@interface TVMusicLibraryEpisodesViewController
+ (BOOL)_isTVEpisodeWatched:(id)a3;
- (CGSize)artworkSize;
- (TVMusicLibraryEpisodesViewController)initWithSeason:(id)a3 libraryRequest:(id)a4;
- (TVMusicLibraryEpisodesViewController)initWithTitle:(id)a3 libraryRequest:(id)a4;
- (TVMusicLibraryHeaderView)titleHeaderView;
- (double)cellsTopMargin;
- (id)_artworkPlaceholderImageForUserInterfaceStyle:(int64_t)a3;
- (id)_seasonName;
- (id)_songCellPlaceholderImage;
- (id)cellIdentifier;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)genericObjectForItemAtIndexPath:(id)a3;
- (void)_setPositionForView:(id)a3 topLeft:(CGPoint)a4;
- (void)_sizeImageViewToFit;
- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)handlePlayPauseCommand;
- (void)setTitleHeaderView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVMusicLibraryEpisodesViewController

- (TVMusicLibraryEpisodesViewController)initWithTitle:(id)a3 libraryRequest:(id)a4
{
  return 0LL;
}

- (TVMusicLibraryEpisodesViewController)initWithSeason:(id)a3 libraryRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 show]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 title]);
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___TVMusicLibraryEpisodesViewController;
  v11 = -[TVMusicMPRequestViewController initWithTitle:libraryRequest:pageType:]( &v43,  "initWithTitle:libraryRequest:pageType:",  v10,  v8,  0LL);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_tvSeason, a3);
    v12 = objc_alloc_init(&OBJC_CLASS___TVMusicLibraryHeaderView);
    titleHeaderView = v11->_titleHeaderView;
    v11->_titleHeaderView = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
    -[UICollectionViewFlowLayout setItemSize:](v14, "setItemSize:", 830.0, 100.0);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v14, "setMinimumLineSpacing:", 28.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](v11, "collectionView"));
    [v15 setCollectionViewLayout:v14];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](v11, "collectionView"));
    [v16 setRemembersLastFocusedIndexPath:1];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](v11, "collectionView"));
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___TVMusicSongCell, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController cellIdentifier](v11, "cellIdentifier"));
    [v17 registerClass:v19 forCellWithReuseIdentifier:v20];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](v11, "collectionView"));
    objc_msgSend(v21, "setContentInset:", 212.0, 160.0, 24.0, 160.0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager title2Font](&OBJC_CLASS___TVThemeManager, "title2Font"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](v11, "titleHeaderView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 titleLabel]);
    [v24 setFont:v22];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController title](v11, "title"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](v11, "titleHeaderView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 titleLabel]);
    [v27 setText:v25];

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager headlineFont](&OBJC_CLASS___TVThemeManager, "headlineFont"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](v11, "titleHeaderView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 subtitleLabel]);
    [v30 setFont:v28];

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](v11, "titleHeaderView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 titleLabel]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 textColor]);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](v11, "titleHeaderView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 subtitleLabel]);
    [v35 setTextColor:v33];

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController _seasonName](v11, "_seasonName"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](v11, "titleHeaderView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 subtitleLabel]);
    [v38 setText:v36];

    actionButtons = v11->_actionButtons;
    v11->_actionButtons = (NSArray *)&__NSArray0__struct;

    v40 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    episodeReleaseDateFormatter = v11->_episodeReleaseDateFormatter;
    v11->_episodeReleaseDateFormatter = v40;

    -[NSDateFormatter setDateStyle:](v11->_episodeReleaseDateFormatter, "setDateStyle:", 3LL);
  }

  return v11;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicLibraryEpisodesViewController;
  -[TVMusicLibraryEpisodesViewController dealloc](&v4, "dealloc");
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicLibraryEpisodesViewController;
  -[TVMusicMPRequestViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  self->_visibleOnScreen = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicLibraryEpisodesViewController;
  -[TVMusicMPRequestViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  if (self->_shouldReloadOnViewDidAppear)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
    [v4 reloadData];

    self->_shouldReloadOnViewDidAppear = 0;
  }

  self->_visibleOnScreen = 1;
}

