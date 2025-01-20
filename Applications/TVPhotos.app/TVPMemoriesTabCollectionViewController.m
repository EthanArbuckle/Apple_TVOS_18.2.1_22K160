@interface TVPMemoriesTabCollectionViewController
- (BOOL)_isWatchNextSectionLoaded;
- (BOOL)collectionNeedsReload;
- (BOOL)collectionNeedsUpdate;
- (BOOL)initialSyncComplete;
- (BOOL)isScrollingEnabled;
- (CGRect)_normalizedCropRectForAsset:(id)a3 withSize:(CGSize)a4;
- (NSArray)sections;
- (NSIndexPath)focusedIndexPath;
- (NSMutableDictionary)sectionScrollOffsets;
- (NSTimer)updateCollectionViewTimer;
- (PBSBulletin)currentBulletin;
- (PBSBulletinServiceInterface)bulletinServiceProxy;
- (PHCachingImageManager)cachingImageManager;
- (PHPhotoLibrary)photoLibrary;
- (PXCPLUIStatusProvider)statusProvider;
- (PXGradientView)favoriteGradientView;
- (PXGradientView)watchNextGradientView;
- (PXLibraryFilterState)libraryFilterState;
- (PXSharedLibraryStatusProvider)libraryStatusProvider;
- (PXStoryModel)actionMenuModel;
- (TVPMemoriesTabCollectionViewController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4;
- (TVPMemoriesTabPreviewManager)previewAssetManager;
- (UICollectionView)collectionView;
- (UIImageView)previewView;
- (UIView)loadingView;
- (UIVisualEffectView)blurView;
- (double)_preferredHeaderHeightForSectionAtIndex:(int64_t)a3;
- (double)_showcaseScrollOffset;
- (double)collectionViewTimerInterval;
- (double)contentHeight;
- (double)displayScale;
- (double)showcaseFactor;
- (id)_layoutSectionForSectionIndex:(int64_t)a3 environment:(id)a4;
- (id)_memoryAssetsForIndexPaths:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (int64_t)_numberOfNonEmptySections;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)tabMode;
- (void)_configureCell:(id)a3 atIndexPath:(id)a4;
- (void)_configureGradientViews;
- (void)_configurePeekForCell:(id)a3 atIndexPath:(id)a4;
- (void)_configurePreviewForIndex:(id)a3 withDelay:(BOOL)a4;
- (void)_dismissAllLoadingAndEmptyViews;
- (void)_dismissEmptyView;
- (void)_dismissLoadingView;
- (void)_displayEmptyOrLoadingMessageIfNeeded;
- (void)_displayLoadingView;
- (void)_handleLongPress:(id)a3;
- (void)_handlePlayButton:(id)a3;
- (void)_playMemoryWithInfo:(id)a3 willPresentHandler:(id)a4;
- (void)_presentActionMenuForMemoryWithInfo:(id)a3;
- (void)_presentBulletinMessage:(id)a3 imageKey:(id)a4 withCompletion:(id)a5;
- (void)_setPreviewImage:(id)a3;
- (void)_setupBlurView;
- (void)_setupFavoriteGradientView;
- (void)_setupWatchNextGradientView;
- (void)_updateCPLStatus;
- (void)_updateCollectionView;
- (void)_updateCollectionViewTimerFired;
- (void)_updatePreviewGradientViews;
- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)ppt_navigateToLatestInteractiveMemoryWithWillPresentHandler:(id)a3;
- (void)previewManagerDidUpdatePreview:(id)a3;
- (void)reloadSection:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)sectionHasUpdates:(id)a3;
- (void)setActionMenuModel:(id)a3;
- (void)setBulletinServiceProxy:(id)a3;
- (void)setCachingImageManager:(id)a3;
- (void)setCollectionNeedsReload:(BOOL)a3;
- (void)setCollectionNeedsUpdate:(BOOL)a3;
- (void)setCollectionViewTimerInterval:(double)a3;
- (void)setCurrentBulletin:(id)a3;
- (void)setDisplayScale:(double)a3;
- (void)setFocusedIndexPath:(id)a3;
- (void)setInitialSyncComplete:(BOOL)a3;
- (void)setLoadingView:(id)a3;
- (void)setPreviewView:(id)a3;
- (void)setSectionScrollOffsets:(id)a3;
- (void)setShowcaseFactor:(double)a3;
- (void)setStatusProvider:(id)a3;
- (void)setUpdateCollectionViewTimer:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation TVPMemoriesTabCollectionViewController

- (TVPMemoriesTabCollectionViewController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4
{
  id v6 = a3;
  id obj = a4;
  id v41 = a4;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionViewController;
  v7 = -[TVPMemoriesTabCollectionViewController init](&v53, "init");
  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvp_buildMemoriesTabSectionsWithLibraryFilterState:", v41));
    sections = v7->_sections;
    v7->_sections = (NSArray *)v8;

    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    v10 = v7->_sections;
    id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v49,  v55,  16LL);
    if (v11)
    {
      uint64_t v12 = *(void *)v50;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v50 != v12) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * (void)i) setDelegate:v7];
        }

        id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v49,  v55,  16LL);
      }

      while (v11);
    }

    objc_initWeak(&location, v7);
    v14 = objc_alloc(&OBJC_CLASS___TVPMemoriesTabCollectionViewLayout);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_10002A15C;
    v46[3] = &unk_1000CA570;
    v38 = &v47;
    objc_copyWeak(&v47, &location);
    v40 = -[TVPMemoriesTabCollectionViewLayout initWithSectionProvider:](v14, "initWithSectionProvider:", v46);
    v15 = -[UICollectionView initWithFrame:collectionViewLayout:]( objc_alloc(&OBJC_CLASS___UICollectionView),  "initWithFrame:collectionViewLayout:",  v40,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    collectionView = v7->_collectionView;
    v7->_collectionView = v15;

    -[UICollectionView setDataSource:](v7->_collectionView, "setDataSource:", v7);
    -[UICollectionView setDelegate:](v7->_collectionView, "setDelegate:", v7);
    -[UICollectionView setPrefetchDataSource:](v7->_collectionView, "setPrefetchDataSource:", v7);
    -[UICollectionView setContentInsetAdjustmentBehavior:]( v7->_collectionView,  "setContentInsetAdjustmentBehavior:",  2LL);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    v17 = v7->_sections;
    id v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v42,  v54,  16LL);
    if (v18)
    {
      uint64_t v19 = *(void *)v43;
      do
      {
        for (j = 0LL; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v17);
          }
          v21 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)j);
          v22 = v7->_collectionView;
          id v23 = objc_msgSend(v21, "cellClass", v38, obj);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v21 cellReuseIdentifier]);
          -[UICollectionView registerClass:forCellWithReuseIdentifier:]( v22,  "registerClass:forCellWithReuseIdentifier:",  v23,  v24);
        }

        id v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v42,  v54,  16LL);
      }

      while (v18);
    }

    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:]( v7->_collectionView,  "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___TVPMemoriesTabCollectionSectionHeaderView, v25),  @"sectionHeaderKind",  @"sectionHeaderReuseIdentifier");
    -[UICollectionView setRemembersLastFocusedIndexPath:](v7->_collectionView, "setRemembersLastFocusedIndexPath:", 1LL);
    -[UICollectionView setContentInset:](v7->_collectionView, "setContentInset:", 0.0, 0.0, 90.0, 0.0);
    -[TVPMemoriesTabCollectionViewController setTabBarObservedScrollView:]( v7,  "setTabBarObservedScrollView:",  v7->_collectionView);
    uint64_t v27 = objc_opt_new(&OBJC_CLASS___PHCachingImageManager, v26);
    cachingImageManager = v7->_cachingImageManager;
    v7->_cachingImageManager = (PHCachingImageManager *)v27;

    v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sectionScrollOffsets = v7->_sectionScrollOffsets;
    v7->_sectionScrollOffsets = v29;

    v31 = objc_alloc_init(&OBJC_CLASS___TVPMemoriesTabPreviewManager);
    previewAssetManager = v7->_previewAssetManager;
    v7->_previewAssetManager = v31;

    -[TVPMemoriesTabPreviewManager setDelegate:](v7->_previewAssetManager, "setDelegate:", v7);
    uint64_t v33 = objc_claimAutoreleasedReturnValue( +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:]( &OBJC_CLASS___PXSharedLibraryStatusProvider,  "sharedLibraryStatusProviderWithPhotoLibrary:",  v6));
    libraryStatusProvider = v7->_libraryStatusProvider;
    v7->_libraryStatusProvider = (PXSharedLibraryStatusProvider *)v33;

    objc_storeStrong((id *)&v7->_libraryFilterState, obj);
    v35 = -[PXCPLUIStatusProvider initWithPhotoLibrary:]( objc_alloc(&OBJC_CLASS___PXCPLUIStatusProvider),  "initWithPhotoLibrary:",  v6);
    statusProvider = v7->_statusProvider;
    v7->_statusProvider = v35;

    -[PXCPLUIStatusProvider registerChangeObserver:context:]( v7->_statusProvider,  "registerChangeObserver:context:",  v7,  off_100101C70);
    -[TVPMemoriesTabCollectionViewController setCollectionViewTimerInterval:]( v7,  "setCollectionViewTimerInterval:",  0.2);

    objc_destroyWeak(v38);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (double)contentHeight
{
  double result = self->_contentHeight;
  if (result == 0.0)
  {
    uint64_t v6 = 0LL;
    v7 = &v6;
    uint64_t v8 = 0x2020000000LL;
    uint64_t v9 = 0LL;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10002A28C;
    v5[3] = &unk_1000CA598;
    v5[4] = self;
    v5[5] = &v6;
    [v4 enumerateObjectsUsingBlock:v5];

    *(void *)&self->_contentHeight = v7[3];
    _Block_object_dispose(&v6, 8);
    return self->_contentHeight;
  }

  return result;
}

