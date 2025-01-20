@interface TVHMusicMainViewController
+ (UIEdgeInsets)defaultMusicCategoryContentInset;
+ (UIEdgeInsets)defaultMusicCategoryWithHeaderContentInset;
+ (id)_makeDataSourceWithMediaLibrary:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (TVHCollectionViewDiffableDataSource)diffableDataSource;
- (TVHMusicMainDataSource)dataSource;
- (TVHMusicMainViewController)initWithMediaLibrary:(id)a3;
- (TVHMusicMainViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHPreviewingListViewController)listViewController;
- (id)_previewViewControllerForIndexPath:(id)a3 oldIndexPath:(id)a4 oldViewController:(id)a5;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_configureCell:(id)a3 withIdentifier:(id)a4;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)setDataSource:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setListViewController:(id)a3;
@end

@implementation TVHMusicMainViewController

- (TVHMusicMainViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHMusicMainViewController)initWithMediaLibrary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:",  4LL,  1LL));
  uint64_t v6 = TVHKCommonMediaEntityCollectionProperties([v5 setIdentifier:@"MusicGenresFetchRequestIdentifier"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setProperties:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption title](&OBJC_CLASS___TVHSortOption, "title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sortDescriptors]);

  [v5 setSortDescriptors:v9];
  v16 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHMusicMainViewController;
  v11 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v15,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v4,  v10,  0LL,  0LL,  0LL);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"NO_MUSIC_FOUND_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v11, "setNoContentErrorMessage:", v13);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v11, "setDelegate:", v11);
  }

  return v11;
}

+ (UIEdgeInsets)defaultMusicCategoryContentInset
{
  double v2 = 45.0;
  double v3 = 68.0;
  double v4 = 60.0;
  double v5 = 90.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (UIEdgeInsets)defaultMusicCategoryWithHeaderContentInset
{
  double v2 = 68.0;
  double v3 = 60.0;
  double v4 = 90.0;
  double v5 = 0.0;
  result.right = v4;
  result.bottom = v3;
  result.left = v2;
  result.top = v5;
  return result;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v22 = a3;
  id v10 = a4;
  id v21 = a5;
  id v20 = a6;
  v11 = objc_alloc_init(&OBJC_CLASS___TVHListViewLayout);
  -[TVHListViewLayout setItemSize:](v11, "setItemSize:", 436.0, 70.0);
  v12 = -[TVHPreviewingListViewController initWithListViewLayout:]( objc_alloc(&OBJC_CLASS___TVHPreviewingListViewController),  "initWithListViewLayout:",  v11);
  -[TVHMusicMainViewController setListViewController:](self, "setListViewController:", v12);
  -[TVHPreviewingListViewController setListViewMargin:](v12, "setListViewMargin:", 0.0, 90.0, 0.0, 0.0);
  -[TVHPreviewingListViewController setPreviewOnRightSide:](v12, "setPreviewOnRightSide:", 1LL);
  -[TVHPreviewingListViewController setPreviewViewRespectSafeAreaInsets:]( v12,  "setPreviewViewRespectSafeAreaInsets:",  1LL);
  -[TVHPreviewingListViewController setUpdatesListViewCellSelectedAppearance:]( v12,  "setUpdatesListViewCellSelectedAppearance:",  1LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController listView](v12, "listView"));
  objc_msgSend(v13, "setContentInset:", 45.0, 0.0, 60.0, 0.0);
  [v13 registerClass:objc_opt_class(TVHSimpleListViewCell) forCellWithReuseIdentifier:@"MusicCellIdentifier"];
  [v13 registerClass:objc_opt_class(TVHCatalogueListViewSectionHeaderView) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ListViewSectionHeaderViewIdentifier"];
  [v13 setDelegate:self];
  objc_initWeak(location, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000153B4;
  v27[3] = &unk_1000FCF20;
  objc_copyWeak(&v28, location);
  -[TVHPreviewingListViewController setAutoUpdatePreviewViewControllerBlock:]( v12,  "setAutoUpdatePreviewViewControllerBlock:",  v27);
  v14 = (void *)objc_opt_class(self);
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 _makeDataSourceWithMediaLibrary:v15]);

  -[TVHMusicMainViewController setDataSource:](self, "setDataSource:", v16);
  v17 = objc_alloc(&OBJC_CLASS___TVHCollectionViewDiffableDataSource);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100015444;
  v25[3] = &unk_1000FCF88;
  objc_copyWeak(&v26, location);
  v18 = -[TVHCollectionViewDiffableDataSource initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:]( v17,  "initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:",  v13,  v16,  &stru_1000FD210,  v25);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000154A8;
  v23[3] = &unk_1000FCFB0;
  objc_copyWeak(&v24, location);
  -[TVHCollectionViewDiffableDataSource setSupplementaryViewProvider:](v18, "setSupplementaryViewProvider:", v23);
  -[TVHMusicMainViewController setDiffableDataSource:](self, "setDiffableDataSource:", v18);
  -[TVHMusicMainViewController _updateWithFetchControllerResultSet:](self, "_updateWithFetchControllerResultSet:", v10);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(location);

  return v12;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicMainViewController listViewController](self, "listViewController"));
  [v11 collectionView:v10 willDisplayCell:v9 forItemAtIndexPath:v8];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicMainViewController listViewController](self, "listViewController"));
  [v11 collectionView:v10 didEndDisplayingCell:v9 forItemAtIndexPath:v8];
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicMainViewController listViewController](self, "listViewController"));
  [v11 collectionView:v10 didUpdateFocusInContext:v9 withAnimationCoordinator:v8];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainViewController dataSource](self, "dataSource", a3, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sectionTitleAIndex:a5]);

  if ([v7 length]) {
    double v8 = 102.0;
  }
  else {
    double v8 = 0.0;
  }

  double v9 = 0.0;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)_previewViewControllerForIndexPath:(id)a3 oldIndexPath:(id)a4 oldViewController:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___TVHMediaEntitiesFetchViewController);
  id v10 = v7;
  id v11 = v10;
  if (v9)
  {
    if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0) {
      v12 = v11;
    }
    else {
      v12 = 0LL;
    }
  }

  else
  {
    v12 = 0LL;
  }

  id v13 = v12;

  [v13 disableFetching];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainViewController dataSource](self, "dataSource"));
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 itemForIndexPath:v8]);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 mediaEntitiesFetchViewController]);
  [v16 enableFetching];

  return v16;
}

