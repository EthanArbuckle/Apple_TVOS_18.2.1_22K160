@interface TVHMusicAlbumsViewController
- (TVHMediaEntitiesGridViewController)gridViewController;
- (TVHMusicAlbumsViewController)initWithMediaLibrary:(id)a3 albumsDataSource:(id)a4;
- (TVHMusicAlbumsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHMusicAlbumsViewControllerDataSource)dataSource;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_handlePlayButtonAction;
- (void)_handleShuffleButtonAction;
- (void)_playWithShuffle:(BOOL)a3;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 currentSortDidChange:(id)a4;
- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setGridViewController:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVHMusicAlbumsViewController

- (TVHMusicAlbumsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHMusicAlbumsViewController)initWithMediaLibrary:(id)a3 albumsDataSource:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 fetchRequest]);
  v15 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHMusicAlbumsViewController;
  v11 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v14,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v8,  v10,  0LL,  0LL,  0LL);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataSource, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMusicAlbumsViewControllerDataSource noContentFoundErrorMessage]( v11->_dataSource,  "noContentFoundErrorMessage"));
    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v11, "setNoContentErrorMessage:", v12);

    -[TVHMediaEntitiesFetchViewController setDelegate:](v11, "setDelegate:", v11);
  }

  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHMusicAlbumsViewController;
  -[TVHMediaEntitiesFetchViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumsViewController dataSource](self, "dataSource"));
  [v4 processPendingSortOption];
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumsViewController dataSource](self, "dataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaEntitiesDataSource]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntitiesGridViewLayout mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:]( &OBJC_CLASS___TVHMediaEntitiesGridViewLayout,  "mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:",  1LL,  273.0,  273.0));
  [v10 setMinimumInteritemSpacing:40.0];
  [v10 setMinimumLineSpacing:64.0];
  v11 = -[TVHMediaEntitiesGridViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesGridViewController),  "initWithDataSource:layout:",  v9,  v10);
  -[TVHMusicAlbumsViewController setGridViewController:](self, "setGridViewController:", v11);
  +[TVHMusicMainViewController defaultMusicCategoryWithHeaderContentInset]( &OBJC_CLASS___TVHMusicMainViewController,  "defaultMusicCategoryWithHeaderContentInset");
  -[TVHMediaEntitiesGridViewController setGridContentInset:](v11, "setGridContentInset:");
  -[TVHMediaEntitiesGridViewController setDelegate:](v11, "setDelegate:", self);
  if ([v8 showsPlaybackControls])
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButton playMusicButton](&OBJC_CLASS___TVHButton, "playMusicButton"));
    [v12 addTarget:self action:"_handlePlayButtonAction" forControlEvents:0x2000];
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButton shuffleButton](&OBJC_CLASS___TVHButton, "shuffleButton"));
    [v13 addTarget:self action:"_handleShuffleButtonAction" forControlEvents:0x2000];
    v18[0] = v12;
    v18[1] = v13;
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
  }

  else
  {
    objc_super v14 = 0LL;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 headerTitle]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 sortOptions]);
  -[TVHMediaEntitiesGridViewController setHeaderTitle:controls:andSortOptions:]( v11,  "setHeaderTitle:controls:andSortOptions:",  v15,  v14,  v16);

  -[TVHMusicAlbumsViewController _updateWithFetchControllerResultSet:](self, "_updateWithFetchControllerResultSet:", v7);
  return v11;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 artistTitle]);
  +[TVHPosterLockupConfigurator configurePosterLockup:withMediaEntity:mediaLibrary:subtitle:]( &OBJC_CLASS___TVHPosterLockupConfigurator,  "configurePosterLockup:withMediaEntity:mediaLibrary:subtitle:",  v8,  v7,  v10,  v9);
}

- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumsViewController dataSource](self, "dataSource"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fetchRequest]);
    id v15 = (id)objc_claimAutoreleasedReturnValue([v7 identifier]);

    id v8 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchControllerIdentifier](self, "fetchControllerIdentifier"));
    id v10 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v8,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v9,  v15);

    v11 = objc_alloc(&OBJC_CLASS___TVHMusicAlbumViewController);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    v13 = -[TVHMusicAlbumViewController initWithAlbum:mediaLibrary:albumsFetchContext:]( v11,  "initWithAlbum:mediaLibrary:albumsFetchContext:",  v5,  v12,  v10);

    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumsViewController navigationController](self, "navigationController"));
    [v14 pushViewController:v13 animated:1];
  }

- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  id v10 = -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:mediaCategoryType:mediaEntityCollectionType:mediaEntityCollectionIdentifier:]( v6,  "initWithMediaLibrary:mediaCategoryType:mediaEntityCollectionType:mediaEntityCollectionIdentifier:",  v7,  1LL,  1LL,  v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumsViewController navigationController](self, "navigationController"));
  [v9 pushViewController:v10 animated:1];
}

- (void)mediaEntitiesGridViewController:(id)a3 currentSortDidChange:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumsViewController dataSource](self, "dataSource"));
  [v6 sortOptionDidChange:v5];
}

- (void)_handlePlayButtonAction
{
}

- (void)_handleShuffleButtonAction
{
}

- (void)_playWithShuffle:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumsViewController dataSource](self, "dataSource"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntitiesDataSource]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v6 mediaEntities]);

  id v7 = objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v9 = -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:musicAlbums:shuffle:]( v7,  "initWithMediaLibrary:musicAlbums:shuffle:",  v8,  v11,  v3);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumsViewController navigationController](self, "navigationController"));
  [v10 pushViewController:v9 animated:1];
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = -[TVHMediaEntitiesDataSourceFetchResult initWithFetchControllerResultSet:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithFetchControllerResultSet:",  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumsViewController gridViewController](self, "gridViewController"));
  id v8 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  [v6 updateWithMediaEntitiesDataSourceFetchResults:v7];
}

- (TVHMusicAlbumsViewControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (TVHMediaEntitiesGridViewController)gridViewController
{
  return self->_gridViewController;
}

- (void)setGridViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end