- (void)setShowcaseFactor:(double)a3
{
  if (self->_showcaseFactor != a3)
  {
    self->_showcaseFactor = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathsForVisibleSupplementaryElementsOfKind:@"sectionHeaderKind"]);

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v31;
      double v11 = 1.0 - a3;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          v13 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          if ([v13 section])
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
            v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 supplementaryViewForElementKind:@"sectionHeaderKind" atIndexPath:v13]);

            [v15 setTitleAlpha:v11];
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }

      while (v9);
    }

    -[TVPMemoriesTabCollectionViewController _updatePreviewGradientViews](self, "_updatePreviewGradientViews");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 indexPathsForVisibleItems]);

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v18 = v17;
    id v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (j = 0LL; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)j);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView", (void)v26));
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 cellForItemAtIndexPath:v23]);

          -[TVPMemoriesTabCollectionViewController _configurePeekForCell:atIndexPath:]( self,  "_configurePeekForCell:atIndexPath:",  v25,  v23);
        }

        id v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }

      while (v20);
    }
  }

- (BOOL)isScrollingEnabled
{
  return -[TVPMemoriesTabCollectionViewController _numberOfNonEmptySections](self, "_numberOfNonEmptySections") > 1;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionViewController;
  -[TVPMemoriesTabCollectionViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 traitCollection]);
  [v4 displayScale];
  -[TVPMemoriesTabCollectionViewController setDisplayScale:](self, "setDisplayScale:");

  v5 = objc_alloc(&OBJC_CLASS___UIImageView);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v6 bounds];
  id v7 = -[UIImageView initWithFrame:](v5, "initWithFrame:");
  -[TVPMemoriesTabCollectionViewController setPreviewView:](self, "setPreviewView:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController previewView](self, "previewView"));
  [v8 setContentMode:2];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController previewView](self, "previewView"));
  [v9 addSubview:v10];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController previewView](self, "previewView"));
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  id v16 = -[TVPMemoriesTabCollectionViewController displayScale](self, "displayScale");
  double v18 = PXSizeScale(v16, v13, v15, v17);
  double v20 = v19;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController previewAssetManager](self, "previewAssetManager"));
  objc_msgSend(v21, "setPreviewSizeInPixels:", v18, v20);

  -[TVPMemoriesTabCollectionViewController _configureGradientViews](self, "_configureGradientViews");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
  [v22 addSubview:v23];

  if (-[TVPMemoriesTabCollectionViewController _isWatchNextSectionLoaded](self, "_isWatchNextSectionLoaded"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  0LL));
    -[TVPMemoriesTabCollectionViewController _configurePreviewForIndex:withDelay:]( self,  "_configurePreviewForIndex:withDelay:",  v24,  0LL);
  }

  uint64_t v25 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  self,  "_handleLongPress:");
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
  [v26 addGestureRecognizer:v25];

  __int128 v27 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handlePlayButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v27, "setAllowedPressTypes:", &off_1000D1B88);
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
  [v28 addGestureRecognizer:v27];

  -[TVPMemoriesTabCollectionViewController setShowcaseFactor:](self, "setShowcaseFactor:", 1.0);
  -[TVPMemoriesTabCollectionViewController _displayEmptyOrLoadingMessageIfNeeded]( self,  "_displayEmptyOrLoadingMessageIfNeeded");
  -[TVPMemoriesTabCollectionViewController _updateCPLStatus](self, "_updateCPLStatus");
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionViewController;
  -[TVPMemoriesTabCollectionViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  self->_contentHeight = 0.0;
}

- (void)viewDidLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionViewController;
  -[TVPMemoriesTabCollectionViewController viewDidLayoutSubviews](&v16, "viewDidLayoutSubviews");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v13, "_setVisibleRectEdgeInsets:", 0.0, 0.0, -65.0, 0.0);

  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController updateCollectionViewTimer](self, "updateCollectionViewTimer"));
  if (!v14)
  {
    -[TVPMemoriesTabCollectionViewController collectionViewTimerInterval](self, "collectionViewTimerInterval");
    double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_updateCollectionViewTimerFired",  0LL,  0LL));
    -[TVPMemoriesTabCollectionViewController setUpdateCollectionViewTimer:](self, "setUpdateCollectionViewTimer:", v15);
  }