- (id)_seasonName
{
  if (-[MPModelTVSeason sortType](self->_tvSeason, "sortType")
    || (uint64_t)-[MPModelTVSeason number](self->_tvSeason, "number") < 1)
  {
    v3 = 0LL;
  }

  else
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"MusicLibrarySeasonTitle" value:&stru_100279068 table:0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v5,  -[MPModelTVSeason number](self->_tvSeason, "number")));
  }

  return v3;
}

- (void)viewDidLoad
{
  v104.receiver = self;
  v104.super_class = (Class)&OBJC_CLASS___TVMusicLibraryEpisodesViewController;
  -[TVMusicMPRequestViewController viewDidLoad](&v104, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](self, "titleHeaderView"));
  [v3 addSubview:v4];

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](self, "titleHeaderView"));
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v94 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](self, "titleHeaderView"));
  v85 = (void *)objc_claimAutoreleasedReturnValue([v94 leadingAnchor]);
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController view](self, "view"));
  v88 = (void *)objc_claimAutoreleasedReturnValue([v91 leadingAnchor]);
  v82 = (void *)objc_claimAutoreleasedReturnValue([v85 constraintEqualToAnchor:v88]);
  v108[0] = v82;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](self, "titleHeaderView"));
  v72 = (void *)objc_claimAutoreleasedReturnValue([v79 trailingAnchor]);
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController view](self, "view"));
  v74 = (void *)objc_claimAutoreleasedReturnValue([v76 trailingAnchor]);
  v70 = (void *)objc_claimAutoreleasedReturnValue([v72 constraintEqualToAnchor:v74]);
  v108[1] = v70;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](self, "titleHeaderView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v69 topAnchor]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 overlayLayoutView]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 topAnchor]);
  -[TVMusicMPRequestViewController headerVerticalOffset](self, "headerVerticalOffset");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v9));
  v108[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](self, "titleHeaderView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 heightAnchor]);
  -[TVMusicLibraryEpisodesViewController cellsTopMargin](self, "cellsTopMargin");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToConstant:"));
  v108[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v108, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v15, "setLayoutMargins:", -8.0, 160.0, 0.0, 160.0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v95 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  v89 = (void *)objc_claimAutoreleasedReturnValue([v95 heightAnchor]);
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController view](self, "view"));
  v86 = (void *)objc_claimAutoreleasedReturnValue([v92 heightAnchor]);
  v83 = (void *)objc_claimAutoreleasedReturnValue([v89 constraintEqualToAnchor:v86]);
  v107[0] = v83;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  v77 = (void *)objc_claimAutoreleasedReturnValue([v80 widthAnchor]);
  v75 = (void *)objc_claimAutoreleasedReturnValue([v77 constraintEqualToConstant:1150.0]);
  v107[1] = v75;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  v71 = (void *)objc_claimAutoreleasedReturnValue([v73 topAnchor]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController view](self, "view"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 topAnchor]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v71 constraintEqualToAnchor:v18]);
  v107[2] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 leadingAnchor]);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 leadingAnchor]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v23]);
  v107[3] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v107, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v25);

  v26 = objc_alloc_init(&OBJC_CLASS___UIView);
  imageViewContainer = self->_imageViewContainer;
  self->_imageViewContainer = v26;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( self->_imageViewContainer,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController view](self, "view"));
  [v28 addSubview:self->_imageViewContainer];

  v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_imageViewContainer, "widthAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue([v96 constraintEqualToConstant:640.0]);
  v106[0] = v93;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_imageViewContainer, "widthAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_imageViewContainer, "heightAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue([v87 constraintEqualToAnchor:v90]);
  v106[1] = v84;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_imageViewContainer, "trailingAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v81 safeAreaLayoutGuide]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 trailingAnchor]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v78 constraintEqualToAnchor:v30]);
  v106[2] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_imageViewContainer, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 topAnchor]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v34 constant:136.0]);
  v106[3] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v106, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v36);

  v37 = objc_alloc(&OBJC_CLASS___TVImageView);
  -[UIView bounds](self->_imageViewContainer, "bounds");
  v38 = -[TVImageView initWithFrame:](v37, "initWithFrame:");
  artworkImageView = self->_artworkImageView;
  self->_artworkImageView = v38;

  -[TVImageView setCornerRadius:](self->_artworkImageView, "setCornerRadius:", 8.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVImageView layer](self->_artworkImageView, "layer"));
  [v40 setShadowRadius:30.0];

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVImageView layer](self->_artworkImageView, "layer"));
  LODWORD(v42) = 1053609165;
  [v41 setShadowOpacity:v42];

  objc_super v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVImageView layer](self->_artworkImageView, "layer"));
  objc_msgSend(v43, "setShadowOffset:", 0.0, 20.0);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVImageView layer](self->_artworkImageView, "layer"));
  [v44 setMasksToBounds:0];

  -[UIView addSubview:](self->_imageViewContainer, "addSubview:", self->_artworkImageView);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelTVSeason artworkCatalog](self->_tvSeason, "artworkCatalog"));
  if (v45)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v45, "setFittingSize:", 640.0, 640.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v46 scale];
    objc_msgSend(v45, "setDestinationScale:");

    v47 = self->_artworkImageView;
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472LL;
    v101[2] = sub_100018C70;
    v101[3] = &unk_100269780;
    objc_copyWeak(&v102, &location);
    [v45 setDestination:v47 configurationBlock:v101];
    objc_destroyWeak(&v102);
    objc_destroyWeak(&location);
  }

  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  v48 = self->_actionButtons;
  id v49 = -[NSArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v97,  v105,  16LL);
  if (v49)
  {
    uint64_t v50 = *(void *)v98;
    do
    {
      v51 = 0LL;
      do
      {
        if (*(void *)v98 != v50) {
          objc_enumerationMutation(v48);
        }
        uint64_t v52 = *(void *)(*((void *)&v97 + 1) + 8LL * (void)v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController view](self, "view"));
        [v53 addSubview:v52];

        v51 = (char *)v51 + 1;
      }

      while (v49 != v51);
      id v49 = -[NSArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v97,  v105,  16LL);
    }

    while (v49);
  }

  if (-[NSArray count](self->_actionButtons, "count"))
  {
    v54 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController view](self, "view"));
    [v55 addLayoutGuide:v54];

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide leftAnchor](v54, "leftAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[TVImageView leftAnchor](self->_artworkImageView, "leftAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue([v56 constraintEqualToAnchor:v57]);
    [v58 setActive:1];

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide rightAnchor](v54, "rightAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[TVImageView rightAnchor](self->_artworkImageView, "rightAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue([v59 constraintEqualToAnchor:v60]);
    [v61 setActive:1];

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](v54, "topAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[TVImageView topAnchor](self->_artworkImageView, "topAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue([v62 constraintEqualToAnchor:v63]);
    [v64 setActive:1];

    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide bottomAnchor](v54, "bottomAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController view](self, "view"));
    v67 = (void *)objc_claimAutoreleasedReturnValue([v66 bottomAnchor]);
    v68 = (void *)objc_claimAutoreleasedReturnValue([v65 constraintEqualToAnchor:v67]);
    [v68 setActive:1];

    -[UIFocusGuide setPreferredFocusEnvironments:](v54, "setPreferredFocusEnvironments:", self->_actionButtons);
  }
}

