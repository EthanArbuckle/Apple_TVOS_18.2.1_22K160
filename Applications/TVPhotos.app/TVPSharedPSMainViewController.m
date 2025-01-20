@interface TVPSharedPSMainViewController
- (BOOL)_hasSharedAlbumsWithPendingInvitationsInPhotoLibrary:(id)a3;
- (BOOL)_isSharedAlbumContentAvailable;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)photoLibraryDidUpdateWithChanges;
- (NSArray)sharedAlbums;
- (NSArray)subscribedAlbums;
- (NSTimer)fetchAssetsAndReloadTimer;
- (PHPhotoLibrary)photoLibrary;
- (PXLibraryFilterState)libraryFilterState;
- (TVPCollectionViewCachingManager)sharedAlbumsCachingManager;
- (TVPCollectionViewCachingManager)subscribedAlbumsCachingManager;
- (TVPFetchManager)myPhotoStreamFetchManager;
- (TVPFetchManager)sharedAlbumsFetchManager;
- (TVPSharedPSActivityBannerView)bannerView;
- (TVPSharedPSMainViewController)init;
- (TVPSharedPSMainViewController)initWithCoder:(id)a3;
- (TVPSharedPSMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVPSharedPSMainViewController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4;
- (UIView)loadingView;
- (UIVisualEffectView)sharedAlbumHeaderView;
- (UIVisualEffectView)subscribedAlbumHeaderView;
- (id)_activityBannerView;
- (id)_assetAtIndexPath:(id)a3 fetchManager:(id)a4 isOwnedSharedAlbum:(BOOL)a5;
- (id)_collectionAtIndexPath:(id)a3 isOwnedSharedAlbum:(BOOL)a4;
- (id)_sharedAlbumsInPhotoLibrary:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionViewCachingManager:(id)a3 assetsForIndexPaths:(id)a4;
- (id)preferredFocusEnvironments;
- (int64_t)_totalSharedAssetsCount;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)tabMode;
- (void)_cancelExistingTimer;
- (void)_didFinishTimedInterval:(id)a3;
- (void)_dismissLoadingView;
- (void)_displayInvitationDialogForSubscribingToCollection:(id)a3 assetCollection:(id)a4;
- (void)_displayLoadingView;
- (void)_fetchCloudSharedAlbumsWithCompletion:(id)a3;
- (void)_layoutSharedAlbumsView;
- (void)_loadSharedStreamContentFromFetchResult:(id)a3 photoStreamFetchResult:(id)a4 completion:(id)a5;
- (void)_loadUpActivityAssetsAndPopulateBanner;
- (void)_selectButtonAction:(id)a3;
- (void)collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)didFocusBannerView:(id)a3;
- (void)loadView;
- (void)photoLibraryDidChange:(id)a3;
- (void)setBannerView:(id)a3;
- (void)setFetchAssetsAndReloadTimer:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setMyPhotoStreamFetchManager:(id)a3;
- (void)setPhotoLibraryDidUpdateWithChanges:(BOOL)a3;
- (void)setSharedAlbumHeaderView:(id)a3;
- (void)setSharedAlbums:(id)a3;
- (void)setSharedAlbumsCachingManager:(id)a3;
- (void)setSharedAlbumsFetchManager:(id)a3;
- (void)setSubscribedAlbumHeaderView:(id)a3;
- (void)setSubscribedAlbums:(id)a3;
- (void)setSubscribedAlbumsCachingManager:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVPSharedPSMainViewController

- (TVPSharedPSMainViewController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVPSharedPSMainViewController;
  v9 = -[TVPSharedPSMainViewController initWithNibName:bundle:](&v19, "initWithNibName:bundle:", 0LL, 0LL);
  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSArray);
    sharedAlbums = v9->_sharedAlbums;
    v9->_sharedAlbums = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSArray);
    subscribedAlbums = v9->_subscribedAlbums;
    v9->_subscribedAlbums = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___TVPCollectionViewCachingManager);
    sharedAlbumsCachingManager = v9->_sharedAlbumsCachingManager;
    v9->_sharedAlbumsCachingManager = v14;

    -[TVPCollectionViewCachingManager setAllowsHorizontalScrolling:]( v9->_sharedAlbumsCachingManager,  "setAllowsHorizontalScrolling:",  1LL);
    -[TVPCollectionViewCachingManager setDataSource:](v9->_sharedAlbumsCachingManager, "setDataSource:", v9);
    v16 = objc_alloc_init(&OBJC_CLASS___TVPCollectionViewCachingManager);
    subscribedAlbumsCachingManager = v9->_subscribedAlbumsCachingManager;
    v9->_subscribedAlbumsCachingManager = v16;

    -[TVPCollectionViewCachingManager setAllowsHorizontalScrolling:]( v9->_subscribedAlbumsCachingManager,  "setAllowsHorizontalScrolling:",  1LL);
    -[TVPCollectionViewCachingManager setDataSource:](v9->_subscribedAlbumsCachingManager, "setDataSource:", v9);
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    -[PHPhotoLibrary registerChangeObserver:](v9->_photoLibrary, "registerChangeObserver:", v9);
    objc_storeStrong((id *)&v9->_libraryFilterState, a4);
  }

  return v9;
}

- (TVPSharedPSMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v9,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPSharedPSMainViewController.m",  125,  @"%s is not available as initializer",  "-[TVPSharedPSMainViewController initWithNibName:bundle:]");

  abort();
}

- (TVPSharedPSMainViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v6,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPSharedPSMainViewController.m",  129,  @"%s is not available as initializer",  "-[TVPSharedPSMainViewController initWithCoder:]");

  abort();
}

- (TVPSharedPSMainViewController)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPSharedPSMainViewController.m",  133,  @"%s is not available as initializer",  "-[TVPSharedPSMainViewController init]");

  abort();
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController photoLibrary](self, "photoLibrary"));
  [v4 unregisterChangeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPSharedPSMainViewController;
  -[TVPSharedPSMainViewController dealloc](&v5, "dealloc");
}

- (void)loadView
{
  v4 = objc_alloc_init(&OBJC_CLASS___UIScrollView);
  -[UIScrollView setTag:](v4, "setTag:", 5LL);
  -[UIScrollView setDelegate:](v4, "setDelegate:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  -[UIScrollView setFrame:](v4, "setFrame:");

  -[TVPSharedPSMainViewController setView:](self, "setView:", v4);
  -[TVPSharedPSMainViewController setTabBarObservedScrollView:](self, "setTabBarObservedScrollView:", v4);
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPSharedPSMainViewController;
  -[TVPSharedPSMainViewController viewDidLoad](&v4, "viewDidLoad");
  -[TVPSharedPSMainViewController _displayLoadingView](self, "_displayLoadingView");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100056124;
  v3[3] = &unk_1000CBD20;
  v3[4] = self;
  -[TVPSharedPSMainViewController _fetchCloudSharedAlbumsWithCompletion:]( self,  "_fetchCloudSharedAlbumsWithCompletion:",  v3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController sharedAlbumsCachingManager](self, "sharedAlbumsCachingManager"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 collectionView]);
    [v8 reloadData];
  }

