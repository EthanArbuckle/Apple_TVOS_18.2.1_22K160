@interface TVPPhotoLibraryFeedCollectionViewController
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (NSArray)photoAssets;
- (NSArray)photoBatches;
- (NSIndexPath)preferredFocusIndexPath;
- (NSTimer)updateAssetsAndReloadTimer;
- (PHAssetCollection)photoStreamFeedCollection;
- (PHPhotoLibrary)photoLibrary;
- (TVPCollectionView)photoFeedCollectionView;
- (TVPCollectionViewCachingManager)cachingManager;
- (TVPFetchManager)fetchManager;
- (TVPPhotoBannerBrowserView)photoFeedHeaderView;
- (TVPPhotoLibraryFeedCollectionViewController)initWithPhotoLibrary:(id)a3;
- (TVPPhotoLibraryFeedCollectionViewController)initWithPhotoLibrary:(id)a3 assetCollection:(id)a4;
- (UIView)loadingView;
- (id)_feedCollection;
- (id)_photoStreamFeedHeaderView;
- (id)_photoStreamHeaderSubtitle;
- (id)_photoStreamHeaderTitle;
- (id)assetAtIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCachingManager:(id)a3 assetWithTargetSizeAtIndexPath:(id)a4;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)photoBatchesForCollectionView:(id)a3 layout:(id)a4;
- (id)preferredFocusEnvironments;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_cancelExistingTimer;
- (void)_didFinishTimedInterval:(id)a3;
- (void)_displayLoadingView;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)dealloc;
- (void)dismissLoadingView;
- (void)loadPhotoFeedAssets;
- (void)loadView;
- (void)photoLibraryDidChange:(id)a3;
- (void)resetFocusWithFocusedAsset:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setCachingManager:(id)a3;
- (void)setFetchManager:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setPhotoAssets:(id)a3;
- (void)setPhotoBatches:(id)a3;
- (void)setPhotoFeedCollectionView:(id)a3;
- (void)setPhotoFeedHeaderView:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setPhotoStreamFeedCollection:(id)a3;
- (void)setPreferredFocusIndexPath:(id)a3;
- (void)setUpdateAssetsAndReloadTimer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCollectionHeader;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVPPhotoLibraryFeedCollectionViewController

- (TVPPhotoLibraryFeedCollectionViewController)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryFeedCollectionViewController;
  v6 = -[TVPPhotoLibraryFeedCollectionViewController init](&v10, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___TVPCollectionViewCachingManager);
    cachingManager = v6->_cachingManager;
    v6->_cachingManager = v7;

    -[TVPCollectionViewCachingManager setAllowsHorizontalScrolling:]( v6->_cachingManager,  "setAllowsHorizontalScrolling:",  1LL);
    -[TVPCollectionViewCachingManager setDataSource:](v6->_cachingManager, "setDataSource:", v6);
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    -[PHPhotoLibrary registerChangeObserver:](v6->_photoLibrary, "registerChangeObserver:", v6);
  }

  return v6;
}

- (TVPPhotoLibraryFeedCollectionViewController)initWithPhotoLibrary:(id)a3 assetCollection:(id)a4
{
  id v7 = a4;
  v8 = -[TVPPhotoLibraryFeedCollectionViewController initWithPhotoLibrary:](self, "initWithPhotoLibrary:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photoStreamFeedCollection, a4);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsInAssetCollection:options:",  v9->_photoStreamFeedCollection,  0LL));
    v11 = -[TVPFetchManager initWithFetchResult:]( objc_alloc(&OBJC_CLASS___TVPFetchManager),  "initWithFetchResult:",  v10);
    fetchManager = v9->_fetchManager;
    v9->_fetchManager = v11;
  }

  return v9;
}

- (id)assetAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[NSArray count](self->_photoAssets, "count");
  else {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_photoAssets, "objectAtIndex:", [v4 item]));
  }

  return v6;
}

- (void)dismissLoadingView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController loadingView](self, "loadingView"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController loadingView](self, "loadingView"));
    [v4 removeFromSuperview];

    -[TVPPhotoLibraryFeedCollectionViewController setLoadingView:](self, "setLoadingView:", 0LL);
  }

- (void)resetFocusWithFocusedAsset:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController navigationController](self, "navigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController navigationController](self, "navigationController"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 topViewController]);
    [v5 _forgetFocusedItemForViewController:v7];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoAssets](self, "photoAssets"));
    id v9 = [v8 indexOfObject:v4];

    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v9,  0LL));
    -[TVPPhotoLibraryFeedCollectionViewController setPreferredFocusIndexPath:](self, "setPreferredFocusIndexPath:", v10);
  }

