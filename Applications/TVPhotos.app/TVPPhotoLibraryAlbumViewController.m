@interface TVPPhotoLibraryAlbumViewController
- (Class)_collectionViewCellClass;
- (Class)_sectionHeaderViewClass;
- (NSIndexPath)preferredFocusIndexPath;
- (NSTimer)updateAssetsAndReloadTimer;
- (PHAssetCollection)album;
- (PLCloudSharedAlbum)pl_sharedAlbum;
- (PXLibraryFilterState)libraryFilterState;
- (TVPCollectionViewCachingManager)cachingManager;
- (TVPFetchManager)fetchManager;
- (TVPModalPresenter)presenter;
- (TVPPhotoLibraryAlbumViewController)init;
- (TVPPhotoLibraryAlbumViewController)initWithAlbum:(id)a3 libraryFilterState:(id)a4;
- (TVPPhotoLibraryAlbumViewController)initWithCoder:(id)a3;
- (TVPPhotoLibraryAlbumViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVPSharedPSSubscriberListViewController)subscribersListController;
- (id)_allPhotoAssets;
- (id)_assetAtIndexPath:(id)a3;
- (id)_indexPathsFromIndexes:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCachingManager:(id)a3 assetsForIndexPaths:(id)a4;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_cancelExistingTimer;
- (void)_didFinishTimedInterval:(id)a3;
- (void)_menuAction:(id)a3;
- (void)_onSelectDetailsButton:(id)a3;
- (void)_onSelectScreenSaverButton:(id)a3;
- (void)_onSelectSlideshowButton:(id)a3;
- (void)_onSelectSubscribersButton:(id)a3;
- (void)_sharedAlbumStreamDeletedOrUnsubscribedNotification:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)dealloc;
- (void)photoLibraryDidChange:(id)a3;
- (void)photoLibraryOneUpControllerWillPop:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setCachingManager:(id)a3;
- (void)setFetchManager:(id)a3;
- (void)setPl_sharedAlbum:(id)a3;
- (void)setPreferredFocusIndexPath:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setSubscribersListController:(id)a3;
- (void)setUpdateAssetsAndReloadTimer:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVPPhotoLibraryAlbumViewController

- (TVPPhotoLibraryAlbumViewController)initWithAlbum:(id)a3 libraryFilterState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryAlbumViewController;
  v9 = -[TVPPhotoLibraryAlbumViewController initWithNibName:bundle:](&v28, "initWithNibName:bundle:", 0LL, 0LL);
  objc_storeStrong((id *)&v9->_album, a3);
  objc_storeStrong((id *)&v9->_libraryFilterState, a4);
  v10 = objc_alloc_init(&OBJC_CLASS___TVPCollectionViewCachingManager);
  cachingManager = v9->_cachingManager;
  v9->_cachingManager = v10;

  -[TVPCollectionViewCachingManager setDataSource:](v9->_cachingManager, "setDataSource:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 photoLibrary]);
  [v12 registerChangeObserver:v9];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 photoLibrary]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "px_standardLibrarySpecificFetchOptions"));

  if (objc_msgSend(v7, "px_isRecentsSmartAlbum"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"dateCreated",  0LL));
    v29[0] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"addedDate",  0LL));
    v29[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"objectID",  0LL));
    v29[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 3LL));
    [v14 setInternalSortDescriptors:v18];
  }

  if ((objc_msgSend(v7, "px_isSharedAlbum") & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController libraryFilterState](v9, "libraryFilterState"));
    id v20 = [v19 sharingFilter];

    [v14 setSharingFilter:v20];
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsInAssetCollection:options:",  v7,  v14));
  v22 = -[TVPFetchManager initWithFetchResult:](objc_alloc(&OBJC_CLASS___TVPFetchManager), "initWithFetchResult:", v21);
  fetchManager = v9->_fetchManager;
  v9->_fetchManager = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHAssetCollection pl_assetContainer](v9->_album, "pl_assetContainer"));
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___PLCloudSharedAlbum, v25);
  if ((objc_opt_isKindOfClass(v24, v26) & 1) != 0) {
    objc_storeStrong((id *)&v9->_pl_sharedAlbum, v24);
  }

  return v9;
}

- (TVPPhotoLibraryAlbumViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v9,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPPhotoLibraryAlbumViewController.m",  104,  @"%s is not available as initializer",  "-[TVPPhotoLibraryAlbumViewController initWithNibName:bundle:]");

  abort();
}

- (TVPPhotoLibraryAlbumViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v6,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPPhotoLibraryAlbumViewController.m",  108,  @"%s is not available as initializer",  "-[TVPPhotoLibraryAlbumViewController initWithCoder:]");

  abort();
}

- (TVPPhotoLibraryAlbumViewController)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPPhotoLibraryAlbumViewController.m",  112,  @"%s is not available as initializer",  "-[TVPPhotoLibraryAlbumViewController init]");

  abort();
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryAlbumViewController;
  -[TVPPhotoLibraryCollectionViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController cachingManager](self, "cachingManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryCollectionViewController _photoLibraryCollectionView]( self,  "_photoLibraryCollectionView"));
  [v3 setCollectionView:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryAlbumViewController;
  -[TVPPhotoLibraryAlbumViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController preferredFocusIndexPath](self, "preferredFocusIndexPath"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryCollectionViewController _photoLibraryCollectionView]( self,  "_photoLibraryCollectionView"));
  unsigned int v6 = +[TVPUIUtilities isValidIndexPath:collectionView:]( &OBJC_CLASS___TVPUIUtilities,  "isValidIndexPath:collectionView:",  v4,  v5);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryCollectionViewController _photoLibraryCollectionView]( self,  "_photoLibraryCollectionView"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController preferredFocusIndexPath](self, "preferredFocusIndexPath"));
    [v7 scrollToItemAtIndexPath:v8 atScrollPosition:2 animated:0];
  }

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryAlbumViewController;
  -[TVPPhotoLibraryAlbumViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPFetchManager rootFetchResult](self->_fetchManager, "rootFetchResult"));
  id v5 = [v4 count];

  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController cachingManager](self, "cachingManager"));
    [v6 startPrefetchingAssets];
  }

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryAlbumViewController;
  -[TVPPhotoLibraryAlbumViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  if (-[PLCloudSharedAlbum isCloudSharedAlbum](self->_pl_sharedAlbum, "isCloudSharedAlbum"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAssetCollection localIdentifier](self->_album, "localIdentifier"));
    +[PLPhotoSharingHelper markAlbumGUIDAsViewed:clearUnseenAssetsCount:]( &OBJC_CLASS___PLPhotoSharingHelper,  "markAlbumGUIDAsViewed:clearUnseenAssetsCount:",  v4,  1LL);
  }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController album](self, "album"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 photoLibrary]);
  [v4 unregisterChangeObserver:self];

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryAlbumViewController;
  -[TVPPhotoLibraryAlbumViewController dealloc](&v6, "dealloc");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController cachingManager](self, "cachingManager", a3));
  [v3 setAllowsCachingHighQualityImages:0];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController cachingManager](self, "cachingManager", a3));
  [v3 setAllowsCachingHighQualityImages:1];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPFetchManager rootFetchResult](self->_fetchManager, "rootFetchResult", a3, a4));
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( [a3 dequeueReusableCellWithReuseIdentifier:@"collectionViewAssetCellIdentifier" forIndexPath:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", v6));

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
  [v7 setAssetLocalIdentifier:v9];

  objc_msgSend( v7,  "setAssetType:",  +[TVPUIUtilities assetTypeForAsset:](TVPUIUtilities, "assetTypeForAsset:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController cachingManager](self, "cachingManager"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100075438;
  v16[3] = &unk_1000CA748;
  id v11 = v7;
  id v17 = v11;
  v18 = v8;
  id v12 = v8;
  [v10 requestImageForAsset:v12 processingHandler:0 resultHandler:v16];

  v13 = v18;
  id v14 = v11;

  return v14;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [a3 dequeueReusableSupplementaryViewOfKind:a4 withReuseIdentifier:@"collectionViewSectionHeaderCellIdentifier" forIndexPath:a5]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAssetCollection localizedTitle](self->_album, "localizedTitle"));
  [v6 setTitle:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPFetchManager rootFetchResult](self->_fetchManager, "rootFetchResult"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities getFormattedAssetCountStringForPhotoCount:videoCount:]( TVPPhotoUtilities,  "getFormattedAssetCountStringForPhotoCount:videoCount:",  [v8 countOfAssetsWithMediaType:1],  objc_msgSend(v8, "countOfAssetsWithMediaType:", 2)));
  if (-[PHAssetCollection isOwnedCloudSharedAlbum](self->_album, "isOwnedCloudSharedAlbum"))
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"sharedByYou" value:&stru_1000CC6C8 table:0]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"%@   •   %@",  v11,  v9));
  }

  else
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[PHAssetCollection pl_assetContainer](self->_album, "pl_assetContainer"));
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___PLCloudSharedAlbum, v13);
    if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0)
    {
      v45 = v9;
      id v10 = v10;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"sharedByYou" value:&stru_1000CC6C8 table:0]);

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 isOwned]);
      unsigned __int8 v18 = [v17 BOOLValue];

      if ((v18 & 1) == 0)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue([v10 cloudOwnerDisplayNameIncludingEmail:0 allowsEmail:1]);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        id v20 = v8;
        v21 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"sharedPersonString" value:&stru_1000CC6C8 table:0]);
        uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v21, v43));

        id v8 = v20;
        v16 = (void *)v22;
      }

      objc_super v9 = v45;
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"%@   •   %@",  v16,  v45));
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"%@",  v9));
    }
  }

  [v6 setSubtitle:v12];
  v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"InternalFocusHeaders", @"com.apple.TVPhotos", 0LL);
  if (-[PHAssetCollection isSlideshowCompatible](self->_album, "isSlideshowCompatible"))
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVPFetchManager rootFetchResult](self->_fetchManager, "rootFetchResult"));
    BOOL v26 = [v25 count] != 0;

    v46 = v9;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    int v44 = AppBooleanValue;
    objc_super v28 = v6;
    v29 = v12;
    v30 = v8;
    v31 = (void *)objc_claimAutoreleasedReturnValue( [v27 localizedStringForKey:@"PlaySlideshow" value:&stru_1000CC6C8 table:0]);
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities getPhotoBannerButtonWithTitle:]( &OBJC_CLASS___TVPPhotoUtilities,  "getPhotoBannerButtonWithTitle:",  v31));

    [v32 addTarget:self action:"_onSelectSlideshowButton:" forControlEvents:0x2000];
    [v32 _setBlurEnabled:0];
    [v32 setEnabled:v26];
    -[NSMutableArray addObject:](v23, "addObject:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue( [v33 localizedStringForKey:@"SetAsScreensaver" value:&stru_1000CC6C8 table:0]);
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities getPhotoBannerButtonWithTitle:]( &OBJC_CLASS___TVPPhotoUtilities,  "getPhotoBannerButtonWithTitle:",  v34));

    id v8 = v30;
    id v12 = v29;
    id v6 = v28;
    int AppBooleanValue = v44;

    objc_super v9 = v46;
    [v35 addTarget:self action:"_onSelectScreenSaverButton:" forControlEvents:0x2000];
    [v35 _setBlurEnabled:0];
    [v35 setEnabled:v26];
    -[NSMutableArray addObject:](v23, "addObject:", v35);
  }

  if (-[PLCloudSharedAlbum isCloudSharedAlbum](self->_pl_sharedAlbum, "isCloudSharedAlbum"))
  {
    v36 = v6;
    v37 = v12;
    v38 = v9;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 localizedStringForKey:@"people" value:&stru_1000CC6C8 table:0]);
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities getPhotoBannerButtonWithTitle:]( &OBJC_CLASS___TVPPhotoUtilities,  "getPhotoBannerButtonWithTitle:",  v40));

    objc_super v9 = v38;
    id v12 = v37;
    id v6 = v36;
    [v41 addTarget:self action:"_onSelectSubscribersButton:" forControlEvents:0x2000];
    [v41 _setBlurEnabled:0];
    -[NSMutableArray addObject:](v23, "addObject:", v41);
    [v36 setButtons:v23];
