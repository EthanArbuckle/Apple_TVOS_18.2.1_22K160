@interface TVPPhotoLibraryAlbumsListController
- (BOOL)_isAssetCollectionEmpty:(id)a3;
- (BOOL)initialSyncComplete;
- (BOOL)needsReload;
- (NSArray)albumAssetCollections;
- (NSMutableDictionary)_folderCountFetchResults;
- (NSMutableDictionary)_subCollectionKeyAssetsFetchResults;
- (PHCollectionList)defaultCollectionList;
- (PHPhotoLibrary)photoLibrary;
- (PXCPLUIStatusProvider)statusProvider;
- (PXLibraryFilterState)libraryFilterState;
- (PXSharedLibraryStatusProvider)libraryStatusProvider;
- (TVPCollectionView)albumsListView;
- (TVPCollectionViewCachingManager)cachingManager;
- (TVPFetchManager)fetchManager;
- (TVPPhotoLibraryAlbumsListController)init;
- (TVPPhotoLibraryAlbumsListController)initWithCoder:(id)a3;
- (TVPPhotoLibraryAlbumsListController)initWithCollectionList:(id)a3 libraryFilterState:(id)a4;
- (TVPPhotoLibraryAlbumsListController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVPPhotoLibraryAlbumsListController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4;
- (UIView)loadingView;
- (id)_albumAtIndexPath:(id)a3;
- (id)_assetAtIndexPath:(id)a3;
- (id)_libraryFetchOptions;
- (id)_overlayImageForAlbum:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCachingManager:(id)a3 assetsForIndexPaths:(id)a4;
- (id)preferredFocusEnvironments;
- (int64_t)_assetCountForCollection:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)tabMode;
- (void)_dismissAllLoadingAndEmptyViews;
- (void)_dismissEmptyView;
- (void)_dismissLoadingView;
- (void)_displayEmptyOrLoadingMessageIfNeeded;
- (void)_displayLoadingView;
- (void)_fetchAlbumCollectionsWithCompletion:(id)a3;
- (void)_loadFolderCell:(id)a3 withFolder:(id)a4;
- (void)_reloadData;
- (void)_updateCPLStatus;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setAlbumAssetCollections:(id)a3;
- (void)setAlbumsListView:(id)a3;
- (void)setCachingManager:(id)a3;
- (void)setDefaultCollectionList:(id)a3;
- (void)setFetchManager:(id)a3;
- (void)setInitialSyncComplete:(BOOL)a3;
- (void)setLoadingView:(id)a3;
- (void)setNeedsReload:(BOOL)a3;
- (void)setStatusProvider:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVPPhotoLibraryAlbumsListController

- (TVPPhotoLibraryAlbumsListController)initWithCollectionList:(id)a3 libraryFilterState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 photoLibrary]);
  v10 = -[TVPPhotoLibraryAlbumsListController initWithPhotoLibrary:libraryFilterState:]( self,  "initWithPhotoLibrary:libraryFilterState:",  v9,  v8);

  if (v10) {
    objc_storeStrong((id *)&v10->_defaultCollectionList, a3);
  }

  return v10;
}

- (TVPPhotoLibraryAlbumsListController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryAlbumsListController;
  v9 = -[TVPPhotoLibraryAlbumsListController initWithNibName:bundle:](&v22, "initWithNibName:bundle:", 0LL, 0LL);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    v11 = objc_alloc_init(&OBJC_CLASS___TVPCollectionViewCachingManager);
    cachingManager = v10->_cachingManager;
    v10->_cachingManager = v11;

    -[TVPCollectionViewCachingManager setDataSource:](v10->_cachingManager, "setDataSource:", v10);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    subCollectionKeyAssetsFetchResults = v10->__subCollectionKeyAssetsFetchResults;
    v10->__subCollectionKeyAssetsFetchResults = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    folderCountFetchResults = v10->__folderCountFetchResults;
    v10->__folderCountFetchResults = (NSMutableDictionary *)v15;

    -[PHPhotoLibrary px_registerChangeObserver:](v10->_photoLibrary, "px_registerChangeObserver:", v10);
    objc_storeStrong((id *)&v10->_libraryFilterState, a4);
    -[PXLibraryFilterState registerChangeObserver:context:]( v10->_libraryFilterState,  "registerChangeObserver:context:",  v10,  off_100102730);
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:]( &OBJC_CLASS___PXSharedLibraryStatusProvider,  "sharedLibraryStatusProviderWithPhotoLibrary:",  v7));
    libraryStatusProvider = v10->_libraryStatusProvider;
    v10->_libraryStatusProvider = (PXSharedLibraryStatusProvider *)v17;

    v19 = -[PXCPLUIStatusProvider initWithPhotoLibrary:]( objc_alloc(&OBJC_CLASS___PXCPLUIStatusProvider),  "initWithPhotoLibrary:",  v7);
    statusProvider = v10->_statusProvider;
    v10->_statusProvider = v19;

    -[PXCPLUIStatusProvider registerChangeObserver:context:]( v10->_statusProvider,  "registerChangeObserver:context:",  v10,  off_100102738);
  }

  return v10;
}