- (void)loadPhotoFeedAssets
{
  if (!self->_photoStreamFeedCollection || !self->_fetchManager)
  {
    v3 = (PHAssetCollection *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController _feedCollection](self, "_feedCollection"));
    photoStreamFeedCollection = self->_photoStreamFeedCollection;
    self->_photoStreamFeedCollection = v3;

    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsInAssetCollection:options:",  self->_photoStreamFeedCollection,  0LL));
    v6 = -[TVPFetchManager initWithFetchResult:](objc_alloc(&OBJC_CLASS___TVPFetchManager), "initWithFetchResult:", v5);
    fetchManager = self->_fetchManager;
    self->_fetchManager = v6;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController fetchManager](self, "fetchManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 rootFetchResult]);
  id v10 = [v9 count];

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController fetchManager](self, "fetchManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 rootFetchResult]);
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[TVPSharedPSUtilities photoStreamBatchesForPhotos:]( &OBJC_CLASS___TVPSharedPSUtilities,  "photoStreamBatchesForPhotos:",  v12));

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVPSharedPSUtilities sortedPhotosFromPhotoBatches:]( &OBJC_CLASS___TVPSharedPSUtilities,  "sortedPhotosFromPhotoBatches:",  v16));
    if ([v16 count])
    {
      if ([v13 count])
      {
        -[TVPPhotoLibraryFeedCollectionViewController setPhotoBatches:](self, "setPhotoBatches:", v16);
        -[TVPPhotoLibraryFeedCollectionViewController setPhotoAssets:](self, "setPhotoAssets:", v13);
        -[TVPPhotoLibraryFeedCollectionViewController _cacheFeedInfoIfRequired](self, "_cacheFeedInfoIfRequired");
        -[TVPPhotoLibraryFeedCollectionViewController dismissLoadingView](self, "dismissLoadingView");
        -[TVPPhotoLibraryFeedCollectionViewController updateCollectionHeader](self, "updateCollectionHeader");
        v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryFeedCollectionViewController photoFeedCollectionView]( self,  "photoFeedCollectionView"));
        [v14 reloadData];

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController cachingManager](self, "cachingManager"));
        [v15 startPrefetchingAssets];
      }
    }
  }

- (void)updateCollectionHeader
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoFeedHeaderView](self, "photoFeedHeaderView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 superview]);

  if (v4)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoFeedHeaderView](self, "photoFeedHeaderView"));
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryFeedCollectionViewController _photoStreamHeaderSubtitle]( self,  "_photoStreamHeaderSubtitle"));
    [v7 setSubtitle:v5];
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryFeedCollectionViewController _photoStreamFeedHeaderView]( self,  "_photoStreamFeedHeaderView"));
    -[TVPPhotoLibraryFeedCollectionViewController setPhotoFeedHeaderView:](self, "setPhotoFeedHeaderView:", v6);

    id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController view](self, "view"));
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoFeedHeaderView](self, "photoFeedHeaderView"));
    [v7 addSubview:v5];
  }
}

