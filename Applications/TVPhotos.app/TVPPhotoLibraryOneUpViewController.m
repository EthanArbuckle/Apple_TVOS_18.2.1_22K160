@interface TVPPhotoLibraryOneUpViewController
- (BOOL)isVideoAssetDownloading;
- (BOOL)performReloadOnLibraryChangeNotificationIfRequired:(id)a3;
- (BOOL)startVideoPlaybackOnLoad;
- (NSArray)sortedMostRecentlyModifiedAssets;
- (PHAsset)currentMediaAsset;
- (PHAsset)focusedAsset;
- (PHAssetCollection)assetCollection;
- (PHFetchResult)assetsFetchResult;
- (PHPhotoLibrary)photoLibrary;
- (PXSystemAVResourceReclamationController)avResourceReclamationController;
- (TVPOneupViewCachingManager)cachingManager;
- (TVPPhotoLibraryOneUpViewController)initWithPhotoLibrary:(id)a3;
- (TVPPhotoLibraryOneUpViewControllerDelegate)delegate;
- (id)_assetStatusProvider;
- (id)assetAtIndex:(int64_t)a3;
- (id)configureItemViewForOneupView:(id)a3 AtIndex:(int64_t)a4 showVideoBadgeInCaptionMode:(BOOL)a5;
- (id)oneUpViewCachingManager:(id)a3 assetAtIndex:(unint64_t)a4;
- (id)oneupView:(id)a3 supplementaryViewForItemAtIndex:(unint64_t)a4;
- (id)oneupView:(id)a3 viewForItemAtIndex:(unint64_t)a4;
- (int)videoAssetRequestID;
- (int64_t)numberOfItemsInOneupView:(id)a3;
- (unint64_t)_allowedModesFromModes:(id)a3;
- (unint64_t)selectedAssetIndex;
- (void)_configureCustomMenuItemsForAsset:(id)a3 playbackViewController:(id)a4;
- (void)_configureFavoriteAction:(id)a3 isFavorite:(BOOL)a4;
- (void)_configureMetadataForPlayerItem:(id)a3 asset:(id)a4 image:(id)a5;
- (void)_configureProResOrHDRBadgeForAsset:(id)a3 playbackViewController:(id)a4;
- (void)_displayPlaybackViewControllerWithPlayerItem:(id)a3 asset:(id)a4;
- (void)_handleAVResourcesReclaimationEvent;
- (void)_tearDownVideoPlaybackViewController;
- (void)_updateFavoriteOnAsset:(id)a3 favorite:(BOOL)a4 action:(id)a5;
- (void)_updateSharedLibraryStatusForOneUpView:(id)a3;
- (void)_updateVideoOverlayForItemView:(id)a3;
- (void)dealloc;
- (void)itemDidFinishPlaying:(id)a3;
- (void)loadView;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)oneupView:(id)a3 didFocusItemAtIndex:(unint64_t)a4;
- (void)oneupView:(id)a3 didPlayItemAtIndex:(unint64_t)a4;
- (void)oneupView:(id)a3 didSelectItemAtIndex:(unint64_t)a4;
- (void)oneupView:(id)a3 willBeginViewTransitionForFocusedView:(id)a4;
- (void)photoLibraryDidChange:(id)a3;
- (void)resourceReclamationEventDidOccur:(id)a3;
- (void)setAssetCollection:(id)a3;
- (void)setAssetsFetchResult:(id)a3;
- (void)setAvResourceReclamationController:(id)a3;
- (void)setCachingManager:(id)a3;
- (void)setCurrentMediaAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusedAsset:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setSelectedAssetIndex:(unint64_t)a3;
- (void)setSortedMostRecentlyModifiedAssets:(id)a3;
- (void)setStartVideoPlaybackOnLoad:(BOOL)a3;
- (void)setVideoAssetDownloading:(BOOL)a3;
- (void)setVideoAssetRequestID:(int)a3;
- (void)startVideoPlaybackForItem:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation TVPPhotoLibraryOneUpViewController