- (void)viewDidLayoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___TVMusicLibraryEpisodesViewController;
  -[TVMusicLibraryEpisodesViewController viewDidLayoutSubviews](&v35, "viewDidLayoutSubviews");
  if (-[NSArray count](self->_actionButtons, "count"))
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    v3 = self->_actionButtons;
    id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v31,  v37,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v32;
      double v7 = -24.0;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v32 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * (void)i) frame];
          double v7 = v7 + v9 + 24.0;
        }

        id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v31,  v37,  16LL);
      }

      while (v5);
    }

    else
    {
      double v7 = -24.0;
    }

    -[UIView frame](self->_imageViewContainer, "frame");
    double MinX = CGRectGetMinX(v38);
    -[UIView frame](self->_imageViewContainer, "frame");
    double Width = CGRectGetWidth(v39);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController view](self, "view", 0LL));
    id v13 = [v12 effectiveUserInterfaceLayoutDirection];
    actionButtons = self->_actionButtons;
    if (v13 == (id)1) {
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray reverseObjectEnumerator](actionButtons, "reverseObjectEnumerator"));
    }
    else {
      v15 = actionButtons;
    }
    v16 = v15;

    id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v27,  v36,  16LL);
    if (v17)
    {
      id v18 = v17;
      double v19 = MinX + ceil((Width - v7) * 0.5);
      uint64_t v20 = *(void *)v28;
      do
      {
        for (j = 0LL; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v16);
          }
          v22 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)j);
          [v22 frame];
          double v24 = v23;
          double v26 = v25;
          -[UIView frame](self->_imageViewContainer, "frame");
          objc_msgSend(v22, "setFrame:", v19, CGRectGetMaxY(v40) + 60.0, v24, v26);
          double v19 = v19 + v24 + 24.0;
        }

        id v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v27,  v36,  16LL);
      }

      while (v18);
    }
  }