- (id)preferredFocusEnvironments
{
  if (self->_photoFeedCollectionView)
  {
    photoFeedCollectionView = self->_photoFeedCollectionView;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &photoFeedCollectionView,  1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)loadView
{
  v14 = objc_alloc_init(&OBJC_CLASS___UIView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  -[UIView setFrame:](v14, "setFrame:");

  -[TVPPhotoLibraryFeedCollectionViewController setView:](self, "setView:", v14);
  id v4 = objc_alloc_init(&OBJC_CLASS___TVPSharedPSActivityViewFlowLayout);
  -[TVPSharedPSActivityViewFlowLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:]( v4,  "_setWantsRightToLeftHorizontalMirroringIfNeeded:",  1LL);
  unint64_t v5 = objc_alloc(&OBJC_CLASS___TVPCollectionView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v6 bounds];
  id v7 = -[TVPCollectionView initWithFrame:collectionViewLayout:]( v5,  "initWithFrame:collectionViewLayout:",  v4,  0.0,  239.0);
  photoFeedCollectionView = self->_photoFeedCollectionView;
  self->_photoFeedCollectionView = v7;

  -[TVPCollectionView setDataSource:](self->_photoFeedCollectionView, "setDataSource:", self);
  -[TVPCollectionView setDelegate:](self->_photoFeedCollectionView, "setDelegate:", self);
  -[TVPCollectionView setScrollEnabled:](self->_photoFeedCollectionView, "setScrollEnabled:", 1LL);
  -[TVPCollectionView setContentInset:](self->_photoFeedCollectionView, "setContentInset:", 0.0, 90.0, -90.0, 90.0);
  -[TVPCollectionView registerClass:forCellWithReuseIdentifier:]( self->_photoFeedCollectionView,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___TVPSharedPSActivityImageCell, v9),  @"imageCellIdentifier");
  -[TVPCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:]( self->_photoFeedCollectionView,  "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___TVPSharedPSActivitySupplementaryView, v10),  @"supplementaryView",  @"supplementaryViewIdentifier");
  v11 = self->_photoFeedCollectionView;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[TVPCollectionView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  -[TVPCollectionView setUserInteractionEnabled:](self->_photoFeedCollectionView, "setUserInteractionEnabled:", 1LL);
  -[TVPCollectionView setClipsToBounds:](self->_photoFeedCollectionView, "setClipsToBounds:", 0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController view](self, "view"));
  [v13 addSubview:self->_photoFeedCollectionView];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryFeedCollectionViewController;
  -[TVPPhotoLibraryFeedCollectionViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController cachingManager](self, "cachingManager"));
  [v3 setCollectionView:self->_photoFeedCollectionView];

  -[TVPPhotoLibraryFeedCollectionViewController _displayLoadingView](self, "_displayLoadingView");
  -[TVPPhotoLibraryFeedCollectionViewController _updateFeedInfoAndUI](self, "_updateFeedInfoAndUI");
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryFeedCollectionViewController;
  -[TVPPhotoLibraryFeedCollectionViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController preferredFocusIndexPath](self, "preferredFocusIndexPath"));
  unsigned int v5 = +[TVPUIUtilities isValidIndexPath:collectionView:]( &OBJC_CLASS___TVPUIUtilities,  "isValidIndexPath:collectionView:",  v4,  self->_photoFeedCollectionView);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryFeedCollectionViewController photoFeedCollectionView]( self,  "photoFeedCollectionView"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryFeedCollectionViewController preferredFocusIndexPath]( self,  "preferredFocusIndexPath"));
    [v6 scrollToItemAtIndexPath:v7 atScrollPosition:16 animated:0];
  }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoLibrary](self, "photoLibrary"));
  [v3 unregisterChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryFeedCollectionViewController;
  -[TVPPhotoLibraryFeedCollectionViewController dealloc](&v4, "dealloc");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[TVPCollectionView reloadData](self->_photoFeedCollectionView, "reloadData");
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController cachingManager](self, "cachingManager", a3));
  [v3 setAllowsCachingHighQualityImages:0];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController cachingManager](self, "cachingManager", a3));
  [v3 setAllowsCachingHighQualityImages:1];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_photoAssets, "count", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  v11 = (objc_class *)objc_opt_class(self, v10);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v9 handleFailureInMethod:a2, self, @"TVPPhotoLibraryFeedCollectionViewController.m", 235, @"Method %s is a responsibility of subclass %@", "-[TVPPhotoLibraryFeedCollectionViewController collectionView:cellForItemAtIndexPath:]", v13 object file lineNumber description];

  abort();
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  v14 = (objc_class *)objc_opt_class(self, v13);
  v15 = NSStringFromClass(v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v12 handleFailureInMethod:a2, self, @"TVPPhotoLibraryFeedCollectionViewController.m", 240, @"Method %s is a responsibility of subclass %@", "-[TVPPhotoLibraryFeedCollectionViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:]", v16 object file lineNumber description];

  abort();
}

- (id)photoBatchesForCollectionView:(id)a3 layout:(id)a4
{
  return self->_photoBatches;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 nextFocusedIndexPath]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 nextFocusedIndexPath]);
    -[TVPPhotoLibraryFeedCollectionViewController setPreferredFocusIndexPath:](self, "setPreferredFocusIndexPath:", v7);
  }
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController preferredFocusIndexPath](self, "preferredFocusIndexPath"));
  unsigned int v6 = +[TVPUIUtilities isValidIndexPath:collectionView:]( &OBJC_CLASS___TVPUIUtilities,  "isValidIndexPath:collectionView:",  v5,  v4);

  if (v6) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryFeedCollectionViewController preferredFocusIndexPath]( self,  "preferredFocusIndexPath"));
  }
  else {
    id v7 = 0LL;
  }
  return v7;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPFetchManager rootFetchResult](self->_fetchManager, "rootFetchResult"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v8 changeDetailsForFetchResult:v4]);

  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVPFetchManager fetchManagerByApplyingChange:]( self->_fetchManager,  "fetchManagerByApplyingChange:",  v8));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000555B4;
    block[3] = &unk_1000C9CC8;
    block[4] = self;
    id v10 = v6;
    id v7 = v6;
    dispatch_sync(&_dispatch_main_q, block);
  }
}

- (id)collectionViewCachingManager:(id)a3 assetWithTargetSizeAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController assetAtIndexPath:](self, "assetAtIndexPath:", v7));
    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 collectionView]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 collectionViewLayout]);

      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 layoutAttributesForItemAtIndexPath:v7]);
      [v12 size];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:"));
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v13, v9);
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)_photoStreamHeaderTitle
{
  return 0LL;
}

