@interface TVHPhotosMainViewController
+ (id)_photoPlaylistsFetchResponseFromResultsSet:(id)a3;
- (BOOL)mediaEntitiesFetchViewController:(id)a3 shouldShowContentViewControllerWithFetchControllerResultSet:(id)a4;
- (TVHPhotosMainListViewController)listViewController;
- (TVHPhotosMainListViewDataSource)dataSource;
- (TVHPhotosMainViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHPhotosMainViewController)initWithMediaLibrary:(id)a3 showingInTabBar:(BOOL)a4;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)setDataSource:(id)a3;
- (void)setListViewController:(id)a3;
@end

@implementation TVHPhotosMainViewController

- (TVHPhotosMainViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHPhotosMainViewController)initWithMediaLibrary:(id)a3 showingInTabBar:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    v7 = 0LL;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"PHOTOS_TITLE" value:0 table:0]);
  }

  v9 = -[TVHPhotosMainListViewDataSource initWithTitle:]( objc_alloc(&OBJC_CLASS___TVHPhotosMainListViewDataSource),  "initWithTitle:",  v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainListViewDataSource fetchRequest](v9, "fetchRequest"));
  v17 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVHPhotosMainViewController;
  v12 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v16,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v6,  v11,  0LL,  0LL,  0LL);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:@"NO_PHOTOS_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v12, "setNoContentErrorMessage:", v14);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v12, "setDelegate:", v12);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v12,  "setEnableFetchingWhenViewFirstAppears:",  !v4);
  }

  return v12;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a4;
  v8 = objc_alloc(&OBJC_CLASS___TVHPhotosMainListViewController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainViewController dataSource](self, "dataSource"));
  v11 = -[TVHPhotosMainListViewController initWithMediaLibrary:dataSource:]( v8,  "initWithMediaLibrary:dataSource:",  v9,  v10);

  -[TVHPhotosMainViewController setListViewController:](self, "setListViewController:", v11);
  -[TVHPhotosMainViewController _updateWithFetchControllerResultSet:](self, "_updateWithFetchControllerResultSet:", v7);

  return v11;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (BOOL)mediaEntitiesFetchViewController:(id)a3 shouldShowContentViewControllerWithFetchControllerResultSet:(id)a4
{
  id v5 = a4;
  id v6 = [(id)objc_opt_class(self) _photoPlaylistsFetchResponseFromResultsSet:v5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (!v7)
  {
    id v8 = sub_10007A1C8();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "No photo playlists response received. Will show the no-content error message.",  v11,  2u);
    }
  }

  return v7 != 0LL;
}

+ (id)_photoPlaylistsFetchResponseFromResultsSet:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 results]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 response]);

  return v5;
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) _photoPlaylistsFetchResponseFromResultsSet:v4];
  id v7 = (id)objc_claimAutoreleasedReturnValue(v5);

  if (v7)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainViewController listViewController](self, "listViewController"));
    [v6 updateWithPhotoPlaylistsFetchResponse:v7];
  }
}

- (TVHPhotosMainListViewController)listViewController
{
  return self->_listViewController;
}

- (void)setListViewController:(id)a3
{
}

- (TVHPhotosMainListViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end