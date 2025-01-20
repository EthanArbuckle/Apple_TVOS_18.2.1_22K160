@interface TVHPlaylistFolderViewController
- (NSArray)playlistItemMediaCategoryTypes;
- (TVHKMediaEntitiesFetchRequest)fetchRequest;
- (TVHMediaEntitiesGridViewController)gridViewController;
- (TVHPlaylistFolderViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHPlaylistFolderViewController)initWithPlaylistFolder:(id)a3 mediaLibrary:(id)a4 playlistsFetchContext:(id)a5 playlistItemMediaCategoryTypes:(id)a6;
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
- (void)setFetchRequest:(id)a3;
- (void)setGridViewController:(id)a3;
- (void)setPendingSortOption:(id)a3;
- (void)setPlaylistItemMediaCategoryTypes:(id)a3;
@end

@implementation TVHPlaylistFolderViewController

- (TVHPlaylistFolderViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHPlaylistFolderViewController)initWithPlaylistFolder:(id)a3 mediaLibrary:(id)a4 playlistsFetchContext:(id)a5 playlistItemMediaCategoryTypes:(id)a6
{
  id v10 = a3;
  id v30 = a6;
  id v11 = a5;
  id v31 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistFolderViewController _sortOptionFromSettings](self, "_sortOptionFromSettings"));
  id v13 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest playlistsFetchRequestWithPlaylistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "playlistsFetchRequestWithPlaylistItemMediaCategoryTypes:",  v30));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringRepresentation]);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"__PlaylistsFetchRequestIdentifierPrefix",  v16));

  [v14 setIdentifier:v17];
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_equalPredicateWithKeyPath:value:]( &OBJC_CLASS___NSPredicate,  "tvhk_equalPredicateWithKeyPath:value:",  @"parentPlaylistIdentifier",  v15));
  uint64_t v19 = TVHKPlaylistProperties([v14 setPredicate:v18]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v14 setProperties:v20];
  v21 = (void *)objc_claimAutoreleasedReturnValue([v12 sortDescriptors]);
  [v14 setSortDescriptors:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  [v22 addObserver:self forKeyPath:@"playlistsSortMode" options:0 context:off_100155AC8];
  v33 = v14;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___TVHPlaylistFolderViewController;
  v24 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v32,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v31,  v23,  0LL,  v13,  v11);

  if (v24)
  {
    objc_storeStrong((id *)&v24->_currentSortOption, v12);
    objc_storeStrong((id *)&v24->_fetchRequest, v14);
    v25 = (NSArray *)[v30 copy];
    playlistItemMediaCategoryTypes = v24->_playlistItemMediaCategoryTypes;
    v24->_playlistItemMediaCategoryTypes = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue( [v27 localizedStringForKey:@"NO_PLAYLISTS_FOUND_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v24, "setNoContentErrorMessage:", v28);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v24, "setDelegate:", v24);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v24,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
  }

  return v24;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"playlistsSortMode" context:off_100155AC8];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHPlaylistFolderViewController;
  -[TVHMediaEntitiesFetchViewController dealloc](&v4, "dealloc");
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a4;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController sourceMediaEntity](self, "sourceMediaEntity"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption playlistType](&OBJC_CLASS___TVHSortOption, "playlistType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption playlistTitle](&OBJC_CLASS___TVHSortOption, "playlistTitle"));
  v22[0] = v21;
  v22[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 requests]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);

  id v13 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistFolderViewController currentSortOption](self, "currentSortOption"));
  v15 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:initialSortOption:]( v13,  "initWithFetchResultIdentifier:initialSortOption:",  v12,  v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntitiesGridViewLayout mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:]( &OBJC_CLASS___TVHMediaEntitiesGridViewLayout,  "mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:",  0LL,  308.0,  308.0));
  v17 = -[TVHMediaEntitiesGridViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesGridViewController),  "initWithDataSource:layout:",  v15,  v16);
  -[TVHPlaylistFolderViewController setGridViewController:](self, "setGridViewController:", v17);
  -[TVHMediaEntitiesGridViewController setDelegate:](v17, "setDelegate:", self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tvh_displayTitle"));
  -[TVHMediaEntitiesGridViewController setHeaderTitle:controls:andSortOptions:]( v17,  "setHeaderTitle:controls:andSortOptions:",  v18,  0LL,  v9);

  -[TVHPlaylistFolderViewController _updateWithFetchControllerResultSet:]( self,  "_updateWithFetchControllerResultSet:",  v7);
  return v17;
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
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistFolderViewController fetchRequest](self, "fetchRequest"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  v14 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v6,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v7,  v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPlaylistFolderViewController playlistItemMediaCategoryTypes]( self,  "playlistItemMediaCategoryTypes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVHPlaylistViewControllerFactory playlistViewControllerWithPlaylist:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHPlaylistViewControllerFactory,  "playlistViewControllerWithPlaylist:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:",  v5,  v10,  v14,  v11));

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistFolderViewController navigationController](self, "navigationController"));
    [v13 pushViewController:v12 animated:1];
  }
}

- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4
{
  id v5 = a4;
  if ([v5 playlistType] != (id)1) {
    -[TVHPlaylistFolderViewController _playPlaylist:](self, "_playPlaylist:", v5);
  }
}

- (void)mediaEntitiesGridViewController:(id)a3 currentSortDidChange:(id)a4
{
  id v5 = a4;
  -[TVHPlaylistFolderViewController setCurrentSortOption:](self, "setCurrentSortOption:", v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  id v6 = [v5 sortMode];

  [v7 setPlaylistsSortMode:v6];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100155AC8 == a6)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHPlaylistFolderViewController _sortOptionFromSettings](self, "_sortOptionFromSettings", a3, a4, a5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistFolderViewController gridViewController](self, "gridViewController"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v7 currentSortOption]);

    if (v10 == v8) {
      id v9 = 0LL;
    }
    else {
      id v9 = v10;
    }
    -[TVHPlaylistFolderViewController setPendingSortOption:](self, "setPendingSortOption:", v9);
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___TVHPlaylistFolderViewController;
    -[TVHPlaylistFolderViewController observeValueForKeyPath:ofObject:change:context:]( &v11,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (id)_sortOptionFromSettings
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVHSortOption sortOptionWithSortMode:]( TVHSortOption,  "sortOptionWithSortMode:",  [v2 playlistsSortMode]));

  return v3;
}

- (void)_processPendingSortOption
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHPlaylistFolderViewController pendingSortOption](self, "pendingSortOption"));
  if (v4)
  {
    -[TVHPlaylistFolderViewController setPendingSortOption:](self, "setPendingSortOption:", 0LL);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistFolderViewController gridViewController](self, "gridViewController"));
    [v3 setCurrentSortOption:v4];
  }
}

- (void)_playPlaylist:(id)a3
{
  id v4 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest playlistItemsFetchRequestWithPlaylistIdentifier:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "playlistItemsFetchRequestWithPlaylistIdentifier:",  v5));
  uint64_t v7 = TVHKAllMediaItemProperties([v6 setIdentifier:@"__PlaylistItemsFetchRequestIdentifier"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v6 setProperties:v8];

  id v9 = -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:]( objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController),  "initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:",  v11,  v6,  0LL,  1LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistFolderViewController navigationController](self, "navigationController"));
  [v10 pushViewController:v9 animated:1];
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = -[TVHMediaEntitiesDataSourceFetchResult initWithFetchControllerResultSet:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithFetchControllerResultSet:",  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistFolderViewController gridViewController](self, "gridViewController"));
  id v8 = v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  [v6 updateWithMediaEntitiesDataSourceFetchResults:v7];
}

- (TVHKMediaEntitiesFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (TVHMediaEntitiesGridViewController)gridViewController
{
  return self->_gridViewController;
}

- (void)setGridViewController:(id)a3
{
}

- (NSArray)playlistItemMediaCategoryTypes
{
  return self->_playlistItemMediaCategoryTypes;
}

- (void)setPlaylistItemMediaCategoryTypes:(id)a3
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