- (TVPPhotoLibraryOneUpViewController)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryOneUpViewController;
  v6 = -[TVPPhotoLibraryOneUpViewController init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    -[PHPhotoLibrary registerChangeObserver:](v7->_photoLibrary, "registerChangeObserver:", v7);
    v8 = objc_alloc_init(&OBJC_CLASS___TVPOneupViewCachingManager);
    cachingManager = v7->_cachingManager;
    v7->_cachingManager = v8;

    -[TVPOneupViewCachingManager setDataSource:](v7->_cachingManager, "setDataSource:", v7);
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[PLDateRangeFormatter autoupdatingFormatterWithPreset:]( &OBJC_CLASS___PLDateRangeFormatter,  "autoupdatingFormatterWithPreset:",  2LL));
    dayFormatter = v7->_dayFormatter;
    v7->_dayFormatter = (PLDateRangeFormatter *)v10;

    -[PLDateRangeFormatter setUseLocalDates:](v7->_dayFormatter, "setUseLocalDates:", 1LL);
    v12 = objc_alloc_init(&OBJC_CLASS___PXSystemAVResourceReclamationController);
    avResourceReclamationController = v7->_avResourceReclamationController;
    v7->_avResourceReclamationController = v12;

    -[PXSystemAVResourceReclamationController registerObserver:]( v7->_avResourceReclamationController,  "registerObserver:",  v7);
  }

  return v7;
}

- (void)loadView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = -[TVPOneupView initWithFrame:](objc_alloc(&OBJC_CLASS___TVPOneupView), "initWithFrame:", v5, v7, v9, v11);
  -[TVPOneupView setDataSource:](v12, "setDataSource:", self);
  -[TVPOneupView setDelegate:](v12, "setDelegate:", self);
  -[TVPOneupView registerItemViewClass:](v12, "registerItemViewClass:", objc_opt_class(&OBJC_CLASS___TVPPhotoView, v13));
  -[TVPOneupView registerSupplementaryViewClass:]( v12,  "registerSupplementaryViewClass:",  objc_opt_class(&OBJC_CLASS___TVPPhotoLibraryOneupSupplementaryView, v14));
  -[TVPOneupView setTransition:](v12, "setTransition:", 3LL);
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  -[TVPOneupView setBackgroundColor:](v12, "setBackgroundColor:", v15);

  v17[0] = @"oneup";
  v17[1] = @"caption";
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  -[TVPOneupView setAllowedModes:]( v12,  "setAllowedModes:",  -[TVPPhotoLibraryOneUpViewController _allowedModesFromModes:](self, "_allowedModesFromModes:", v16));

  -[TVPOneupView setCurrentMode:](v12, "setCurrentMode:", 1LL);
  -[TVPOneupView setAdjustedFocusIndex:](v12, "setAdjustedFocusIndex:", self->_selectedAssetIndex);
  -[TVPPhotoLibraryOneUpViewController setView:](self, "setView:", v12);
  -[TVPOneupViewCachingManager setOneupView:](self->_cachingManager, "setOneupView:", v12);
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryOneUpViewController;
  -[TVPPhotoLibraryOneUpViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController navigationController](self, "navigationController"));
  [v3 setDelegate:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryOneUpViewController;
  -[TVPPhotoLibraryOneUpViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[TVPOneupViewCachingManager startPrefetchingAssets](self->_cachingManager, "startPrefetchingAssets");
}

- (void)willMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryOneUpViewController;
  -[TVPPhotoLibraryOneUpViewController willMoveToParentViewController:](&v6, "willMoveToParentViewController:");
  if (!a3)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController delegate](self, "delegate"));
    [v5 photoLibraryOneUpControllerWillPop:self];
  }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController photoLibrary](self, "photoLibrary"));
  [v3 unregisterChangeObserver:self];

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController navigationController](self, "navigationController"));
  [v4 setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryOneUpViewController;
  -[TVPPhotoLibraryOneUpViewController dealloc](&v5, "dealloc");
}

