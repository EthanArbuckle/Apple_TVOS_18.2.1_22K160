@interface TVHMusicSongsViewController
- (TVHMusicSongsListViewController)songsViewController;
- (TVHMusicSongsViewController)initWithMediaLibrary:(id)a3;
- (TVHMusicSongsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)musicSongsListViewController:(id)a3 currentSortDidChange:(id)a4;
- (void)setSongsViewController:(id)a3;
@end

@implementation TVHMusicSongsViewController

- (TVHMusicSongsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHMusicSongsViewController)initWithMediaLibrary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVHSortOption sortOptionWithSortMode:]( TVHSortOption,  "sortOptionWithSortMode:",  [v5 musicSongsSortMode]));

  id v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  1LL));
  uint64_t v9 = TVHKMusicMediaItemProperties([v8 setIdentifier:@"SongsFetchRequestIdentifier"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v8 setProperties:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntityType mediaItemMediaEntityTypeWithMediaItemType:mediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntityType,  "mediaItemMediaEntityTypeWithMediaItemType:mediaCategoryType:",  1LL,  1LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaEntityTypePredicateWithMediaEntityType:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaEntityTypePredicateWithMediaEntityType:",  v11));
  [v8 setPredicate:v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 sortDescriptors]);

  [v8 setSortDescriptors:v13];
  uint64_t v22 = TVHKMediaEntitiesFetchRequestOptionCalculateIndexBarItems;
  v23 = &__kCFBooleanTrue;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  [v8 setOptions:v14];

  v21 = v8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVHMusicSongsViewController;
  v16 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v20,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v4,  v15,  0LL,  0LL,  0LL);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"NO_SONGS_FOUND_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v16, "setNoContentErrorMessage:", v18);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v16, "setDelegate:", v16);
  }

  return v16;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchRequests](self, "fetchRequests"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption title](&OBJC_CLASS___TVHSortOption, "title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption artistTitle](&OBJC_CLASS___TVHSortOption, "artistTitle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption recentlyAdded](&OBJC_CLASS___TVHSortOption, "recentlyAdded"));
  v21[0] = v11;
  v21[1] = v12;
  v21[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVHSortOption sortOptionWithSortMode:]( TVHSortOption,  "sortOptionWithSortMode:",  [v15 musicSongsSortMode]));

  v17 = objc_alloc(&OBJC_CLASS___TVHMusicSongsListViewController);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v19 = -[TVHMusicSongsListViewController initWithMediaLibrary:fetchRequestIdentifier:sortOptions:initialSortOption:]( v17,  "initWithMediaLibrary:fetchRequestIdentifier:sortOptions:initialSortOption:",  v18,  v10,  v14,  v16);

  -[TVHMusicSongsListViewController setDelegate:](v19, "setDelegate:", self);
  -[TVHMusicSongsViewController setSongsViewController:](self, "setSongsViewController:", v19);
  -[TVHMusicSongsViewController _updateWithFetchControllerResultSet:](self, "_updateWithFetchControllerResultSet:", v7);

  return v19;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)musicSongsListViewController:(id)a3 currentSortDidChange:(id)a4
{
  id v4 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  id v5 = [v4 sortMode];

  [v6 setMusicSongsSortMode:v5];
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v6 = -[TVHMediaEntitiesDataSourceFetchResult initWithFetchControllerResultSet:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithFetchControllerResultSet:",  v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongsViewController songsViewController](self, "songsViewController"));
  [v5 updateWithMediaEntitiesDataSourceFetchResult:v6];
}

- (TVHMusicSongsListViewController)songsViewController
{
  return self->_songsViewController;
}

- (void)setSongsViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end