LABEL_14:

    goto LABEL_15;
  }

  if (AppBooleanValue)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities getPhotoBannerButtonWithTitle:]( &OBJC_CLASS___TVPPhotoUtilities,  "getPhotoBannerButtonWithTitle:",  @"Details"));
    [v41 addTarget:self action:"_onSelectDetailsButton:" forControlEvents:0x2000];
    [v41 _setBlurEnabled:0];
    -[NSMutableArray addObject:](v23, "addObject:", v41);
    goto LABEL_14;
  }

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 delegate]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", v5));
  if ([v7 isPhotoPickerModeEnabled])
  {
    [v7 photoPickerViewController:self selectedPhotoAsset:v8];
  }

  else
  {
    if (-[PLCloudSharedAlbum isCloudSharedAlbum](self->_pl_sharedAlbum, "isCloudSharedAlbum"))
    {
      objc_super v9 = objc_alloc(&OBJC_CLASS___TVPSharedPSOneUpViewController);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController album](self, "album"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 photoLibrary]);
      id v12 = -[TVPSharedPSOneUpViewController initWithPhotoLibrary:](v9, "initWithPhotoLibrary:", v11);

      v18[0] = @"oneup";
      v18[1] = @"caption";
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
      -[TVPSharedPSOneUpViewController setAllowedModes:](v12, "setAllowedModes:", v13);
    }

    else
    {
      uint64_t v14 = objc_alloc(&OBJC_CLASS___TVPPhotoLibraryOneUpViewController);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController album](self, "album"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 photoLibrary]);
      id v12 = -[TVPPhotoLibraryOneUpViewController initWithPhotoLibrary:](v14, "initWithPhotoLibrary:", v15);
    }

    -[TVPPhotoLibraryOneUpViewController setDelegate:](v12, "setDelegate:", self);
    -[TVPPhotoLibraryOneUpViewController setAssetCollection:](v12, "setAssetCollection:", self->_album);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPFetchManager rootFetchResult](self->_fetchManager, "rootFetchResult"));
    -[TVPPhotoLibraryOneUpViewController setAssetsFetchResult:](v12, "setAssetsFetchResult:", v16);

    -[TVPPhotoLibraryOneUpViewController setSelectedAssetIndex:]( v12,  "setSelectedAssetIndex:",  [v5 item]);
    if ([v8 playbackStyle] == (id)4) {
      -[TVPPhotoLibraryOneUpViewController setStartVideoPlaybackOnLoad:](v12, "setStartVideoPlaybackOnLoad:", 1LL);
    }
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController navigationController](self, "navigationController"));
    [v17 pushViewController:v12 animated:1];
  }
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 nextFocusedIndexPath]);

  if (v6)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v8 nextFocusedIndexPath]);
    -[TVPPhotoLibraryAlbumViewController setPreferredFocusIndexPath:](self, "setPreferredFocusIndexPath:", v7);
  }
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController preferredFocusIndexPath](self, "preferredFocusIndexPath"));
  unsigned int v6 = +[TVPUIUtilities isValidIndexPath:collectionView:]( &OBJC_CLASS___TVPUIUtilities,  "isValidIndexPath:collectionView:",  v5,  v4);

  if (v6) {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController preferredFocusIndexPath](self, "preferredFocusIndexPath"));
  }
  else {
    objc_super v7 = 0LL;
  }
  return v7;
}