- (id)preferredFocusEnvironments
{
  if (self->_bannerView)
  {
    bannerView = self->_bannerView;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &bannerView,  1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = [a3 tag];
  if (!v5)
  {
    id v6 = &OBJC_IVAR___TVPSharedPSMainViewController__subscribedAlbums;
    return (int64_t)[*(id *)((char *)&self->super.super.super.isa + *v6) count];
  }

  if (v5 == (id)1)
  {
    id v6 = &OBJC_IVAR___TVPSharedPSMainViewController__sharedAlbums;
    return (int64_t)[*(id *)((char *)&self->super.super.super.isa + *v6) count];
  }

  return 0LL;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 dequeueReusableCellWithReuseIdentifier:@"albumGridIdentifier" forIndexPath:v6]);
  id v9 = [v7 tag];

  if (v9 != (id)1)
  {
    if (v9)
    {
      uint64_t v26 = 0LL;
      unint64_t v25 = 0LL;
      v11 = 0LL;
      v27 = 0LL;
      v12 = 0LL;
      v28 = &stru_1000CC6C8;
      goto LABEL_23;
    }

    if ([v8 tag])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewController subscribedAlbumsCachingManager]( self,  "subscribedAlbumsCachingManager"));
      objc_msgSend(v10, "cancelImageRequest:", objc_msgSend(v8, "tag"));
    }

    v11 = self->_subscribedAlbumsCachingManager;
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewController _collectionAtIndexPath:isOwnedSharedAlbum:]( self,  "_collectionAtIndexPath:isOwnedSharedAlbum:",  v6,  0LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pl_assetContainer"));
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___PLCloudSharedAlbum, v14);
    int v16 = 0;
    if ((objc_opt_isKindOfClass(v13, v15) & 1) == 0) {
      goto LABEL_22;
    }
    v46 = v12;
    id v17 = v13;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 cloudRelationshipState]);
    if ([v18 intValue] == 1)
    {
    }

    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v17 hasUnseenContent]);
      unsigned int v31 = [v30 BOOLValue];

      if (!v31)
      {
        int v16 = 0;
        goto LABEL_21;
      }
    }

    int v16 = 1;
LABEL_21:
    v12 = v46;

LABEL_22:
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 localizedTitle]);
    v27 = self->_sharedAlbumsFetchManager;

    uint64_t v26 = 0LL;
    unint64_t v25 = v16 != 0;
    goto LABEL_23;
  }

  if ([v8 tag])
  {
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController sharedAlbumsCachingManager](self, "sharedAlbumsCachingManager"));
    objc_msgSend(v19, "cancelImageRequest:", objc_msgSend(v8, "tag"));
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewController _collectionAtIndexPath:isOwnedSharedAlbum:]( self,  "_collectionAtIndexPath:isOwnedSharedAlbum:",  v6,  1LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pl_assetContainer"));
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___PLCloudSharedAlbum, v21);
  if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
  {
    id v23 = v20;
    if ([v23 isMultipleContributorCloudSharedAlbum])
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 hasUnseenContent]);
      unint64_t v25 = (unint64_t)[v24 BOOLValue];
    }

    else
    {
      unint64_t v25 = 0LL;
    }

    v28 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 localizedTitle]);
    v27 = self->_sharedAlbumsFetchManager;
  }

  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue( [v29 localizedStringForKey:@"photoStreamAlbum" value:&stru_1000CC6C8 table:0]);

    v27 = self->_myPhotoStreamFetchManager;
    unint64_t v25 = 0LL;
  }

  v11 = self->_sharedAlbumsCachingManager;

  uint64_t v26 = 1LL;
LABEL_23:
  v32 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewController _assetAtIndexPath:fetchManager:isOwnedSharedAlbum:]( self,  "_assetAtIndexPath:fetchManager:isOwnedSharedAlbum:",  v6,  v27,  v26));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 localIdentifier]);
  [v8 setCellIdentifier:v33];

  if (v32)
  {
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_100056A50;
    v48[3] = &unk_1000CA748;
    id v34 = v8;
    id v49 = v34;
    id v35 = v6;
    v36 = v12;
    id v37 = v32;
    id v50 = v37;
    v47 = v8;
    v38 = v27;
    v39 = v28;
    unint64_t v40 = v25;
    v41 = objc_retainBlock(v48);
    id v42 = v37;
    v12 = v36;
    id v6 = v35;
    objc_msgSend( v34,  "setTag:",  -[TVPCachingManager requestImageForAsset:processingHandler:resultHandler:]( v11,  "requestImageForAsset:processingHandler:resultHandler:",  v42,  0,  v41));

    unint64_t v25 = v40;
    v28 = v39;
    v27 = v38;
    id v8 = v47;
  }

  [v8 setTitle:v28];
  [v8 setDisplaysNewAlbumBadge:v25];
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v8 setBackgroundColor:v43];

  id v44 = v8;
  return v44;
}