- (TVPPhotoLibraryAlbumsListController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v9,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPPhotoLibraryAlbumsListController.m",  136,  @"%s is not available as initializer",  "-[TVPPhotoLibraryAlbumsListController initWithNibName:bundle:]");

  abort();
}

- (TVPPhotoLibraryAlbumsListController)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v6,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPPhotoLibraryAlbumsListController.m",  140,  @"%s is not available as initializer",  "-[TVPPhotoLibraryAlbumsListController initWithCoder:]");

  abort();
}

- (TVPPhotoLibraryAlbumsListController)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPPhotoLibraryAlbumsListController.m",  144,  @"%s is not available as initializer",  "-[TVPPhotoLibraryAlbumsListController init]");

  abort();
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryAlbumsListController;
  -[TVPPhotoLibraryAlbumsListController viewDidLoad](&v18, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v8 = objc_alloc_init(&OBJC_CLASS___TVPCollectionViewFlowLayout);
  -[TVPCollectionViewFlowLayout setItemSize:](v8, "setItemSize:", 308.0, 308.0);
  -[TVPCollectionViewFlowLayout setMinimumInteritemSpacing:](v8, "setMinimumInteritemSpacing:", 50.0);
  -[TVPCollectionViewFlowLayout setMinimumLineSpacing:](v8, "setMinimumLineSpacing:", 100.0);
  -[TVPCollectionViewFlowLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:]( v8,  "_setWantsRightToLeftHorizontalMirroringIfNeeded:",  0LL);
  v9 = -[TVPCollectionView initWithFrame:collectionViewLayout:]( objc_alloc(&OBJC_CLASS___TVPCollectionView),  "initWithFrame:collectionViewLayout:",  v8,  0.0,  0.0,  v5,  v7);
  albumsListView = self->_albumsListView;
  self->_albumsListView = v9;

  -[TVPCollectionView setDataSource:](self->_albumsListView, "setDataSource:", self);
  -[TVPCollectionView setDelegate:](self->_albumsListView, "setDelegate:", self);
  -[TVPCollectionView setContentInset:](self->_albumsListView, "setContentInset:", 60.0, 90.0, 90.0, 90.0);
  -[TVPCollectionView setContentInsetAdjustmentBehavior:]( self->_albumsListView,  "setContentInsetAdjustmentBehavior:",  0LL);
  v11 = self->_albumsListView;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[TVPCollectionView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  -[TVPCollectionView setClipsToBounds:](self->_albumsListView, "setClipsToBounds:", 0LL);
  -[TVPCollectionView registerClass:forCellWithReuseIdentifier:]( self->_albumsListView,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___TVPSharedPSAlbumDescriptionView, v13),  @"albumGridIdentifier");
  -[TVPCollectionView registerClass:forCellWithReuseIdentifier:]( self->_albumsListView,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___TVPFolderCell, v14),  @"folderGridIdentifier");
  -[TVPCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:]( self->_albumsListView,  "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___TVPPhotoLibraryTitleView, v15),  @"TVPCollectionElementKindTitle",  @"albumTitleReuseIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController view](self, "view"));
  [v16 addSubview:self->_albumsListView];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController cachingManager](self, "cachingManager"));
  [v17 setCollectionView:self->_albumsListView];

  -[TVPPhotoLibraryAlbumsListController setTabBarObservedScrollView:]( self,  "setTabBarObservedScrollView:",  self->_albumsListView);
  -[TVPPhotoLibraryAlbumsListController _displayEmptyOrLoadingMessageIfNeeded]( self,  "_displayEmptyOrLoadingMessageIfNeeded");
  -[TVPPhotoLibraryAlbumsListController _reloadData](self, "_reloadData");
  -[TVPPhotoLibraryAlbumsListController _updateCPLStatus](self, "_updateCPLStatus");
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryAlbumsListController;
  -[TVPPhotoLibraryAlbumsListController viewWillAppear:](&v5, "viewWillAppear:", a3);
  if (-[TVPPhotoLibraryAlbumsListController needsReload](self, "needsReload"))
  {
    -[TVPCollectionView reloadData](self->_albumsListView, "reloadData");
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController cachingManager](self, "cachingManager"));
    [v4 startPrefetchingAssets];

    -[TVPPhotoLibraryAlbumsListController setNeedsReload:](self, "setNeedsReload:", 0LL);
  }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController photoLibrary](self, "photoLibrary"));
  objc_msgSend(v3, "px_unregisterChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryAlbumsListController;
  -[TVPPhotoLibraryAlbumsListController dealloc](&v4, "dealloc");
}