- (void)photoLibraryOneUpControllerWillPop:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue([a3 focusedAsset]);
  if (v10)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController navigationController](self, "navigationController"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController navigationController](self, "navigationController"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 topViewController]);
    [v4 _forgetFocusedItemForViewController:v6];

    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPFetchManager rootFetchResult](self->_fetchManager, "rootFetchResult"));
    id v8 = [v7 indexOfObject:v10];

    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v8,  0LL));
    -[TVPPhotoLibraryAlbumViewController setPreferredFocusIndexPath:](self, "setPreferredFocusIndexPath:", v9);
  }
}

- (void)photoLibraryDidChange:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPFetchManager rootFetchResult](self->_fetchManager, "rootFetchResult"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 changeDetailsForFetchResult:v4]);

  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVPFetchManager fetchManagerByApplyingChange:]( self->_fetchManager,  "fetchManagerByApplyingChange:",  v8));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100075F48;
    block[3] = &unk_1000C9CC8;
    block[4] = self;
    id v10 = v6;
    id v7 = v6;
    dispatch_sync(&_dispatch_main_q, block);
  }
}

- (Class)_sectionHeaderViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVPPhotoBannerBrowserView, a2);
}

- (Class)_collectionViewCellClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVPhotoLibraryGridViewCell, a2);
}