- (void)didFocusBannerView:(id)a3
{
  p_sharedAlbumHeaderView = &self->_sharedAlbumHeaderView;
  if (-[UIVisualEffectView tag](self->_sharedAlbumHeaderView, "tag", a3) == (id)10
    || (p_sharedAlbumHeaderView = &self->_subscribedAlbumHeaderView,
        -[UIVisualEffectView tag](self->_subscribedAlbumHeaderView, "tag") == (id)10))
  {
    +[TVPUIUtilities animateToBottom:](&OBJC_CLASS___TVPUIUtilities, "animateToBottom:", *p_sharedAlbumHeaderView);
  }

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v27 = a4;
  id v6 = [a3 tag];
  if (!v6)
  {
    uint64_t v7 = 0LL;
    goto LABEL_5;
  }

  if (v6 == (id)1)
  {
    uint64_t v7 = 1LL;
LABEL_5:
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewController _collectionAtIndexPath:isOwnedSharedAlbum:]( self,  "_collectionAtIndexPath:isOwnedSharedAlbum:",  v27,  v7));
    goto LABEL_7;
  }

  id v8 = 0LL;
LABEL_7:
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pl_assetContainer"));
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___PLCloudSharedAlbum, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
  {
    v13 = v9;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSMainViewController cloudRelationshipState](v13, "cloudRelationshipState"));
    if ([v14 intValue])
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSMainViewController cloudRelationshipState](v13, "cloudRelationshipState"));
      unsigned int v16 = [v15 intValue];

      if (v16 != 2)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSMainViewController cloudRelationshipState](v13, "cloudRelationshipState"));
        unsigned int v18 = [v17 intValue];

        if (v18 == 1) {
          -[TVPSharedPSMainViewController _displayInvitationDialogForSubscribingToCollection:assetCollection:]( self,  "_displayInvitationDialogForSubscribingToCollection:assetCollection:",  v13,  v8);
        }
        goto LABEL_16;
      }
    }

    else
    {
    }

    id v23 = objc_alloc(&OBJC_CLASS___TVPPhotoLibraryAlbumViewController);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController libraryFilterState](self, "libraryFilterState"));
    unint64_t v25 = -[TVPPhotoLibraryAlbumViewController initWithAlbum:libraryFilterState:]( v23,  "initWithAlbum:libraryFilterState:",  v8,  v24);

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController navigationController](self, "navigationController"));
    [v26 pushViewController:v25 animated:1];

LABEL_16:
    goto LABEL_17;
  }

  uint64_t v19 = objc_opt_class(&OBJC_CLASS___PLPhotoStreamAlbum, v12);
  if ((objc_opt_isKindOfClass(v9, v19) & 1) != 0)
  {
    v20 = objc_alloc(&OBJC_CLASS___TVPMyPSMainViewController);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController photoLibrary](self, "photoLibrary"));
    v13 = -[TVPPhotoLibraryFeedCollectionViewController initWithPhotoLibrary:assetCollection:]( v20,  "initWithPhotoLibrary:assetCollection:",  v21,  v8);

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController navigationController](self, "navigationController"));
    [v22 pushViewController:v13 animated:1];

    goto LABEL_16;
  }

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v32 = (id)objc_claimAutoreleasedReturnValue([v6 cellForItemAtIndexPath:a4]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController view](self, "view"));
  [v32 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v32 superview]);
  objc_msgSend(v7, "convertRect:fromView:", v16, v9, v11, v13, v15);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  id v25 = [v6 tag];
  if (v25 == (id)1)
  {
    if (-[UIVisualEffectView tag](self->_subscribedAlbumHeaderView, "tag") == (id)10) {
      +[TVPUIUtilities animateToBottom:]( &OBJC_CLASS___TVPUIUtilities,  "animateToBottom:",  self->_subscribedAlbumHeaderView);
    }
    uint64_t v26 = 4LL;
    goto LABEL_9;
  }

  if (!v25)
  {
    if (-[UIVisualEffectView tag](self->_sharedAlbumHeaderView, "tag") == (id)10) {
      +[TVPUIUtilities animateToBottom:](&OBJC_CLASS___TVPUIUtilities, "animateToBottom:", self->_sharedAlbumHeaderView);
    }
    uint64_t v26 = 5LL;
LABEL_9:
    Class v27 = (&self->super.super.super.isa)[v26];
    -[objc_class frame](v27, "frame");
    +[TVPUIUtilities animateAlbumHeader:focusedCellFrame:adjustedHeaderFrame:]( &OBJC_CLASS___TVPUIUtilities,  "animateAlbumHeader:focusedCellFrame:adjustedHeaderFrame:",  v27,  v18,  v20,  v22,  v24,  v28,  v29,  v30,  v31);
  }
}

