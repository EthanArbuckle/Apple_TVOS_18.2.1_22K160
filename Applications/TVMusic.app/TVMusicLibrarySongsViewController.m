@interface TVMusicLibrarySongsViewController
- (BOOL)_shouldReloadReceivedResponse:(id)a3;
- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4;
- (MPLazySectionedCollectionDataSource)sectionedCollectionDataSource;
- (MPModelLibraryRequest)libraryRequest;
- (MPModelResponse)lastReceivedResponse;
- (MPSectionedCollection)songs;
- (TVCollectionView)collectionView;
- (TVMLibraryHeaderView)headerView;
- (TVMusicLibrarySongsViewController)initWithLibraryRequest:(id)a3;
- (id)_placeholderImage;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (id)indexTitlesForCollectionView:(id)a3;
- (id)preferredFocusEnvironments;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_handlePlayPause:(id)a3;
- (void)_invalidateResultsWithResponse:(id)a3;
- (void)_modelResponseDidInvalidate:(id)a3;
- (void)_performRequest;
- (void)_performRequestWithSortDescriptors:(id)a3 filter:(int64_t)a4;
- (void)_playSongAtIndexPath:(id)a3;
- (void)_processResponse:(id)a3;
- (void)_processResponse:(id)a3 error:(id)a4;
- (void)_selectedPlayButton;
- (void)_selectedShuffleButton;
- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scrollViewDidScroll:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setLastReceivedResponse:(id)a3;
- (void)setLibraryRequest:(id)a3;
- (void)setSectionedCollectionDataSource:(id)a3;
- (void)setSongs:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TVMusicLibrarySongsViewController

