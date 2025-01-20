@interface TVMusicMPRequestViewController
- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4;
- (BOOL)preventPopWhenEmpty;
- (BOOL)showGradientMask;
- (BOOL)showIndexBarTitles;
- (BOOL)updateWithModelResponse:(id)a3;
- (CGPoint)cellSpacing;
- (CGRect)focusedCellFrame;
- (CGSize)artworkSize;
- (CGSize)cellSize;
- (MPLazySectionedCollectionDataSource)sectionedCollectionDataSource;
- (MPModelGenericObject)cachedObjectForContextMenu;
- (MPModelLibraryRequest)libraryRequest;
- (MPSectionedCollection)mpResults;
- (MPSectionedCollection)previousMPResults;
- (NSString)cellIdentifier;
- (TVCollectionView)collectionView;
- (TVMLibraryHeaderView)headerView;
- (TVMusicMPRequestViewController)initWithTitle:(id)a3 libraryRequest:(id)a4 pageType:(int64_t)a5;
- (double)cellsTopMargin;
- (double)collectionViewTop;
- (double)headerVerticalOffset;
- (id)_baseMPModelObjectForObject:(id)a3;
- (id)_visibleCellClosestToScreenCoordinates:(CGPoint)a3;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (id)collectionViewLayout;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (id)genericObjectForItemAtIndexPath:(id)a3;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)indexTitlesForCollectionView:(id)a3;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)preferredFocusEnvironments;
- (id)sortMenu;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)libraryPageType;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)totalNumberOfItems;
- (int64_t)updateTypeForIndexPath:(id)a3;
- (unint64_t)lastFocusHeading;
- (void)_adjustOffsetForHeaderViews:(id)a3 withCells:(id)a4;
- (void)_cachePreparedObject:(id)a3;
- (void)_configureCollectionViewLayout:(id)a3;
- (void)_handlePlayPause:(id)a3;
- (void)_modelResponseDidInvalidate:(id)a3;
- (void)_performRequest;
- (void)_performRequestWithSortDescriptors:(id)a3 filter:(int64_t)a4;
- (void)_processResponse:(id)a3 error:(id)a4;
- (void)_reconfigureVisibleCells;
- (void)_registerForSystemTraitsChangesAffectingColorAppearance;
- (void)_updateHeaderViews:(id)a3 forFocusContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)_updateWithMPRequestResults:(id)a3;
- (void)collectionView:(id)a3 didReceiveInitialPressOfLongPressForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCachedObjectForContextMenu:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewTop:(double)a3;
- (void)setFocusedCellFrame:(CGRect)a3;
- (void)setLastFocusHeading:(unint64_t)a3;
- (void)setLibraryPageType:(int64_t)a3;
- (void)setLibraryRequest:(id)a3;
- (void)setLibraryRequest:(id)a3 completionHandler:(id)a4;
- (void)setMpResults:(id)a3;
- (void)setMpResults:(id)a3 completion:(id)a4;
- (void)setPreventPopWhenEmpty:(BOOL)a3;
- (void)setPreviousMPResults:(id)a3;
- (void)setSectionedCollectionDataSource:(id)a3;
- (void)setShowIndexBarTitles:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTotalNumberOfItems:(int64_t)a3;
- (void)updateCollectionViewLayout;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVMusicMPRequestViewController

- (TVMusicMPRequestViewController)initWithTitle:(id)a3 libraryRequest:(id)a4 pageType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___TVMusicMPRequestViewController;
  v10 = -[TVMusicMPRequestViewController initWithNibName:bundle:](&v36, "initWithNibName:bundle:", 0LL, 0LL);
  v11 = v10;
  if (v10)
  {
    -[TVMusicMPRequestViewController setTitle:](v10, "setTitle:", v8);
    objc_storeStrong((id *)&v11->_libraryRequest, a4);
    v11->_libraryPageType = a5;
    -[TVMusicMPRequestViewController setCollectionViewTop:](v11, "setCollectionViewTop:", 328.0);
    v12 = objc_alloc(&OBJC_CLASS___TVCollectionView);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionViewLayout](v11, "collectionViewLayout"));
    v14 = -[TVCollectionView initWithFrame:collectionViewLayout:]( v12,  "initWithFrame:collectionViewLayout:",  v13,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    collectionView = v11->_collectionView;
    v11->_collectionView = v14;

    v16 = v11->_collectionView;
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___TVMusicLibraryCollectionViewCell, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController cellIdentifier](v11, "cellIdentifier"));
    -[TVCollectionView registerClass:forCellWithReuseIdentifier:]( v16,  "registerClass:forCellWithReuseIdentifier:",  v18,  v19);

    -[TVCollectionView setDelegate:](v11->_collectionView, "setDelegate:", v11);
    -[TVCollectionView setDataSource:](v11->_collectionView, "setDataSource:", v11);
    v20 = v11->_collectionView;
    -[TVMusicMPRequestViewController cellsTopMargin](v11, "cellsTopMargin");
    -[TVCollectionView setContentInset:](v20, "setContentInset:");
    -[TVCollectionView setRemembersLastFocusedIndexPath:]( v11->_collectionView,  "setRemembersLastFocusedIndexPath:",  1LL);
    if (a5)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v9 scopedContainers]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___MPModelArtist, v23);
      if ((objc_opt_isKindOfClass(v22, v24) & 1) != 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v9 scopedContainers]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 firstObject]);
      }

      else
      {
        v26 = 0LL;
      }

      v27 = -[TVMLibraryHeaderView initWithPageType:artist:headingText:]( objc_alloc(&OBJC_CLASS___TVMLibraryHeaderView),  "initWithPageType:artist:headingText:",  -[TVMusicMPRequestViewController libraryPageType](v11, "libraryPageType"),  v26,  v8);
      headerView = v11->_headerView;
      v11->_headerView = v27;

      -[TVMLibraryHeaderView setLayoutMargins:](v11->_headerView, "setLayoutMargins:", 0.0, 80.0, 0.0, 80.0);
      objc_initWeak(&location, v11);
      v30 = _NSConcreteStackBlock;
      uint64_t v31 = 3221225472LL;
      v32 = sub_1000B47A0;
      v33 = &unk_10026CA58;
      objc_copyWeak(&v34, &location);
      -[TVMLibraryHeaderView setSortRequestHandler:](v11->_headerView, "setSortRequestHandler:", &v30);
      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }

    -[TVMusicMPRequestViewController _registerForSystemTraitsChangesAffectingColorAppearance]( v11,  "_registerForSystemTraitsChangesAffectingColorAppearance",  v30,  v31,  v32,  v33);
  }

  return v11;
}

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___TVMusicMPRequestViewController;
  -[TVMusicMPRequestViewController viewDidLoad](&v41, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController view](self, "view"));
  [v3 bounds];
  CGFloat v4 = CGRectGetWidth(v43) + 30.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController view](self, "view"));
  [v5 bounds];
  double Height = CGRectGetHeight(v44);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  [v7 setAutoresizingMask:18];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "setFrame:", -30.0, 0.0, v4, Height);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  [v9 addSubview:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
    [v13 addSubview:v14];

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v40 leadingAnchor]);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController view](self, "view"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v39 leadingAnchor]);
    objc_super v36 = (void *)objc_claimAutoreleasedReturnValue([v38 constraintEqualToAnchor:v37]);
    v42[0] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v35 trailingAnchor]);
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController view](self, "view"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v34 trailingAnchor]);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintEqualToAnchor:v32]);
    v42[1] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v30 topAnchor]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 overlayLayoutView]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 topAnchor]);
    -[TVMusicMPRequestViewController headerVerticalOffset](self, "headerVerticalOffset");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v18));
    v42[2] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 heightAnchor]);
    -[TVMusicMPRequestViewController cellsTopMargin](self, "cellsTopMargin");
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:"));
    v42[3] = v22;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 4LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v23);

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bottomEdgeFocusGuide]);
    [v25 setEnabled:1];
  }

  v26 = -[TVInteractionGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___TVInteractionGestureRecognizer),  "initWithTarget:action:",  self,  "_handlePlayPause:");
  -[TVInteractionGestureRecognizer setAllowedPressTypes:](v26, "setAllowedPressTypes:", &off_100282288);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController view](self, "view"));
  [v27 addGestureRecognizer:v26];

  -[TVMusicMPRequestViewController _updateControls](self, "_updateControls");
  -[TVMusicMPRequestViewController _performRequest](self, "_performRequest");
  if (-[TVMusicMPRequestViewController showGradientMask](self, "showGradientMask"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
    objc_msgSend(v28, "_setGradientMaskEdgeInsets:", 155.0, 0.0, 0.0, 0.0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
    objc_msgSend(v29, "_setGradientMaskLengths:", 50.0, 0.0, 0.0, 0.0);
  }
}

- (BOOL)showGradientMask
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController title](self, "title"));
  BOOL v3 = v2 == 0LL;

  return v3;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicMPRequestViewController;
  -[TVMusicMPRequestViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  self->_visibleOnScreen = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVMusicMPRequestViewController;
  -[TVMusicMPRequestViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  if (self->_shouldUpdateOnViewDidAppear)
  {
    -[TVMusicMPRequestViewController _performRequest](self, "_performRequest");
    self->_shouldUpdateOnViewDidAppear = 0;
  }

  self->_visibleOnScreen = 1;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryTopMenuViewController currentTopMenu]( &OBJC_CLASS___TVMusicLibraryTopMenuViewController,  "currentTopMenu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifierForCurrentlySelectedItem]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  [v6 setAccessibilityIdentifier:v5];
}

- (id)preferredFocusEnvironments
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvm_focusedView"));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
    unsigned int v8 = objc_msgSend(v7, "tvm_isDescendentFocused");

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
      v12 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

      return v10;
    }
  }

  else
  {
  }

  return 0LL;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicMPRequestViewController;
  id v3 = -[TVMusicMPRequestViewController contentScrollViewForEdge:](&v5, "contentScrollViewForEdge:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4
{
  return sub_10006DF28() ^ 1;
}

- (id)genericObjectForItemAtIndexPath:(id)a3
{
  return 0LL;
}

- (void)collectionView:(id)a3 didReceiveInitialPressOfLongPressForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if (sub_10006DF28())
  {
    -[TVMusicMPRequestViewController setCachedObjectForContextMenu:](self, "setCachedObjectForContextMenu:", 0LL);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPRequestViewController genericObjectForItemAtIndexPath:]( self,  "genericObjectForItemAtIndexPath:",  v5));
    if (v6)
    {
      objc_super v7 = v6;
      if ([v6 type] == (id)2)
      {
        unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 album]);
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472LL;
        v9[2] = sub_1000B5014;
        v9[3] = &unk_10026A8A0;
        id v10 = v7;
        v11 = self;
        +[TVMusicLibraryUtilities findSingleMusicVideoInAlbum:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findSingleMusicVideoInAlbum:completionHandler:",  v8,  v9);
      }

      else
      {
        -[TVMusicMPRequestViewController _cachePreparedObject:](self, "_cachePreparedObject:", v7);
      }
    }
  }
}