- (id)preferredFocusEnvironments
{
  if (self->_albumsListView)
  {
    albumsListView = self->_albumsListView;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &albumsListView,  1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[TVPCollectionView reloadData](self->_albumsListView, "reloadData");
  }
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v26 = a3;
  v25 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  obj = self->__subCollectionKeyAssetsFetchResults;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v34,  v39,  16LL);
  if (v4)
  {
    id v5 = v4;
    id v6 = 0LL;
    char v7 = 0;
    uint64_t v8 = *(void *)v35;
    do
    {
      v9 = 0LL;
      v10 = v6;
      do
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->__subCollectionKeyAssetsFetchResults,  "objectForKeyedSubscript:",  v11));
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v26 changeDetailsForFetchResult:v12]);

        if (v6) {
          -[NSMutableSet addObject:](v25, "addObject:", v11);
        }
        v7 |= v6 != 0LL;
        v9 = (char *)v9 + 1;
        v10 = v6;
      }

      while (v5 != v9);
      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v34,  v39,  16LL);
    }

    while (v5);
  }

  else
  {
    char v7 = 0;
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  obja = self->__folderCountFetchResults;
  id v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v30,  v38,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = 0LL;
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0LL;
      objc_super v18 = v15;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(obja);
        }
        uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->__folderCountFetchResults, "objectForKey:", v19));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v26 changeDetailsForFetchResult:v20]);

        if (v15) {
          -[NSMutableSet addObject:](v25, "addObject:", v19);
        }
        v7 |= v15 != 0LL;
        uint64_t v17 = (char *)v17 + 1;
        objc_super v18 = v15;
      }

      while (v14 != v17);
      id v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v30,  v38,  16LL);
    }

    while (v14);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVPFetchManager rootFetchResult](self->_fetchManager, "rootFetchResult"));
  objc_super v22 = (void *)objc_claimAutoreleasedReturnValue([v26 changeDetailsForFetchResult:v21]);

  if (v22 || (v7 & 1) != 0 || !-[NSArray count](self->_albumAssetCollections, "count"))
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10005A66C;
    v27[3] = &unk_1000CBED8;
    v27[4] = self;
    id v28 = v22;
    v29 = v25;
    -[TVPPhotoLibraryAlbumsListController _fetchAlbumCollectionsWithCompletion:]( self,  "_fetchAlbumCollectionsWithCompletion:",  v27);
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController cachingManager](self, "cachingManager", a3));
  [v3 setAllowsCachingHighQualityImages:0];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController cachingManager](self, "cachingManager", a3));
  [v3 setAllowsCachingHighQualityImages:1];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_albumAssetCollections, "count", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v39 = 0LL;
  v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  v42 = sub_10005B108;
  v43 = sub_10005B118;
  id v44 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController _albumAtIndexPath:](self, "_albumAtIndexPath:", v7));
  uint64_t v33 = 0LL;
  __int128 v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  __int128 v36 = sub_10005B108;
  __int128 v37 = sub_10005B118;
  id v38 = 0LL;
  uint64_t v8 = v40[5];
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___PHAssetCollection, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0) {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithReuseIdentifier:@"albumGridIdentifier" forIndexPath:v7]);
  }
  else {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithReuseIdentifier:@"folderGridIdentifier" forIndexPath:v7]);
  }
  v12 = (void *)v34[5];
  v34[5] = v11;

  if ([(id)v34[5] tag])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController cachingManager](self, "cachingManager"));
    objc_msgSend(v13, "cancelImageRequest:", objc_msgSend((id)v34[5], "tag"));
  }

  id v14 = (void *)v34[5];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([(id)v40[5] localizedTitle]);
  [v14 setTitle:v15];

  uint64_t v16 = (void *)v34[5];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([(id)v40[5] localIdentifier]);
  [v16 setCellIdentifier:v17];

  objc_super v18 = (void *)v34[5];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController _overlayImageForAlbum:](self, "_overlayImageForAlbum:", v40[5]));
  [v18 setOverlayImage:v19];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController _assetAtIndexPath:](self, "_assetAtIndexPath:", v7));
  if (v21)
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10005B120;
    v32[3] = &unk_1000CBF00;
    v32[4] = &v33;
    v32[5] = &v39;
    objc_super v22 = objc_retainBlock(v32);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController cachingManager](self, "cachingManager"));
    signed int v24 = [v23 requestImageForAsset:v21 processingHandler:0 resultHandler:v22];

    [(id)v34[5] setTag:v24];
  }

  else
  {
    uint64_t v27 = v40[5];
    uint64_t v28 = objc_opt_class(&OBJC_CLASS___PHCollectionList, v20);
    if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
    {
      -[TVPPhotoLibraryAlbumsListController _loadFolderCell:withFolder:]( self,  "_loadFolderCell:withFolder:",  v34[5],  v40[5]);
      goto LABEL_9;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController traitCollection](self, "traitCollection"));
    id v30 = [v29 userInterfaceStyle];

    __int128 v31 = (void *)v34[5];
    if (v30 == (id)1) {
      objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"EmptyFolder-Light"));
    }
    else {
      objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"EmptyFolder-Dark"));
    }
    [v31 setPhotoImage:v22];
  }