- (TVMusicLibrarySongsViewController)initWithLibraryRequest:(id)a3
{
  id v5 = a3;
  v6 = -[TVMusicLibrarySongsViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0LL, 0LL);
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v7, "setMinimumLineSpacing:", 12.0);
    v8 = -[TVCollectionView initWithFrame:collectionViewLayout:]( objc_alloc(&OBJC_CLASS___TVCollectionView),  "initWithFrame:collectionViewLayout:",  v7,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    collectionView = v6->_collectionView;
    v6->_collectionView = v8;

    -[TVCollectionView registerClass:forCellWithReuseIdentifier:]( v6->_collectionView,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___TVMusicSongCell, v10),  @"SongCell");
    -[TVCollectionView setDelegate:](v6->_collectionView, "setDelegate:", v6);
    -[TVCollectionView setDataSource:](v6->_collectionView, "setDataSource:", v6);
    -[TVCollectionView setPrefetchDataSource:](v6->_collectionView, "setPrefetchDataSource:", v6);
    -[TVCollectionView setContentInset:](v6->_collectionView, "setContentInset:", 328.0, 95.0, 50.0, 80.0);
    v11 = -[TVMLibraryHeaderView initWithPageType:]( objc_alloc(&OBJC_CLASS___TVMLibraryHeaderView),  "initWithPageType:",  6LL);
    headerView = v6->_headerView;
    v6->_headerView = v11;

    -[TVMLibraryHeaderView setLayoutMargins:](v6->_headerView, "setLayoutMargins:", 0.0, 95.0, 0.0, 80.0);
    objc_initWeak(&location, v6);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10009691C;
    v16[3] = &unk_10026CA58;
    objc_copyWeak(&v17, &location);
    -[TVMLibraryHeaderView setSortRequestHandler:](v6->_headerView, "setSortRequestHandler:", v16);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100096974;
    v14[3] = &unk_100269F48;
    objc_copyWeak(&v15, &location);
    -[TVMLibraryHeaderView setPlayHandler:](v6->_headerView, "setPlayHandler:", v14);
    objc_storeStrong((id *)&v6->_libraryRequest, a3);
    -[TVMusicLibrarySongsViewController _performRequest](v6, "_performRequest");
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)viewDidLoad
{
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___TVMusicLibrarySongsViewController;
  -[TVMusicLibrarySongsViewController viewDidLoad](&v34, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
  [v3 setRemembersLastFocusedIndexPath:1];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController view](self, "view"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
  [v4 addSubview:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController headerView](self, "headerView"));
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController headerView](self, "headerView"));
  [v7 addSubview:v8];

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController headerView](self, "headerView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v33 leadingAnchor]);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v32 leadingAnchor]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v30]);
  v35[0] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController headerView](self, "headerView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v28 trailingAnchor]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v27 trailingAnchor]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v25]);
  v35[1] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController headerView](self, "headerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v23 topAnchor]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 overlayLayoutView]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 topAnchor]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v12 constant:38.0]);
  v35[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController headerView](self, "headerView"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 heightAnchor]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 constraintEqualToConstant:328.0]);
  v35[3] = v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
  [v18 setBounces:0];

  v19 = -[TVInteractionGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___TVInteractionGestureRecognizer),  "initWithTarget:action:",  self,  "_handlePlayPause:");
  -[TVInteractionGestureRecognizer setAllowedPressTypes:](v19, "setAllowedPressTypes:", &off_100282240);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController view](self, "view"));
  [v20 addGestureRecognizer:v19];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
  objc_msgSend(v21, "_setGradientMaskEdgeInsets:", 155.0, 0.0, 0.0, 0.0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
  objc_msgSend(v22, "_setGradientMaskLengths:", 50.0, 0.0, 0.0, 0.0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicLibrarySongsViewController;
  -[TVMusicLibrarySongsViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  self->_visibleOnScreen = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVMusicLibrarySongsViewController;
  -[TVMusicLibrarySongsViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  if (self->_shouldUpdateOnViewDidAppear)
  {
    -[TVMusicLibrarySongsViewController _performRequest](self, "_performRequest");
    self->_shouldUpdateOnViewDidAppear = 0;
  }

  self->_visibleOnScreen = 1;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryTopMenuViewController currentTopMenu]( &OBJC_CLASS___TVMusicLibraryTopMenuViewController,  "currentTopMenu"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifierForCurrentlySelectedItem]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
  [v6 setAccessibilityIdentifier:v5];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVMusicLibrarySongsViewController;
  -[TVMusicLibrarySongsViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v20,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController view](self, "view"));
  unsigned int v9 = [v7 isDescendantOfView:v8];

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
    [v10 setRemembersLastFocusedIndexPath:0];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, v12);
  char isKindOfClass = objc_opt_isKindOfClass(v11, v13);

  if ((isKindOfClass & 1) != 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController headerView](self, "headerView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lastFocusedView]);
    v22 = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController headerView](self, "headerView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bottomEdgeFocusGuide]);
    [v19 setPreferredFocusEnvironments:v17];
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
    v21 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController headerView](self, "headerView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 bottomEdgeFocusGuide]);
    [v18 setPreferredFocusEnvironments:v16];
  }
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicLibrarySongsViewController;
  id v3 = -[TVMusicLibrarySongsViewController contentScrollViewForEdge:](&v5, "contentScrollViewForEdge:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)_handlePlayPause:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance", a3));
  id v14 = (id)objc_claimAutoreleasedReturnValue([v4 player]);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v14 state]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

  if (v5 == v6)
  {
    [v14 pause];
  }

  else
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v14 state]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));
    if (v7 == (void *)v8)
    {

LABEL_7:
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 indexPathForLastFocusedItem]);
      -[TVMusicLibrarySongsViewController _playSongAtIndexPath:](self, "_playSongAtIndexPath:", v13);

      goto LABEL_8;
    }

    unsigned int v9 = (void *)v8;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v14 state]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));

    if (v10 == v11) {
      goto LABEL_7;
    }
  }