- (void)_cachePreparedObject:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000B50D0;
  v3[3] = &unk_10026B9A0;
  v3[4] = self;
  +[TVMContextMenus getPropertiesWithLibraryObject:completion:]( &OBJC_CLASS___TVMContextMenus,  "getPropertiesWithLibraryObject:completion:",  a3,  v3);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  if (sub_10006DF28())
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

    if (v7)
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPRequestViewController genericObjectForItemAtIndexPath:]( self,  "genericObjectForItemAtIndexPath:",  v8));

      if (v9)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController cachedObjectForContextMenu](self, "cachedObjectForContextMenu"));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPRequestViewController cachedObjectForContextMenu]( self,  "cachedObjectForContextMenu"));
          v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVMContextMenus menuWithLibraryObjectWithProperties:]( &OBJC_CLASS___TVMContextMenus,  "menuWithLibraryObjectWithProperties:",  v11));

          -[TVMusicMPRequestViewController setCachedObjectForContextMenu:](self, "setCachedObjectForContextMenu:", 0LL);
LABEL_16:

          goto LABEL_17;
        }

        if ([v9 type] != (id)2
          || (v13 = (void *)objc_claimAutoreleasedReturnValue([v9 album]),
              v14 = (void *)objc_claimAutoreleasedReturnValue([v13 title]),
              v14,
              v13,
              v14))
        {
          id v15 = sub_1000B5334();
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = 138412290;
            v21 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Show context menu for library object without required properties: %@",  (uint8_t *)&v20,  0xCu);
          }

          v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVMContextMenus menuWithLibraryObjectWithoutProperties:]( &OBJC_CLASS___TVMContextMenus,  "menuWithLibraryObjectWithoutProperties:",  v9));
          goto LABEL_16;
        }

        id v17 = sub_1000B5334();
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138412290;
          v21 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Can't show context menu for object: %@",  (uint8_t *)&v20,  0xCu);
        }
      }

      v12 = 0LL;
      goto LABEL_16;
    }
  }

  v12 = 0LL;