- (void)traitCollectionDidChange:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVMusicLibraryEpisodesViewController;
  id v4 = a3;
  -[TVMusicLibraryEpisodesViewController traitCollectionDidChange:](&v22, "traitCollectionDidChange:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryEpisodesViewController traitCollection]( self,  "traitCollection",  v22.receiver,  v22.super_class));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController traitCollection](self, "traitCollection"));
    id v9 = [v8 userInterfaceStyle];

    if (v9 == (id)2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
      double v11 = 1.0;
      double v12 = 0.5;
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
      double v12 = 0.6;
      double v11 = 0.0;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v11, v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](self, "titleHeaderView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 titleLabel]);
    [v15 setTextColor:v10];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController titleHeaderView](self, "titleHeaderView"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 subtitleLabel]);
    [v17 setTextColor:v13];

    artworkImageView = self->_artworkImageView;
    double v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController traitCollection](self, "traitCollection"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryEpisodesViewController _artworkPlaceholderImageForUserInterfaceStyle:]( self,  "_artworkPlaceholderImageForUserInterfaceStyle:",  [v19 userInterfaceStyle]));
    -[TVImageView setPlaceholderImage:](artworkImageView, "setPlaceholderImage:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
    [v21 reloadData];
  }

- (void)_sizeImageViewToFit
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVImageView image](self->_artworkImageView, "image"));
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  CGFloat y = CGPointZero.y;
  _UIScaleTransformForAspectFitOfSizeInTargetSize(&v18, -[UIView bounds](self->_imageViewContainer, "bounds"), v5, v7);
  v19.origin.double x = CGPointZero.x;
  v19.origin.CGFloat y = y;
  v19.size.double width = v5;
  v19.size.double height = v7;
  CGRect v20 = CGRectApplyAffineTransform(v19, &v18);
  double x = v20.origin.x;
  double v10 = v20.origin.y;
  double width = v20.size.width;
  double height = v20.size.height;
  id v13 = -[UIView bounds](self->_imageViewContainer, "bounds");
  UIRectCenteredIntegralRect(v13, x, v10, width, height, v14, v15, v16, v17);
  -[TVImageView setFrame:](self->_artworkImageView, "setFrame:");
}

