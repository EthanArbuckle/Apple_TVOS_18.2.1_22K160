@interface TVHMusicAlbumArtistViewController
- (TVHMediaEntitiesDataSource)dataSource;
- (TVHMediaEntitiesGridViewController)gridViewController;
- (TVHMusicAlbumArtistViewController)initWithAlbumArtist:(id)a3 mediaLibrary:(id)a4 albumArtistsFetchContext:(id)a5;
- (TVHMusicAlbumArtistViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHSortOption)currentSortOption;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_handlePlayButtonAction;
- (void)_handleShuffleButtonAction;
- (void)_playWithShuffle:(BOOL)a3;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 currentSortDidChange:(id)a4;
- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)setCurrentSortOption:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setGridViewController:(id)a3;
@end

@implementation TVHMusicAlbumArtistViewController

- (TVHMusicAlbumArtistViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHMusicAlbumArtistViewController)initWithAlbumArtist:(id)a3 mediaLibrary:(id)a4 albumArtistsFetchContext:(id)a5
{
  id v38 = a5;
  id v36 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVHSortOption sortOptionWithSortMode:]( TVHSortOption,  "sortOptionWithSortMode:",  [v8 musicArtistAlbumsSortMode]));

  v34 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id obj = v9;
  id v11 = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:",  1LL,  1LL));
  uint64_t v13 = TVHKMusicAlbumProperties([v12 setIdentifier:@"AlbumsFetchRequestIdentifier"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v12 setProperties:v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaEntityCollectionArtistIdentifierPredicateWithIdentifier:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaEntityCollectionArtistIdentifierPredicateWithIdentifier:",  v10));
  [v12 setPredicate:v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 sortDescriptors]);

  [v12 setSortDescriptors:v16];
  v33 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v17 = v11;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  1LL));
  uint64_t v19 = TVHKMusicMediaItemProperties([v18 setIdentifier:@"MusicVideosFetchRequestIdentifier"]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v18 setProperties:v20];
  v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntityType mediaItemMediaEntityTypeWithMediaItemType:mediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntityType,  "mediaItemMediaEntityTypeWithMediaItemType:mediaCategoryType:",  2LL,  1LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaEntityTypePredicateWithMediaEntityType:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaEntityTypePredicateWithMediaEntityType:",  v22));
  -[NSMutableArray addObject:](v21, "addObject:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaItemAlbumArtistIdentifierPredicateWithIdentifier:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaItemAlbumArtistIdentifierPredicateWithIdentifier:",  v33));
  -[NSMutableArray addObject:](v21, "addObject:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_predicateWithSubpredicates:compoundPredicateType:]( &OBJC_CLASS___NSPredicate,  "tvhk_predicateWithSubpredicates:compoundPredicateType:",  v21,  1LL));
  [v18 setPredicate:v25];
  v26 = (void *)objc_claimAutoreleasedReturnValue([v17 sortDescriptors]);
  v35 = v17;

  [v18 setSortDescriptors:v26];
  v40[0] = v12;
  v40[1] = v18;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 2LL));
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___TVHMusicAlbumArtistViewController;
  v28 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v39,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v36,  v27,  0LL,  v34,  v38);

  if (v28)
  {
    objc_storeStrong((id *)&v28->_currentSortOption, obj);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue( [v29 localizedStringForKey:@"NO_MUSIC_ALBUM_ARTIST_FOUND_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v28, "setNoContentErrorMessage:", v30);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v28, "setDelegate:", v28);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v28,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
  }

  return v28;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v35 = a4;
  objc_super v39 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption title](&OBJC_CLASS___TVHSortOption, "title"));
  id v38 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption recentlyAdded](&OBJC_CLASS___TVHSortOption, "recentlyAdded"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption newestReleaseYearFirst](&OBJC_CLASS___TVHSortOption, "newestReleaseYearFirst"));
  id v36 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption oldestReleaseYearFirst](&OBJC_CLASS___TVHSortOption, "oldestReleaseYearFirst"));
  v48[0] = v39;
  v48[1] = v38;
  v48[2] = v37;
  v48[3] = v36;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 4LL));
  id v7 = -[TVHMediaEntitiesDataSourceItemCollectionDescriptor initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceItemCollectionDescriptor),  "initWithFetchResultIdentifier:",  @"AlbumsFetchRequestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"MUSIC_ALBUMS_TITLE" value:0 table:0]);

  v32 = v7;
  -[TVHMediaEntitiesDataSourceItemCollectionDescriptor setTitle:](v7, "setTitle:", v34);
  v30 = -[TVHMediaEntitiesDataSourceItemCollectionDescriptor initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceItemCollectionDescriptor),  "initWithFetchResultIdentifier:",  @"MusicVideosFetchRequestIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"MUSIC_VIDEOS_TITLE" value:0 table:0]);

  -[TVHMediaEntitiesDataSourceItemCollectionDescriptor setTitle:](v30, "setTitle:", v31);
  v10 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource);
  v47[0] = v7;
  v47[1] = v30;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumArtistViewController currentSortOption](self, "currentSortOption"));
  uint64_t v13 = -[TVHMediaEntitiesDataSource initWithItemCollectionDescriptors:initialSortOption:]( v10,  "initWithItemCollectionDescriptors:initialSortOption:",  v11,  v12);

  v27 = v13;
  -[TVHMusicAlbumArtistViewController setDataSource:](self, "setDataSource:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicAlbum](&OBJC_CLASS___TVHKMediaEntityType, "musicAlbum"));
  v45[0] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", 308.0, 308.0));
  v46[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicVideo](&OBJC_CLASS___TVHKMediaEntityType, "musicVideo"));
  v45[1] = v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", 550.0, 309.0));
  v46[1] = v17;
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  2LL));

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntitiesGridViewLayout mediaEntitiesGridViewLayoutWithImageSizes:footerLayoutType:]( &OBJC_CLASS___TVHMediaEntitiesGridViewLayout,  "mediaEntitiesGridViewLayoutWithImageSizes:footerLayoutType:",  v29,  1LL));
  v43[0] = @"AlbumsFetchRequestIdentifier";
  v43[1] = @"MusicVideosFetchRequestIdentifier";
  v44[0] = &off_100106E58;
  v44[1] = &off_100106E68;
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  2LL));
  [v18 setMinimumLineSpacingByFetchRequestIdentifier:v28];
  v41[0] = @"AlbumsFetchRequestIdentifier";
  v41[1] = @"MusicVideosFetchRequestIdentifier";
  v42[0] = &off_100106E68;
  v42[1] = &off_100106E78;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  2LL));
  [v18 setMinimumInteritemSpacingByFetchRequestIdentifier:v19];
  v20 = -[TVHMediaEntitiesGridViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesGridViewController),  "initWithDataSource:layout:",  v13,  v18);
  -[TVHMusicAlbumArtistViewController setGridViewController:](self, "setGridViewController:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButton playMusicButton](&OBJC_CLASS___TVHButton, "playMusicButton"));
  [v21 addTarget:self action:"_handlePlayButtonAction" forControlEvents:0x2000];
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButton shuffleButton](&OBJC_CLASS___TVHButton, "shuffleButton"));
  [v22 addTarget:self action:"_handleShuffleButtonAction" forControlEvents:0x2000];
  v40[0] = v21;
  v40[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 2LL));
  v24 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController sourceMediaEntityCollection]( self,  "sourceMediaEntityCollection"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tvh_displayTitle"));
  -[TVHMediaEntitiesGridViewController setHeaderTitle:controls:andSortOptions:]( v20,  "setHeaderTitle:controls:andSortOptions:",  v25,  v23,  v33);

  -[TVHMediaEntitiesGridViewController setDelegate:](v20, "setDelegate:", self);
  -[TVHMusicAlbumArtistViewController _updateWithFetchControllerResultSet:]( self,  "_updateWithFetchControllerResultSet:",  v35);

  return v20;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 releaseYear]);
  id v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvhk_localizedDisplayString"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  +[TVHPosterLockupConfigurator configurePosterLockup:withMediaEntity:mediaLibrary:subtitle:]( &OBJC_CLASS___TVHPosterLockupConfigurator,  "configurePosterLockup:withMediaEntity:mediaLibrary:subtitle:",  v8,  v7,  v10,  v11);
}

- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4
{
  id v20 = a4;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVHKMediaEntityCollection);
  if ((objc_opt_isKindOfClass(v20, v5) & 1) != 0)
  {
    v6 = (TVHPlayerPlaylist *)v20;
    id v7 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchControllerIdentifier](self, "fetchControllerIdentifier"));
    v9 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v7,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v8,  @"AlbumsFetchRequestIdentifier");

    v10 = objc_alloc(&OBJC_CLASS___TVHMusicAlbumViewController);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    v12 = -[TVHMusicAlbumViewController initWithAlbum:mediaLibrary:albumsFetchContext:]( v10,  "initWithAlbum:mediaLibrary:albumsFetchContext:",  v6,  v11,  v9);

    if (v12)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumArtistViewController navigationController](self, "navigationController"));
      [v13 pushViewController:v12 animated:1];
    }

    goto LABEL_7;
  }

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___TVHKMediaItem);
  char isKindOfClass = objc_opt_isKindOfClass(v20, v14);
  v16 = v20;
  if ((isKindOfClass & 1) != 0)
  {
    id v17 = v20;
    v18 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    v6 = -[TVHPlayerPlaylist initWithHomeSharingMediaItem:mediaLibrary:]( v18,  "initWithHomeSharingMediaItem:mediaLibrary:",  v17,  v19);

    v9 = (TVHKMediaEntitiesFetchContext *)objc_claimAutoreleasedReturnValue( -[TVHMusicAlbumArtistViewController tvh_playbackManager]( self,  "tvh_playbackManager"));
    -[TVHKMediaEntitiesFetchContext playPlaylist:](v9, "playPlaylist:", v6);
LABEL_7:

    v16 = v20;
  }
}

- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4
{
  id v18 = a4;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVHKMediaEntityCollection);
  if ((objc_opt_isKindOfClass(v18, v5) & 1) != 0)
  {
    v6 = (TVHPlayerPlaylist *)v18;
    id v7 = objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlayerPlaylist identifier](v6, "identifier"));
    v10 = -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:mediaCategoryType:mediaEntityCollectionType:mediaEntityCollectionIdentifier:]( v7,  "initWithMediaLibrary:mediaCategoryType:mediaEntityCollectionType:mediaEntityCollectionIdentifier:",  v8,  1LL,  1LL,  v9);

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumArtistViewController navigationController](self, "navigationController"));
      [v11 pushViewController:v10 animated:1];
    }

    goto LABEL_6;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___TVHKMediaItem);
  char isKindOfClass = objc_opt_isKindOfClass(v18, v12);
  uint64_t v14 = v18;
  if ((isKindOfClass & 1) != 0)
  {
    id v15 = v18;
    v16 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    v6 = -[TVHPlayerPlaylist initWithHomeSharingMediaItem:mediaLibrary:]( v16,  "initWithHomeSharingMediaItem:mediaLibrary:",  v15,  v17);

    v10 = (TVHMediaItemsFetchPlaybackViewController *)objc_claimAutoreleasedReturnValue( -[TVHMusicAlbumArtistViewController tvh_playbackManager]( self,  "tvh_playbackManager"));
    -[TVHMediaItemsFetchPlaybackViewController playPlaylist:](v10, "playPlaylist:", v6);
LABEL_6:

    uint64_t v14 = v18;
  }
}

- (void)mediaEntitiesGridViewController:(id)a3 currentSortDidChange:(id)a4
{
  id v5 = a4;
  -[TVHMusicAlbumArtistViewController setCurrentSortOption:](self, "setCurrentSortOption:", v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  id v6 = [v5 sortMode];

  [v7 setMusicArtistAlbumsSortMode:v6];
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v18 = self;
  id v3 = a3;
  v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v19 = v3;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 results]);
  id v23 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "response", v18));
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntitiesResult]);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 changeSet]);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaEntitiesChangeSet]);
        v10 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 request]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntities]);
        uint64_t v14 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( v10,  "initWithIdentifier:mediaEntities:",  v12,  v13);

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 sortDescriptors]);
        -[TVHMediaEntitiesDataSourceFetchResult setSortDescriptors:](v14, "setSortDescriptors:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue([v7 indexBarItems]);
        -[TVHMediaEntitiesDataSourceFetchResult setIndexBarItems:](v14, "setIndexBarItems:", v16);

        -[TVHMediaEntitiesDataSourceFetchResult setChangeSet:](v14, "setChangeSet:", v9);
        -[NSMutableArray addObject:](v22, "addObject:", v14);
      }

      id v23 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v23);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumArtistViewController gridViewController](v18, "gridViewController"));
  [v17 updateWithMediaEntitiesDataSourceFetchResults:v22];
}

- (void)_handlePlayButtonAction
{
}

- (void)_handleShuffleButtonAction
{
}

- (void)_playWithShuffle:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumArtistViewController dataSource](self, "dataSource"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntities]);
  id v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_filter:", &stru_1000FE108));

  id v7 = objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v9 = -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:musicAlbums:shuffle:]( v7,  "initWithMediaLibrary:musicAlbums:shuffle:",  v8,  v11,  v3);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumArtistViewController navigationController](self, "navigationController"));
  [v10 pushViewController:v9 animated:1];
}

- (TVHMediaEntitiesDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
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