- (void)setFocusedAsset:(id)a3
{
  objc_super v4 = (PHAsset *)a3;
  -[PXSharedLibraryAssetStatusProvider unregisterChangeObserver:context:]( self->_assetStatusProvider,  "unregisterChangeObserver:context:",  self,  off_100102428);
  currentMediaAsset = self->_currentMediaAsset;
  self->_currentMediaAsset = v4;
  double v8 = v4;

  objc_super v6 = self->_currentMediaAsset;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController _assetStatusProvider](self, "_assetStatusProvider"));
  [v7 setAsset:v6];

  -[PXSharedLibraryAssetStatusProvider registerChangeObserver:context:]( self->_assetStatusProvider,  "registerChangeObserver:context:",  self,  off_100102428);
}

- (PHAsset)focusedAsset
{
  return self->_currentMediaAsset;
}

- (void)startVideoPlaybackForItem:(id)a3
{
  id v4 = a3;
  objc_super v6 = (void *)objc_opt_new(&OBJC_CLASS___PHVideoRequestOptions, v5);
  [v6 setNetworkAccessAllowed:1];
  -[TVPPhotoLibraryOneUpViewController setVideoAssetDownloading:](self, "setVideoAssetDownloading:", 1LL);
  int v14 = 1839812531;
  __int128 v13 = xmmword_100097D4E;
  if ((MGIsDeviceOneOfType(&v13) & 1) == 0) {
    [v6 setAllowMediumHighQuality:1];
  }
  objc_initWeak(&location, self);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](&OBJC_CLASS___PHImageManager, "defaultManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100051ECC;
  v9[3] = &unk_1000CBAB8;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  self->_videoAssetRequestID = [v7 requestPlayerItemForVideo:v8 options:v6 resultHandler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)configureItemViewForOneupView:(id)a3 AtIndex:(int64_t)a4 showVideoBadgeInCaptionMode:(BOOL)a5
{
  id v7 = a3;
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  v50 = sub_1000525A0;
  v51 = sub_1000525B0;
  id v52 = (id)objc_claimAutoreleasedReturnValue([v7 dequeueReusableItemView]);
  [(id)v48[5] setContentMode:1];
  [(id)v48[5] setTag:a4];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController assetAtIndex:](self, "assetAtIndex:", a4));
  -[TVPPhotoLibraryOneUpViewController setFocusedAsset:](self, "setFocusedAsset:", v8);
  [(id)v48[5] displaySpinner];
  switch((unint64_t)[v8 playbackStyle])
  {
    case 0uLL:
      double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"unsupportedFormat" value:&stru_1000CC6C8 table:0]);
      id v11 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v10,  1LL));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"unsupportedFormatButton" value:&stru_1000CC6C8 table:0]);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100052E44;
      v28[3] = &unk_1000CA418;
      v28[4] = self;
      int v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  0LL,  v28));
      [v11 addAction:v14];

      -[TVPPhotoLibraryOneUpViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);
      goto LABEL_6;
    case 1uLL:
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_100052C78;
      v33[3] = &unk_1000CBC20;
      v33[4] = &v47;
      v33[5] = a4;
      id v11 = objc_retainBlock(v33);
      uint64_t v15 = -[TVPCachingManager requestImageForAsset:processingHandler:resultHandler:]( self->_cachingManager,  "requestImageForAsset:processingHandler:resultHandler:",  v8,  0LL,  v11);
      [(id)v48[5] setCurrentRequestID:v15];
      goto LABEL_6;
    case 2uLL:
      uint64_t v36 = 0LL;
      v37 = &v36;
      uint64_t v38 = 0x2020000000LL;
      LOBYTE(v39) = 0;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_1000527E4;
      v45[3] = &unk_1000CBB30;
      v45[5] = &v36;
      v45[6] = a4;
      v45[4] = &v47;
      v16 = objc_retainBlock(v45);
      -[TVPCachingManager requestImageForAsset:processingHandler:resultHandler:]( self->_cachingManager,  "requestImageForAsset:processingHandler:resultHandler:",  v8,  0LL,  v16);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_10005285C;
      v44[3] = &unk_1000CBB80;
      v44[5] = &v36;
      v44[6] = a4;
      v44[4] = &v47;
      v17 = objc_retainBlock(v44);
      uint64_t v18 = -[TVPCachingManager requestAnimatedImageForAsset:resultHandler:]( self->_cachingManager,  "requestAnimatedImageForAsset:resultHandler:",  v8,  v17);
      [(id)v48[5] setCurrentRequestID:v18];

      v19 = &v36;
      goto LABEL_9;
    case 3uLL:
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_1000525B8;
      v46[3] = &unk_1000CBB08;
      v46[5] = &v47;
      v46[6] = a4;
      v46[4] = self;
      id v11 = objc_retainBlock(v46);
      uint64_t v20 = -[TVPCachingManager requestLivePhotoForAsset:resultHandler:]( self->_cachingManager,  "requestLivePhotoForAsset:resultHandler:",  v8,  v11);
      [(id)v48[5] setCurrentRequestID:v20];