- (id)_photoStreamHeaderSubtitle
{
  return 0LL;
}

- (id)_feedCollection
{
  return 0LL;
}

- (id)_photoStreamFeedHeaderView
{
  id v3 = -[TVPPhotoBannerBrowserView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVPPhotoBannerBrowserView),  "initWithFrame:",  0.0,  0.0,  1920.0,  219.0);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController _photoStreamHeaderTitle](self, "_photoStreamHeaderTitle"));
  -[TVPPhotoBannerBrowserView setTitle:](v3, "setTitle:", v4);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryFeedCollectionViewController _photoStreamHeaderSubtitle]( self,  "_photoStreamHeaderSubtitle"));
  -[TVPPhotoBannerBrowserView setSubtitle:](v3, "setSubtitle:", v5);

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"PlaySlideshow" value:&stru_1000CC6C8 table:0]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities getPhotoBannerButtonWithTitle:]( &OBJC_CLASS___TVPPhotoUtilities,  "getPhotoBannerButtonWithTitle:",  v8));

  [v9 addTarget:self action:"_onSelectSlideshowButton:" forControlEvents:0x2000];
  [v9 _setBlurEnabled:0];
  -[NSMutableArray addObject:](v6, "addObject:", v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"SetAsScreensaver" value:&stru_1000CC6C8 table:0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities getPhotoBannerButtonWithTitle:]( &OBJC_CLASS___TVPPhotoUtilities,  "getPhotoBannerButtonWithTitle:",  v11));

  [v12 addTarget:self action:"_onSelectScreenSaverButton:" forControlEvents:0x2000];
  [v12 _setBlurEnabled:0];
  -[NSMutableArray addObject:](v6, "addObject:", v12);
  -[TVPPhotoBannerBrowserView setButtons:](v3, "setButtons:", v6);
  -[TVPPhotoBannerBrowserView setRequiresHorizontalMargins:](v3, "setRequiresHorizontalMargins:", 1LL);

  return v3;
}

- (void)_didFinishTimedInterval:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoAssets](self, "photoAssets"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController navigationController](self, "navigationController"));
  +[TVPUIUtilities refreshSlideshowPreviewWithPhotoAssets:navigationController:]( &OBJC_CLASS___TVPUIUtilities,  "refreshSlideshowPreviewWithPhotoAssets:navigationController:",  v5,  v4);
}

- (void)_displayLoadingView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController loadingView](self, "loadingView"));

  if (!v3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController view](self, "view"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities embedPhotosLoadingViewInView:topMargin:message:]( &OBJC_CLASS___TVPUIUtilities,  "embedPhotosLoadingViewInView:topMargin:message:",  v5,  0LL,  0.0));
    -[TVPPhotoLibraryFeedCollectionViewController setLoadingView:](self, "setLoadingView:", v4);
  }

- (void)_cancelExistingTimer
{
  updateAssetsAndReloadTimer = self->_updateAssetsAndReloadTimer;
  if (updateAssetsAndReloadTimer)
  {
    -[NSTimer invalidate](updateAssetsAndReloadTimer, "invalidate");
    id v4 = self->_updateAssetsAndReloadTimer;
    self->_updateAssetsAndReloadTimer = 0LL;
  }

- (TVPCollectionView)photoFeedCollectionView
{
  return self->_photoFeedCollectionView;
}

- (void)setPhotoFeedCollectionView:(id)a3
{
}

- (TVPPhotoBannerBrowserView)photoFeedHeaderView
{
  return self->_photoFeedHeaderView;
}

- (void)setPhotoFeedHeaderView:(id)a3
{
}

- (PHAssetCollection)photoStreamFeedCollection
{
  return self->_photoStreamFeedCollection;
}

- (void)setPhotoStreamFeedCollection:(id)a3
{
}

- (TVPCollectionViewCachingManager)cachingManager
{
  return self->_cachingManager;
}

- (void)setCachingManager:(id)a3
{
}

- (TVPFetchManager)fetchManager
{
  return self->_fetchManager;
}

- (void)setFetchManager:(id)a3
{
}

- (NSArray)photoBatches
{
  return self->_photoBatches;
}

- (void)setPhotoBatches:(id)a3
{
}

- (NSArray)photoAssets
{
  return self->_photoAssets;
}

- (void)setPhotoAssets:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (UIView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (NSIndexPath)preferredFocusIndexPath
{
  return self->_preferredFocusIndexPath;
}

- (void)setPreferredFocusIndexPath:(id)a3
{
}

- (NSTimer)updateAssetsAndReloadTimer
{
  return self->_updateAssetsAndReloadTimer;
}

- (void)setUpdateAssetsAndReloadTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end