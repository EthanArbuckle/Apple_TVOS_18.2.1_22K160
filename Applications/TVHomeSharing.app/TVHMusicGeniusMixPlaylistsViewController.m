@interface TVHMusicGeniusMixPlaylistsViewController
- (CGSize)cellSize;
- (TVHMediaEntitiesDataSource)dataSource;
- (TVHMediaEntitiesGridViewController)gridViewController;
- (TVHMusicGeniusMixPlaylistsViewController)initWithMediaLibrary:(id)a3;
- (TVHMusicGeniusMixPlaylistsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_playGeniusMix:(id)a3;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)setCellSize:(CGSize)a3;
- (void)setDataSource:(id)a3;
- (void)setGridViewController:(id)a3;
@end

@implementation TVHMusicGeniusMixPlaylistsViewController

- (TVHMusicGeniusMixPlaylistsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHMusicGeniusMixPlaylistsViewController)initWithMediaLibrary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest playlistsFetchRequestWithPlaylistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "playlistsFetchRequestWithPlaylistItemMediaCategoryTypes:",  &off_100106D28));
  [v5 setIdentifier:@"MusicGeniusMixPlaylistsFetchRequestIdentifier"];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_includeAnyPlaylistTypePredicate:]( &OBJC_CLASS___NSPredicate,  "tvhk_includeAnyPlaylistTypePredicate:",  &off_100106D40));
  uint64_t v7 = TVHKPlaylistProperties([v5 setPredicate:v6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 setProperties:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
  v21 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  [v5 setSortDescriptors:v10];

  v20 = v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVHMusicGeniusMixPlaylistsViewController;
  v12 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v19,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v4,  v11,  0LL,  0LL,  0LL);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    v14 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithFetchResultIdentifier:",  v13);
    dataSource = v12->_dataSource;
    v12->_dataSource = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"NO_GENIUS_MIXES_FOUND_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v12, "setNoContentErrorMessage:", v17);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v12, "setDelegate:", v12);
  }

  return v12;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicGeniusMixPlaylistsViewController dataSource](self, "dataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntitiesGridViewLayout mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:]( &OBJC_CLASS___TVHMediaEntitiesGridViewLayout,  "mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:",  0LL,  308.0,  308.0));
  v10 = -[TVHMediaEntitiesGridViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesGridViewController),  "initWithDataSource:layout:",  v8,  v9);
  -[TVHMusicGeniusMixPlaylistsViewController setGridViewController:](self, "setGridViewController:", v10);
  -[TVHMediaEntitiesGridViewController setDelegate:](v10, "setDelegate:", self);
  +[TVHMusicMainViewController defaultMusicCategoryWithHeaderContentInset]( &OBJC_CLASS___TVHMusicMainViewController,  "defaultMusicCategoryWithHeaderContentInset");
  -[TVHMediaEntitiesGridViewController setGridContentInset:](v10, "setGridContentInset:");
  -[TVHMusicGeniusMixPlaylistsViewController _updateWithFetchControllerResultSet:]( self,  "_updateWithFetchControllerResultSet:",  v7);

  return v10;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  +[TVHPosterLockupConfigurator configurePosterLockup:withMediaEntity:mediaLibrary:]( &OBJC_CLASS___TVHPosterLockupConfigurator,  "configurePosterLockup:withMediaEntity:mediaLibrary:",  v8,  v7,  v9);
}

- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4
{
}

- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4
{
}

- (void)_playGeniusMix:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest playlistItemsFetchRequestWithPlaylistIdentifier:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "playlistItemsFetchRequestWithPlaylistIdentifier:",  v6));
  uint64_t v8 = TVHKAllMediaItemProperties([v7 setIdentifier:@"MusicGeniusMixItemsFetchRequestIdentifier"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 setProperties:v9];
  uint64_t v16 = TVHKMediaEntitiesFetchRequestOptionGeniusMixMakeNewContext;
  v17 = &__kCFBooleanTrue;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  [v7 setOptions:v10];

  v11 = -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:]( objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController),  "initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:",  v5,  v7,  0LL,  1LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicGeniusMixPlaylistsViewController tvh_playbackManager](self, "tvh_playbackManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 interactivePlaylistPlayer]);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[TVHGeniusMixPlaybackMonitor sharedInstance]( &OBJC_CLASS___TVHGeniusMixPlaybackMonitor,  "sharedInstance"));
  [v14 startMonitoringPlaybackWithPlayer:v13 fetchRequest:v7 mediaLibrary:v5];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicGeniusMixPlaylistsViewController navigationController](self, "navigationController"));
  [v15 pushViewController:v11 animated:1];
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  v5 = -[TVHMediaEntitiesDataSourceFetchResult initWithFetchControllerResultSet:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithFetchControllerResultSet:",  v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicGeniusMixPlaylistsViewController gridViewController](self, "gridViewController"));
  uint64_t v8 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  [v6 updateWithMediaEntitiesDataSourceFetchResults:v7];
}

- (TVHMediaEntitiesDataSource)dataSource
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

- (CGSize)cellSize
{
  double width = self->_cellSize.width;
  double height = self->_cellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (void).cxx_destruct
{
}

@end