- (void)viewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVMusicLibrarySongsViewController;
  -[TVMusicLibrarySongsViewController viewWillLayoutSubviews](&v12, "viewWillLayoutSubviews");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController view](self, "view"));
  [v3 frame];
  double v5 = v4;

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController view](self, "view"));
  [v6 frame];
  double v8 = v7;

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v5, v8);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 collectionViewLayout]);

  objc_msgSend(v11, "setItemSize:", v5 + -95.0 + -80.0, 68.0);
  objc_msgSend(v11, "setHeaderReferenceSize:", v5, 12.0);
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
  double v5 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1002B6A10 == a6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController lastReceivedResponse](self, "lastReceivedResponse", a3, a4, a5));

    if (v7)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController lastReceivedResponse](self, "lastReceivedResponse"));
      -[TVMusicLibrarySongsViewController _invalidateResultsWithResponse:](self, "_invalidateResultsWithResponse:", v8);
    }
  }

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));

  if (v5 == v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
    [v6 contentOffset];
    double v8 = -v7;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
    [v9 contentInset];
    CGAffineTransformMakeTranslation(&v13, 0.0, v8 - v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController headerView](self, "headerView"));
    CGAffineTransform v12 = v13;
    [v11 setTransform:&v12];
  }

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v11 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 cellForItemAtIndexPath:v11]);
  [v6 setSelected:0];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController songs](self, "songs"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 itemAtIndexPath:v11]);

  if (v8)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 storeAsset]);
    unsigned int v10 = [v9 isRedownloadable];

    if (v10) {
      -[TVMusicLibrarySongsViewController _playSongAtIndexPath:](self, "_playSongAtIndexPath:", v11);
    }
  }
}

- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4
{
  return sub_10006DF28() ^ 1;
}

- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController songs](self, "songs"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 itemAtIndexPath:v5]);

  +[TVMusicLibraryUtilities showContextMenuForLibraryObject:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "showContextMenuForLibraryObject:",  v7);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  if (sub_10006DF28()
    && (id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]), v7, v7))
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController songs](self, "songs"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 itemAtIndexPath:v9]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v10));
    CGAffineTransform v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVMContextMenus menuWithLibraryObjectWithoutProperties:]( &OBJC_CLASS___TVMContextMenus,  "menuWithLibraryObjectWithoutProperties:",  v11));
  }

  else
  {
    CGAffineTransform v12 = 0LL;
  }

  return v12;
}

- (id)indexTitlesForCollectionView:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibrarySongsViewController sectionedCollectionDataSource]( self,  "sectionedCollectionDataSource",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sectionIndexTitles]);

  return v4;
}

- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibrarySongsViewController sectionedCollectionDataSource]( self,  "sectionedCollectionDataSource",  a3,  a4));

  if (v7)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController songs](self, "songs"));
    id v9 = [v8 numberOfSections];

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibrarySongsViewController sectionedCollectionDataSource]( self,  "sectionedCollectionDataSource"));
    uint64_t v11 = (uint64_t)[v10 indexOfSectionForSectionIndexTitleAtIndex:a5];

    else {
      uint64_t v12 = v11 & ~(v11 >> 63);
    }
    CGAffineTransform v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  v12));
  }

  else
  {
    CGAffineTransform v13 = 0LL;
  }

  return v13;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController songs](self, "songs", a3));
  id v4 = [v3 numberOfSections];

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController songs](self, "songs", a3));
  id v6 = [v5 numberOfItemsInSection:a4];

  return (int64_t)v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 dequeueReusableCellWithReuseIdentifier:@"SongCell" forIndexPath:v6]);
  [v7 setFullWidthStyle:1];
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController _placeholderImage](self, "_placeholderImage"));
  [v7 setPlaceholderImage:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController songs](self, "songs"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 itemAtIndexPath:v6]);

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 artworkCatalog]);
    uint64_t v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "setFittingSize:", 68.0, 68.0);
      [v12 setDestination:v7 configurationBlock:&stru_10026CA78];
    }

    CGAffineTransform v13 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
    objc_msgSend(v7, "setTitle:isExplicit:", v13, objc_msgSend(v10, "isExplicitSong"));

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 artist]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
    [v7 setArtist:v15];

    [v10 duration];
    objc_msgSend(v7, "setDuration:");
    v16 = (void *)objc_claimAutoreleasedReturnValue([v10 identifiers]);
    [v7 setSongIdentifier:v16];

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 storeAsset]);
    objc_msgSend(v7, "setEnabled:", objc_msgSend(v17, "isRedownloadable"));

    objc_msgSend( v7,  "setFavorite:",  +[TVMusicLibraryUtilities isItemFavorited:](TVMusicLibraryUtilities, "isItemFavorited:", v10));
  }

  return v7;
}