LABEL_9:
  id v25 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v25;
}

- (void)_loadFolderCell:(id)a3 withFolder:(id)a4
{
  id v35 = a3;
  id v6 = a4;
  fetchManager = self->_fetchManager;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10005B598;
  v46[3] = &unk_1000CBE10;
  id v8 = v6;
  id v47 = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVPFetchManager fetchResultForObject:missBlock:]( fetchManager,  "fetchResultForObject:missBlock:",  v8,  v46));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryAlbumsListController _subCollectionKeyAssetsFetchResults]( self,  "_subCollectionKeyAssetsFetchResults"));
  __int128 v36 = v8;
  [v10 setObject:v9 forKeyedSubscript:v8];

  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v43;
LABEL_3:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v43 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(*((void *)&v42 + 1) + 8 * v16);
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___PHAssetCollection, v13);
      if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
      {
        uint64_t v19 = self->_fetchManager;
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_10005B5B0;
        v41[3] = &unk_1000CBF28;
        v41[4] = self;
        v41[5] = v17;
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[TVPFetchManager fetchResultForObject:missBlock:]( v19,  "fetchResultForObject:missBlock:",  v17,  v41));
        v21 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryAlbumsListController _subCollectionKeyAssetsFetchResults]( self,  "_subCollectionKeyAssetsFetchResults"));
        [v21 setObject:v20 forKeyedSubscript:v17];

        if ([v20 count])
        {
          objc_super v22 = (void *)objc_claimAutoreleasedReturnValue([v20 firstObject]);
          -[NSMutableArray addObject:](v11, "addObject:", v22);
        }

        id v23 = -[NSMutableArray count](v11, "count");
      }

      if (v14 == (id)++v16)
      {
        id v14 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
        if (v14) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  signed int v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController traitCollection](self, "traitCollection"));
  id v25 = [v24 userInterfaceStyle];

  if (v25 == (id)1) {
    id v26 = @"EmptyFolder-Light";
  }
  else {
    id v26 = @"EmptyFolder-Dark";
  }
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v26));
  [v35 setBackgroundImage:v27];

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"thumbnail = YES AND isVideo = NO AND table = NO"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController photoLibrary](self, "photoLibrary"));
  id v30 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResourceQualityClass allQualityClassesMatchingPredicate:inLibrary:]( &OBJC_CLASS___PHAssetResourceQualityClass,  "allQualityClassesMatchingPredicate:inLibrary:",  v28,  v29));

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10005B608;
  v38[3] = &unk_1000CBF50;
  id v31 = v30;
  id v39 = v31;
  id v32 = v35;
  id v40 = v32;
  -[NSMutableArray enumerateObjectsUsingBlock:](v11, "enumerateObjectsUsingBlock:", v38);
  [v32 updateFolderImage];
  int v33 = -[NSMutableArray count](v11, "count");
  if (v33 <= 3)
  {
    uint64_t v34 = v33;
    do
      [v32 setImage:0 forQuadrant:v34++];
    while ((_DWORD)v34 != 4);
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v9 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:@"albumTitleReuseIdentifier" forIndexPath:v11]);

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController _albumAtIndexPath:](self, "_albumAtIndexPath:", a4));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___PHAssetCollection, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    id v9 = v5;
    id v10 = objc_alloc(&OBJC_CLASS___TVPPhotoLibraryAlbumViewController);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController libraryFilterState](self, "libraryFilterState"));
    id v12 = -[TVPPhotoLibraryAlbumViewController initWithAlbum:libraryFilterState:]( v10,  "initWithAlbum:libraryFilterState:",  v9,  v11);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController navigationController](self, "navigationController"));
    [v13 pushViewController:v12 animated:1];
  }

  else
  {
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___PHCollectionList, v8);
    if ((objc_opt_isKindOfClass(v5, v14) & 1) == 0) {
      goto LABEL_8;
    }
    id v12 = v5;
    if (-[TVPPhotoLibraryAlbumViewController collectionListSubtype](v12, "collectionListSubtype") == (id)100)
    {
      uint64_t v15 = objc_alloc(&OBJC_CLASS___TVPPhotoLibraryAlbumsListController);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController libraryFilterState](self, "libraryFilterState"));
      uint64_t v17 = -[TVPPhotoLibraryAlbumsListController initWithCollectionList:libraryFilterState:]( v15,  "initWithCollectionList:libraryFilterState:",  v12,  v16);

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumViewController localizedTitle](v12, "localizedTitle"));
      -[TVPPhotoLibraryAlbumsListController setTitle:](v17, "setTitle:", v18);

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController navigationController](self, "navigationController"));
      [v19 pushViewController:v17 animated:1];

      goto LABEL_4;
    }

    uint64_t Log = PXAssertGetLog();
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_FAULT)) {
      sub_100079ED8((uint64_t)v12, (os_log_s *)v13);
    }
  }