LABEL_6:

      break;
    case 4uLL:
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_100052D84;
      v29[3] = &unk_1000CBC48;
      v31 = &v47;
      int64_t v32 = a4;
      v29[4] = self;
      id v21 = v8;
      id v30 = v21;
      v22 = objc_retainBlock(v29);
      -[TVPCachingManager requestImageForAsset:processingHandler:resultHandler:]( self->_cachingManager,  "requestImageForAsset:processingHandler:resultHandler:",  v21,  0LL,  v22);

      break;
    case 5uLL:
      v42[0] = 0LL;
      v42[1] = v42;
      v42[2] = 0x2020000000LL;
      char v43 = 0;
      uint64_t v36 = 0LL;
      v37 = &v36;
      uint64_t v38 = 0x3032000000LL;
      v39 = sub_1000525A0;
      v40 = sub_1000525B0;
      id v41 = 0LL;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_100052A08;
      v35[3] = &unk_1000CBBA8;
      v35[4] = &v47;
      v35[5] = v42;
      v35[6] = &v36;
      v35[7] = a4;
      v23 = objc_retainBlock(v35);
      -[TVPCachingManager requestImageForAsset:processingHandler:resultHandler:]( self->_cachingManager,  "requestImageForAsset:processingHandler:resultHandler:",  v8,  0LL,  v23);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_100052A9C;
      v34[3] = &unk_1000CBBF8;
      v34[4] = &v47;
      v34[5] = v42;
      v34[6] = &v36;
      v34[7] = a4;
      v24 = objc_retainBlock(v34);
      uint64_t v25 = -[TVPCachingManager requestAutoloopVideoForAsset:resultHandler:]( self->_cachingManager,  "requestAutoloopVideoForAsset:resultHandler:",  v8,  v24);
      [(id)v48[5] setCurrentRequestID:v25];

      _Block_object_dispose(&v36, 8);
      v19 = v42;
LABEL_9:
      _Block_object_dispose(v19, 8);
      break;
    default:
      break;
  }

  id v26 = (id)v48[5];

  _Block_object_dispose(&v47, 8);
  return v26;
}

- (BOOL)performReloadOnLibraryChangeNotificationIfRequired:(id)a3
{
  currentMediaAsset = self->_currentMediaAsset;
  id v5 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 changeDetailsForObject:currentMediaAsset]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 changeDetailsForObject:self->_assetCollection]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 changeDetailsForFetchResult:self->_assetsFetchResult]);

  if (!(v6 | v7))
  {
    char v18 = 0;
    goto LABEL_11;
  }

  unsigned int v9 = -[PHAsset isFavorite](self->_currentMediaAsset, "isFavorite");
  id v10 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 objectAfterChanges]);
  -[TVPPhotoLibraryOneUpViewController setFocusedAsset:](self, "setFocusedAsset:", v10);

  id v11 = (PHFetchResult *)objc_claimAutoreleasedReturnValue([v8 fetchResultAfterChanges]);
  assetsFetchResult = self->_assetsFetchResult;
  self->_assetsFetchResult = v11;

  __int128 v13 = (PHAssetCollection *)objc_claimAutoreleasedReturnValue([(id)v7 objectAfterChanges]);
  assetCollection = self->_assetCollection;
  self->_assetCollection = v13;

  unsigned int v15 = [(id)v7 objectWasDeleted];
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController navigationController](self, "navigationController"));
    id v17 = [v16 popToRootViewControllerAnimated:1];