LABEL_17:

  return v12;
}

- (void)setTitle:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVMusicMPRequestViewController;
  -[TVMusicMPRequestViewController setTitle:](&v3, "setTitle:", a3);
}

- (void)setLibraryRequest:(id)a3
{
}

- (void)setLibraryRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  p_libraryRequest = &self->_libraryRequest;
  objc_storeStrong((id *)&self->_libraryRequest, a3);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sortMenu]);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController sortMenu](self, "sortMenu"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sortDescriptors]);
    -[MPModelLibraryRequest setItemSortDescriptors:](*p_libraryRequest, "setItemSortDescriptors:", v13);
  }

  -[TVMusicMPRequestViewController _updateControls](self, "_updateControls");
  objc_initWeak(&location, self);
  v14 = *p_libraryRequest;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000B5518;
  v16[3] = &unk_10026DA30;
  objc_copyWeak(&v18, &location);
  id v15 = v8;
  id v17 = v15;
  -[MPModelLibraryRequest performWithResponseHandler:](v14, "performWithResponseHandler:", v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (id)collectionViewLayout
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
  -[TVMusicMPRequestViewController _configureCollectionViewLayout:](self, "_configureCollectionViewLayout:", v3);
  -[UICollectionViewFlowLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:]( v3,  "_setWantsRightToLeftHorizontalMirroringIfNeeded:",  0LL);
  return v3;
}

- (void)updateCollectionViewLayout
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 collectionViewLayout]);

  -[TVMusicMPRequestViewController _configureCollectionViewLayout:](self, "_configureCollectionViewLayout:", v4);
}

- (void)setMpResults:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v7 = (void (**)(id, id))a4;
  objc_storeStrong((id *)&self->_previousMPResults, self->_mpResults);
  objc_storeStrong((id *)&self->_mpResults, a3);
  if (v7) {
    v7[2](v7, v8);
  }
}

- (void)setMpResults:(id)a3
{
}

- (double)headerVerticalOffset
{
  return 37.0;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVCollectionView, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 indexPathForLastFocusedItem]);

  return v7;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1LL;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4) {
    return 0LL;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults", a3));
  id v6 = [v5 totalItemCount];

  return (int64_t)v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  return -[TVMusicMPRequestViewController cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", a4);
}

- (id)indexTitlesForCollectionView:(id)a3
{
  if (-[TVMusicMPRequestViewController showIndexBarTitles](self, "showIndexBarTitles", a3)
    && (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPRequestViewController sectionedCollectionDataSource]( self,  "sectionedCollectionDataSource")),  v4,  v4))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPRequestViewController sectionedCollectionDataSource]( self,  "sectionedCollectionDataSource"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sectionIndexTitles]);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  if (-[TVMusicMPRequestViewController showIndexBarTitles](self, "showIndexBarTitles", a3, a4)
    && (id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPRequestViewController sectionedCollectionDataSource]( self,  "sectionedCollectionDataSource")),  v7,  v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPRequestViewController sectionedCollectionDataSource]( self,  "sectionedCollectionDataSource"));
    uint64_t v9 = (uint64_t)[v8 indexOfSectionForSectionIndexTitleAtIndex:a5];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
    if (v9 >= (uint64_t)[v10 numberOfSections])
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
      uint64_t v9 = (uint64_t)[v11 numberOfSections];
    }

    if (v9 < 1)
    {
      uint64_t v15 = 1LL;
    }

    else
    {
      uint64_t v12 = 0LL;
      uint64_t v13 = 0LL;
      do
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
        v13 += (uint64_t)[v14 numberOfItemsInSection:v12];

        ++v12;
      }

      while (v9 != v12);
      uint64_t v15 = v13 + 1;
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
    id v18 = [v17 totalItemCount];

    if (v15 >= (uint64_t)v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
      uint64_t v15 = (uint64_t)[v19 totalItemCount] - 1;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v15,  0LL));
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___TVMusicMPRequestViewController;
  -[TVMusicMPRequestViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v40,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController view](self, "view"));
  unsigned int v9 = [v7 isDescendantOfView:v8];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
    [v10 setRemembersLastFocusedIndexPath:0];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, v13);
    char isKindOfClass = objc_opt_isKindOfClass(v12, v14);

    if ((isKindOfClass & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 lastFocusedView]);
      CGRect v43 = v17;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
      int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 bottomEdgeFocusGuide]);
      [v20 setPreferredFocusEnvironments:v18];
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 indexPathForLastFocusedItem]);

      if (v22)
      {
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 indexPathForLastFocusedItem]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v23 cellForItemAtIndexPath:v25]);

        if (v26) {
          goto LABEL_10;
        }
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
      unsigned int v28 = [v16 isDescendantOfView:v27];

      if (!v28) {
        goto LABEL_11;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
      [v29 frame];
      double MaxX = CGRectGetMaxX(v44);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
      [v31 frame];
      double MaxY = CGRectGetMaxY(v45);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
      objc_msgSend(v16, "convertPoint:toView:", 0, MaxX, MaxY);
      double v34 = v33;
      double v36 = v35;

      v26 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPRequestViewController _visibleCellClosestToScreenCoordinates:]( self,  "_visibleCellClosestToScreenCoordinates:",  v34,  v36));
      if (v26)
      {
LABEL_10:
        v42[0] = v26;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
        v42[1] = v16;
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 2LL));

        int v37 = 0;
      }

      else
      {
LABEL_11:
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
        objc_super v41 = v26;
        int v37 = 1;
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 bottomEdgeFocusGuide]);
      [v39 setPreferredFocusEnvironments:v17];

      if (v37) {
        v16 = v26;
      }
    }
  }
}

