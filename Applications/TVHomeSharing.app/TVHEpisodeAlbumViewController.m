@interface TVHEpisodeAlbumViewController
- (BOOL)shouldAutoplayMediaItemsForMediaEntityCollectionDetailsViewController:(id)a3;
- (NSString)episodeCountFormatString;
- (TVHEpisodeAlbumViewController)initWithAlbum:(id)a3 mediaLibrary:(id)a4 albumsFetchContext:(id)a5 albumItemsFetchRequest:(id)a6;
- (TVHEpisodeAlbumViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHMediaEntityCollectionDetailsViewController)detailsViewController;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (unint64_t)mediaEntityCollectionDetailsViewController:(id)a3 contextMenuOptionsForMediaItem:(id)a4;
- (void)_updateAlbumDetailsViewControllerWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withSourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)mediaEntityCollectionDetailsViewController:(id)a3 configureCell:(id)a4 forMediaItem:(id)a5;
- (void)mediaEntityCollectionDetailsViewController:(id)a3 updateHeaderView:(id)a4 forMediaEntityCollection:(id)a5;
- (void)setDetailsViewController:(id)a3;
- (void)setEpisodeCountFormatString:(id)a3;
@end

@implementation TVHEpisodeAlbumViewController

- (TVHEpisodeAlbumViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHEpisodeAlbumViewController)initWithAlbum:(id)a3 mediaLibrary:(id)a4 albumsFetchContext:(id)a5 albumItemsFetchRequest:(id)a6
{
  id v10 = a6;
  id v21 = v10;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVHEpisodeAlbumViewController;
  v15 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v20,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v12,  v14,  1LL,  v13,  v11);

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 localizedStringForKey:@"SD_EPISODES_COUNT_FORMAT" value:0 table:0]);
    episodeCountFormatString = v15->_episodeCountFormatString;
    v15->_episodeCountFormatString = (NSString *)v17;

    -[TVHMediaEntitiesFetchViewController setDelegate:](v15, "setDelegate:", v15);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v15,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
  }

  return v15;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = objc_alloc(&OBJC_CLASS___TVHMediaEntityCollectionDetailsViewController);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v14 = -[TVHMediaEntityCollectionDetailsViewController initWithMediaEntityCollection:mediaLibrary:imageShape:backgroundImageInfo:]( v12,  "initWithMediaEntityCollection:mediaLibrary:imageShape:backgroundImageInfo:",  v11,  v13,  0LL,  v10);

  -[TVHEpisodeAlbumViewController setDetailsViewController:](self, "setDetailsViewController:", v14);
  -[TVHMediaEntityCollectionDetailsViewController setDelegate:](v14, "setDelegate:", self);
  -[TVHMediaEntityCollectionDetailsViewController setPreviewType:](v14, "setPreviewType:", 1LL);
  -[TVHMediaEntityCollectionDetailsViewController setListViewCellClass:]( v14,  "setListViewCellClass:",  objc_opt_class(&OBJC_CLASS___TVHEpisodeListViewCell));
  -[TVHEpisodeAlbumViewController _updateAlbumDetailsViewControllerWithFetchControllerResultSet:]( self,  "_updateAlbumDetailsViewControllerWithFetchControllerResultSet:",  v9);

  return v14;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withSourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHEpisodeAlbumViewController detailsViewController](self, "detailsViewController"));
  [v10 setMediaEntityCollection:v9];

  [v10 setBackgroundImageInfo:v8];
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)mediaEntityCollectionDetailsViewController:(id)a3 configureCell:(id)a4 forMediaItem:(id)a5
{
  id v6 = a5;
  id v15 = a4;
  unint64_t v7 = (unint64_t)[v6 playedState];
  if (v7 > 3) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = qword_1000C3228[v7];
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvh_displayTitle"));
  [v15 setTitle:v9];

  [v15 setPlayedState:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 releaseDate]);
  [v15 setReleaseDate:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 duration]);
  [v15 setDurationInSeconds:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 contentRating]);
  objc_msgSend(v15, "setHasExplicitLyrics:", objc_msgSend(v12, "isExplicitContent"));

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 type]);
  id v14 = [v13 mediaItemType];

  [v15 setIsVideoItem:v14 == (id)2];
}

- (void)mediaEntityCollectionDetailsViewController:(id)a3 updateHeaderView:(id)a4 forMediaEntityCollection:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvh_displayTitle"));
  [v9 setTitle:v11];

  v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvh_displayGenreTitle"));

  -[NSMutableArray bs_safeAddObject:](v16, "bs_safeAddObject:", v12);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 mediaItems]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeAlbumViewController episodeCountFormatString](self, "episodeCountFormatString"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( NSString,  "localizedStringWithFormat:",  v14,  [v13 count]));

  -[NSMutableArray bs_safeAddObject:](v16, "bs_safeAddObject:", v15);
  [v9 setMetadataStrings:v16];
}

- (BOOL)shouldAutoplayMediaItemsForMediaEntityCollectionDetailsViewController:(id)a3
{
  return 1;
}

- (unint64_t)mediaEntityCollectionDetailsViewController:(id)a3 contextMenuOptionsForMediaItem:(id)a4
{
  return 0LL;
}

- (void)_updateAlbumDetailsViewControllerWithFetchControllerResultSet:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 results]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v11 response]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntitiesResult]);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntities]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 changeSet]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaEntitiesChangeSet]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeAlbumViewController detailsViewController](self, "detailsViewController"));
  [v10 setMediaItems:v7 changeSet:v9];
}

- (NSString)episodeCountFormatString
{
  return self->_episodeCountFormatString;
}

- (void)setEpisodeCountFormatString:(id)a3
{
}

- (TVHMediaEntityCollectionDetailsViewController)detailsViewController
{
  return self->_detailsViewController;
}

- (void)setDetailsViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end