LABEL_8:
    char v18 = v15 ^ 1;

    goto LABEL_9;
  }

  if (([(id)v6 objectWasDeleted] & 1) != 0
    || [(id)v6 assetContentChanged])
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController view](self, "view"));
    [v16 reloadData];
    goto LABEL_8;
  }

  char v18 = 0;
LABEL_9:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController focusedAsset](self, "focusedAsset"));
  unsigned int v20 = [v19 isFavorite];

  if (v9 != v20)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005306C;
    block[3] = &unk_1000C9528;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

- (id)assetAtIndex:(int64_t)a3
{
  p_assetsFetchResult = (id *)&self->_assetsFetchResult;
  if (-[PHFetchResult count](self->_assetsFetchResult, "count") <= a3
    && (p_assetsFetchResult = (id *)&self->_sortedMostRecentlyModifiedAssets,
        -[NSArray count](self->_sortedMostRecentlyModifiedAssets, "count") <= a3))
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*p_assetsFetchResult objectAtIndex:a3]);
  }

  return v6;
}

- (id)_assetStatusProvider
{
  assetStatusProvider = self->_assetStatusProvider;
  if (!assetStatusProvider)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___PXSharedLibraryAssetStatusProvider);
    id v5 = self->_assetStatusProvider;
    self->_assetStatusProvider = v4;

    -[PXSharedLibraryAssetStatusProvider setAsset:](self->_assetStatusProvider, "setAsset:", self->_currentMediaAsset);
    assetStatusProvider = self->_assetStatusProvider;
  }

  return assetStatusProvider;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v11 = a4;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___AVPlayerViewController, v6);
  if ((objc_opt_isKindOfClass(v11, v7) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 player]);
    [v8 play];

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController view](self, "view"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 focusedItemView]);

    -[TVPPhotoLibraryOneUpViewController _updateVideoOverlayForItemView:](self, "_updateVideoOverlayForItemView:", v10);
    -[TVPPhotoLibraryOneUpViewController setVideoAssetDownloading:](self, "setVideoAssetDownloading:", 0LL);
  }
}

- (void)photoLibraryDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000532BC;
  block[3] = &unk_1000C9CC8;
  block[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_sync(&_dispatch_main_q, block);
}

- (void)itemDidFinishPlaying:(id)a3
{
}

- (int64_t)numberOfItemsInOneupView:(id)a3
{
  p_assetsFetchResult = (id *)&self->_assetsFetchResult;
  if (!-[PHFetchResult count](self->_assetsFetchResult, "count", a3)) {
    p_assetsFetchResult = (id *)&self->_sortedMostRecentlyModifiedAssets;
  }
  return (int64_t)[*p_assetsFetchResult count];
}

- (id)oneupView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  return -[TVPPhotoLibraryOneUpViewController configureItemViewForOneupView:AtIndex:showVideoBadgeInCaptionMode:]( self,  "configureItemViewForOneupView:AtIndex:showVideoBadgeInCaptionMode:",  a3,  a4,  0LL);
}

- (id)oneupView:(id)a3 supplementaryViewForItemAtIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableSupplementaryView]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController assetAtIndex:](self, "assetAtIndex:", a4));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 creationDate]);
  [v7 setCreationDate:v9];

  -[TVPPhotoLibraryOneUpViewController _updateSharedLibraryStatusForOneUpView:]( self,  "_updateSharedLibraryStatusForOneUpView:",  v6);
  return v7;
}

- (void)_updateSharedLibraryStatusForOneUpView:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 dequeueReusableSupplementaryView]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController _assetStatusProvider](self, "_assetStatusProvider"));
  if ([v4 status] == (id)3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedContributionStatus]);
    [v6 setSharedLibraryStatus:v5];
  }

  else
  {
    [v6 setSharedLibraryStatus:&stru_1000CC6C8];
  }
}

- (void)oneupView:(id)a3 didFocusItemAtIndex:(unint64_t)a4
{
  cachingManager = self->_cachingManager;
  id v5 = a3;
  -[TVPOneupViewCachingManager updatePrefetchedAssets](cachingManager, "updatePrefetchedAssets");
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 focusedItemView]);

  [v6 playVitalityHint];
}

