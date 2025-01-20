@interface TVPPhotoLibraryCollectionViewController
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (Class)_collectionViewCellClass;
- (Class)_collectionViewTitleViewClass;
- (Class)_sectionHeaderViewClass;
- (TVPCollectionView)photoLibraryCollectionView;
- (UIView)loadingView;
- (id)_photoLibraryCollectionView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)photosDetailsContextForMemory:(id)a3;
- (id)preferredFocusEnvironments;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_dismissLoadingView;
- (void)_displayLoadingView;
- (void)setLoadingView:(id)a3;
- (void)setPhotoLibraryCollectionView:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVPPhotoLibraryCollectionViewController

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryCollectionViewController;
  -[TVPPhotoLibraryCollectionViewController viewDidLoad](&v14, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___TVPCollectionViewFlowLayout);
  -[TVPCollectionViewFlowLayout setMinimumInteritemSpacing:](v3, "setMinimumInteritemSpacing:", 50.0);
  -[TVPCollectionViewFlowLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:", 50.0);
  -[TVPCollectionViewFlowLayout setItemSize:](v3, "setItemSize:", 308.0, 308.0);
  -[TVPCollectionViewFlowLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:]( v3,  "_setWantsRightToLeftHorizontalMirroringIfNeeded:",  0LL);
  v4 = objc_alloc(&OBJC_CLASS___TVPCollectionView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryCollectionViewController view](self, "view"));
  [v5 bounds];
  double v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryCollectionViewController view](self, "view"));
  [v8 bounds];
  v9 = -[TVPCollectionView initWithFrame:collectionViewLayout:]( v4,  "initWithFrame:collectionViewLayout:",  v3,  0.0,  0.0,  v7);
  photoLibraryCollectionView = self->_photoLibraryCollectionView;
  self->_photoLibraryCollectionView = v9;

  -[TVPCollectionView setDataSource:](self->_photoLibraryCollectionView, "setDataSource:", self);
  -[TVPCollectionView setDelegate:](self->_photoLibraryCollectionView, "setDelegate:", self);
  -[TVPCollectionView setScrollEnabled:](self->_photoLibraryCollectionView, "setScrollEnabled:", 1LL);
  -[TVPCollectionView setContentInset:](self->_photoLibraryCollectionView, "setContentInset:", 0.0, 90.0, 120.0, 90.0);
  -[TVPCollectionView registerClass:forCellWithReuseIdentifier:]( self->_photoLibraryCollectionView,  "registerClass:forCellWithReuseIdentifier:",  -[TVPPhotoLibraryCollectionViewController _collectionViewCellClass](self, "_collectionViewCellClass"),  @"collectionViewAssetCellIdentifier");
  -[TVPCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:]( self->_photoLibraryCollectionView,  "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:",  -[TVPPhotoLibraryCollectionViewController _collectionViewTitleViewClass](self, "_collectionViewTitleViewClass"),  @"TVPCollectionElementKindTitle",  @"collectionViewTitleReuseIdentifier");
  -[TVPCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:]( self->_photoLibraryCollectionView,  "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:",  -[TVPPhotoLibraryCollectionViewController _sectionHeaderViewClass](self, "_sectionHeaderViewClass"),  UICollectionElementKindSectionHeader,  @"collectionViewSectionHeaderCellIdentifier");
  v11 = self->_photoLibraryCollectionView;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[TVPCollectionView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  -[TVPCollectionView setUserInteractionEnabled:](self->_photoLibraryCollectionView, "setUserInteractionEnabled:", 1LL);
  -[TVPCollectionView setPrefetchingEnabled:](self->_photoLibraryCollectionView, "setPrefetchingEnabled:", 0LL);
  -[TVPCollectionView setClipsToBounds:](self->_photoLibraryCollectionView, "setClipsToBounds:", 0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryCollectionViewController view](self, "view"));
  [v13 addSubview:self->_photoLibraryCollectionView];

  -[TVPPhotoLibraryCollectionViewController setTabBarObservedScrollView:]( self,  "setTabBarObservedScrollView:",  self->_photoLibraryCollectionView);
}

- (id)photosDetailsContextForMemory:(id)a3
{
  id v13 = a3;
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[PHCollectionList transientCollectionListWithCollections:title:]( &OBJC_CLASS___PHCollectionList,  "transientCollectionListWithCollections:title:",  v4,  0LL,  v13));

  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[PHCollection fetchCollectionsInCollectionList:options:]( &OBJC_CLASS___PHCollection,  "fetchCollectionsInCollectionList:options:",  v5,  0LL));
  id v7 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v6 options:0];
  [v7 setHideHiddenAssets:1];
  id v8 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v7];
  id v9 = [[PXDisplayTitleInfo alloc] initWithAssetCollection:v3 useVerboseSmartDescription:0];
  id v10 = objc_alloc(&OBJC_CLASS___PXPhotosDetailsContext);

  id v11 = [v10 initWithPhotosDataSource:v8 displayTitleInfo:v9 parentContext:0 keyAssetsFetchResult:0];
  [v11 performChanges:&stru_1000CC4A8];

  return v11;
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryCollectionViewController _photoLibraryCollectionView](self, "_photoLibraryCollectionView"));
  id v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 0LL;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  id v11 = (objc_class *)objc_opt_class(self, v10);
  v12 = NSStringFromClass(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v9 handleFailureInMethod:a2, self, @"TVPPhotoLibraryCollectionViewController.m", 112, @"Method %s is a responsibility of subclass %@", "-[TVPPhotoLibraryCollectionViewController collectionView:cellForItemAtIndexPath:]", v13 object file lineNumber description];

  abort();
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_super v14 = (objc_class *)objc_opt_class(self, v13);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v12 handleFailureInMethod:a2, self, @"TVPPhotoLibraryCollectionViewController.m", 117, @"Method %s is a responsibility of subclass %@", "-[TVPPhotoLibraryCollectionViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:]", v16 object file lineNumber description];

  abort();
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryCollectionViewController view](self, "view", a3, a4, a5));
  [v5 bounds];
  double v7 = v6;

  double v8 = 219.0;
  double v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (Class)_collectionViewTitleViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSNull, a2);
}

- (Class)_sectionHeaderViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSNull, a2);
}

- (Class)_collectionViewCellClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSNull, a2);
}

- (id)_photoLibraryCollectionView
{
  return self->_photoLibraryCollectionView;
}

- (void)_displayLoadingView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryCollectionViewController loadingView](self, "loadingView"));

  if (!v3)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryCollectionViewController view](self, "view"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"TVPLoadingStateTitle" value:&stru_1000CC6C8 table:0]);
    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities embedPhotosLoadingViewInView:topMargin:message:]( &OBJC_CLASS___TVPUIUtilities,  "embedPhotosLoadingViewInView:topMargin:message:",  v7,  v5,  0.0));
    -[TVPPhotoLibraryCollectionViewController setLoadingView:](self, "setLoadingView:", v6);
  }

- (void)_dismissLoadingView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryCollectionViewController loadingView](self, "loadingView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryCollectionViewController loadingView](self, "loadingView"));
    [v4 removeFromSuperview];

    -[TVPPhotoLibraryCollectionViewController setLoadingView:](self, "setLoadingView:", 0LL);
  }

- (UIView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (TVPCollectionView)photoLibraryCollectionView
{
  return self->_photoLibraryCollectionView;
}

- (void)setPhotoLibraryCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end