- (id)_visibleCellClosestToScreenCoordinates:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 visibleCells]);

  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    unsigned int v9 = 0LL;
    uint64_t v10 = *(void *)v21;
    double v11 = 1.79769313e308;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        [v13 center];
        objc_msgSend(v13, "convertPoint:toView:", 0);
        double v16 = hypot(x - v14, y - v15);
        if (v16 < v11)
        {
          double v17 = v16;
          id v18 = v13;

          double v11 = v17;
          unsigned int v9 = v18;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v8);
  }

  else
  {
    unsigned int v9 = 0LL;
  }

  return v9;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nextFocusedIndexPath]);

  if (v8)
  {
    -[TVMusicMPRequestViewController setLastFocusHeading:]( self,  "setLastFocusHeading:",  [v7 focusHeading]);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 nextFocusedIndexPath]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v11 cellForItemAtIndexPath:v9]);

    [v10 frame];
    -[TVMusicMPRequestViewController setFocusedCellFrame:](self, "setFocusedCellFrame:");
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v33 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController view](self, "view"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tvm_focusedView"));

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 superview]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  if (v9 == v11)
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___UICollectionReusableView, v10);
    char v12 = objc_opt_isKindOfClass(v8, v13) ^ 1;
  }

  else
  {
    char v12 = 0;
  }

  if ((id)-[TVMusicMPRequestViewController lastFocusHeading](self, "lastFocusHeading") == (id)1 && (v12 & 1) == 0)
  {
    -[TVMusicMPRequestViewController focusedCellFrame](self, "focusedCellFrame");
    double v15 = v14 - a5->y;
    [v33 contentInset];
    double v17 = v16;
    [v33 _gradientMaskLengths];
    double v19 = v18;
    [v33 _gradientMaskEdgeInsets];
    if (v17 <= v19 + v20)
    {
      [v33 _gradientMaskLengths];
      double v23 = v22;
      [v33 _gradientMaskEdgeInsets];
      double v21 = v23 + v24;
    }

    else
    {
      [v33 contentInset];
    }

    double v25 = v21 + 80.0;
    if (v15 < v21 + 80.0)
    {
      CGFloat x = a5->x;
      -[TVMusicMPRequestViewController focusedCellFrame](self, "focusedCellFrame");
      double v28 = v27 - v25;
      [v33 contentInset];
      if (v28 <= -v29)
      {
        [v33 contentInset];
        double v31 = -v32;
      }

      else
      {
        -[TVMusicMPRequestViewController focusedCellFrame](self, "focusedCellFrame");
        double v31 = v30 - v25;
      }

      a5->CGFloat x = x;
      a5->double y = v31;
    }
  }
}

- (id)sortMenu
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController headerView](self, "headerView"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sortMenu]);

  return v3;
}

