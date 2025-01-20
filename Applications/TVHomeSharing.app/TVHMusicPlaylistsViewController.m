@interface TVHMusicPlaylistsViewController
- (TVHMediaEntitiesGridViewController)gridViewController;
- (TVHMusicPlaylistsViewController)initWithMediaLibrary:(id)a3;
- (TVHMusicPlaylistsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHSortOption)currentSortOption;
- (TVHSortOption)pendingSortOption;
- (id)_sortOptionFromSettings;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_playPlaylist:(id)a3;
- (void)_processPendingSortOption;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)dealloc;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 currentSortDidChange:(id)a4;
- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCurrentSortOption:(id)a3;
- (void)setGridViewController:(id)a3;
- (void)setPendingSortOption:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVHMusicPlaylistsViewController

- (TVHMusicPlaylistsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHMusicPlaylistsViewController)initWithMediaLibrary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicPlaylistsViewController _sortOptionFromSettings](self, "_sortOptionFromSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest playlistsFetchRequestWithPlaylistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "playlistsFetchRequestWithPlaylistItemMediaCategoryTypes:",  &off_100106B30));
  [v6 setIdentifier:@"MusicPlaylistsFetchRequestIdentifier"];
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_equalPredicateWithKeyPath:value:]( &OBJC_CLASS___NSPredicate,  "tvhk_equalPredicateWithKeyPath:value:",  @"parentPlaylistIdentifier",  0LL));
  -[NSMutableArray tvhk_addObjectIfNotNil:](v7, "tvhk_addObjectIfNotNil:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_excludeAllPlaylistTypePredicate:]( &OBJC_CLASS___NSPredicate,  "tvhk_excludeAllPlaylistTypePredicate:",  &off_100106B48));
  -[NSMutableArray tvhk_addObjectIfNotNil:](v7, "tvhk_addObjectIfNotNil:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_predicateWithSubpredicates:compoundPredicateType:]( &OBJC_CLASS___NSPredicate,  "tvhk_predicateWithSubpredicates:compoundPredicateType:",  v7,  1LL));
  uint64_t v11 = TVHKPlaylistProperties([v6 setPredicate:v10]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v6 setProperties:v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 sortDescriptors]);
  [v6 setSortDescriptors:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  [v14 addObserver:self forKeyPath:@"playlistsSortMode" options:0 context:off_100155E30];
  v21 = v6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVHMusicPlaylistsViewController;
  v16 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v20,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v4,  v15,  0LL,  0LL,  0LL);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_currentSortOption, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"NO_PLAYLISTS_FOUND_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v16, "setNoContentErrorMessage:", v18);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v16, "setDelegate:", v16);
  }

  return v16;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"playlistsSortMode" context:off_100155E30];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHMusicPlaylistsViewController;
  -[TVHMediaEntitiesFetchViewController dealloc](&v4, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHMusicPlaylistsViewController;
  -[TVHMediaEntitiesFetchViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[TVHMusicPlaylistsViewController _processPendingSortOption](self, "_processPendingSortOption");
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption playlistType](&OBJC_CLASS___TVHSortOption, "playlistType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption playlistTitle](&OBJC_CLASS___TVHSortOption, "playlistTitle"));
  v20[0] = v8;
  v20[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 requests]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);

  v14 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicPlaylistsViewController currentSortOption](self, "currentSortOption"));
  v16 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:initialSortOption:]( v14,  "initWithFetchResultIdentifier:initialSortOption:",  v13,  v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntitiesGridViewLayout mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:]( &OBJC_CLASS___TVHMediaEntitiesGridViewLayout,  "mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:",  0LL,  273.0,  273.0));
  [v17 setMinimumInteritemSpacing:40.0];
  [v17 setMinimumLineSpacing:64.0];
  v18 = -[TVHMediaEntitiesGridViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesGridViewController),  "initWithDataSource:layout:",  v16,  v17);
  -[TVHMusicPlaylistsViewController setGridViewController:](self, "setGridViewController:", v18);
  -[TVHMediaEntitiesGridViewController setDelegate:](v18, "setDelegate:", self);
  +[TVHMusicMainViewController defaultMusicCategoryWithHeaderContentInset]( &OBJC_CLASS___TVHMusicMainViewController,  "defaultMusicCategoryWithHeaderContentInset");
  -[TVHMediaEntitiesGridViewController setGridContentInset:](v18, "setGridContentInset:");
  -[TVHMediaEntitiesGridViewController setHeaderTitle:controls:andSortOptions:]( v18,  "setHeaderTitle:controls:andSortOptions:",  0LL,  0LL,  v10);
  -[TVHMusicPlaylistsViewController _updateWithFetchControllerResultSet:]( self,  "_updateWithFetchControllerResultSet:",  v7);

  return v18;
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
  id v5 = a4;
  v6 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchControllerIdentifier](self, "fetchControllerIdentifier"));
  uint64_t v11 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v6,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v7,  @"MusicPlaylistsFetchRequestIdentifier");

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVHPlaylistViewControllerFactory playlistViewControllerWithPlaylist:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHPlaylistViewControllerFactory,  "playlistViewControllerWithPlaylist:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:",  v5,  v8,  v11,  &off_100106B18));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicPlaylistsViewController navigationController](self, "navigationController"));
    [v10 pushViewController:v9 animated:1];
  }
}

- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4
{
  id v5 = a4;
  if ([v5 playlistType] != (id)1) {
    -[TVHMusicPlaylistsViewController _playPlaylist:](self, "_playPlaylist:", v5);
  }
}

- (void)mediaEntitiesGridViewController:(id)a3 currentSortDidChange:(id)a4
{
  id v5 = a4;
  -[TVHMusicPlaylistsViewController setCurrentSortOption:](self, "setCurrentSortOption:", v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  id v6 = [v5 sortMode];

  [v7 setPlaylistsSortMode:v6];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100155E30 == a6)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicPlaylistsViewController _sortOptionFromSettings](self, "_sortOptionFromSettings", a3, a4, a5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicPlaylistsViewController gridViewController](self, "gridViewController"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v7 currentSortOption]);

    if (v10 == v8) {
      id v9 = 0LL;
    }
    else {
      id v9 = v10;
    }
    -[TVHMusicPlaylistsViewController setPendingSortOption:](self, "setPendingSortOption:", v9);
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___TVHMusicPlaylistsViewController;
    -[TVHMusicPlaylistsViewController observeValueForKeyPath:ofObject:change:context:]( &v11,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (id)_sortOptionFromSettings
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVHSortOption sortOptionWithSortMode:]( TVHSortOption,  "sortOptionWithSortMode:",  [v2 playlistsSortMode]));

  return v3;
}

- (void)_processPendingSortOption
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicPlaylistsViewController pendingSortOption](self, "pendingSortOption"));
  if (v4)
  {
    -[TVHMusicPlaylistsViewController setPendingSortOption:](self, "setPendingSortOption:", 0LL);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicPlaylistsViewController gridViewController](self, "gridViewController"));
    [v3 setCurrentSortOption:v4];
  }
}

- (void)_playPlaylist:(id)a3
{
  id v4 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest playlistItemsFetchRequestWithPlaylistIdentifier:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "playlistItemsFetchRequestWithPlaylistIdentifier:",  v5));
  uint64_t v7 = TVHKAllMediaItemProperties([v6 setIdentifier:@"MusicPlaylistItemsFetchRequestIdentifier"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v6 setProperties:v8];

  id v9 = -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:]( objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController),  "initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:",  v11,  v6,  0LL,  1LL);
  if (v4)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicPlaylistsViewController navigationController](self, "navigationController"));
    [v10 pushViewController:v9 animated:1];
  }
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = -[TVHMediaEntitiesDataSourceFetchResult initWithFetchControllerResultSet:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithFetchControllerResultSet:",  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicPlaylistsViewController gridViewController](self, "gridViewController"));
  id v8 = v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
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

- (TVHSortOption)pendingSortOption
{
  return self->_pendingSortOption;
}

- (void)setPendingSortOption:(id)a3
{
}

- (void).cxx_destruct
{
}

@end