- (void)_updateCollectionViewTimerFired
{
  if (-[TVPMemoriesTabCollectionViewController collectionNeedsUpdate](self, "collectionNeedsUpdate"))
  {
    -[TVPMemoriesTabCollectionViewController setCollectionNeedsUpdate:](self, "setCollectionNeedsUpdate:", 0LL);
    -[TVPMemoriesTabCollectionViewController _updateCollectionView](self, "_updateCollectionView");
  }

  -[TVPMemoriesTabCollectionViewController setUpdateCollectionViewTimer:](self, "setUpdateCollectionViewTimer:", 0LL);
  -[TVPMemoriesTabCollectionViewController setCollectionViewTimerInterval:]( self,  "setCollectionViewTimerInterval:",  0.2);
}

- (int64_t)tabMode
{
  return 1LL;
}

- (id)_layoutSectionForSectionIndex:(int64_t)a3 environment:(id)a4
{
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:a3]);

  id v9 = [v8 scrollDirection];
  if (v9 == (id)1)
  {
    [v8 itemSize];
    double v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:"));
    [v8 itemSize];
    double v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  v18));
    double v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v17,  v19));

    double v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutItem itemWithLayoutSize:]( &OBJC_CLASS___NSCollectionLayoutItem,  "itemWithLayoutSize:",  v13));
    v35 = v20;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:]( &OBJC_CLASS___NSCollectionLayoutGroup,  "horizontalGroupWithLayoutSize:subitems:",  v13,  v21));
  }

  else if (v9)
  {
    objc_super v16 = 0LL;
    double v13 = 0LL;
  }

  else
  {
    [v8 itemSize];
    double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:"));
    [v8 itemSize];
    double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  v11));
    double v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v10,  v12));

    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutItem itemWithLayoutSize:]( &OBJC_CLASS___NSCollectionLayoutItem,  "itemWithLayoutSize:",  v13));
    [v8 extraVerticalSpacing];
    objc_msgSend(v14, "setContentInsets:", 0.0, 0.0, v15, 0.0);
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:repeatingSubitem:count:]( NSCollectionLayoutGroup,  "horizontalGroupWithLayoutSize:repeatingSubitem:count:",  v13,  v14,  [v8 columnCount]));
  }

  [v8 itemSpacing];
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](&OBJC_CLASS___NSCollectionLayoutSpacing, "fixedSpacing:"));
  [v16 setInterItemSpacing:v22];

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutDimension fractionalWidthDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "fractionalWidthDimension:",  1.0));
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutDimension estimatedDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "estimatedDimension:",  100.0));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v23,  v24));

  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:]( &OBJC_CLASS___NSCollectionLayoutBoundarySupplementaryItem,  "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:",  v25,  @"sectionHeaderKind",  2LL));
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSCollectionLayoutSection sectionWithGroup:]( &OBJC_CLASS___NSCollectionLayoutSection,  "sectionWithGroup:",  v16));
  v34 = v26;
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
  [v27 setBoundarySupplementaryItems:v28];

  [v8 itemSpacing];
  objc_msgSend(v27, "setInterGroupSpacing:");
  id v29 = [v8 scrollDirection];
  objc_initWeak(&location, self);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10002AE2C;
  v31[3] = &unk_1000CA5C0;
  objc_copyWeak(&v32, &location);
  [v27 setVisibleItemsInvalidationHandler:v31];
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v27;
}

- (void)sectionHasUpdates:(id)a3
{
  if (-[TVPMemoriesTabCollectionViewController isViewLoaded](self, "isViewLoaded", a3)
    && !-[TVPMemoriesTabCollectionViewController collectionNeedsUpdate](self, "collectionNeedsUpdate"))
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 window]);

    if (!v5) {
      -[TVPMemoriesTabCollectionViewController setCollectionViewTimerInterval:]( self,  "setCollectionViewTimerInterval:",  0.0);
    }
    -[TVPMemoriesTabCollectionViewController setCollectionNeedsUpdate:](self, "setCollectionNeedsUpdate:", 1LL);
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    [v6 setNeedsLayout];
  }

- (void)reloadSection:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B020;
  block[3] = &unk_1000C9528;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)previewManagerDidUpdatePreview:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController previewAssetManager](self, "previewAssetManager", a3));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v5 previewImage]);
  -[TVPMemoriesTabCollectionViewController _setPreviewImage:](self, "_setPreviewImage:", v4);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections", a3));
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:a4]);

  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 snapshot]);
  id v8 = [v7 numberOfItems];

  return (int64_t)v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 cellReuseIdentifier]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v6]);

  return v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));

  double v11 = (void *)objc_claimAutoreleasedReturnValue( [v8 dequeueReusableSupplementaryViewOfKind:@"sectionHeaderKind" withReuseIdentifier:@"sectionHeaderReuseIdentifier" forIndexPath:v7]);
  -[TVPMemoriesTabCollectionViewController _preferredHeaderHeightForSectionAtIndex:]( self,  "_preferredHeaderHeightForSectionAtIndex:",  [v7 section]);
  objc_msgSend(v11, "setPreferredHeight:");
  id v12 = [v7 section];

  if (v12 == (id)1)
  {
    -[TVPMemoriesTabCollectionViewController showcaseFactor](self, "showcaseFactor");
    double v14 = 1.0 - v15;
LABEL_7:
    [v11 setTitleAlpha:v14];
    goto LABEL_8;
  }

  if (!v12)
  {
    unsigned int v13 = -[TVPMemoriesTabCollectionViewController _isWatchNextSectionLoaded](self, "_isWatchNextSectionLoaded");
    double v14 = 0.0;
    if (v13) {
      double v14 = 1.0;
    }
    goto LABEL_7;
  }

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
  id v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v15 snapshot]);
  id v9 = [v6 item];

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectReferenceAtIndex:v9]);
  if (!v10)
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, self, @"TVPMemoriesTabCollectionViewController.m", 420, @"Invalid parameter not satisfying: %@", @"objectReference != nil" object file lineNumber description];
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 leafObject]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___PXMemoryInfo, v12);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0) {
    -[TVPMemoriesTabCollectionViewController _playMemoryWithInfo:willPresentHandler:]( self,  "_playMemoryWithInfo:willPresentHandler:",  v11,  0LL);
  }
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController focusedIndexPath](self, "focusedIndexPath"));
  id v6 = [v5 section];

  if (v6 == (id)1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController focusedIndexPath](self, "focusedIndexPath"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 indexPathsForVisibleItems]);
    unsigned __int8 v9 = [v8 containsObject:v7];

    if ((v9 & 1) == 0)
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController focusedIndexPath](self, "focusedIndexPath"));
      double v11 = (char *)[v10 item] - 1;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController focusedIndexPath](self, "focusedIndexPath"));
      id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  v11,  [v12 section]));

      double v14 = (void *)objc_claimAutoreleasedReturnValue([v4 indexPathsForVisibleItems]);
      unsigned int v15 = [v14 containsObject:v13];

      if (!v15)
      {
        objc_super v16 = 0LL;
        goto LABEL_8;
      }

      id v7 = v13;
    }

    id v13 = v7;
    objc_super v16 = v13;
LABEL_8:

    goto LABEL_9;
  }

  objc_super v16 = 0LL;
