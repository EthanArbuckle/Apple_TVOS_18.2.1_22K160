@interface TVHMusicAlbumViewController
- (BOOL)shouldAutoplayMediaItemsForMediaEntityCollectionDetailsViewController:(id)a3;
- (TVHKImageColors)imageColors;
- (TVHMediaEntityCollectionDetailsViewController)albumDetailsViewController;
- (TVHMusicAlbumViewController)initWithAlbum:(id)a3 mediaLibrary:(id)a4 albumsFetchContext:(id)a5;
- (TVHMusicAlbumViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (unint64_t)mediaEntityCollectionDetailsViewController:(id)a3 contextMenuOptionsForMediaItem:(id)a4;
- (void)_updateAlbumDetailsViewControllerWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withSourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)mediaEntityCollectionDetailsViewController:(id)a3 configureCell:(id)a4 forMediaItem:(id)a5;
- (void)mediaEntityCollectionDetailsViewController:(id)a3 updateHeaderView:(id)a4 forMediaEntityCollection:(id)a5;
- (void)setAlbumDetailsViewController:(id)a3;
- (void)setImageColors:(id)a3;
@end

@implementation TVHMusicAlbumViewController

- (TVHMusicAlbumViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHMusicAlbumViewController)initWithAlbum:(id)a3 mediaLibrary:(id)a4 albumsFetchContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  1LL));
  uint64_t v12 = TVHKMusicMediaItemProperties([v11 setIdentifier:@"AlbumItemsFetchRequestIdentifier"]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v11 setProperties:v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaEntityAlbumIdentifierPredicateWithIdentifier:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaEntityAlbumIdentifierPredicateWithIdentifier:",  v10));
  [v11 setPredicate:v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingMusicAlbumItemSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingMusicAlbumItemSortDescriptor"));
  v25 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  [v11 setSortDescriptors:v16];

  v24 = v11;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVHMusicAlbumViewController;
  v18 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v23,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v8,  v17,  1LL,  v9,  v7);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"NO_MUSIC_ITEMS_FOUND_FOR_ALBUM_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v18, "setNoContentErrorMessage:", v20);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v18, "setDelegate:", v18);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v18,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
  }

  return v18;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  uint64_t v12 = objc_alloc(&OBJC_CLASS___TVHMediaEntityCollectionDetailsViewController);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v14 = -[TVHMediaEntityCollectionDetailsViewController initWithMediaEntityCollection:mediaLibrary:imageShape:backgroundImageInfo:]( v12,  "initWithMediaEntityCollection:mediaLibrary:imageShape:backgroundImageInfo:",  v11,  v13,  0LL,  v10);

  -[TVHMusicAlbumViewController setAlbumDetailsViewController:](self, "setAlbumDetailsViewController:", v14);
  -[TVHMediaEntityCollectionDetailsViewController setDelegate:](v14, "setDelegate:", self);
  -[TVHMediaEntityCollectionDetailsViewController setPreviewType:](v14, "setPreviewType:", 0LL);
  -[TVHMediaEntityCollectionDetailsViewController setListViewCellClass:]( v14,  "setListViewCellClass:",  objc_opt_class(&OBJC_CLASS___TVHMusicAlbumItemListViewCell));
  -[TVHMusicAlbumViewController _updateAlbumDetailsViewControllerWithFetchControllerResultSet:]( self,  "_updateAlbumDetailsViewControllerWithFetchControllerResultSet:",  v9);

  return v14;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withSourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumViewController albumDetailsViewController](self, "albumDetailsViewController"));
  [v10 setMediaEntityCollection:v9];

  [v10 setBackgroundImageInfo:v8];
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)mediaEntityCollectionDetailsViewController:(id)a3 configureCell:(id)a4 forMediaItem:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 trackNumber]);
  [v7 setTrackNumber:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvh_displayTitle"));
  [v7 setTitle:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 duration]);
  [v7 setDurationInSeconds:v10];

  id v11 = (id)objc_claimAutoreleasedReturnValue([v6 contentRating]);
  objc_msgSend(v7, "setHasExplicitLyrics:", objc_msgSend(v11, "isExplicitContent"));
}

- (void)mediaEntityCollectionDetailsViewController:(id)a3 updateHeaderView:(id)a4 forMediaEntityCollection:(id)a5
{
  id v19 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tvh_displayTitle"));
  [v7 setTitle:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v19 artistTitle]);
  [v7 setSubtitle:v10];

  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v19 releaseYear]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringValue]);

  -[NSMutableArray bs_safeAddObject:](v11, "bs_safeAddObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tvh_displayGenreTitle"));
  -[NSMutableArray bs_safeAddObject:](v11, "bs_safeAddObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"SD_MUSIC_ITEMS_COUNT_FORMAT" value:0 table:0]);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItems]);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( NSString,  "localizedStringWithFormat:",  v16,  [v17 count]));
  -[NSMutableArray bs_safeAddObject:](v11, "bs_safeAddObject:", v18);
  [v7 setMetadataStrings:v11];
}

- (BOOL)shouldAutoplayMediaItemsForMediaEntityCollectionDetailsViewController:(id)a3
{
  return 1;
}

- (unint64_t)mediaEntityCollectionDetailsViewController:(id)a3 contextMenuOptionsForMediaItem:(id)a4
{
  return 2LL;
}

- (void)_updateAlbumDetailsViewControllerWithFetchControllerResultSet:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 results]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v11 response]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntitiesResult]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntities]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 changeSet]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaEntitiesChangeSet]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumViewController albumDetailsViewController](self, "albumDetailsViewController"));
  [v10 setMediaItems:v7 changeSet:v9];
}

- (TVHMediaEntityCollectionDetailsViewController)albumDetailsViewController
{
  return self->_albumDetailsViewController;
}

- (void)setAlbumDetailsViewController:(id)a3
{
}

- (TVHKImageColors)imageColors
{
  return self->_imageColors;
}

- (void)setImageColors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end