- (void)oneupView:(id)a3 didSelectItemAtIndex:(unint64_t)a4
{
  id v8 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController assetAtIndex:](self, "assetAtIndex:", a4));
  self->_selectedAssetIndex = a4;
  if ([v6 playbackStyle] == (id)4
    && !-[TVPPhotoLibraryOneUpViewController isVideoAssetDownloading](self, "isVideoAssetDownloading"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 focusedItemView]);
    [v7 displayVideoLoadingSpinnerOverlay];
    -[TVPPhotoLibraryOneUpViewController startVideoPlaybackForItem:](self, "startVideoPlaybackForItem:", v6);
  }
}

- (void)oneupView:(id)a3 didPlayItemAtIndex:(unint64_t)a4
{
  id v8 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController assetAtIndex:](self, "assetAtIndex:", a4));
  self->_selectedAssetIndex = a4;
  if ([v6 playbackStyle] == (id)4
    && !-[TVPPhotoLibraryOneUpViewController isVideoAssetDownloading](self, "isVideoAssetDownloading"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 focusedItemView]);
    [v7 displayVideoLoadingSpinnerOverlay];
    -[TVPPhotoLibraryOneUpViewController startVideoPlaybackForItem:](self, "startVideoPlaybackForItem:", v6);
  }
}

- (void)oneupView:(id)a3 willBeginViewTransitionForFocusedView:(id)a4
{
  id v6 = a4;
  if (-[TVPPhotoLibraryOneUpViewController isVideoAssetDownloading](self, "isVideoAssetDownloading"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](&OBJC_CLASS___PHImageManager, "defaultManager"));
    [v5 cancelImageRequest:self->_videoAssetRequestID];

    -[TVPPhotoLibraryOneUpViewController _updateVideoOverlayForItemView:](self, "_updateVideoOverlayForItemView:", v6);
    -[TVPPhotoLibraryOneUpViewController setVideoAssetDownloading:](self, "setVideoAssetDownloading:", 0LL);
  }

  [v6 prepareForReuse];
}

- (id)oneUpViewCachingManager:(id)a3 assetAtIndex:(unint64_t)a4
{
  return -[TVPPhotoLibraryOneUpViewController assetAtIndex:](self, "assetAtIndex:", a4);
}

- (unint64_t)_allowedModesFromModes:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 containsObject:@"oneup"];
  unsigned int v5 = [v3 containsObject:@"caption"];

  unint64_t v6 = v4 | 4;
  if (!v5) {
    unint64_t v6 = v4;
  }
  if (v6 <= 1) {
    return 1LL;
  }
  else {
    return v6;
  }
}

- (void)_configureCustomMenuItemsForAsset:(id)a3 playbackViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  unsigned __int8 v28 = [v6 isFavorite];
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000539AC;
  v20[3] = &unk_1000CBC70;
  v22 = &v25;
  objc_copyWeak(&v23, &location);
  id v8 = v6;
  id v21 = v8;
  unsigned int v9 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", v20));
  favoriteAction = self->_favoriteAction;
  self->_favoriteAction = v9;

  -[TVPPhotoLibraryOneUpViewController _configureFavoriteAction:isFavorite:]( self,  "_configureFavoriteAction:isFavorite:",  self->_favoriteAction,  *((unsigned __int8 *)v26 + 24));
  objc_initWeak(&from, v7);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"TVPVideoPlayerRewind" value:&stru_1000CC6C8 table:0]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"arrow.counterclockwise"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  void v17[2] = sub_100053A20;
  v17[3] = &unk_1000CBC98;
  objc_copyWeak(&v18, &from);
  int v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v12,  v13,  0LL,  v17));

  unsigned int v15 = self->_favoriteAction;
  v29[0] = v14;
  v29[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
  [v7 setTransportBarCustomMenuItems:v16];

  -[TVPPhotoLibraryOneUpViewController _configureProResOrHDRBadgeForAsset:playbackViewController:]( self,  "_configureProResOrHDRBadgeForAsset:playbackViewController:",  v8,  v7);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v25, 8);
}