LABEL_9:

  return v16;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v8 nextFocusedIndexPath]);
  -[TVPMemoriesTabCollectionViewController setFocusedIndexPath:](self, "setFocusedIndexPath:", v11);

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v8 nextFocusedIndexPath]);
  if (v12)
  {
    id v13 = (void *)v12;
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v8 previouslyFocusedIndexPath]);

    if (v14)
    {
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v8 previouslyFocusedIndexPath]);
      id v16 = [v15 section];
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v8 nextFocusedIndexPath]);
      BOOL v18 = v16 == [v17 section];

      double v19 = (void *)objc_claimAutoreleasedReturnValue([v8 nextFocusedIndexPath]);
      double v20 = self;
      uint64_t v21 = v19;
      BOOL v22 = v18;
LABEL_6:
      -[TVPMemoriesTabCollectionViewController _configurePreviewForIndex:withDelay:]( v20,  "_configurePreviewForIndex:withDelay:",  v21,  v22);

      goto LABEL_7;
    }
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 previouslyFocusedIndexPath]);

  if (!v23)
  {
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v8 nextFocusedIndexPath]);
    double v20 = self;
    uint64_t v21 = v19;
    BOOL v22 = 0LL;
    goto LABEL_6;
  }

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sectionScrollOffsets](self, "sectionScrollOffsets"));
  [v13 adjustSupplementaryView:v12 forElementKind:v11 atIndexPath:v10 sectionScrollOffsets:v14];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController focusedIndexPath](self, "focusedIndexPath", a3, a4.x, a4.y));
  id v8 = [v7 section];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
  id v10 = [v9 count];

  if (v10)
  {
    if (!v8)
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
      [v12 adjustedContentInset];
      a5->y = -v11;
    }
  }

- (void)scrollViewDidScroll:(id)a3
{
  double v5 = v4;
  -[TVPMemoriesTabCollectionViewController _showcaseScrollOffset](self, "_showcaseScrollOffset");
  double v7 = (v6 * 0.5 * -0.01 + v5 * 1.01) / v6;
  if (v7 > 1.0) {
    double v7 = 1.0;
  }
  if (v7 <= 0.0) {
    double v8 = 1.0;
  }
  else {
    double v8 = 1.0 - v7;
  }
  -[TVPMemoriesTabCollectionViewController setShowcaseFactor:](self, "setShowcaseFactor:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController previewView](self, "previewView"));
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  id v16 = (id)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController previewView](self, "previewView"));
  objc_msgSend(v16, "setBounds:", v11, v5, v13, v15);
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5 = a4;
  id v21 = (id)objc_opt_new(&OBJC_CLASS___PHImageRequestOptions, v6);
  [v21 setResizeMode:2];
  double v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVPMemoriesTabCollectionViewController _memoryAssetsForIndexPaths:]( self,  "_memoryAssetsForIndexPaths:",  v5));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  double v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v9, "section")));
  [v10 itemSize];
  double v12 = v11;
  double v14 = v13;
  id v15 = -[TVPMemoriesTabCollectionViewController displayScale](self, "displayScale");
  double v17 = PXSizeScale(v15, v12, v14, v16);
  double v19 = v18;

  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController cachingImageManager](self, "cachingImageManager"));
  objc_msgSend(v20, "startCachingImagesForAssets:targetSize:contentMode:options:", v7, 1, v21, v17, v19);
}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
  id v5 = a4;
  id v21 = (id)objc_opt_new(&OBJC_CLASS___PHImageRequestOptions, v6);
  [v21 setResizeMode:2];
  double v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVPMemoriesTabCollectionViewController _memoryAssetsForIndexPaths:]( self,  "_memoryAssetsForIndexPaths:",  v5));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  double v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v9, "section")));
  [v10 itemSize];
  double v12 = v11;
  double v14 = v13;
  id v15 = -[TVPMemoriesTabCollectionViewController displayScale](self, "displayScale");
  double v17 = PXSizeScale(v15, v12, v14, v16);
  double v19 = v18;

  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController cachingImageManager](self, "cachingImageManager"));
  objc_msgSend(v20, "stopCachingImagesForAssets:targetSize:contentMode:options:", v7, 1, v21, v17, v19);
}

- (void)_handleLongPress:(id)a3
{
  if ([a3 state] == (id)1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFocusSystem focusSystemForEnvironment:]( &OBJC_CLASS___UIFocusSystem,  "focusSystemForEnvironment:",  self));
    id v20 = (id)objc_claimAutoreleasedReturnValue([v5 focusedItem]);

    uint64_t v7 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, v6);
    if ((objc_opt_isKindOfClass(v20, v7) & 1) != 0)
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
      unsigned int v9 = [v8 containsView:v20];

      if (v9)
      {
        double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
        double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 indexPathForCell:v20]);

        if (v11)
        {
          double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
          double v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v11, "section")));

          double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 snapshot]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectReferenceAtIndex:", objc_msgSend(v11, "item")));

          if (!v15)
          {
            double v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
            [v19 handleFailureInMethod:a2, self, @"TVPMemoriesTabCollectionViewController.m", 510, @"Invalid parameter not satisfying: %@", @"objectReference != nil" object file lineNumber description];
          }

          double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 leafObject]);
          uint64_t v18 = objc_opt_class(&OBJC_CLASS___PXMemoryInfo, v17);
          if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0) {
            -[TVPMemoriesTabCollectionViewController _presentActionMenuForMemoryWithInfo:]( self,  "_presentActionMenuForMemoryWithInfo:",  v16);
          }
        }
      }
    }
  }

- (void)_handlePlayButton:(id)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFocusSystem focusSystemForEnvironment:]( &OBJC_CLASS___UIFocusSystem,  "focusSystemForEnvironment:",  self));
  id v20 = (id)objc_claimAutoreleasedReturnValue([v5 focusedItem]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, v6);
  if ((objc_opt_isKindOfClass(v20, v7) & 1) != 0)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
    unsigned int v9 = [v8 containsView:v20];

    if (v9)
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 indexPathForCell:v20]);

      if (v11)
      {
        double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
        double v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v11, "section")));

        double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 snapshot]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectReferenceAtIndex:", objc_msgSend(v11, "item")));

        if (!v15)
        {
          double v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
          [v19 handleFailureInMethod:a2, self, @"TVPMemoriesTabCollectionViewController.m", 527, @"Invalid parameter not satisfying: %@", @"objectReference != nil" object file lineNumber description];
        }

        double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 leafObject]);
        uint64_t v18 = objc_opt_class(&OBJC_CLASS___PXMemoryInfo, v17);
        if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0) {
          -[TVPMemoriesTabCollectionViewController _playMemoryWithInfo:willPresentHandler:]( self,  "_playMemoryWithInfo:willPresentHandler:",  v16,  0LL);
        }
      }
    }
  }
}

- (void)_playMemoryWithInfo:(id)a3 willPresentHandler:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a3 assetCollection]);
  id v8 = [[PXStoryConfiguration alloc] initWithAssetCollection:v7];
  [v8 setLaunchType:PXStoryLaunchTypeTVMemoriesTab];
  uint64_t v11 = 0LL;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[PXStoryUIFactory viewControllerWithConfiguration:contentViewController:]( &OBJC_CLASS___PXStoryUIFactory,  "viewControllerWithConfiguration:contentViewController:",  v8,  &v11));
  if (v6) {
    v6[2](v6, v11);
  }
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController navigationController](self, "navigationController"));
  [v10 pushViewController:v9 animated:1];
}

