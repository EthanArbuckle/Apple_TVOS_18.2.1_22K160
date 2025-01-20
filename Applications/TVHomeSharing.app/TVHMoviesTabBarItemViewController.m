@interface TVHMoviesTabBarItemViewController
- (NSSet)mediaCategoryTypes;
- (TVHCatalogueViewController)catalogueViewController;
- (TVHMoviesDataStore)dataStore;
- (TVHMoviesTabBarItemViewController)initWithMediaLibrary:(id)a3;
- (TVHMoviesTabBarItemViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (unint64_t)selectedMediaCategoryType;
- (unint64_t)type;
- (void)_updateDataStoreWithFetchControllerResultSet:(id)a3;
- (void)catalogViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)catalogViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)setCatalogueViewController:(id)a3;
- (void)setDataStore:(id)a3;
@end

@implementation TVHMoviesTabBarItemViewController

- (TVHMoviesTabBarItemViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHMoviesTabBarItemViewController)initWithMediaLibrary:(id)a3
{
  id v4 = a3;
  v5 = -[TVHMoviesDataStore initWithMediaLibrary:mode:]( objc_alloc(&OBJC_CLASS___TVHMoviesDataStore),  "initWithMediaLibrary:mode:",  v4,  0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesDataStore fetchRequests](v5, "fetchRequests"));
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVHMoviesTabBarItemViewController;
  v7 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v11,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v4,  v6,  0LL,  0LL,  0LL);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataStore, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"NO_MOVIES_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v7, "setNoContentErrorMessage:", v9);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v7, "setDelegate:", v7);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v7,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
  }

  return v7;
}

- (unint64_t)type
{
  return 1LL;
}

- (NSSet)mediaCategoryTypes
{
  return +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", &off_1001060F0, &off_100106108, 0LL);
}

- (unint64_t)selectedMediaCategoryType
{
  return 3LL;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesTabBarItemViewController dataStore](self, "dataStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 catalogueDataSource]);

  v10 = objc_alloc(&OBJC_CLASS___TVHCatalogueViewController);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v12 = -[TVHCatalogueViewController initWithMediaLibrary:dataSource:](v10, "initWithMediaLibrary:dataSource:", v11, v9);

  -[TVHCatalogueViewController setDelegate:](v12, "setDelegate:", self);
  -[TVHMoviesTabBarItemViewController setCatalogueViewController:](self, "setCatalogueViewController:", v12);
  -[TVHMoviesTabBarItemViewController _updateDataStoreWithFetchControllerResultSet:]( self,  "_updateDataStoreWithFetchControllerResultSet:",  v7);

  return v12;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)catalogViewController:(id)a3 didSelectMediaEntity:(id)a4
{
  id v22 = a4;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVHKMediaEntityCollection);
  if ((objc_opt_isKindOfClass(v22, v5) & 1) != 0)
  {
    v6 = (TVHKMediaEntitiesFetchContext *)v22;
    id v7 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchControllerIdentifier](self, "fetchControllerIdentifier"));
    v9 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v7,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v8,  @"MoviePlaylistsFetchRequestIdentifier");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    objc_super v11 = (TVHMovieViewController *)objc_claimAutoreleasedReturnValue( +[TVHPlaylistViewControllerFactory playlistViewControllerWithPlaylist:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHPlaylistViewControllerFactory,  "playlistViewControllerWithPlaylist:mediaLibrary:playlistsFetchContext:playlistIt emMediaCategoryTypes:",  v6,  v10,  v9,  &off_100106CB0));
  }

  else
  {
    id v12 = v22;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 type]);
    id v14 = [v13 mediaCategoryType];

    if (v14 == (id)2)
    {
      v9 = @"MovieRentalsFetchRequestIdentifier";
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesTabBarItemViewController dataStore](self, "dataStore"));
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 movieRentalsInfoCenter]);
    }

    else
    {
      v9 = @"MoviesFetchRequestIdentifier";
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesTabBarItemViewController dataStore](self, "dataStore"));
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 moviesInfoCenter]);
    }

    v10 = (void *)v16;

    v17 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchControllerIdentifier](self, "fetchControllerIdentifier"));
    v6 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v17,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v18,  v9);

    v19 = objc_alloc(&OBJC_CLASS___TVHMovieViewController);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    objc_super v11 = -[TVHMovieViewController initWithMovie:mediaLibrary:moviesFetchContext:moviesInfoCenter:]( v19,  "initWithMovie:mediaLibrary:moviesFetchContext:moviesInfoCenter:",  v12,  v20,  v6,  v10);
  }

  if (v11)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesTabBarItemViewController navigationController](self, "navigationController"));
    [v21 pushViewController:v11 animated:1];
  }
}

- (void)catalogViewController:(id)a3 didPlayMediaEntity:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v9 = -[TVHPlayerPlaylist initWithHomeSharingMediaItem:mediaLibrary:]( v6,  "initWithHomeSharingMediaItem:mediaLibrary:",  v5,  v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesTabBarItemViewController tvh_playbackManager](self, "tvh_playbackManager"));
  [v8 playPlaylist:v9];
}

- (void)_updateDataStoreWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMoviesTabBarItemViewController dataStore](self, "dataStore"));
  [v5 updateWithMediaEntitiesFetchControllerResultSet:v4];
}

- (TVHMoviesDataStore)dataStore
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