- (void)_performRequest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController headerView](self, "headerView"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 sortMenu]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 sortDescriptors]);
  -[TVMusicLibrarySongsViewController _performRequestWithSortDescriptors:filter:]( self,  "_performRequestWithSortDescriptors:filter:",  v4,  [v5 filterType]);
}

- (void)_performRequestWithSortDescriptors:(id)a3 filter:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController libraryRequest](self, "libraryRequest"));
  [v7 setItemSortDescriptors:v6];

  if (a4 == 1)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController libraryRequest](self, "libraryRequest"));
    id v9 = v8;
    uint64_t v10 = 0x800000LL;
    goto LABEL_5;
  }

  if (!a4)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController libraryRequest](self, "libraryRequest"));
    id v9 = v8;
    uint64_t v10 = 0LL;
LABEL_5:
    [v8 setFilteringOptions:v10];
  }

  objc_initWeak(&location, self);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController libraryRequest](self, "libraryRequest"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100097B78;
  v12[3] = &unk_10026CAA0;
  objc_copyWeak(&v13, &location);
  [v11 performWithResponseHandler:v12];

  objc_destroyWeak(&v13);
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
    v8[2] = sub_100097C6C;
    v8[3] = &unk_100268B30;
    v8[4] = self;
    id v9 = v6;
    dispatch_async(&_dispatch_main_q, v8);
  }
}

- (void)_processResponse:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_lastReceivedResponse, a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 results]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController songs](self, "songs"));
  if (v7) {
    unsigned __int8 v8 = -[TVMusicLibrarySongsViewController _shouldReloadReceivedResponse:](self, "_shouldReloadReceivedResponse:", v5);
  }
  else {
    unsigned __int8 v8 = 1;
  }

  if ([v5 isValid])
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100097EC8;
    v20[3] = &unk_100268B30;
    v20[4] = self;
    id v21 = v6;
    id v9 = objc_retainBlock(v20);
    if ((v8 & 1) != 0
      || (uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView")),
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 indexPathsForVisibleItems]),
          id v12 = [v11 count],
          v11,
          v10,
          !v12))
    {
      ((void (*)(void *))v9[2])(v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController collectionView](self, "collectionView"));
      [v16 reloadData];

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v14 addObserver:self selector:"_modelResponseDidInvalidate:" name:MPModelResponseDidInvalidateNotification object:0];
    }

    else
    {
      collectionView = self->_collectionView;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100097F4C;
      v18[3] = &unk_10026BA80;
      v18[4] = self;
      v19 = v9;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100097FC0;
      v17[3] = &unk_100268F50;
      v17[4] = self;
      -[TVCollectionView performBatchUpdates:completion:](collectionView, "performBatchUpdates:completion:", v18, v17);
      id v14 = v19;
    }
  }

  else
  {
    -[TVMusicLibrarySongsViewController setSongs:](self, "setSongs:", v6);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v15 addObserver:self selector:"_modelResponseDidInvalidate:" name:MPModelResponseDidInvalidateNotification object:0];

    -[TVMusicLibrarySongsViewController _performRequest](self, "_performRequest");
  }
}

