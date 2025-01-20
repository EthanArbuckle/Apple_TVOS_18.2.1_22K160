@interface TVHITunesUMainViewController
- (TVHCatalogueViewController)catalogueViewController;
- (TVHITunesUDataStore)dataStore;
- (TVHITunesUMainViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHITunesUMainViewController)initWithMediaLibrary:(id)a3 showingInTabBar:(BOOL)a4;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_updateCatalogueWithFetchControllerResult:(id)a3;
- (void)catalogViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)setCatalogueViewController:(id)a3;
- (void)setDataStore:(id)a3;
@end

@implementation TVHITunesUMainViewController

- (TVHITunesUMainViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHITunesUMainViewController)initWithMediaLibrary:(id)a3 showingInTabBar:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___TVHITunesUDataStore);
  if (!v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"ITUNES_U_TITLE" value:0 table:0]);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHITunesUDataStore catalogueDataSource](v7, "catalogueDataSource"));
    [v10 setHeaderTitle:v9];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHITunesUDataStore fetchRequests](v7, "fetchRequests"));
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVHITunesUMainViewController;
  v12 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v16,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v6,  v11,  0LL,  0LL,  0LL);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataStore, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"NO_ITUNES_U_COURSES_FOUND_ERROR_MESSAGE" value:0 table:0]);

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
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHITunesUMainViewController dataStore](self, "dataStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 catalogueDataSource]);
  v12 = -[TVHCatalogueViewController initWithMediaLibrary:dataSource:](v8, "initWithMediaLibrary:dataSource:", v9, v11);

  -[TVHCatalogueViewController setDelegate:](v12, "setDelegate:", self);
  -[TVHITunesUMainViewController setCatalogueViewController:](self, "setCatalogueViewController:", v12);
  -[TVHITunesUMainViewController _updateCatalogueWithFetchControllerResult:]( self,  "_updateCatalogueWithFetchControllerResult:",  v7);

  return v12;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)catalogViewController:(id)a3 didSelectMediaEntity:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 type]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType playlist](&OBJC_CLASS___TVHKMediaEntityType, "playlist"));

  id v16 = v5;
  v8 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchControllerIdentifier](self, "fetchControllerIdentifier"));
  if (v6 == v7)
  {
    v10 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v8,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v9,  @"ITunesUPlaylistsFetchRequestIdentifier");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    v13 = (TVHITunesUCourseViewController *)objc_claimAutoreleasedReturnValue( +[TVHPlaylistViewControllerFactory playlistViewControllerWithPlaylist:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHPlaylistViewControllerFactory,  "playlistViewControllerWithPlaylist:mediaLibrary:playlistsFetchContext:pl aylistItemMediaCategoryTypes:",  v16,  v12,  v10,  &off_100106DA0));
  }

  else
  {
    v10 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v8,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v9,  @"ITunesUCoursesFetchRequestIdentifier");

    v11 = objc_alloc(&OBJC_CLASS___TVHITunesUCourseViewController);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    v13 = -[TVHITunesUCourseViewController initWithCourse:mediaLibrary:coursesFetchContext:]( v11,  "initWithCourse:mediaLibrary:coursesFetchContext:",  v16,  v12,  v10);
  }

  v14 = v13;

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHITunesUMainViewController navigationController](self, "navigationController"));
    [v15 pushViewController:v14 animated:1];
  }
}

- (void)_updateCatalogueWithFetchControllerResult:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHITunesUMainViewController catalogueViewController](self, "catalogueViewController"));
  [v5 updateWithMediaEntitiesFetchControllerResultSet:v4];
}

- (TVHITunesUDataStore)dataStore
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