- (void)_configureProResOrHDRBadgeForAsset:(id)a3 playbackViewController:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  else {
    BOOL v6 = 0LL;
  }
  [v5 setTitleMetadataIncludesProResBadge:v6];
  BOOL v7 = ([v8 isProRes] & 1) == 0
  [v5 setTitleMetadataIncludesHDRBadge:v7];
}

- (void)_updateFavoriteOnAsset:(id)a3 favorite:(BOOL)a4 action:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 photoLibrary]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100053C80;
  v19[3] = &unk_1000CA4D0;
  id v11 = v8;
  id v20 = v11;
  BOOL v21 = a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100053CC8;
  v14[3] = &unk_1000CBCE8;
  objc_copyWeak(&v17, &location);
  id v12 = v9;
  id v15 = v12;
  BOOL v18 = a4;
  id v13 = v11;
  id v16 = v13;
  [v10 performChanges:v19 completionHandler:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_configureFavoriteAction:(id)a3 isFavorite:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  BOOL v7 = v6;
  if (v4) {
    id v8 = @"TVPVideoPlayerUnfavorite";
  }
  else {
    id v8 = @"TVPVideoPlayerFavorite";
  }
  if (v4) {
    id v9 = @"heart.fill";
  }
  else {
    id v9 = @"heart";
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:v8 value:&stru_1000CC6C8 table:0]);
  [v5 setTitle:v10];

  id v11 = (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v9));
  [v5 setImage:v11];
}

- (void)_displayPlaybackViewControllerWithPlayerItem:(id)a3 asset:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (-[TVPPhotoLibraryOneUpViewController isVideoAssetDownloading](self, "isVideoAssetDownloading"))
  {
    [v16 setAllowedAudioSpatializationFormats:4];
    BOOL v7 = -[AVPlayer initWithPlayerItem:](objc_alloc(&OBJC_CLASS___AVPlayer), "initWithPlayerItem:", v16);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ISWrappedAVAudioSession sharedVideoPlaybackInstance]( &OBJC_CLASS___ISWrappedAVAudioSession,  "sharedVideoPlaybackInstance"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 audioSession]);
    -[AVPlayer setAudioSession:](v7, "setAudioSession:", v9);

    id v10 = objc_alloc_init(&OBJC_CLASS___AVPlayerViewController);
    -[AVPlayerViewController setPlayer:](v10, "setPlayer:", v7);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController view](self, "view"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 focusedItemView]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 displayedImage]);
    if (v13) {
      -[TVPPhotoLibraryOneUpViewController _configureMetadataForPlayerItem:asset:image:]( self,  "_configureMetadataForPlayerItem:asset:image:",  v16,  v6,  v13);
    }
    -[TVPPhotoLibraryOneUpViewController _configureCustomMenuItemsForAsset:playbackViewController:]( self,  "_configureCustomMenuItemsForAsset:playbackViewController:",  v6,  v10);
    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:self selector:"itemDidFinishPlaying:" name:AVPlayerItemDidPlayToEndTimeNotification object:v16];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController navigationController](self, "navigationController"));
    [v15 pushViewController:v10 animated:1];
  }
}

- (void)_configureMetadataForPlayerItem:(id)a3 asset:(id)a4 image:(id)a5
{
  id v24 = a4;
  id v8 = (UIImage *)a5;
  id v9 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMetadataItem metadataItem](&OBJC_CLASS___AVMutableMetadataItem, "metadataItem"));
  [v11 setIdentifier:AVMetadataCommonIdentifierArtwork];
  [v11 setDataType:kCMMetadataBaseDataType_JPEG];
  [v11 setExtendedLanguageTag:@"und"];
  id v12 = UIImageJPEGRepresentation(v8, 0.5);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  [v11 setValue:v13];
  -[NSMutableArray addObject:](v10, "addObject:", v11);
  int v14 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMetadataItem metadataItem](&OBJC_CLASS___AVMutableMetadataItem, "metadataItem"));
  [v14 setIdentifier:AVKitMetadataIdentifierReleaseDate];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  [v14 setLocale:v15];

  -[NSMutableArray addObject:](v10, "addObject:", v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMetadataItem metadataItem](&OBJC_CLASS___AVMutableMetadataItem, "metadataItem"));
  [v16 setIdentifier:AVMetadataCommonIdentifierTitle];
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  [v16 setLocale:v17];

  -[NSMutableArray addObject:](v10, "addObject:", v16);
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v24 creationDate]);
  if (v18)
  {
    dayFormatter = self->_dayFormatter;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v24 creationDate]);
    BOOL v21 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PLDateRangeFormatter stringFromDate:](dayFormatter, "stringFromDate:", v20));
  }

  else
  {
    BOOL v21 = &stru_1000CC6C8;
  }

  v22 = (__CFString *)objc_claimAutoreleasedReturnValue([v24 localizedGeoDescription]);
  if (-[__CFString length](v22, "length"))
  {
    [v14 setValue:v21];
    id v23 = v22;
  }

  else
  {
    [v14 setValue:&stru_1000CC6C8];
    id v23 = v21;
  }

  [v16 setValue:v23];
  [v9 setExternalMetadata:v10];
}