- (BOOL)_shouldReloadReceivedResponse:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 results]);
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = 48LL;
    if (self->_songs)
    {
      id v7 = [v4 numberOfSections];
      if (v7 == -[MPSectionedCollection numberOfSections](self->_songs, "numberOfSections"))
      {
        if ([v5 numberOfSections])
        {
          if ((uint64_t)[v5 numberOfSections] < 1)
          {
            BOOL v18 = 0;
            goto LABEL_16;
          }

          uint64_t v8 = 0LL;
          while (1)
          {
            id v9 = [v5 numberOfItemsInSection:v8];
            if (v9 != [*(id *)((char *)&self->super.super.super.isa + v6) numberOfItemsInSection:v8]
              || ![v5 numberOfItemsInSection:v8])
            {
              break;
            }

            if ((uint64_t)[v5 numberOfItemsInSection:v8] >= 1)
            {
              uint64_t v10 = 0LL;
              do
              {
                uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v10,  v8,  v20));
                id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiersForItemAtIndexPath:v11]);
                id v13 = self;
                uint64_t v14 = v6;
                id v15 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)((char *)&self->super.super.super.isa + v6) identifiersForItemAtIndexPath:v11]);
                v16 = (void *)objc_claimAutoreleasedReturnValue([v12 library]);
                id v21 = [v16 persistentID];
                id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 library]);
                id v20 = [v17 persistentID];

                if (v21 != v20) {
                  goto LABEL_15;
                }
                ++v10;
                self = v13;
                uint64_t v6 = v14;
              }

              while ((uint64_t)[v5 numberOfItemsInSection:v8] > v10);
            }

            ++v8;
            BOOL v18 = 0;
          }
        }
      }
    }
  }

- (void)_selectedPlayButton
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController songs](self, "songs"));
  uint64_t v4 = (uint64_t)[v3 totalItemCount];

  if (v4 >= 1)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  0LL));
    -[TVMusicLibrarySongsViewController _playSongAtIndexPath:](self, "_playSongAtIndexPath:", v5);
  }

- (void)_selectedShuffleButton
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController songs](self, "songs"));
  uint64_t v3 = (uint64_t)[v2 totalItemCount];

  if (v3 >= 1) {
    +[TVMusicPlaybackHelper shuffleAllLibrarySongs](&OBJC_CLASS___TVMusicPlaybackHelper, "shuffleAllLibrarySongs");
  }
}

- (id)_placeholderImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController traitCollection](self, "traitCollection"));
  id v3 = sub_100030478(5, 0, [v2 userInterfaceStyle]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (void)_playSongAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController songs](self, "songs"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v5 itemAtIndexPath:v4]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequest"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController headerView](self, "headerView"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sortMenu]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sortDescriptors]);
  [v6 setItemSortDescriptors:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v11 identifiers]);
  +[TVMusicPlaybackHelper playFromRequest:startItemIdentifiers:initialPlaybackType:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playFromRequest:startItemIdentifiers:initialPlaybackType:",  v6,  v10,  1LL);
}

- (void)_modelResponseDidInvalidate:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  -[TVMusicLibrarySongsViewController _invalidateResultsWithResponse:](self, "_invalidateResultsWithResponse:", v4);
}

- (void)_invalidateResultsWithResponse:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController lastReceivedResponse](self, "lastReceivedResponse"));
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 removeObserver:self name:MPModelResponseDidInvalidateNotification object:0];

    if (self->_visibleOnScreen) {
      -[TVMusicLibrarySongsViewController _performRequest](self, "_performRequest");
    }
    else {
      self->_shouldUpdateOnViewDidAppear = 1;
    }
  }

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v9);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySongsViewController songs](self, "songs"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 itemAtIndexPath:v10]);

        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 artworkCatalog]);
        objc_msgSend(v13, "setFittingSize:", 68.0, 68.0);
        [v13 requestImageWithCompletion:&stru_10026CAE0];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }
}

- (TVCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (TVMLibraryHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (MPModelLibraryRequest)libraryRequest
{
  return self->_libraryRequest;
}

- (void)setLibraryRequest:(id)a3
{
}

- (MPModelResponse)lastReceivedResponse
{
  return self->_lastReceivedResponse;
}

- (void)setLastReceivedResponse:(id)a3
{
}

- (MPSectionedCollection)songs
{
  return self->_songs;
}

- (void)setSongs:(id)a3
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