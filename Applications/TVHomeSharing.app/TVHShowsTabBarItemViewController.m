@interface TVHShowsTabBarItemViewController
- (NSSet)mediaCategoryTypes;
- (TVHCatalogueViewController)catalogueViewController;
- (TVHShowsDataStore)dataStore;
- (TVHShowsTabBarItemViewController)initWithMediaLibrary:(id)a3;
- (TVHShowsTabBarItemViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (unint64_t)selectedMediaCategoryType;
- (unint64_t)type;
- (void)_updateDataStoreWithFetchControllerResultSet:(id)a3;
- (void)catalogViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)setCatalogueViewController:(id)a3;
@end

@implementation TVHShowsTabBarItemViewController

- (TVHShowsTabBarItemViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHShowsTabBarItemViewController)initWithMediaLibrary:(id)a3
{
  id v4 = a3;
  v5 = -[TVHShowsDataStore initWithMediaLibrary:mode:]( objc_alloc(&OBJC_CLASS___TVHShowsDataStore),  "initWithMediaLibrary:mode:",  v4,  0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowsDataStore fetchRequests](v5, "fetchRequests"));
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVHShowsTabBarItemViewController;
  v7 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v11,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v4,  v6,  0LL,  0LL,  0LL);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataStore, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"NO_SHOWS_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v7, "setNoContentErrorMessage:", v9);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v7, "setDelegate:", v7);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v7,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
  }

  return v7;
}

- (unint64_t)type
{
  return 3LL;
}

- (NSSet)mediaCategoryTypes
{
  return +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", &off_100105EC8, 0LL);
}

- (unint64_t)selectedMediaCategoryType
{
  return 4LL;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowsTabBarItemViewController dataStore](self, "dataStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 catalogueDataSource]);

  v10 = objc_alloc(&OBJC_CLASS___TVHCatalogueViewController);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v12 = -[TVHCatalogueViewController initWithMediaLibrary:dataSource:](v10, "initWithMediaLibrary:dataSource:", v11, v9);

  -[TVHCatalogueViewController setDelegate:](v12, "setDelegate:", self);
  -[TVHShowsTabBarItemViewController setCatalogueViewController:](self, "setCatalogueViewController:", v12);
  -[TVHShowsTabBarItemViewController _updateDataStoreWithFetchControllerResultSet:]( self,  "_updateDataStoreWithFetchControllerResultSet:",  v7);

  return v12;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)catalogViewController:(id)a3 didSelectMediaEntity:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 type]);
  id v7 = [v6 mediaEntityCollectionType];

  id v17 = v5;
  v8 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchControllerIdentifier](self, "fetchControllerIdentifier"));
  if (v7 == (id)5)
  {
    v10 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v8,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v9,  @"ShowPlaylistsFetchRequestIdentifier");

    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    v12 = (TVHShowSeasonViewController *)objc_claimAutoreleasedReturnValue( +[TVHPlaylistViewControllerFactory playlistViewControllerWithPlaylist:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHPlaylistViewControllerFactory,  "playlistViewControllerWithPlaylist:mediaLibrary:playlistsFetchContext:playl istItemMediaCategoryTypes:",  v17,  v11,  v10,  &off_100106AD0));
    v13 = v17;
  }

  else
  {
    v10 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v8,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v9,  @"ShowsFetchRequestIdentifier");

    v14 = objc_alloc(&OBJC_CLASS___TVHShowSeasonViewController);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowsTabBarItemViewController dataStore](self, "dataStore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 showsInfoCenter]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v17 selectedSeasonIdentifier]);
    v12 = -[TVHShowSeasonViewController initWithShow:showsFetchContext:showsInfoCenter:seasonIdentifier:]( v14,  "initWithShow:showsFetchContext:showsInfoCenter:seasonIdentifier:",  v17,  v10,  v13,  v15);
  }

  if (v12)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowsTabBarItemViewController navigationController](self, "navigationController"));
    [v16 pushViewController:v12 animated:1];
  }
}

- (void)_updateDataStoreWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHShowsTabBarItemViewController dataStore](self, "dataStore"));
  [v5 updateWithMediaEntitiesFetchControllerResultSet:v4];
}

- (TVHShowsDataStore)dataStore
{
  return self->_dataStore;
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