- (void)_selectButtonAction:(id)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___TVPSharedPSActivityViewController);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController photoLibrary](self, "photoLibrary"));
  uint64_t v7 = -[TVPPhotoLibraryFeedCollectionViewController initWithPhotoLibrary:](v4, "initWithPhotoLibrary:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController navigationController](self, "navigationController"));
  [v6 pushViewController:v7 animated:1];
}

- (void)photoLibraryDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005702C;
  block[3] = &unk_1000C9CC8;
  block[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_sync(&_dispatch_main_q, block);
}

- (id)collectionViewCachingManager:(id)a3 assetsForIndexPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      id v18 = v7;
      double v11 = 0LL;
      uint64_t v12 = *(void *)v21;
      do
      {
        double v13 = 0LL;
        double v14 = v11;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v13);
          unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionView", v18));
          double v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewController _assetAtIndexPath:fetchManager:isOwnedSharedAlbum:]( self,  "_assetAtIndexPath:fetchManager:isOwnedSharedAlbum:",  v15,  self->_sharedAlbumsFetchManager,  [v16 tag] != 0));

          if (v11) {
            [v19 addObject:v11];
          }

          double v13 = (char *)v13 + 1;
          double v14 = v11;
        }

        while (v10 != v13);
        id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v10);

      id v7 = v18;
    }
  }

  else
  {
    id v19 = 0LL;
  }

  return v19;
}

- (void)_didFinishTimedInterval:(id)a3
{
  if (self->_photoLibraryDidUpdateWithChanges)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController view](self, "view", a3, 0LL));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 subviews]);

    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          double v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          uint64_t v12 = objc_opt_class(&OBJC_CLASS___TVPCollectionView, v7);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
            [v11 reloadData];
          }
        }

        id v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }

    -[TVPSharedPSMainViewController _loadUpActivityAssetsAndPopulateBanner]( self,  "_loadUpActivityAssetsAndPopulateBanner");
    self->_photoLibraryDidUpdateWithChanges = 0;
  }

  else
  {
    -[TVPSharedPSMainViewController _cancelExistingTimer](self, "_cancelExistingTimer", a3);
  }

- (void)_fetchCloudSharedAlbumsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100057834;
  v8[3] = &unk_1000C9EF0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (id)_activityBannerView
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVPSharedPSActivityBannerView);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"ActivityTitleHeader" value:&stru_1000CC6C8 table:0]);
  -[TVPSharedPSActivityBannerView setBannerTitle:](v3, "setBannerTitle:", v5);

  id v6 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_selectButtonAction:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v6, "setAllowedPressTypes:", &off_1000D1C78);
  -[TVPSharedPSActivityBannerView addGestureRecognizer:](v3, "addGestureRecognizer:", v6);
  -[TVPSharedPSActivityBannerView setDelegate:](v3, "setDelegate:", self);
  -[TVPSharedPSActivityBannerView setFrame:](v3, "setFrame:", 90.0, 0.0, 1740.0, 573.0);

  return v3;
}