- (id)collectionViewCachingManager:(id)a3 assetsForIndexPaths:(id)a4
{
  id v5 = a4;
  if ([v5 count])
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryAlbumViewController _assetAtIndexPath:]( self,  "_assetAtIndexPath:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v11),  (void)v14));
          if (v12) {
            [v6 addObject:v12];
          }

          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v9);
    }
  }

  else
  {
    unsigned int v6 = 0LL;
  }

  return v6;
}

- (void)_didFinishTimedInterval:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryCollectionViewController _photoLibraryCollectionView]( self,  "_photoLibraryCollectionView",  a3));
  [v6 reloadData];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController _allPhotoAssets](self, "_allPhotoAssets"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController navigationController](self, "navigationController"));
  +[TVPUIUtilities refreshSlideshowPreviewWithPhotoAssets:navigationController:]( &OBJC_CLASS___TVPUIUtilities,  "refreshSlideshowPreviewWithPhotoAssets:navigationController:",  v4,  v5);
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

- (id)_assetAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPFetchManager rootFetchResult](self->_fetchManager, "rootFetchResult"));
  id v6 = [v5 count];
  if (v6 <= [v4 item])
  {
    id v8 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPFetchManager rootFetchResult](self->_fetchManager, "rootFetchResult"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "item")));
  }

  return v8;
}

- (id)_allPhotoAssets
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPFetchManager rootFetchResult](self->_fetchManager, "rootFetchResult"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007634C;
  v5[3] = &unk_1000CC5A0;
  id v3 =  -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v2 count]);
  id v6 = v3;
  [v2 enumerateObjectsUsingBlock:v5];

  return v3;
}

- (void)_onSelectScreenSaverButton:(id)a3
{
  id v8 = @"CollectionID";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAssetCollection localIdentifier](self->_album, "localIdentifier", a3));
  id v9 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAssetCollection localizedTitle](self->_album, "localizedTitle"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
  [v7 setScreenSaverWithName:v6 style:0 extraInfo:v5 showConfirmation:1 completion:0];
}

- (void)_onSelectSlideshowButton:(id)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___TVPSlideshowSettingsViewController);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController _allPhotoAssets](self, "_allPhotoAssets"));
  id v7 = -[TVPSlideshowSettingsViewController initWithPhotoAssets:](v4, "initWithPhotoAssets:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController navigationController](self, "navigationController"));
  [v6 pushViewController:v7 animated:1];
}