LABEL_4:
LABEL_8:
}

- (id)collectionViewCachingManager:(id)a3 assetsForIndexPaths:(id)a4
{
  id v5 = a4;
  if ([v5 count])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
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
          id v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryAlbumsListController _assetAtIndexPath:]( self,  "_assetAtIndexPath:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v11),  (void)v14));
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
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v9 = a3;
  if (off_100102730 == a5)
  {
    if ((v6 & 1) != 0)
    {
      id v10 = v9;
      -[TVPPhotoLibraryAlbumsListController _reloadData](self, "_reloadData");
      goto LABEL_7;
    }
  }

  else
  {
    if (off_100102738 != a5) {
      sub_100079F4C((uint64_t)a2, (uint64_t)self);
    }
    if ((v6 & 0x10000) != 0)
    {
      id v10 = v9;
      -[TVPPhotoLibraryAlbumsListController _updateCPLStatus](self, "_updateCPLStatus");
LABEL_7:
      id v9 = v10;
    }
  }
}

- (id)_libraryFetchOptions
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController photoLibrary](self, "photoLibrary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "px_standardLibrarySpecificFetchOptions"));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController libraryStatusProvider](self, "libraryStatusProvider"));
  unsigned int v6 = [v5 hasSharedLibrary];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController libraryFilterState](self, "libraryFilterState"));
    id v8 = [v7 sharingFilter];

    [v4 setSharingFilter:v8];
  }

  return v4;
}