- (void)_layoutSharedAlbumsView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController view](self, "view"));
  id v4 = (TVPSharedPSActivityBannerView *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewController _activityBannerView]( self,  "_activityBannerView"));
  bannerView = self->_bannerView;
  self->_bannerView = v4;

  [v3 addSubview:self->_bannerView];
  -[TVPSharedPSActivityBannerView frame](self->_bannerView, "frame");
  double v6 = CGRectGetMaxY(v94) + 0.0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController view](self, "view"));
  id v8 = [v7 effectiveUserInterfaceLayoutDirection];

  id v9 = &ACAccountStoreDidChangeNotification_ptr;
  id v10 = &off_100097000;
  id v83 = v8;
  if (-[NSArray count](self->_sharedAlbums, "count"))
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"myAlbums" value:&stru_1000CC6C8 table:0]);
    __int128 v13 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities vibrantLabelWithText:]( &OBJC_CLASS___TVPPhotoUtilities,  "vibrantLabelWithText:",  v12));
    sharedAlbumHeaderView = self->_sharedAlbumHeaderView;
    self->_sharedAlbumHeaderView = v13;

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedStringForKey:@"myAlbums" value:&stru_1000CC6C8 table:0]);
    double v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager headlineFont](&OBJC_CLASS___TVPThemeManager, "headlineFont"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v18 bounds];
    +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v16,  v17,  v19);
    double v21 = v20;
    double v23 = v22;

    double v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_sharedAlbumHeaderView, "contentView"));
    [v24 setClipsToBounds:0];

    if (v8 == (id)1)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController view](self, "view"));
      [v25 frame];
      double v27 = v26 + -90.0 - v21;
    }

    else
    {
      double v27 = 90.0;
    }

    -[UIVisualEffectView setFrame:](self->_sharedAlbumHeaderView, "setFrame:", v27, v6 + 54.0, v21, v23);
    -[UIVisualEffectView frame](self->_sharedAlbumHeaderView, "frame");
    double v29 = v6 + v28 + 54.0;
    [v3 addSubview:self->_sharedAlbumHeaderView];
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    double v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_sharedAlbumHeaderView, "contentView"));
    double v31 = (void *)objc_claimAutoreleasedReturnValue([v30 subviews]);

    id v32 = [v31 countByEnumeratingWithState:&v88 objects:v93 count:16];
    if (v32)
    {
      id v34 = v32;
      uint64_t v35 = *(void *)v89;
      while (2)
      {
        for (i = 0LL; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v89 != v35) {
            objc_enumerationMutation(v31);
          }
          id v37 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)i);
          uint64_t v38 = objc_opt_class(&OBJC_CLASS___UILabel, v33);
          if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0)
          {
            -[UIVisualEffectView bounds](self->_sharedAlbumHeaderView, "bounds");
            objc_msgSend(v37, "setFrame:");
            goto LABEL_15;
          }
        }

        id v34 = [v31 countByEnumeratingWithState:&v88 objects:v93 count:16];
        if (v34) {
          continue;
        }
        break;
      }
    }

- (void)_displayLoadingView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController loadingView](self, "loadingView"));

  if (!v3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController view](self, "view"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities embedPhotosLoadingViewInView:topMargin:message:]( &OBJC_CLASS___TVPUIUtilities,  "embedPhotosLoadingViewInView:topMargin:message:",  v5,  0LL,  0.0));
    -[TVPSharedPSMainViewController setLoadingView:](self, "setLoadingView:", v4);
  }

- (void)_dismissLoadingView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController loadingView](self, "loadingView"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController loadingView](self, "loadingView"));
    [v4 removeFromSuperview];

    -[TVPSharedPSMainViewController setLoadingView:](self, "setLoadingView:", 0LL);
  }