- (void)_menuAction:(id)a3
{
  presenter = self->_presenter;
  if (presenter) {
    -[TVPModalPresenter hideController:animated:withCompletion:]( presenter,  "hideController:animated:withCompletion:",  self->_subscribersListController,  1LL,  0LL);
  }
}

- (void)_sharedAlbumStreamDeletedOrUnsubscribedNotification:(id)a3
{
  presenter = self->_presenter;
  if (presenter) {
    -[TVPModalPresenter hideController:animated:withCompletion:]( presenter,  "hideController:animated:withCompletion:",  self->_subscribersListController,  0LL,  0LL);
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController navigationController](self, "navigationController", a3));
  id v5 = [v6 popToRootViewControllerAnimated:1];
}

- (void)_onSelectDetailsButton:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryCollectionViewController photosDetailsContextForMemory:]( self,  "photosDetailsContextForMemory:",  self->_album));
  id v4 = [[PXPhotosDetailsUIViewController alloc] initWithContext:v6 options:0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController navigationController](self, "navigationController"));
  [v5 pushViewController:v4 animated:1];
}

- (void)_onSelectSubscribersButton:(id)a3
{
  id v11 = a3;
  if (!self->_subscribersListController)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___TVPSharedPSSubscriberListViewController);
    subscribersListController = self->_subscribersListController;
    self->_subscribersListController = v4;

    -[TVPSharedPSSubscriberListViewController setCloudSharedAlbum:]( self->_subscribersListController,  "setCloudSharedAlbum:",  self->_album);
    id v6 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuAction:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v6, "setAllowedPressTypes:", &off_1000D1DF8);
    -[TVPSharedPSSubscriberListViewController setMenuGestureRecognizer:]( self->_subscribersListController,  "setMenuGestureRecognizer:",  v6);
  }

  presenter = self->_presenter;
  if (!presenter)
  {
    id v8 = (TVPModalPresenter *)objc_claimAutoreleasedReturnValue(+[TVPModalPresenter presenter](&OBJC_CLASS___TVPModalPresenter, "presenter"));
    id v9 = self->_presenter;
    self->_presenter = v8;

    presenter = self->_presenter;
  }

  -[TVPModalPresenter showController:fromController:withCompletionBlock:]( presenter,  "showController:fromController:withCompletionBlock:",  self->_subscribersListController,  self,  0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v10 addObserver:self selector:"_sharedAlbumStreamDeletedOrUnsubscribedNotification:" name:off_100101F88 object:0];
}

- (id)_indexPathsFromIndexes:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000767B0;
  v6[3] = &unk_1000CC5C8;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  id v7 = v4;
  [v3 enumerateIndexesUsingBlock:v6];

  return v4;
}

- (NSIndexPath)preferredFocusIndexPath
{
  return self->_preferredFocusIndexPath;
}

- (void)setPreferredFocusIndexPath:(id)a3
{
}

- (TVPModalPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (TVPFetchManager)fetchManager
{
  return self->_fetchManager;
}

- (void)setFetchManager:(id)a3
{
}

- (TVPCollectionViewCachingManager)cachingManager
{
  return self->_cachingManager;
}

- (void)setCachingManager:(id)a3
{
}

- (TVPSharedPSSubscriberListViewController)subscribersListController
{
  return self->_subscribersListController;
}

- (void)setSubscribersListController:(id)a3
{
}

- (PLCloudSharedAlbum)pl_sharedAlbum
{
  return self->_pl_sharedAlbum;
}

- (void)setPl_sharedAlbum:(id)a3
{
}

- (NSTimer)updateAssetsAndReloadTimer
{
  return self->_updateAssetsAndReloadTimer;
}

- (void)setUpdateAssetsAndReloadTimer:(id)a3
{
}

- (PHAssetCollection)album
{
  return self->_album;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void).cxx_destruct
{
}

@end