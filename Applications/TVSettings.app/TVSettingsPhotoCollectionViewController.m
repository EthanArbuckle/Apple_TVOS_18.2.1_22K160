@interface TVSettingsPhotoCollectionViewController
- (NSArray)photoAssets;
- (TVPhotoCollection)collection;
- (TVSettingsPhotoCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVSettingsPhotoCollectionViewControllerSelectionDelegate)delegate;
- (UICollectionView)gridView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)preferredFocusEnvironments;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)setCollection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGridView:(id)a3;
- (void)setPhotoAssets:(id)a3;
@end

@implementation TVSettingsPhotoCollectionViewController

- (TVSettingsPhotoCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsPhotoCollectionViewController;
  v4 = -[TVSettingsPhotoCollectionViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = -[TVImageScaleDecorator initWithScaleToSize:scaleMode:]( objc_alloc(&OBJC_CLASS___TVImageScaleDecorator),  "initWithScaleToSize:scaleMode:",  3LL,  380.0,  380.0);
    scaleDecorator = v4->_scaleDecorator;
    v4->_scaleDecorator = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoCollectionViewController gridView](v4, "gridView"));
    [v7 setContentInsetAdjustmentBehavior:2];
  }

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsPhotoCollectionViewController;
  -[TVSettingsPhotoCollectionViewController dealloc](&v4, "dealloc");
}

- (void)loadView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v24 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setItemSize:](v24, "setItemSize:", 308.0, 308.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v24, "setMinimumInteritemSpacing:", 50.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v24, "setMinimumLineSpacing:", 50.0);
  -[UICollectionViewFlowLayout setHeaderReferenceSize:](v24, "setHeaderReferenceSize:", v9, 203.0);
  v12 = -[UICollectionView initWithFrame:collectionViewLayout:]( objc_alloc(&OBJC_CLASS___UICollectionView),  "initWithFrame:collectionViewLayout:",  v24,  v5,  v7,  v9,  v11);
  gridView = self->_gridView;
  self->_gridView = v12;

  -[UICollectionView setDataSource:](self->_gridView, "setDataSource:", self);
  -[UICollectionView setDelegate:](self->_gridView, "setDelegate:", self);
  -[UICollectionView setScrollEnabled:](self->_gridView, "setScrollEnabled:", 1LL);
  v14 = self->_gridView;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___TVSettingsPhotoCollectionViewCell);
  v16 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSettingsPhotoCollectionViewCell);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:]( v14,  "registerClass:forCellWithReuseIdentifier:",  v15,  v18);

  v19 = self->_gridView;
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___TVSettingsPhotoCollectionViewHeader);
  v21 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSettingsPhotoCollectionViewHeader);
  v22 = NSStringFromClass(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:]( v19,  "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:",  v20,  UICollectionElementKindSectionHeader,  v23);

  -[UICollectionView setContentInset:](self->_gridView, "setContentInset:", 0.0, 90.0, 90.0, 90.0);
  -[TVSettingsPhotoCollectionViewController setView:](self, "setView:", self->_gridView);
}

- (id)preferredFocusEnvironments
{
  if (self->_gridView)
  {
    gridView = self->_gridView;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &gridView, 1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)setCollection:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_collection, a3);
  objc_initWeak(&location, self);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoCollection photoSource](self->_collection, "photoSource"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoCollection collectionIdentifier](self->_collection, "collectionIdentifier"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007BF44;
  v8[3] = &unk_10018F550;
  objc_copyWeak(&v9, &location);
  [v6 fetchAssetsForCollectionWithIdentifier:v7 options:0 completion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_photoAssets, "count", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  photoAssets = self->_photoAssets;
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( photoAssets,  "objectAtIndexedSubscript:",  [v7 item]));
  double v10 = objc_alloc(&OBJC_CLASS___TVImageProxy);
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v9 fullResolutionURL]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVURLImageLoader sharedInstance](&OBJC_CLASS___TVURLImageLoader, "sharedInstance"));
  v13 = -[TVImageProxy initWithObject:imageLoader:groupType:]( v10,  "initWithObject:imageLoader:groupType:",  v11,  v12,  0LL);

  -[TVImageProxy setDecorator:](v13, "setDecorator:", self->_scaleDecorator);
  v14 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSettingsPhotoCollectionViewCell);
  uint64_t v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 dequeueReusableCellWithReuseIdentifier:v16 forIndexPath:v7]);

  [v17 setImageProxy:v13];
  return v17;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSettingsPhotoCollectionViewHeader);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( [v10 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v13 forIndexPath:v8]);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoCollection collectionName](self->_collection, "collectionName"));
  uint64_t v16 = TSKLocString(@"PhotoGridAssetCountFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v17,  -[NSArray count](self->_photoAssets, "count")));

  [v14 setTitle:v15];
  [v14 setSubtitle:v18];

  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_photoAssets,  "objectAtIndexedSubscript:",  objc_msgSend(a4, "item", a3)));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controller:self didSelectAsset:v6];
}

- (TVPhotoCollection)collection
{
  return self->_collection;
}

- (TVSettingsPhotoCollectionViewControllerSelectionDelegate)delegate
{
  return (TVSettingsPhotoCollectionViewControllerSelectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UICollectionView)gridView
{
  return self->_gridView;
}

- (void)setGridView:(id)a3
{
}

- (NSArray)photoAssets
{
  return self->_photoAssets;
}

- (void)setPhotoAssets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end