- (void)_loadSharedStreamContentFromFetchResult:(id)a3 photoStreamFetchResult:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v8 photoLibrary]);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  __int128 v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005852C;
  block[3] = &unk_1000CBDE8;
  id v19 = v9;
  id v20 = v11;
  double v21 = self;
  id v22 = v8;
  id v23 = v10;
  id v14 = v10;
  id v15 = v8;
  id v16 = v11;
  id v17 = v9;
  dispatch_async(v13, block);
}

- (BOOL)_isSharedAlbumContentAvailable
{
  return -[NSArray count](self->_sharedAlbums, "count") || -[NSArray count](self->_subscribedAlbums, "count") != 0;
}

- (id)_assetAtIndexPath:(id)a3 fetchManager:(id)a4 isOwnedSharedAlbum:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewController _collectionAtIndexPath:isOwnedSharedAlbum:]( self,  "_collectionAtIndexPath:isOwnedSharedAlbum:",  a3,  v5));
  id v10 = v9;
  if (v9)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000589B0;
    v14[3] = &unk_1000CBE10;
    id v15 = v9;
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v8 fetchResultForObject:v15 missBlock:v14]);
  }

  else
  {
    double v11 = 0LL;
  }

  if ([v11 count]) {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
  }
  else {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (id)_collectionAtIndexPath:(id)a3 isOwnedSharedAlbum:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    uint64_t v7 = 2LL;
  }
  else {
    uint64_t v7 = 3LL;
  }
  id v8 = (id *)&(&self->super.super.super.isa)[v7];
  id v9 = -[objc_class count]((&self->super.super.super.isa)[v7], "count");
  if (v9 <= [v6 item]) {
    id v10 = 0LL;
  }
  else {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v8, "objectAtIndex:", objc_msgSend(v6, "item")));
  }

  return v10;
}

- (void)_loadUpActivityAssetsAndPopulateBanner
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058AD4;
  block[3] = &unk_1000C9528;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)_displayInvitationDialogForSubscribingToCollection:(id)a3 assetCollection:(id)a4
{
  id v5 = a3;
  id v31 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudOwnerFullName]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudOwnerEmail]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 localizedTitle]);
  uint64_t v35 = (void *)v8;
  uint64_t v9 = objc_claimAutoreleasedReturnValue( +[PLPhotoSharingHelper sharingDisplayNameIncludingEmail:allowsEmail:]( &OBJC_CLASS___PLPhotoSharingHelper,  "sharingDisplayNameIncludingEmail:allowsEmail:",  1LL,  1LL));
  id v10 = (void *)v9;
  if (v9) {
    double v11 = (__CFString *)v9;
  }
  else {
    double v11 = &stru_1000CC6C8;
  }
  uint64_t v12 = v11;

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"albumSubscribeInvitationMessage" value:&stru_1000CC6C8 table:0]);
  id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v6, v7, v8));

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"sharedAlbumInvitationSubscriberInfo" value:&stru_1000CC6C8 table:0]);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v16, v12));

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v34,  v33,  1LL));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"acceptActionTitle" value:&stru_1000CC6C8 table:0]);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000591A4;
  v40[3] = &unk_1000CBEB0;
  id v20 = v5;
  id v41 = v20;
  id v21 = v31;
  id v42 = v21;
  uint64_t v43 = self;
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v19,  0LL,  v40));
  [v17 addAction:v22];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v24 = (void *)objc_claimAutoreleasedReturnValue( [v23 localizedStringForKey:@"declineActionTitle" value:&stru_1000CC6C8 table:0]);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000592BC;
  v36[3] = &unk_1000CBEB0;
  id v37 = v20;
  uint64_t v38 = self;
  id v39 = v21;
  id v25 = v21;
  id v26 = v20;
  double v27 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v24,  0LL,  v36));
  [v17 addAction:v27];

  double v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v29 = (void *)objc_claimAutoreleasedReturnValue( [v28 localizedStringForKey:@"cancelActionTitle" value:&stru_1000CC6C8 table:0]);
  double v30 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v29,  0LL,  0LL));
  [v17 addAction:v30];

  -[TVPSharedPSMainViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v17,  1LL,  0LL);
}