- (void)_presentActionMenuForMemoryWithInfo:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 assetCollection]);
  id v6 = [[PXStoryConfiguration alloc] initWithAssetCollection:v5];
  uint64_t v7 = objc_alloc(&OBJC_CLASS___PXStoryModel);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVPMemoriesTabCollectionViewController px_extendedTraitCollection]( self,  "px_extendedTraitCollection"));
  unsigned int v9 = -[PXStoryModel initWithConfiguration:extendedTraitCollection:]( v7,  "initWithConfiguration:extendedTraitCollection:",  v6,  v8);

  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[PXMemoriesTitleHelper defaultHelper](&OBJC_CLASS___PXMemoriesTitleHelper, "defaultHelper"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedTitle]);
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 displayableTextForTitle:v11 intent:1]);

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v4 assetCollection]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 localizedSubtitle]);
  id v32 = v6;
  __int128 v33 = (void *)v5;
  v34 = v4;

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"TVPMemoriesActionFavoritesTitleFormat" value:&stru_1000CC6C8 table:0]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v16, v12, v14));
  __int128 v31 = (void *)v14;

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v17,  0LL,  1LL));
  unsigned __int8 v19 = -[PXStoryModel currentAssetCollectionIsFavorite](v9, "currentAssetCollectionIsFavorite");
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  if ((v19 & 1) != 0) {
    uint64_t v21 = objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"TVPMemoriesActionRemoveFromFavorites" value:&stru_1000CC6C8 table:0]);
  }
  else {
    uint64_t v21 = objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"TVPMemoriesActionAddToFavorites" value:&stru_1000CC6C8 table:0]);
  }
  BOOL v22 = (void *)v21;

  -[TVPMemoriesTabCollectionViewController setActionMenuModel:](self, "setActionMenuModel:", v9);
  char v23 = v19 ^ 1;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10002C500;
  v40[3] = &unk_1000CA608;
  v24 = v9;
  char v43 = v23;
  id v41 = v24;
  __int128 v42 = self;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v22,  0LL,  v40));
  [v18 addAction:v25];

  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( [v26 localizedStringForKey:@"TVPMemoriesActionDelete" value:&stru_1000CC6C8 table:0]);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10002C6A0;
  v37[3] = &unk_1000CA630;
  objc_copyWeak(&v39, location);
  __int128 v28 = v24;
  v38 = v28;
  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v27,  0LL,  v37));
  [v18 addAction:v29];

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10002C98C;
  v35[3] = &unk_1000C9E00;
  objc_copyWeak(&v36, location);
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  v35));
  [v18 addAction:v30];

  -[TVPMemoriesTabCollectionViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v18,  1LL,  0LL);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v39);
  objc_destroyWeak(location);
}

- (void)_updateCollectionView
{
  uint64_t v48 = 0LL;
  __int128 v49 = &v48;
  uint64_t v50 = 0x2020000000LL;
  char v51 = 0;
  uint64_t v44 = 0LL;
  __int128 v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  if (-[TVPMemoriesTabCollectionViewController _isWatchNextSectionLoaded](self, "_isWatchNextSectionLoaded")) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = -[TVPMemoriesTabCollectionViewController collectionNeedsReload](self, "collectionNeedsReload");
  }
  unsigned __int8 v47 = v3;
  -[TVPMemoriesTabCollectionViewController setCollectionNeedsReload:](self, "setCollectionNeedsReload:", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10002CE30;
  v40[3] = &unk_1000CA680;
  id v6 = v4;
  id v41 = v6;
  __int128 v42 = &v48;
  char v43 = &v44;
  [v5 enumerateObjectsUsingBlock:v40];

  if (*((_BYTE *)v45 + 24))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 snapshot]);
    BOOL v10 = [v9 numberOfItems] == 0;

    if (v10)
    {
      *((_BYTE *)v49 + 24) = 1;
    }

    else if (!*((_BYTE *)v49 + 24))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_10002CFEC;
      v33[3] = &unk_1000C9CC8;
      id v34 = v6;
      id v35 = v11;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10002D358;
      v29[3] = &unk_1000CA720;
      id v30 = v34;
      id v12 = v35;
      id v31 = v12;
      id v32 = self;
      [v12 performBatchUpdates:v33 completion:v29];

      goto LABEL_25;
    }

    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v17 = v6;
    id v18 = [v17 countByEnumeratingWithState:&v25 objects:v52 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * (void)i), "commit", (void)v25);
        }

        id v18 = [v17 countByEnumeratingWithState:&v25 objects:v52 count:16];
      }

      while (v18);
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
    [v21 reloadData];

    -[UICollectionView setScrollEnabled:]( self->_collectionView,  "setScrollEnabled:",  -[TVPMemoriesTabCollectionViewController isScrollingEnabled](self, "isScrollingEnabled"));
LABEL_25:
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue( -[TVPMemoriesTabCollectionViewController previewAssetManager]( self,  "previewAssetManager",  (void)v25));
    char v23 = (void *)objc_claimAutoreleasedReturnValue([v22 memory]);
    if (v23)
    {
    }

    else
    {
      unsigned int v24 = -[TVPMemoriesTabCollectionViewController _isWatchNextSectionLoaded](self, "_isWatchNextSectionLoaded");

      if (!v24)
      {
LABEL_30:
        -[TVPMemoriesTabCollectionViewController _displayEmptyOrLoadingMessageIfNeeded]( self,  "_displayEmptyOrLoadingMessageIfNeeded");
        goto LABEL_31;
      }

      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  0LL));
      -[TVPMemoriesTabCollectionViewController _configurePreviewForIndex:withDelay:]( self,  "_configurePreviewForIndex:withDelay:",  v22,  0LL);
    }

    goto LABEL_30;
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v13 = v6;
  id v14 = [v13 countByEnumeratingWithState:&v36 objects:v53 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v37;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * (void)j) commit];
      }

      id v14 = [v13 countByEnumeratingWithState:&v36 objects:v53 count:16];
    }

    while (v14);
  }

LABEL_31:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
}