- (void)_performRequest
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController sortMenu](self, "sortMenu"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 sortDescriptors]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController sortMenu](self, "sortMenu"));
  -[TVMusicMPRequestViewController _performRequestWithSortDescriptors:filter:]( self,  "_performRequestWithSortDescriptors:filter:",  v3,  [v4 filterType]);
}

- (void)_performRequestWithSortDescriptors:(id)a3 filter:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
    [v7 setItemSortDescriptors:v6];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 itemKind]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identityKind]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSongKind identityKind](&OBJC_CLASS___MPModelSongKind, "identityKind"));
  if (v10 == v11) {
    uint64_t v12 = 0x800000LL;
  }
  else {
    uint64_t v12 = 0x1000000LL;
  }

  if (a4 == 1)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
    unint64_t v14 = (unint64_t)[v13 filteringOptions] | v12;
    goto LABEL_10;
  }

  if (!a4)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
    unint64_t v14 = (unint64_t)[v13 filteringOptions] & ~v12;
LABEL_10:
    [v13 setFilteringOptions:v14];
  }

  objc_initWeak(&location, self);
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController libraryRequest](self, "libraryRequest"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000B646C;
  v16[3] = &unk_10026CAA0;
  objc_copyWeak(&v17, &location);
  [v15 performWithResponseHandler:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_processResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  if (!a4)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000B658C;
    block[3] = &unk_1002699F8;
    objc_copyWeak(&v9, &location);
    id v8 = v6;
    dispatch_async(&_dispatch_main_q, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_updateWithMPRequestResults:(id)a3
{
  id v17 = a3;
  if (!self->_visibleOnScreen
    || -[TVMusicMPRequestViewController totalNumberOfItems](self, "totalNumberOfItems") < 1
    || [v17 totalItemCount]
    || -[TVMusicMPRequestViewController preventPopWhenEmpty](self, "preventPopWhenEmpty"))
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___MPLazySectionedCollection, v4);
    if ((objc_opt_isKindOfClass(v17, v5) & 1) != 0) {
      id v6 = v17;
    }
    else {
      id v6 = 0LL;
    }
    id v7 = v6;
    id v8 = v7;
    if (v7)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dataSource]);
      -[TVMusicMPRequestViewController setSectionedCollectionDataSource:](self, "setSectionedCollectionDataSource:", v9);
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController previousMPResults](self, "previousMPResults"));
    if (v10
      && (id v11 = (void *)v10,
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController previousMPResults](self, "previousMPResults")),
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults")),
          unsigned __int8 v14 = [v12 hasSameContentAsSectionedCollection:v13],
          v13,
          v12,
          v11,
          (v14 & 1) != 0))
    {
      -[TVMusicMPRequestViewController _reconfigureVisibleCells](self, "_reconfigureVisibleCells");
    }

    else
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
      [v15 reloadData];
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController navigationController](self, "navigationController"));
    id v16 = [v8 popViewControllerAnimated:1];
  }

  -[TVMusicMPRequestViewController setTotalNumberOfItems:]( self,  "setTotalNumberOfItems:",  [v17 totalItemCount]);
}

- (void)_reconfigureVisibleCells
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 indexPathsForVisibleItems]);
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 indexPathsForVisibleItems]);

    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (!v10) {
      goto LABEL_13;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    while (1)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        int64_t v15 = -[TVMusicMPRequestViewController updateTypeForIndexPath:](self, "updateTypeForIndexPath:", v14);
        id v16 = v6;
        if (v15 != 1)
        {
          if (v15 != 2) {
            continue;
          }
          id v16 = v7;
        }

        -[NSMutableArray addObject:](v16, "addObject:", v14);
      }

      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v11)
      {
LABEL_13:

        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_1000B6A74;
        v20[3] = &unk_1002691D8;
        v20[4] = self;
        double v21 = v6;
        double v22 = v7;
        double v18 = v7;
        double v19 = v6;
        [v17 performBatchUpdates:v20 completion:&stru_10026DA50];

        return;
      }
    }
  }

- (int64_t)updateTypeForIndexPath:(id)a3
{
  return 1LL;
}

- (NSString)cellIdentifier
{
  return (NSString *)@"TVMusicCollectionViewCellIdentifier";
}

- (void)_handlePlayPause:(id)a3
{
}