- (id)_overlayImageForAlbum:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PHAssetCollection, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    id v6 = v3;
    if ([v6 assetCollectionType] == (id)2 && objc_msgSend(v6, "assetCollectionSubtype") == (id)203) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"Favorites"));
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)_fetchAlbumCollectionsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005BCA8;
  v8[3] = &unk_1000C9EF0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (int64_t)_assetCountForCollection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 estimatedAssetCount];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController _libraryFetchOptions](self, "_libraryFetchOptions"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsInAssetCollection:options:",  v4,  v6));
    id v5 = [v7 count];
  }

  return (int64_t)v5;
}

- (BOOL)_isAssetCollectionEmpty:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController _libraryFetchOptions](self, "_libraryFetchOptions"));
  [v5 setFetchLimit:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsInAssetCollection:options:",  v4,  v5));

  id v7 = [v6 count];
  return v7 == 0LL;
}

- (void)_displayLoadingView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController loadingView](self, "loadingView"));

  if (!v3)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController view](self, "view"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"TVPLoadingStateTitle" value:&stru_1000CC6C8 table:0]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities embedPhotosLoadingViewInView:topMargin:message:]( &OBJC_CLASS___TVPUIUtilities,  "embedPhotosLoadingViewInView:topMargin:message:",  v7,  v5,  0.0));
    -[TVPPhotoLibraryAlbumsListController setLoadingView:](self, "setLoadingView:", v6);
  }

- (void)_dismissLoadingView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController loadingView](self, "loadingView"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController loadingView](self, "loadingView"));
    [v4 removeFromSuperview];

    -[TVPPhotoLibraryAlbumsListController setLoadingView:](self, "setLoadingView:", 0LL);
  }

- (void)_dismissEmptyView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController view](self, "view"));
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

- (id)_assetAtIndexPath:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController _albumAtIndexPath:](self, "_albumAtIndexPath:", a3));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PHAssetCollection, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    id v7 = v4;
  }
  else {
    id v7 = 0LL;
  }
  id v8 = v7;
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController _libraryFetchOptions](self, "_libraryFetchOptions"));
    fetchManager = self->_fetchManager;
    __int128 v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    uint64_t v19 = sub_10005C4E4;
    uint64_t v20 = &unk_1000CBF28;
    id v11 = v8;
    id v21 = v11;
    id v22 = v9;
    id v12 = v9;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVPFetchManager fetchResultForObject:missBlock:]( fetchManager,  "fetchResultForObject:missBlock:",  v11,  &v17));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryAlbumsListController _subCollectionKeyAssetsFetchResults]( self,  "_subCollectionKeyAssetsFetchResults",  v17,  v18,  v19,  v20));
    [v14 setObject:v13 forKeyedSubscript:v11];

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
  }

  else
  {
    __int128 v15 = 0LL;
  }

  return v15;
}

- (id)_albumAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[NSArray count](self->_albumAssetCollections, "count");
  else {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_albumAssetCollections, "objectAtIndex:", [v4 item]));
  }

  return v6;
}

- (void)_reloadData
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10005C5C8;
  v2[3] = &unk_1000CBFC8;
  v2[4] = self;
  -[TVPPhotoLibraryAlbumsListController _fetchAlbumCollectionsWithCompletion:]( self,  "_fetchAlbumCollectionsWithCompletion:",  v2);
}