- (id)_memoryAssetsForIndexPaths:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 count])
  {
    SEL v22 = a2;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    char v23 = v6;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v12);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v13, "section")));

          double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 snapshot]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectReferenceAtIndex:", objc_msgSend(v13, "item")));

          if (!v17)
          {
            id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
            [v20 handleFailureInMethod:v22, self, @"TVPMemoriesTabCollectionViewController.m", 720, @"Invalid parameter not satisfying: %@", @"objectReference != nil" object file lineNumber description];
          }

          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 itemObject]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 primaryAsset]);

          if (v19) {
            [v7 addObject:v19];
          }

          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v10);
    }

    id v6 = v23;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (void)_configureCell:(id)a3 atIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "section")));

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 snapshot]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectReferenceAtIndex:", objc_msgSend(v8, "item")));

  if (!v12)
  {
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v39 handleFailureInMethod:a2, self, @"TVPMemoriesTabCollectionViewController.m", 734, @"Invalid parameter not satisfying: %@", @"objectReference != nil" object file lineNumber description];
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 leafObject]);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___PXMemoryInfo, v14);
  if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v10 cellSpec]);
    [v7 setMemorySpec:v16];

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedTitle]);
    [v7 setMemoryTitle:v17];

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 assetCollection]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedSubtitle]);
    [v7 setMemorySubtitle:v19];
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 itemObject]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 primaryAsset]);

  if (v21)
  {
    SEL v22 = (void *)objc_claimAutoreleasedReturnValue([v21 localIdentifier]);
    [v7 setAssetLocalId:v22];

    __int128 v24 = (void *)objc_opt_new(&OBJC_CLASS___PHImageRequestOptions, v23);
    [v24 setResizeMode:1];
    [v24 setNetworkAccessAllowed:1];
    [v10 itemSize];
    -[TVPMemoriesTabCollectionViewController _normalizedCropRectForAsset:withSize:]( self,  "_normalizedCropRectForAsset:withSize:",  v21);
    objc_msgSend(v7, "setNormalizedCropRect:");
    [v21 aspectRatio];
    double v26 = v25;
    id v27 = [v10 itemSize];
    double v30 = PXSizeWithAspectRatioFillingSize(v27, v26, v28, v29);
    double v32 = v31;
    id v33 = -[TVPMemoriesTabCollectionViewController displayScale](self, "displayScale");
    double v35 = PXSizeScale(v33, v30, v32, v34);
    double v37 = v36;
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController cachingImageManager](self, "cachingImageManager"));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10002DADC;
    v40[3] = &unk_1000CA748;
    id v41 = v7;
    id v42 = v21;
    objc_msgSend( v38,  "requestImageForAsset:targetSize:contentMode:options:resultHandler:",  v42,  1,  v24,  v40,  v35,  v37);
  }

  -[TVPMemoriesTabCollectionViewController _configurePeekForCell:atIndexPath:]( self,  "_configurePeekForCell:atIndexPath:",  v7,  v8);
}

- (void)_configurePeekForCell:(id)a3 atIndexPath:(id)a4
{
  id v7 = a3;
  if ([a4 section])
  {
    -[TVPMemoriesTabCollectionViewController showcaseFactor](self, "showcaseFactor");
    [v7 setVerticalContentOffset:v6 * -65.0];
  }
}

- (void)_configurePreviewForIndex:(id)a3 withDelay:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:",  self);
  if (![v14 section])
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 snapshot]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectReferenceAtIndex:", objc_msgSend(v14, "item")));

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 itemObject]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetCollection]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController previewAssetManager](self, "previewAssetManager"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 primaryAsset]);
    [v12 updateForMemory:v11 defaultPreviewAsset:v13 withDelay:v4];
  }
}

- (void)_setPreviewImage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController previewView](self, "previewView"));
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_10002DDBC;
  id v10 = &unk_1000C9CC8;
  uint64_t v11 = self;
  id v12 = v4;
  id v6 = v4;
  +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  v5,  5243008LL,  &v7,  0LL,  0.3);

  -[TVPMemoriesTabCollectionViewController _updatePreviewGradientViews]( self,  "_updatePreviewGradientViews",  v7,  v8,  v9,  v10,  v11);
}

- (double)_showcaseScrollOffset
{
  double v4 = v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
  [v5 adjustedContentInset];
  double v7 = v4 + v6 + -1080.0;

  -[TVPMemoriesTabCollectionViewController _preferredHeaderHeightForSectionAtIndex:]( self,  "_preferredHeaderHeightForSectionAtIndex:",  0LL);
  double result = v8 + -90.0;
  if (result >= v7) {
    return v7;
  }
  return result;
}

- (CGRect)_normalizedCropRectForAsset:(id)a3 withSize:(CGSize)a4
{
  if (a3)
  {
    double height = a4.height;
    double width = a4.width;
    id v7 = a3;
    double v8 = (double)(unint64_t)[v7 pixelWidth];
    double v9 = (double)(unint64_t)[v7 pixelHeight];
    id v10 = -[TVPMemoriesTabCollectionViewController displayScale](self, "displayScale");
    objc_msgSend(v7, "suggestedCropForTargetSize:", PXSizeScale(v10, width, height, v11));
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    double x = v13 / v8;
    double y = v15 / v9;
    double v22 = v17 / v8;
    double v23 = v19 / v9;
  }

  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double v22 = CGRectZero.size.width;
    double v23 = CGRectZero.size.height;
  }

  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)_preferredHeaderHeightForSectionAtIndex:(int64_t)a3
{
  if (a3 == 1) {
    return 131.0;
  }
  double v3 = 0.0;
  if (!a3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
    [v5 adjustedContentInset];
    double v7 = v6;
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    [v9 itemSize];
    double v3 = 1080.0 - (v7 + v10 + 116.0);
  }

  return v3;
}

- (void)_configureGradientViews
{
}

- (void)_setupBlurView
{
  if (!self->_blurView)
  {
    double v3 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4005LL));
    id v5 = -[UIVisualEffectView initWithEffect:](v3, "initWithEffect:", v4);
    blurView = self->_blurView;
    self->_blurView = v5;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( self->_blurView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    [v7 addSubview:self->_blurView];
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_blurView, "leadingAnchor"));
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v7 leadingAnchor]);
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v19]);
    v21[0] = v18;
    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_blurView, "trailingAnchor"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 trailingAnchor]);
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v8]);
    v21[1] = v9;
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](self->_blurView, "topAnchor"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v7 topAnchor]);
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToAnchor:v11]);
    v21[2] = v12;
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_blurView, "bottomAnchor"));
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v7 bottomAnchor]);
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v13 constraintEqualToAnchor:v14]);
    v21[3] = v15;
    double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 4LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v16);
  }

- (void)_setupFavoriteGradientView
{
  if (!self->_favoriteGradientView)
  {
    double v3 = objc_alloc_init(&OBJC_CLASS___PXGradientView);
    favoriteGradientView = self->_favoriteGradientView;
    self->_favoriteGradientView = v3;

    -[PXGradientView setTranslatesAutoresizingMaskIntoConstraints:]( self->_favoriteGradientView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0549019608,  0.0549019608,  0.031372549,  0.21));
    v29[0] = v5;
    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0549019608,  0.0549019608,  0.031372549,  1.0));
    v29[1] = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.117647059,  0.125490196,  0.149019608,  1.0));
    v29[2] = v7;
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.117647059,  0.125490196,  0.149019608,  1.0));
    v29[3] = v8;
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 4LL));
    -[PXGradientView setColors:](self->_favoriteGradientView, "setColors:", v9);

    -[PXGradientView setLocations:](self->_favoriteGradientView, "setLocations:", &off_1000D1BA0);
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    [v10 addSubview:self->_favoriteGradientView];

    double v26 = (void *)objc_claimAutoreleasedReturnValue(-[PXGradientView leadingAnchor](self->_favoriteGradientView, "leadingAnchor"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    double v25 = (void *)objc_claimAutoreleasedReturnValue([v27 leadingAnchor]);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v25]);
    v28[0] = v24;
    double v22 = (void *)objc_claimAutoreleasedReturnValue(-[PXGradientView trailingAnchor](self->_favoriteGradientView, "trailingAnchor"));
    double v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v23 trailingAnchor]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v21]);
    v28[1] = v11;
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[PXGradientView topAnchor](self->_favoriteGradientView, "topAnchor"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 topAnchor]);
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v14]);
    v28[2] = v15;
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[PXGradientView bottomAnchor](self->_favoriteGradientView, "bottomAnchor"));
    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 bottomAnchor]);
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v18]);
    v28[3] = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 4LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v20);
  }

