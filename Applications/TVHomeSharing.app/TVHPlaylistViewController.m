@interface TVHPlaylistViewController
- (BOOL)shouldAutoplayMediaItemsForMediaEntityCollectionDetailsViewController:(id)a3;
- (NSArray)playlistItemMediaCategoryTypes;
- (TVHMediaEntityCollectionDetailsViewController)detailsViewController;
- (TVHPlaylistViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHPlaylistViewController)initWithPlaylist:(id)a3 mediaLibrary:(id)a4 playlistsFetchContext:(id)a5 playlistItemMediaCategoryTypes:(id)a6;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (unint64_t)mediaEntityCollectionDetailsViewController:(id)a3 contextMenuOptionsForMediaItem:(id)a4;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withSourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)mediaEntityCollectionDetailsViewController:(id)a3 configureCell:(id)a4 forMediaItem:(id)a5;
- (void)mediaEntityCollectionDetailsViewController:(id)a3 updateHeaderView:(id)a4 forMediaEntityCollection:(id)a5;
- (void)setDetailsViewController:(id)a3;
@end

@implementation TVHPlaylistViewController

- (TVHPlaylistViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHPlaylistViewController)initWithPlaylist:(id)a3 mediaLibrary:(id)a4 playlistsFetchContext:(id)a5 playlistItemMediaCategoryTypes:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest playlistItemsFetchRequestWithPlaylistIdentifier:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "playlistItemsFetchRequestWithPlaylistIdentifier:",  v14));
  uint64_t v16 = TVHKAllMediaItemProperties([v15 setIdentifier:@"PlaylistItemsFetchRequestIdentifier"]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v15 setProperties:v17];

  v26 = v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___TVHPlaylistViewController;
  v19 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v25,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v12,  v18,  0LL,  v13,  v11);

  if (v19)
  {
    v20 = (NSArray *)[v10 copy];
    playlistItemMediaCategoryTypes = v19->_playlistItemMediaCategoryTypes;
    v19->_playlistItemMediaCategoryTypes = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"NO_PLAYLIST_ITEMS_FOUND_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v19, "setNoContentErrorMessage:", v23);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v19, "setDelegate:", v19);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v19,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
  }

  return v19;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistViewController playlistItemMediaCategoryTypes](self, "playlistItemMediaCategoryTypes"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  id v12 = [v11 unsignedIntegerValue];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  id v14 = objc_msgSend(v13, "tvh_playlistCoverArtShapeForPlaylistItemMediaCategoryType:", v12);

  v15 = objc_alloc(&OBJC_CLASS___TVHMediaEntityCollectionDetailsViewController);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v17 = -[TVHMediaEntityCollectionDetailsViewController initWithMediaEntityCollection:mediaLibrary:imageShape:backgroundImageInfo:]( v15,  "initWithMediaEntityCollection:mediaLibrary:imageShape:backgroundImageInfo:",  v9,  v16,  v14,  0LL);

  -[TVHPlaylistViewController setDetailsViewController:](self, "setDetailsViewController:", v17);
  -[TVHMediaEntityCollectionDetailsViewController setDelegate:](v17, "setDelegate:", self);
  -[TVHMediaEntityCollectionDetailsViewController setPreviewType:](v17, "setPreviewType:", 0LL);
  *(void *)&double v18 = objc_opt_class(&OBJC_CLASS___TVHPlaylistItemListViewCell).n128_u64[0];
  -[TVHMediaEntityCollectionDetailsViewController setListViewCellClass:](v17, "setListViewCellClass:", v19, v18);
  -[TVHPlaylistViewController _updateWithFetchControllerResultSet:](self, "_updateWithFetchControllerResultSet:", v8);

  return v17;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withSourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a5;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVHPlaylistViewController detailsViewController](self, "detailsViewController"));
  [v8 setMediaEntityCollection:v7];
}