- (void)_displayEmptyOrLoadingMessageIfNeeded
{
  unsigned __int8 v3 = -[TVPPhotoLibraryAlbumsListController initialSyncComplete](self, "initialSyncComplete");
  NSUInteger v4 = -[NSArray count](self->_albumAssetCollections, "count");
  NSUInteger v5 = v4;
  if ((v3 & 1) == 0 && !v4)
  {
    -[TVPPhotoLibraryAlbumsListController _dismissEmptyView](self, "_dismissEmptyView");
    -[TVPPhotoLibraryAlbumsListController _displayLoadingView](self, "_displayLoadingView");
    return;
  }

  -[TVPPhotoLibraryAlbumsListController _dismissAllLoadingAndEmptyViews](self, "_dismissAllLoadingAndEmptyViews");
  if (!v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController view](self, "view"));
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"TVPAlbumsEmptyTitle" value:&stru_1000CC6C8 table:0]);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"TVPAlbumsEmptyMessage" value:&stru_1000CC6C8 table:0]);
    id v46 = (id)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities photoLibraryEmptyViewWithBounds:title:messageFormat:]( &OBJC_CLASS___TVPUIUtilities,  "photoLibraryEmptyViewWithBounds:title:messageFormat:",  v16,  v18,  v8,  v10,  v12,  v14));

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController libraryStatusProvider](self, "libraryStatusProvider"));
    LODWORD(v15) = [v19 hasSharedLibraryOrPreview];

    if ((_DWORD)v15)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController libraryFilterState](self, "libraryFilterState"));
      id v21 = [v20 viewMode];

      if ((unint64_t)v21 < 2)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController view](self, "view"));
        [v22 bounds];
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;
        uint64_t v32 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_tvOS_EmptyAlbums_Title", v31);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v32);
        id v35 = @"PXSharedLibrary_tvOS_EmptyBothOrPersonal_Message";
LABEL_10:
        uint64_t v42 = PXLocalizedSharedLibraryString(v35, v33);
        __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
        uint64_t v44 = objc_claimAutoreleasedReturnValue( +[TVPUIUtilities photoLibraryEmptyViewWithBounds:title:messageFormat:]( &OBJC_CLASS___TVPUIUtilities,  "photoLibraryEmptyViewWithBounds:title:messageFormat:",  v34,  v43,  v24,  v26,  v28,  v30));

        id v46 = (id)v44;
        goto LABEL_11;
      }

      if (v21 == (id)2)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController view](self, "view"));
        [v22 bounds];
        double v24 = v36;
        double v26 = v37;
        double v28 = v38;
        double v30 = v39;
        uint64_t v41 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_tvOS_EmptyAlbums_Title", v40);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v41);
        id v35 = @"PXSharedLibrary_tvOS_EmptyShared_Message";
        goto LABEL_10;
      }
    }

- (int64_t)tabMode
{
  return 3LL;
}

- (void)_updateCPLStatus
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[PXCPLUIStatusProvider status](self->_statusProvider, "status"));
  if (![v3 state])
  {
    -[TVPPhotoLibraryAlbumsListController setInitialSyncComplete:]( self,  "setInitialSyncComplete:",  [v3 hasCompletedInitialSync]);
    -[TVPPhotoLibraryAlbumsListController _displayEmptyOrLoadingMessageIfNeeded]( self,  "_displayEmptyOrLoadingMessageIfNeeded");
  }
}

- (TVPCollectionView)albumsListView
{
  return self->_albumsListView;
}

- (void)setAlbumsListView:(id)a3
{
}

- (UIView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
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

- (NSArray)albumAssetCollections
{
  return self->_albumAssetCollections;
}

- (void)setAlbumAssetCollections:(id)a3
{
}

- (PHCollectionList)defaultCollectionList
{
  return self->_defaultCollectionList;
}

- (void)setDefaultCollectionList:(id)a3
{
}

- (NSMutableDictionary)_subCollectionKeyAssetsFetchResults
{
  return self->__subCollectionKeyAssetsFetchResults;
}

- (NSMutableDictionary)_folderCountFetchResults
{
  return self->__folderCountFetchResults;
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (void)setNeedsReload:(BOOL)a3
{
  self->_needsReload = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSharedLibraryStatusProvider)libraryStatusProvider
{
  return self->_libraryStatusProvider;
}

- (PXCPLUIStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (void)setStatusProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end