- (void)_setupWatchNextGradientView
{
  if (!self->_watchNextGradientView)
  {
    double v3 = objc_alloc_init(&OBJC_CLASS___PXGradientView);
    watchNextGradientView = self->_watchNextGradientView;
    self->_watchNextGradientView = v3;

    -[PXGradientView setTranslatesAutoresizingMaskIntoConstraints:]( self->_watchNextGradientView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    double v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v30 colorWithAlphaComponent:0.0]);
    v33[0] = v5;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 colorWithAlphaComponent:0.0]);
    v33[1] = v7;
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 colorWithAlphaComponent:0.65]);
    v33[2] = v9;
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 colorWithAlphaComponent:0.65]);
    v33[3] = v11;
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 4LL));
    -[PXGradientView setColors:](self->_watchNextGradientView, "setColors:", v12);

    -[PXGradientView setLocations:](self->_watchNextGradientView, "setLocations:", &off_1000D1BB8);
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    [v13 addSubview:self->_watchNextGradientView];

    double v29 = (void *)objc_claimAutoreleasedReturnValue(-[PXGradientView leadingAnchor](self->_watchNextGradientView, "leadingAnchor"));
    double v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    double v28 = (void *)objc_claimAutoreleasedReturnValue([v31 leadingAnchor]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v28]);
    v32[0] = v27;
    double v25 = (void *)objc_claimAutoreleasedReturnValue(-[PXGradientView trailingAnchor](self->_watchNextGradientView, "trailingAnchor"));
    double v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v26 trailingAnchor]);
    double v23 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v24]);
    v32[1] = v23;
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[PXGradientView topAnchor](self->_watchNextGradientView, "topAnchor"));
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 topAnchor]);
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v16]);
    v32[2] = v17;
    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[PXGradientView bottomAnchor](self->_watchNextGradientView, "bottomAnchor"));
    double v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 bottomAnchor]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToAnchor:v20]);
    v32[3] = v21;
    double v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 4LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v22);
  }

- (int64_t)_numberOfNonEmptySections
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    int64_t v5 = 0LL;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        double v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)i) snapshot]);
        id v9 = [v8 numberOfItems];
      }

      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }

  else
  {
    int64_t v5 = 0LL;
  }

  return v5;
}

- (BOOL)_isWatchNextSectionLoaded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
  if ((uint64_t)[v3 numberOfSections] < 1)
  {
    BOOL v5 = 0;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
    BOOL v5 = (uint64_t)[v4 numberOfItemsInSection:0] > 0;
  }

  return v5;
}

- (void)_displayLoadingView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController loadingView](self, "loadingView"));

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"TVPMemoriesLoadingStateTitle" value:&stru_1000CC6C8 table:0]);
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities embedPhotosLoadingViewInView:topMargin:message:]( &OBJC_CLASS___TVPUIUtilities,  "embedPhotosLoadingViewInView:topMargin:message:",  v4,  v6,  0.0));
    -[TVPMemoriesTabCollectionViewController setLoadingView:](self, "setLoadingView:", v7);
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController previewAssetManager](self, "previewAssetManager"));
  [v8 clearPreview];
}

- (void)_dismissLoadingView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController loadingView](self, "loadingView"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController loadingView](self, "loadingView"));
    [v4 removeFromSuperview];

    -[TVPMemoriesTabCollectionViewController setLoadingView:](self, "setLoadingView:", 0LL);
  }

- (void)_dismissEmptyView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities photoLibraryEmptyViewInView:]( &OBJC_CLASS___TVPUIUtilities,  "photoLibraryEmptyViewInView:",  v2));

  id v3 = v4;
  if (v4)
  {
    [v4 removeFromSuperview];
    id v3 = v4;
  }
}

- (void)_dismissAllLoadingAndEmptyViews
{
}

- (void)_displayEmptyOrLoadingMessageIfNeeded
{
  unsigned __int8 v3 = -[TVPMemoriesTabCollectionViewController initialSyncComplete](self, "initialSyncComplete");
  unsigned __int8 v4 = -[TVPMemoriesTabCollectionViewController _isWatchNextSectionLoaded](self, "_isWatchNextSectionLoaded");
  unsigned __int8 v5 = v4;
  if ((v3 & 1) == 0 && (v4 & 1) == 0)
  {
    -[TVPMemoriesTabCollectionViewController _dismissEmptyView](self, "_dismissEmptyView");
    -[TVPMemoriesTabCollectionViewController _displayLoadingView](self, "_displayLoadingView");
    return;
  }

  -[TVPMemoriesTabCollectionViewController _dismissAllLoadingAndEmptyViews](self, "_dismissAllLoadingAndEmptyViews");
  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"TVPMemoriesNoMemoriesTitle" value:&stru_1000CC6C8 table:0]);
    double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"TVPMemoriesNoMemoriesMessage" value:&stru_1000CC6C8 table:0]);
    double v19 = (void *)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities photoLibraryEmptyViewWithBounds:title:messageFormat:]( &OBJC_CLASS___TVPUIUtilities,  "photoLibraryEmptyViewWithBounds:title:messageFormat:",  v16,  v18,  v8,  v10,  v12,  v14));

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController libraryStatusProvider](self, "libraryStatusProvider"));
    LODWORD(v15) = [v20 hasSharedLibraryOrPreview];

    if ((_DWORD)v15)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController libraryFilterState](self, "libraryFilterState"));
      id v22 = [v21 viewMode];

      if ((unint64_t)v22 < 2)
      {
        double v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
        [v23 bounds];
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        uint64_t v33 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_tvOS_EmptyMemories_Title", v32);
        double v35 = (void *)objc_claimAutoreleasedReturnValue(v33);
        double v36 = @"PXSharedLibrary_tvOS_EmptyBothOrPersonalMemories_Message";
LABEL_10:
        uint64_t v43 = PXLocalizedSharedLibraryString(v36, v34);
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        uint64_t v45 = objc_claimAutoreleasedReturnValue( +[TVPUIUtilities photoLibraryEmptyViewWithBounds:title:messageFormat:]( &OBJC_CLASS___TVPUIUtilities,  "photoLibraryEmptyViewWithBounds:title:messageFormat:",  v35,  v44,  v25,  v27,  v29,  v31));

        double v19 = (void *)v45;
        goto LABEL_11;
      }

      if (v22 == (id)2)
      {
        double v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
        [v23 bounds];
        double v25 = v37;
        double v27 = v38;
        double v29 = v39;
        double v31 = v40;
        uint64_t v42 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_tvOS_EmptyMemories_Title", v41);
        double v35 = (void *)objc_claimAutoreleasedReturnValue(v42);
        double v36 = @"PXSharedLibrary_tvOS_EmptySharedMemories_Message";
        goto LABEL_10;
      }
    }