- (BOOL)_hasSharedAlbumsWithPendingInvitationsInPhotoLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100059524;
  v8[3] = &unk_1000C9BA8;
  v8[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 photoLibrary]);
  id v9 = v5;
  id v10 = &v11;
  [v5 performBlockAndWait:v8];
  char v6 = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)_sharedAlbumsInPhotoLibrary:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 albumListForContentMode:1]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PLFilteredAlbumList filteredAlbumList:filter:]( &OBJC_CLASS___PLFilteredAlbumList,  "filteredAlbumList:filter:",  v3,  0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 albums]);
  char v6 = (void *)objc_claimAutoreleasedReturnValue([v5 array]);

  return v6;
}

- (int64_t)_totalSharedAssetsCount
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v3 = self->_sharedAlbums;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
  if (v4)
  {
    id v5 = v4;
    int64_t v6 = 0LL;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += (int64_t)[*(id *)(*((void *)&v19 + 1) + 8 * (void)i) estimatedAssetCount];
      }

      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
    }

    while (v5);
  }

  else
  {
    int64_t v6 = 0LL;
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v9 = self->_subscribedAlbums;
  id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v6 += (int64_t)objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)j),  "estimatedAssetCount",  (void)v15);
      }

      id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
    }

    while (v11);
  }

  return v6;
}

- (void)_cancelExistingTimer
{
  fetchAssetsAndReloadTimer = self->_fetchAssetsAndReloadTimer;
  if (fetchAssetsAndReloadTimer)
  {
    -[NSTimer invalidate](fetchAssetsAndReloadTimer, "invalidate");
    id v4 = self->_fetchAssetsAndReloadTimer;
    self->_fetchAssetsAndReloadTimer = 0LL;
  }

- (int64_t)tabMode
{
  return 2LL;
}

- (NSArray)sharedAlbums
{
  return self->_sharedAlbums;
}

- (void)setSharedAlbums:(id)a3
{
}

- (NSArray)subscribedAlbums
{
  return self->_subscribedAlbums;
}

- (void)setSubscribedAlbums:(id)a3
{
}

- (UIVisualEffectView)sharedAlbumHeaderView
{
  return self->_sharedAlbumHeaderView;
}

- (void)setSharedAlbumHeaderView:(id)a3
{
}

- (UIVisualEffectView)subscribedAlbumHeaderView
{
  return self->_subscribedAlbumHeaderView;
}

- (void)setSubscribedAlbumHeaderView:(id)a3
{
}

- (TVPSharedPSActivityBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
}

- (UIView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (TVPFetchManager)sharedAlbumsFetchManager
{
  return self->_sharedAlbumsFetchManager;
}

- (void)setSharedAlbumsFetchManager:(id)a3
{
}

- (TVPFetchManager)myPhotoStreamFetchManager
{
  return self->_myPhotoStreamFetchManager;
}

- (void)setMyPhotoStreamFetchManager:(id)a3
{
}

- (TVPCollectionViewCachingManager)sharedAlbumsCachingManager
{
  return self->_sharedAlbumsCachingManager;
}

- (void)setSharedAlbumsCachingManager:(id)a3
{
}

- (TVPCollectionViewCachingManager)subscribedAlbumsCachingManager
{
  return self->_subscribedAlbumsCachingManager;
}

- (void)setSubscribedAlbumsCachingManager:(id)a3
{
}

- (NSTimer)fetchAssetsAndReloadTimer
{
  return self->_fetchAssetsAndReloadTimer;
}

- (void)setFetchAssetsAndReloadTimer:(id)a3
{
}

- (BOOL)photoLibraryDidUpdateWithChanges
{
  return self->_photoLibraryDidUpdateWithChanges;
}

- (void)setPhotoLibraryDidUpdateWithChanges:(BOOL)a3
{
  self->_photoLibraryDidUpdateWithChanges = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void).cxx_destruct
{
}

@end