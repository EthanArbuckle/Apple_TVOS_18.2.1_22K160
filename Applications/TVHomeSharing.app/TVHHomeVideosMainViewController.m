@interface TVHHomeVideosMainViewController
- (TVHCatalogueViewController)catalogueViewController;
- (TVHHomeVideosDataStore)dataStore;
- (TVHHomeVideosMainViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHHomeVideosMainViewController)initWithMediaLibrary:(id)a3 showingInTabBar:(BOOL)a4;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_playHomeVideo:(id)a3;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)catalogViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)catalogViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)setCatalogueViewController:(id)a3;
- (void)setDataStore:(id)a3;
@end

@implementation TVHHomeVideosMainViewController

- (TVHHomeVideosMainViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHHomeVideosMainViewController)initWithMediaLibrary:(id)a3 showingInTabBar:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___TVHHomeVideosDataStore);
  if (!v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"HOME_VIDEOS_TITLE" value:0 table:0]);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHHomeVideosDataStore catalogueDataSource](v7, "catalogueDataSource"));
    [v10 setHeaderTitle:v9];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHHomeVideosDataStore fetchRequests](v7, "fetchRequests"));
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVHHomeVideosMainViewController;
  v12 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v16,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v6,  v11,  0LL,  0LL,  0LL);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataStore, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"NO_HOME_VIDEOS_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v12, "setNoContentErrorMessage:", v14);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v12, "setDelegate:", v12);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v12,  "setEnableFetchingWhenViewFirstAppears:",  !v4);
  }

  return v12;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a4;
  v8 = objc_alloc(&OBJC_CLASS___TVHCatalogueViewController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHHomeVideosMainViewController dataStore](self, "dataStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 catalogueDataSource]);
  v12 = -[TVHCatalogueViewController initWithMediaLibrary:dataSource:](v8, "initWithMediaLibrary:dataSource:", v9, v11);

  -[TVHCatalogueViewController setDelegate:](v12, "setDelegate:", self);
  -[TVHHomeVideosMainViewController setCatalogueViewController:](self, "setCatalogueViewController:", v12);
  -[TVHHomeVideosMainViewController _updateWithFetchControllerResultSet:]( self,  "_updateWithFetchControllerResultSet:",  v7);

  return v12;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)catalogViewController:(id)a3 didSelectMediaEntity:(id)a4
{
  id v14 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v14 type]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType playlist](&OBJC_CLASS___TVHKMediaEntityType, "playlist"));

  if (v5 == v6)
  {
    id v7 = v14;
    v8 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchControllerIdentifier](self, "fetchControllerIdentifier"));
    v10 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v8,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v9,  @"HomeVideoPlaylistsFetchRequestIdentifier");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVHPlaylistViewControllerFactory playlistViewControllerWithPlaylist:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHPlaylistViewControllerFactory,  "playlistViewControllerWithPlaylist:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:",  v7,  v11,  v10,  &off_100106C80));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHHomeVideosMainViewController navigationController](self, "navigationController"));
    [v13 pushViewController:v12 animated:1];
  }

  else
  {
    -[TVHHomeVideosMainViewController _playHomeVideo:](self, "_playHomeVideo:", v14);
  }
}

- (void)catalogViewController:(id)a3 didPlayMediaEntity:(id)a4
{
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHHomeVideosMainViewController catalogueViewController](self, "catalogueViewController"));
  [v5 updateWithMediaEntitiesFetchControllerResultSet:v4];
}

- (void)_playHomeVideo:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v8 = -[TVHPlayerPlaylist initWithHomeSharingMediaItem:mediaLibrary:]( v5,  "initWithHomeSharingMediaItem:mediaLibrary:",  v4,  v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHHomeVideosMainViewController tvh_playbackManager](self, "tvh_playbackManager"));
  [v7 playPlaylist:v8];
}

- (TVHHomeVideosDataStore)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
}

- (TVHCatalogueViewController)catalogueViewController
{
  return self->_catalogueViewController;
}

- (void)setCatalogueViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end