- (void)_updatePreviewGradientViews
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController previewView](self, "previewView"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 image]);

  if (v4)
  {
    -[TVPMemoriesTabCollectionViewController showcaseFactor](self, "showcaseFactor");
    -[PXGradientView setAlpha:](self->_watchNextGradientView, "setAlpha:");
    -[TVPMemoriesTabCollectionViewController showcaseFactor](self, "showcaseFactor");
    -[PXGradientView setAlpha:](self->_favoriteGradientView, "setAlpha:", 1.0 - v5);
    -[TVPMemoriesTabCollectionViewController showcaseFactor](self, "showcaseFactor");
    double v7 = 1.0 - v6;
  }

  else
  {
    double v7 = 0.0;
    -[PXGradientView setAlpha:](self->_watchNextGradientView, "setAlpha:", 0.0);
    -[PXGradientView setAlpha:](self->_favoriteGradientView, "setAlpha:", 0.0);
  }

  -[UIVisualEffectView setAlpha:](self->_blurView, "setAlpha:", v7);
}

- (void)_updateCPLStatus
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController statusProvider](self, "statusProvider"));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 status]);

  if (![v4 state])
  {
    -[TVPMemoriesTabCollectionViewController setInitialSyncComplete:]( self,  "setInitialSyncComplete:",  [v4 hasCompletedInitialSync]);
    -[TVPMemoriesTabCollectionViewController _displayEmptyOrLoadingMessageIfNeeded]( self,  "_displayEmptyOrLoadingMessageIfNeeded");
  }
}

- (PBSBulletinServiceInterface)bulletinServiceProxy
{
  bulletinServiceProxdouble y = self->_bulletinServiceProxy;
  if (!bulletinServiceProxy)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
    double v5 = (PBSBulletinServiceInterface *)objc_claimAutoreleasedReturnValue([v4 bulletinServiceProxy]);
    double v6 = self->_bulletinServiceProxy;
    self->_bulletinServiceProxdouble y = v5;

    bulletinServiceProxdouble y = self->_bulletinServiceProxy;
  }

  return bulletinServiceProxy;
}

- (void)_presentBulletinMessage:(id)a3 imageKey:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController currentBulletin](self, "currentBulletin"));

  if (v11)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController bulletinServiceProxy](self, "bulletinServiceProxy"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController currentBulletin](self, "currentBulletin"));
    [v12 dismissBulletin:v13];
  }

  double v14 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
  v22[0] = PBSSystemBulletinTitleKey;
  v22[1] = PBSSystemBulletinImageIDKey;
  v23[0] = v10;
  v23[1] = v9;
  v22[2] = PBSSystemBulletinBannerTypeKey;
  v23[2] = &off_1000D1548;
  double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  3LL));
  -[PBSBulletin setMessage:](v14, "setMessage:", v15);

  -[PBSBulletin setViewControllerClassName:]( v14,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
  -[PBSBulletin setServiceIdentifier:](v14, "setServiceIdentifier:", PBSSystemBulletinServiceName);
  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController bulletinServiceProxy](self, "bulletinServiceProxy"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10002F434;
  v19[3] = &unk_1000CA770;
  v19[4] = self;
  id v20 = v14;
  id v21 = v8;
  id v17 = v8;
  double v18 = v14;
  [v16 presentBulletin:v18 withCompletion:v19];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v9 = a3;
  if (off_100101C70 != a5) {
    sub_100079B88((uint64_t)a2, (uint64_t)self);
  }
  if ((v6 & 0x10000) != 0)
  {
    id v10 = v9;
    -[TVPMemoriesTabCollectionViewController _updateCPLStatus](self, "_updateCPLStatus");
    id v9 = v10;
  }
}

- (void)ppt_navigateToLatestInteractiveMemoryWithWillPresentHandler:(id)a3
{
  id v5 = a3;
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  0LL));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sections](self, "sections"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 snapshot]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectReferenceAtIndex:", objc_msgSend(v6, "item")));

  if (!v10)
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2, self, @"TVPMemoriesTabCollectionViewController.m", 1084, @"Invalid parameter not satisfying: %@", @"objectReference != nil" object file lineNumber description];
  }

  double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 leafObject]);
  if (!v12)
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    double v18 = (objc_class *)objc_opt_class(&OBJC_CLASS___PXMemoryInfo, v17);
    double v19 = NSStringFromClass(v18);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    [v16 handleFailureInMethod:a2, self, @"TVPMemoriesTabCollectionViewController.m", 1085, @"%@ should be an instance inheriting from %@, but it is nil", @"objectReference.leafObject", v20 object file lineNumber description];
LABEL_8:

    goto LABEL_5;
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___PXMemoryInfo, v11);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v22 = (objc_class *)objc_opt_class(&OBJC_CLASS___PXMemoryInfo, v21);
    double v23 = NSStringFromClass(v22);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v23);
    double v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "px_descriptionForAssertionMessage"));
    [v16 handleFailureInMethod:a2, self, @"TVPMemoriesTabCollectionViewController.m", 1085, @"%@ should be an instance inheriting from %@, but it is %@", @"objectReference.leafObject", v20, v24 object file lineNumber description];

    goto LABEL_8;
  }

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSIndexPath)focusedIndexPath
{
  return self->_focusedIndexPath;
}

- (void)setFocusedIndexPath:(id)a3
{
}

- (BOOL)collectionNeedsUpdate
{
  return self->_collectionNeedsUpdate;
}

- (void)setCollectionNeedsUpdate:(BOOL)a3
{
  self->_collectionNeedsUpdate = a3;
}

- (BOOL)collectionNeedsReload
{
  return self->_collectionNeedsReload;
}

- (void)setCollectionNeedsReload:(BOOL)a3
{
  self->_collectionNeedsReload = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (PHCachingImageManager)cachingImageManager
{
  return self->_cachingImageManager;
}

- (void)setCachingImageManager:(id)a3
{
}

- (PXGradientView)watchNextGradientView
{
  return self->_watchNextGradientView;
}

- (PXGradientView)favoriteGradientView
{
  return self->_favoriteGradientView;
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (NSMutableDictionary)sectionScrollOffsets
{
  return self->_sectionScrollOffsets;
}

- (void)setSectionScrollOffsets:(id)a3
{
}

- (TVPMemoriesTabPreviewManager)previewAssetManager
{
  return self->_previewAssetManager;
}

- (UIImageView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
}

- (NSTimer)updateCollectionViewTimer
{
  return self->_updateCollectionViewTimer;
}

- (void)setUpdateCollectionViewTimer:(id)a3
{
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSharedLibraryStatusProvider)libraryStatusProvider
{
  return self->_libraryStatusProvider;
}

- (PXStoryModel)actionMenuModel
{
  return self->_actionMenuModel;
}

- (void)setActionMenuModel:(id)a3
{
}

- (UIView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (PXCPLUIStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (void)setStatusProvider:(id)a3
{
}

- (BOOL)initialSyncComplete
{
  return self->_initialSyncComplete;
}

- (void)setInitialSyncComplete:(BOOL)a3
{
  self->_initialSyncComplete = a3;
}

- (double)collectionViewTimerInterval
{
  return self->_collectionViewTimerInterval;
}

- (void)setCollectionViewTimerInterval:(double)a3
{
  self->_collectionViewTimerInterval = a3;
}

- (void)setBulletinServiceProxy:(id)a3
{
}

- (PBSBulletin)currentBulletin
{
  return self->_currentBulletin;
}

- (void)setCurrentBulletin:(id)a3
{
}

- (void).cxx_destruct
{
}

@end