- (id)_baseMPModelObjectForObject:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MPModelObject, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    id v6 = v3;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPModelGenericObject, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
      id v9 = v6;
    }
    else {
      id v9 = 0LL;
    }
    id v10 = v9;
    uint64_t v12 = v10;
    if (v10)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 anyObject]);

      id v6 = (id)v13;
    }

    uint64_t v14 = objc_opt_class(&OBJC_CLASS___MPModelPlaylistEntry, v11);
    if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0 && v6)
    {
      id v15 = v6;
      id v6 = (id)objc_claimAutoreleasedReturnValue([v15 anyObject]);
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_configureCollectionViewLayout:(id)a3
{
  id v4 = a3;
  -[TVMusicMPRequestViewController cellSize](self, "cellSize");
  objc_msgSend(v4, "setItemSize:");
  -[TVMusicMPRequestViewController cellSpacing](self, "cellSpacing");
  double v6 = v5;
  [v4 setMinimumLineSpacing:v7];
  [v4 setMinimumInteritemSpacing:v6];
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  [v10 bounds];
  double v9 = v8;
  -[TVMusicMPRequestViewController cellSpacing](self, "cellSpacing");
  [v4 setHeaderReferenceSize:v9];
}

- (void)_adjustOffsetForHeaderViews:(id)a3 withCells:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        [v11 frame];
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        id v18 = v6;
        id v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v28;
          while (2)
          {
            for (j = 0LL; j != v20; j = (char *)j + 1)
            {
              if (*(void *)v28 != v21) {
                objc_enumerationMutation(v18);
              }
              [*(id *)(*((void *)&v27 + 1) + 8 * (void)j) visibleFrame];
              double v24 = v23;
              double v25 = v23 - v17;
              else {
                BOOL v26 = 0;
              }
              if (v26)
              {
                objc_msgSend(v11, "setFrame:", v13, v25, v15, v17);
                goto LABEL_19;
              }
            }

            id v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }

- (void)_updateHeaderViews:(id)a3 forFocusContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
      }

      id v14 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }

    while (v14);
  }

  if ([v11 count])
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 previouslyFocusedItem]);
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___TVMusicLibraryCollectionViewCell, v19);
    if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0)
    {
      id v21 = (id)objc_claimAutoreleasedReturnValue([v9 previouslyFocusedItem]);

      if (v21)
      {
        double v22 = (void *)objc_claimAutoreleasedReturnValue([v9 previouslyFocusedIndexPath]);

        if (v22)
        {
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472LL;
          v31[2] = sub_1000B7170;
          v31[3] = &unk_10026DA78;
          v31[4] = self;
          id v32 = v11;
          id v21 = v21;
          id v33 = v21;
          [v10 addCoordinatedUnfocusingAnimations:v31 completion:0];
        }
      }
    }

    else
    {

      id v21 = 0LL;
    }

    double v23 = (void *)objc_claimAutoreleasedReturnValue([v9 nextFocusedItem]);
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___TVMusicLibraryCollectionViewCell, v24);
    if ((objc_opt_isKindOfClass(v23, v25) & 1) != 0)
    {
      id v26 = (id)objc_claimAutoreleasedReturnValue([v9 nextFocusedItem]);

      if (v26)
      {
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v9 nextFocusedIndexPath]);

        if (v27)
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472LL;
          v28[2] = sub_1000B7200;
          v28[3] = &unk_10026DA78;
          v28[4] = self;
          id v29 = v11;
          id v26 = v26;
          id v30 = v26;
          [v10 addCoordinatedFocusingAnimations:v28 completion:0];
        }
      }
    }

    else
    {

      id v26 = 0LL;
    }
  }
}

