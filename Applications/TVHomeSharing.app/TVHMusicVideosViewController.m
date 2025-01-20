@interface TVHMusicVideosViewController
- (TVHMediaEntitiesGridViewController)gridViewController;
- (TVHMusicVideosViewController)initWithMediaLibrary:(id)a3;
- (TVHMusicVideosViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHSortOption)currentSortOption;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_handlePlayAllButtonAction;
- (void)_handleShuffleAllButtonAction;
- (void)_playAllWithShuffle:(BOOL)a3;
- (void)_playMusicVideo:(id)a3;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 currentSortDidChange:(id)a4;
- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)setCurrentSortOption:(id)a3;
- (void)setGridViewController:(id)a3;
@end

@implementation TVHMusicVideosViewController

- (TVHMusicVideosViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHMusicVideosViewController)initWithMediaLibrary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVHSortOption sortOptionWithSortMode:]( TVHSortOption,  "sortOptionWithSortMode:",  [v5 musicVideosSortMode]));

  id v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  1LL));
  uint64_t v9 = TVHKMusicMediaItemProperties([v8 setIdentifier:@"MusicVideosFetchRequestIdentifier"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v8 setProperties:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntityType mediaItemMediaEntityTypeWithMediaItemType:mediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntityType,  "mediaItemMediaEntityTypeWithMediaItemType:mediaCategoryType:",  2LL,  1LL));
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
  v20.super_class = (Class)&OBJC_CLASS___TVHMusicVideosViewController;
  v16 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v20,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v4,  v15,  0LL,  0LL,  0LL);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_currentSortOption, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"NO_MUSIC_VIDEOS_FOUND_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v16, "setNoContentErrorMessage:", v18);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v16, "setDelegate:", v16);
  }

  return v16;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a4;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption title](&OBJC_CLASS___TVHSortOption, "title"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption artistTitle](&OBJC_CLASS___TVHSortOption, "artistTitle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption recentlyAdded](&OBJC_CLASS___TVHSortOption, "recentlyAdded"));
  v25[0] = v23;
  v25[1] = v22;
  v25[2] = v21;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 3LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 requests]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);

  v12 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicVideosViewController currentSortOption](self, "currentSortOption"));
  v14 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:initialSortOption:]( v12,  "initWithFetchResultIdentifier:initialSortOption:",  v11,  v13);

  -[TVHMediaEntitiesDataSource setProvideIndexTitles:](v14, "setProvideIndexTitles:", 1LL);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntitiesGridViewLayout mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:]( &OBJC_CLASS___TVHMediaEntitiesGridViewLayout,  "mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:",  1LL,  376.0,  211.0));
  [v15 setMinimumInteritemSpacing:40.0];
  [v15 setMinimumLineSpacing:52.0];
  v16 = -[TVHMediaEntitiesGridViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesGridViewController),  "initWithDataSource:layout:",  v14,  v15);
  -[TVHMusicVideosViewController setGridViewController:](self, "setGridViewController:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButton playMusicButton](&OBJC_CLASS___TVHButton, "playMusicButton"));
  [v17 addTarget:self action:"_handlePlayAllButtonAction" forControlEvents:0x2000];
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButton shuffleButton](&OBJC_CLASS___TVHButton, "shuffleButton"));
  [v18 addTarget:self action:"_handleShuffleAllButtonAction" forControlEvents:0x2000];
  v24[0] = v17;
  v24[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
  -[TVHMediaEntitiesGridViewController setHeaderTitle:controls:andSortOptions:]( v16,  "setHeaderTitle:controls:andSortOptions:",  0LL,  v19,  v8);
  +[TVHMusicMainViewController defaultMusicCategoryWithHeaderContentInset]( &OBJC_CLASS___TVHMusicMainViewController,  "defaultMusicCategoryWithHeaderContentInset");
  -[TVHMediaEntitiesGridViewController setGridContentInset:](v16, "setGridContentInset:");
  -[TVHMediaEntitiesGridViewController setDelegate:](v16, "setDelegate:", self);
  -[TVHMusicVideosViewController _updateWithFetchControllerResultSet:](self, "_updateWithFetchControllerResultSet:", v7);

  return v16;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5
{
  id v13 = a5;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v13 artistTitle]);
  uint64_t v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v13 albumArtistTitle]);
  }
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  +[TVHPosterLockupConfigurator configurePosterLockup:withMediaEntity:mediaLibrary:subtitle:]( &OBJC_CLASS___TVHPosterLockupConfigurator,  "configurePosterLockup:withMediaEntity:mediaLibrary:subtitle:",  v7,  v13,  v12,  v11);
}

- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4
{
}

- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4
{
}

- (void)mediaEntitiesGridViewController:(id)a3 currentSortDidChange:(id)a4
{
  id v5 = a4;
  -[TVHMusicVideosViewController setCurrentSortOption:](self, "setCurrentSortOption:", v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  id v6 = [v5 sortMode];

  [v7 setMusicVideosSortMode:v6];
}

- (void)_playMusicVideo:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v8 = -[TVHPlayerPlaylist initWithHomeSharingMediaItem:mediaLibrary:]( v5,  "initWithHomeSharingMediaItem:mediaLibrary:",  v4,  v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicVideosViewController tvh_playbackManager](self, "tvh_playbackManager"));
  [v7 playPlaylist:v8];
}

- (void)_handlePlayAllButtonAction
{
}

- (void)_handleShuffleAllButtonAction
{
}

- (void)_playAllWithShuffle:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicVideosViewController gridViewController](self, "gridViewController"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v5 mediaEntities]);

  if (v3) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  id v7 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  uint64_t v9 = -[TVHPlayerPlaylist initWithHomeSharingMediaItems:mediaLibrary:index:options:]( v7,  "initWithHomeSharingMediaItems:mediaLibrary:index:options:",  v11,  v8,  0LL,  v6);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicVideosViewController tvh_playbackManager](self, "tvh_playbackManager"));
  [v10 playPlaylist:v9];
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = -[TVHMediaEntitiesDataSourceFetchResult initWithFetchControllerResultSet:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithFetchControllerResultSet:",  v4);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicVideosViewController gridViewController](self, "gridViewController"));
  v8 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  [v6 updateWithMediaEntitiesDataSourceFetchResults:v7];
}

- (TVHMediaEntitiesGridViewController)gridViewController
{
  return self->_gridViewController;
}

- (void)setGridViewController:(id)a3
{
}

- (TVHSortOption)currentSortOption
{
  return self->_currentSortOption;
}

- (void)setCurrentSortOption:(id)a3
{
}

- (void).cxx_destruct
{
}

@end