- (void)_configureCell:(id)a3 withIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainViewController dataSource](self, "dataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 itemForIdentifier:v6]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v11 titleLabel]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);
  [v9 setText:v10];
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicMainViewController dataSource](self, "dataSource"));
  [v5 updateWithMediaEntitiesFetchControllerResultSet:v4];
}

+ (id)_makeDataSourceWithMediaLibrary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v3 supportsGeniusMixes])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"GENIUS_MIXES_TITLE" value:0 table:0]);

    id v7 = objc_alloc(&OBJC_CLASS___TVHMusicMainItem);
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = sub_100015EE0;
    v67[3] = &unk_1000FD238;
    id v68 = v3;
    id v8 = -[TVHMusicMainItem initWithTitle:mediaEntitiesFetchViewControllerBlock:]( v7,  "initWithTitle:mediaEntitiesFetchViewControllerBlock:",  v6,  v67);
    -[NSMutableArray addObject:](v4, "addObject:", v8);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"PLAYLISTS_TITLE" value:0 table:0]);

  id v11 = objc_alloc(&OBJC_CLASS___TVHMusicMainItem);
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_100015F10;
  v65[3] = &unk_1000FD238;
  id v12 = v3;
  id v66 = v12;
  id v13 = -[TVHMusicMainItem initWithTitle:mediaEntitiesFetchViewControllerBlock:]( v11,  "initWithTitle:mediaEntitiesFetchViewControllerBlock:",  v10,  v65);
  -[NSMutableArray addObject:](v4, "addObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:@"ARTISTS_TITLE" value:0 table:0]);

  v16 = objc_alloc(&OBJC_CLASS___TVHMusicMainItem);
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_100015F40;
  v63[3] = &unk_1000FD238;
  id v17 = v12;
  id v64 = v17;
  v18 = -[TVHMusicMainItem initWithTitle:mediaEntitiesFetchViewControllerBlock:]( v16,  "initWithTitle:mediaEntitiesFetchViewControllerBlock:",  v15,  v63);

  -[NSMutableArray addObject:](v4, "addObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedStringForKey:@"MUSIC_ALBUMS_TITLE" value:0 table:0]);

  id v21 = objc_alloc(&OBJC_CLASS___TVHMusicMainItem);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_100015F70;
  v61[3] = &unk_1000FD238;
  id v22 = v17;
  id v62 = v22;
  v23 = -[TVHMusicMainItem initWithTitle:mediaEntitiesFetchViewControllerBlock:]( v21,  "initWithTitle:mediaEntitiesFetchViewControllerBlock:",  v20,  v61);

  -[NSMutableArray addObject:](v4, "addObject:", v23);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 localizedStringForKey:@"SONGS_TITLE" value:0 table:0]);

  id v26 = objc_alloc(&OBJC_CLASS___TVHMusicMainItem);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_100015FBC;
  v59[3] = &unk_1000FD238;
  id v27 = v22;
  id v60 = v27;
  id v28 = -[TVHMusicMainItem initWithTitle:mediaEntitiesFetchViewControllerBlock:]( v26,  "initWithTitle:mediaEntitiesFetchViewControllerBlock:",  v25,  v59);

  -[NSMutableArray addObject:](v4, "addObject:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 localizedStringForKey:@"MUSIC_VIDEOS_TITLE" value:0 table:0]);

  v31 = objc_alloc(&OBJC_CLASS___TVHMusicMainItem);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_100015FEC;
  v57[3] = &unk_1000FD238;
  id v32 = v27;
  id v58 = v32;
  v33 = -[TVHMusicMainItem initWithTitle:mediaEntitiesFetchViewControllerBlock:]( v31,  "initWithTitle:mediaEntitiesFetchViewControllerBlock:",  v30,  v57);

  -[NSMutableArray addObject:](v4, "addObject:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 localizedStringForKey:@"COMPOSERS_TITLE" value:0 table:0]);

  v36 = objc_alloc(&OBJC_CLASS___TVHMusicMainItem);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_10001601C;
  v55[3] = &unk_1000FD238;
  id v37 = v32;
  id v56 = v37;
  v38 = -[TVHMusicMainItem initWithTitle:mediaEntitiesFetchViewControllerBlock:]( v36,  "initWithTitle:mediaEntitiesFetchViewControllerBlock:",  v35,  v55);

  -[NSMutableArray addObject:](v4, "addObject:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 localizedStringForKey:@"COMPILATIONS_TITLE" value:0 table:0]);

  v41 = objc_alloc(&OBJC_CLASS___TVHMusicMainItem);
  v50 = _NSConcreteStackBlock;
  uint64_t v51 = 3221225472LL;
  v52 = sub_10001604C;
  v53 = &unk_1000FD238;
  id v54 = v37;
  id v42 = v37;
  v43 = -[TVHMusicMainItem initWithTitle:mediaEntitiesFetchViewControllerBlock:]( v41,  "initWithTitle:mediaEntitiesFetchViewControllerBlock:",  v40,  &v50);

  -[NSMutableArray addObject:](v4, "addObject:", v43, v50, v51, v52, v53);
  v44 = -[TVHMusicMainSection initWithItems:](objc_alloc(&OBJC_CLASS___TVHMusicMainSection), "initWithItems:", v4);
  v45 = -[TVHMusicMainGenresSection initWithMediaLibrary:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMusicMainGenresSection),  "initWithMediaLibrary:fetchRequestIdentifier:",  v42,  @"MusicGenresFetchRequestIdentifier");
  v46 = objc_alloc(&OBJC_CLASS___TVHMusicMainDataSource);
  v69[0] = v44;
  v69[1] = v45;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 2LL));
  v48 = -[TVHMusicMainDataSource initWithSections:](v46, "initWithSections:", v47);

  return v48;
}

- (TVHMusicMainDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (TVHPreviewingListViewController)listViewController
{
  return self->_listViewController;
}

- (void)setListViewController:(id)a3
{
}

- (TVHCollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end