- (void)_registerForSystemTraitsChangesAffectingColorAppearance
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection systemTraitsAffectingColorAppearance]( &OBJC_CLASS___UITraitCollection,  "systemTraitsAffectingColorAppearance"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000B736C;
  v5[3] = &unk_1002693E0;
  objc_copyWeak(&v6, &location);
  id v4 =  -[TVMusicMPRequestViewController registerForTraitChanges:withHandler:]( self,  "registerForTraitChanges:withHandler:",  v3,  v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)cellForItemAtIndexPath:(id)a3
{
  return 0LL;
}

- (CGPoint)cellSpacing
{
  double v2 = 40.0;
  double v3 = 64.0;
  result.double y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGSize)cellSize
{
  double v2 = 273.0;
  double v3 = 362.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)artworkSize
{
  double v2 = 333.0;
  double v3 = 333.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)cellsTopMargin
{
  return v2 + -64.0;
}

- (BOOL)updateWithModelResponse:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  [v4 removeObserver:self name:MPModelResponseDidInvalidateNotification object:0];

  if (self->_visibleOnScreen) {
    -[TVMusicMPRequestViewController _performRequest](self, "_performRequest");
  }
  else {
    self->_shouldUpdateOnViewDidAppear = 1;
  }
  return 1;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  id v8 = (UIViewController *)a4;
  if ((objc_opt_respondsToSelector( self->_navigationControllerDelegate,  "navigationController:didShowViewController:animated:") & 1) != 0) {
    -[UINavigationControllerDelegate navigationController:didShowViewController:animated:]( self->_navigationControllerDelegate,  "navigationController:didShowViewController:animated:",  v12,  v8,  v5);
  }
  if (self->_viewControllerWithZoomAnimation == v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController navigationController](self, "navigationController"));
    [v9 setDelegate:self->_navigationControllerDelegate];

    navigationControllerDelegate = self->_navigationControllerDelegate;
    self->_navigationControllerDelegate = 0LL;

    viewControllerWithZoomAnimation = self->_viewControllerWithZoomAnimation;
    self->_viewControllerWithZoomAnimation = 0LL;
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v8 = a4;
  if ((objc_opt_respondsToSelector( self->_navigationControllerDelegate,  "navigationController:willShowViewController:animated:") & 1) != 0) {
    -[UINavigationControllerDelegate navigationController:willShowViewController:animated:]( self->_navigationControllerDelegate,  "navigationController:willShowViewController:animated:",  v9,  v8,  v5);
  }
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  if (self->_viewControllerWithZoomAnimation == a6) {
    return objc_opt_new(&OBJC_CLASS___TVNavigationZoomAnimator);
  }
  else {
    return 0LL;
  }
}

- (void)_modelResponseDidInvalidate:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  -[TVMusicMPRequestViewController updateWithModelResponse:](self, "updateWithModelResponse:", v4);
}

- (MPModelLibraryRequest)libraryRequest
{
  return self->_libraryRequest;
}

- (BOOL)showIndexBarTitles
{
  return self->_showIndexBarTitles;
}

- (void)setShowIndexBarTitles:(BOOL)a3
{
  self->_showIndexBarTitles = a3;
}

- (BOOL)preventPopWhenEmpty
{
  return self->_preventPopWhenEmpty;
}

- (void)setPreventPopWhenEmpty:(BOOL)a3
{
  self->_preventPopWhenEmptdouble y = a3;
}

- (double)collectionViewTop
{
  return self->_collectionViewTop;
}

- (void)setCollectionViewTop:(double)a3
{
  self->_collectionViewTop = a3;
}

- (int64_t)libraryPageType
{
  return self->_libraryPageType;
}

- (void)setLibraryPageType:(int64_t)a3
{
  self->_libraryPageType = a3;
}

- (MPSectionedCollection)mpResults
{
  return self->_mpResults;
}

- (MPSectionedCollection)previousMPResults
{
  return self->_previousMPResults;
}

- (void)setPreviousMPResults:(id)a3
{
}

- (MPLazySectionedCollectionDataSource)sectionedCollectionDataSource
{
  return self->_sectionedCollectionDataSource;
}

- (void)setSectionedCollectionDataSource:(id)a3
{
}

- (int64_t)totalNumberOfItems
{
  return self->_totalNumberOfItems;
}

- (void)setTotalNumberOfItems:(int64_t)a3
{
  self->_totalNumberOfItems = a3;
}

- (unint64_t)lastFocusHeading
{
  return self->_lastFocusHeading;
}

- (void)setLastFocusHeading:(unint64_t)a3
{
  self->_lastFocusHeading = a3;
}

- (CGRect)focusedCellFrame
{
  double x = self->_focusedCellFrame.origin.x;
  double y = self->_focusedCellFrame.origin.y;
  double width = self->_focusedCellFrame.size.width;
  double height = self->_focusedCellFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFocusedCellFrame:(CGRect)a3
{
  self->_focusedCellFrame = a3;
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

- (MPModelGenericObject)cachedObjectForContextMenu
{
  return (MPModelGenericObject *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setCachedObjectForContextMenu:(id)a3
{
}

- (void).cxx_destruct
{
}

@end