- (void)_tearDownVideoPlaybackViewController
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController navigationController](self, "navigationController"));
  id v4 = [v3 popViewControllerAnimated:0];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self];
}

- (void)_updateVideoOverlayForItemView:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"PlayVideo"));
  [v3 displayVideoOverlayIcon:v4 isVideoBadge:0];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if (off_100102428 != a5) {
    sub_100079E30((uint64_t)a2, (uint64_t)self);
  }
  if ((v6 & 2) != 0)
  {
    id v11 = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController view](self, "view"));
    -[TVPPhotoLibraryOneUpViewController _updateSharedLibraryStatusForOneUpView:]( self,  "_updateSharedLibraryStatusForOneUpView:",  v10);

    id v9 = v11;
  }
}

- (void)resourceReclamationEventDidOccur:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000544F0;
  v3[3] = &unk_1000C9D18;
  objc_copyWeak(&v4, &location);
  dispatch_async(&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_handleAVResourcesReclaimationEvent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController navigationController](self, "navigationController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 topViewController]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___AVPlayerViewController, v5);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) != 0) {
    -[TVPPhotoLibraryOneUpViewController _tearDownVideoPlaybackViewController]( self,  "_tearDownVideoPlaybackViewController");
  }
}

- (PHFetchResult)assetsFetchResult
{
  return self->_assetsFetchResult;
}

- (void)setAssetsFetchResult:(id)a3
{
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setAssetCollection:(id)a3
{
}

- (TVPOneupViewCachingManager)cachingManager
{
  return self->_cachingManager;
}

- (void)setCachingManager:(id)a3
{
}

- (PHAsset)currentMediaAsset
{
  return self->_currentMediaAsset;
}

- (void)setCurrentMediaAsset:(id)a3
{
}

- (NSArray)sortedMostRecentlyModifiedAssets
{
  return self->_sortedMostRecentlyModifiedAssets;
}

- (void)setSortedMostRecentlyModifiedAssets:(id)a3
{
}

- (unint64_t)selectedAssetIndex
{
  return self->_selectedAssetIndex;
}

- (void)setSelectedAssetIndex:(unint64_t)a3
{
  self->_selectedAssetIndex = a3;
}

- (BOOL)startVideoPlaybackOnLoad
{
  return self->_startVideoPlaybackOnLoad;
}

- (void)setStartVideoPlaybackOnLoad:(BOOL)a3
{
  self->_startVideoPlaybackOnLoad = a3;
}

- (BOOL)isVideoAssetDownloading
{
  return self->_videoAssetDownloading;
}

- (void)setVideoAssetDownloading:(BOOL)a3
{
  self->_videoAssetDownloading = a3;
}

- (TVPPhotoLibraryOneUpViewControllerDelegate)delegate
{
  return (TVPPhotoLibraryOneUpViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (int)videoAssetRequestID
{
  return self->_videoAssetRequestID;
}

- (void)setVideoAssetRequestID:(int)a3
{
  self->_videoAssetRequestID = a3;
}

- (PXSystemAVResourceReclamationController)avResourceReclamationController
{
  return self->_avResourceReclamationController;
}

- (void)setAvResourceReclamationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end