- (void)mediaEntityCollectionDetailsViewController:(id)a3 configureCell:(id)a4 forMediaItem:(id)a5
{
  id v31 = a4;
  id v7 = a5;
  +[TVHMediaEntityCollectionDetailsViewController listViewCellSize]( &OBJC_CLASS___TVHMediaEntityCollectionDetailsViewController,  "listViewCellSize");
  double v9 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 type]);
  double v11 = v9;
  if ([v10 mediaItemType] == (id)2)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    unsigned __int8 v13 = [v12 supportsWideVideoCoverArt];

    if ((v13 & 1) != 0)
    {
      double v14 = 1.77777778;
    }

    else
    {
      v15 = (char *)[v10 mediaCategoryType];
      double v14 = 1.0;
    }

    double v11 = floor(v9 * v14);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVImageProxy tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:]( &OBJC_CLASS___TVImageProxy,  "tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:",  v7,  v16,  v11,  v9));

  [v31 setImageProxy:v17];
  [v31 setImageWidth:v11];
  double v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVHPlaceholder placeholderForMediaEntity:containerSize:]( &OBJC_CLASS___TVHPlaceholder,  "placeholderForMediaEntity:containerSize:",  v7,  v11,  v9));
  [v31 setPlaceholder:v18];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v7 contentRating]);
  v20 = v19;
  if (v19)
  {
    if ([v19 isExplicitContent])
    {
      uint64_t v21 = 1LL;
      goto LABEL_12;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[VUIContentRatingBadgeManager sharedInstance]( &OBJC_CLASS___VUIContentRatingBadgeManager,  "sharedInstance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 badgeForContentRating:v20 drawUnknownRatingBadge:0]);

    v24 = (void *)objc_claimAutoreleasedReturnValue([v20 ratingLabel]);
    [v31 setContentRatingBadgeImage:v23 badgeText:v24];
  }

  uint64_t v21 = 0LL;
LABEL_12:
  objc_super v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tvh_displayTitle"));
  [v31 setTitle:v25 hasExplicitLyrics:v21];

  v26 = (void *)objc_claimAutoreleasedReturnValue([v7 type]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType showEpisode](&OBJC_CLASS___TVHKMediaEntityType, "showEpisode"));

  if (v26 == v27) {
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v7 showTitle]);
  }
  else {
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v7 artistTitle]);
  }
  v29 = (void *)v28;
  [v31 setSubtitle:v28];
  v30 = (void *)objc_claimAutoreleasedReturnValue([v7 duration]);
  [v31 setDurationInSeconds:v30];

  objc_msgSend(v31, "setHighDefinition:", objc_msgSend(v7, "tvh_isHighDefinition"));
}

- (void)mediaEntityCollectionDetailsViewController:(id)a3 updateHeaderView:(id)a4 forMediaEntityCollection:(id)a5
{
  id v14 = a5;
  id v7 = a4;
  id v8 = a3;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tvh_displayTitle"));
  [v7 setTitle:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"SD_MEDIA_ITEMS_COUNT_FORMAT" value:0 table:0]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItems]);
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( NSString,  "localizedStringWithFormat:",  v11,  [v12 count]));
  [v7 setSubtitle:v13];
}

- (unint64_t)mediaEntityCollectionDetailsViewController:(id)a3 contextMenuOptionsForMediaItem:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "type", a3));
  id v5 = [v4 mediaCategoryType];

  if (v5 == (id)1) {
    return 3LL;
  }
  else {
    return 0LL;
  }
}

- (BOOL)shouldAutoplayMediaItemsForMediaEntityCollectionDetailsViewController:(id)a3
{
  return 1;
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 results]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v11 response]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntitiesResult]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntities]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 changeSet]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaEntitiesChangeSet]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistViewController detailsViewController](self, "detailsViewController"));
  [v10 setMediaItems:v7 changeSet:v9];
}

- (NSArray)playlistItemMediaCategoryTypes
{
  return self->_playlistItemMediaCategoryTypes;
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