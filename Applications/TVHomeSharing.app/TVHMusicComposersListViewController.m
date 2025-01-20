@interface TVHMusicComposersListViewController
+ (id)new;
- (TVHCollectionViewChangeSetDataSource)changeSetDataSource;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHListView)listView;
- (TVHMediaEntitiesDataSource)dataSource;
- (TVHMusicComposersListViewController)init;
- (TVHMusicComposersListViewController)initWithCoder:(id)a3;
- (TVHMusicComposersListViewController)initWithMediaLibrary:(id)a3 fetchRequestIdentifier:(id)a4;
- (TVHMusicComposersListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)preferredFocusEnvironments;
- (void)_configureCell:(id)a3 atIndexPath:(id)a4;
- (void)collectionView:(id)a3 didPlayItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)setChangeSetDataSource:(id)a3;
- (void)setListView:(id)a3;
- (void)updateWithMediaEntitiesDataSourceFetchResult:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TVHMusicComposersListViewController

+ (id)new
{
  return 0LL;
}

- (TVHMusicComposersListViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMusicComposersListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHMusicComposersListViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMusicComposersListViewController)initWithMediaLibrary:(id)a3 fetchRequestIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHMusicComposersListViewController;
  v9 = -[TVHMusicComposersListViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0LL, 0LL);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibrary, a3);
    v11 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithFetchResultIdentifier:",  v8);
    dataSource = v10->_dataSource;
    v10->_dataSource = v11;

    -[TVHMediaEntitiesDataSource setProvideIndexTitles:](v10->_dataSource, "setProvideIndexTitles:", 1LL);
  }

  return v10;
}

- (void)updateWithMediaEntitiesDataSourceFetchResult:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicComposersListViewController dataSource](self, "dataSource"));
  id v7 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

  [v5 updateWithMediaEntitiesDataSourceFetchResults:v6];
}

- (void)loadView
{
  id v4 = objc_alloc_init(&OBJC_CLASS___TVHListViewLayout);
  -[TVHListViewLayout setMinimumLineSpacing:](v4, "setMinimumLineSpacing:", 16.0);
  v3 = -[TVHListView initWithFrame:listViewLayout:]( objc_alloc(&OBJC_CLASS___TVHListView),  "initWithFrame:listViewLayout:",  v4,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[TVHMusicComposersListViewController setListView:](self, "setListView:", v3);
  -[TVHMusicComposersListViewController setView:](self, "setView:", v3);
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHMusicComposersListViewController;
  -[TVHMusicComposersListViewController viewDidLoad](&v13, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicComposersListViewController listView](self, "listView"));
  [v3 setDelegate:self];
  [v3 setClipsToBounds:0];
  [v3 setRemembersLastFocusedIndexPath:1];
  +[TVHMusicMainViewController defaultMusicCategoryContentInset]( &OBJC_CLASS___TVHMusicMainViewController,  "defaultMusicCategoryContentInset");
  objc_msgSend(v3, "setContentInset:");
  [v3 configureDefaultGradientMaskForDirection:1];
  [v3 registerClass:objc_opt_class(TVHSimpleListViewCell) forCellWithReuseIdentifier:@"TVHMusicComposerListViewCell"];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(&OBJC_CLASS___TVHCollectionViewChangeSetDataSource);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicComposersListViewController dataSource](self, "dataSource"));
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_100020938;
  v10 = &unk_1000FD750;
  objc_copyWeak(&v11, &location);
  v6 = -[TVHCollectionViewChangeSetDataSource initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:]( v4,  "initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:",  v3,  v5,  &stru_1000FD728,  &v7);

  -[TVHMusicComposersListViewController setChangeSetDataSource:](self, "setChangeSetDataSource:", v6, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVHMusicComposersListViewController;
  -[TVHMusicComposersListViewController viewDidLayoutSubviews](&v12, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicComposersListViewController listView](self, "listView"));
  [v3 bounds];
  double v5 = v4;
  [v3 contentInset];
  double v8 = v5 - v6 - v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 listViewLayout]);
  [v9 itemSize];
  if (v8 != v11 || v10 != 79.0)
  {
    objc_msgSend(v9, "setItemSize:", v8, 79.0);
    [v9 invalidateLayout];
  }
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicComposersListViewController listView](self, "listView"));
  double v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicComposersListViewController dataSource](self, "dataSource"));
  id v14 = (id)objc_claimAutoreleasedReturnValue([v6 mediaEntityCollectionAtIndexPath:v5]);

  double v7 = v14;
  if (v14)
  {
    double v8 = sub_10007D684(v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    double v10 = objc_alloc(&OBJC_CLASS___TVHMusicAlbumsViewController);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicComposersListViewController mediaLibrary](self, "mediaLibrary"));
    objc_super v12 = -[TVHMusicAlbumsViewController initWithMediaLibrary:albumsDataSource:]( v10,  "initWithMediaLibrary:albumsDataSource:",  v11,  v9);

    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v12,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicComposersListViewController navigationController](self, "navigationController"));
    [v13 pushViewController:v12 animated:1];

    double v7 = v14;
  }
}

- (void)collectionView:(id)a3 didPlayItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicComposersListViewController dataSource](self, "dataSource"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntityCollectionAtIndexPath:v5]);

  if (v7)
  {
    id v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  1LL));
    uint64_t v10 = TVHKMusicMediaItemProperties();
    double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v9 setProperties:v11];
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);

    if (v12)
    {
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaItemComposerTitlePredicateWithComposerTitle:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaItemComposerTitlePredicateWithComposerTitle:",  v12));
      [v9 setPredicate:v13];
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
    v20 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    [v9 setSortDescriptors:v15];

    v16 = objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicComposersListViewController mediaLibrary](self, "mediaLibrary"));
    v18 = -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:]( v16,  "initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:",  v17,  v9,  0LL,  1LL);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicComposersListViewController navigationController](self, "navigationController"));
    [v19 pushViewController:v18 animated:1];
  }
}

- (void)_configureCell:(id)a3 atIndexPath:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicComposersListViewController dataSource](self, "dataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntityCollectionAtIndexPath:v6]);

  if (v8)
  {
    id v9 = v15;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 titleLabel]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvh_displayTitle"));
    [v10 setText:v11];

    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_10PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_10PercentBlackColor"));
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_10PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_10PercentWhiteColor"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v12,  v13));
    [v9 setBackgroundColor:v14];
  }
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHMediaEntitiesDataSource)dataSource
{
  return self->_dataSource;
}

- (TVHListView)listView
{
  return self->_listView;
}

- (void)setListView:(id)a3
{
}

- (TVHCollectionViewChangeSetDataSource)changeSetDataSource
{
  return self->_changeSetDataSource;
}

- (void)setChangeSetDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end