- (id)cellIdentifier
{
  return @"EpisodeSongCellIdentifier";
}

- (double)cellsTopMargin
{
  return 212.0;
}

- (void)handlePlayPauseCommand
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v3 indexPathForLastFocusedItem]);

  double v4 = v9;
  if (v9)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cellForItemAtIndexPath:v9]);

    if ([v6 isFocused])
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 itemAtIndexPath:v9]);

      if (v8) {
        +[TVMusicPlaybackHelper playItemType:withMPObject:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playItemType:withMPObject:",  8LL,  v8);
      }
    }

    double v4 = v9;
  }
}

- (id)genericObjectForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndexPath:v4]);

  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v6));
  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([a3 cellForItemAtIndexPath:v6]);
  [v7 setSelected:0];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v8 itemAtIndexPath:v6]);

  id v9 = v10;
  if (v10)
  {
    +[TVMusicPlaybackHelper playItemType:withMPObject:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playItemType:withMPObject:",  8LL,  v10);
    id v9 = v10;
  }
}

- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 itemAtIndexPath:v5]);

  +[TVMusicLibraryUtilities showContextMenuForLibraryObject:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "showContextMenuForLibraryObject:",  v7);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController cellIdentifier](self, "cellIdentifier"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 itemAtIndexPath:v6]);

  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 artworkCatalog]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 title]);
  if (-[MPModelTVSeason sortType](self->_tvSeason, "sortType"))
  {
    if (-[MPModelTVSeason sortType](self->_tvSeason, "sortType") == (id)1)
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v11 releaseDate]);

      if (v14)
      {
        episodeReleaseDateFormatter = self->_episodeReleaseDateFormatter;
        double v16 = (void *)objc_claimAutoreleasedReturnValue([v11 releaseDate]);
        double v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](episodeReleaseDateFormatter, "stringFromDate:", v16));
      }
    }

    else
    {
      double v14 = 0LL;
    }
  }

  else
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v11 episodeTypeDisplayName]);
  }

  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController _songCellPlaceholderImage](self, "_songCellPlaceholderImage"));
  [v9 setPlaceholderImage:v17];

  objc_msgSend( v9,  "setIsWatched:",  +[TVMusicLibraryEpisodesViewController _isTVEpisodeWatched:]( TVMusicLibraryEpisodesViewController,  "_isTVEpisodeWatched:",  v11));
  [v9 setSongType:4];
  CGAffineTransform v18 = (void *)objc_claimAutoreleasedReturnValue([v9 thumbnailImageView]);
  [v18 setContentMode:1];

  [v9 setTitle:v13];
  [v9 setArtist:v14];
  if (v12)
  {
    [v9 thumbnailSize];
    objc_msgSend(v12, "setFittingSize:");
    CGRect v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v19 scale];
    objc_msgSend(v12, "setDestinationScale:");

    [v12 setDestination:v9 configurationBlock:&stru_1002697C0];
  }

  return v9;
}

+ (BOOL)_isTVEpisodeWatched:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playbackPosition]);
  if ([v4 hasBeenPlayed])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 playbackPosition]);
    [v5 bookmarkTime];
    BOOL v7 = v6 == 0.0;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_setPositionForView:(id)a3 topLeft:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = a3;
  [v6 frame];
  objc_msgSend(v6, "setFrame:", x, y);
}

- (id)_artworkPlaceholderImageForUserInterfaceStyle:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController traitCollection](self, "traitCollection", a3));
  id v4 = sub_100030478(12, 2uLL, [v3 userInterfaceStyle]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)_songCellPlaceholderImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryEpisodesViewController traitCollection](self, "traitCollection"));
  id v3 = sub_100030478(11, 0, [v2 userInterfaceStyle]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (CGSize)artworkSize
{
  double v2 = 178.0;
  double v3 = 100.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (TVMusicLibraryHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end