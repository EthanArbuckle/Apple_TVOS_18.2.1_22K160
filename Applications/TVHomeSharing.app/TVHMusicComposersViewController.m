@interface TVHMusicComposersViewController
- (TVHMusicComposersListViewController)listViewController;
- (TVHMusicComposersViewController)initWithMediaLibrary:(id)a3;
- (TVHMusicComposersViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)setListViewController:(id)a3;
@end

@implementation TVHMusicComposersViewController

- (TVHMusicComposersViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHMusicComposersViewController)initWithMediaLibrary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:",  3LL,  1LL));
  uint64_t v6 = TVHKCommonMediaEntityCollectionProperties([v5 setIdentifier:@"ComposersFetchRequestIdentifier"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setProperties:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
  v17 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));

  [v5 setSortDescriptors:v9];
  v16 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHMusicComposersViewController;
  v11 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v15,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v4,  v10,  0LL,  0LL,  0LL);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"NO_COMPOSERS_FOUND_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v11, "setNoContentErrorMessage:", v13);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v11, "setDelegate:", v11);
  }

  return v11;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchRequests](self, "fetchRequests"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);

  v11 = objc_alloc(&OBJC_CLASS___TVHMusicComposersListViewController);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v13 = -[TVHMusicComposersListViewController initWithMediaLibrary:fetchRequestIdentifier:]( v11,  "initWithMediaLibrary:fetchRequestIdentifier:",  v12,  v10);

  -[TVHMusicComposersViewController setListViewController:](self, "setListViewController:", v13);
  -[TVHMusicComposersViewController _updateWithFetchControllerResultSet:]( self,  "_updateWithFetchControllerResultSet:",  v7);

  return v13;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  uint64_t v6 = -[TVHMediaEntitiesDataSourceFetchResult initWithFetchControllerResultSet:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithFetchControllerResultSet:",  v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicComposersViewController listViewController](self, "listViewController"));
  [v5 updateWithMediaEntitiesDataSourceFetchResult:v6];
}

- (TVHMusicComposersListViewController)listViewController
{
  return self->_listViewController;
}

- (void)setListViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end