@interface TVHPhotosItemsViewController
+ (id)_noContentErrorMessageForSourcePlaylist:(id)a3;
- (CGSize)cellSize;
- (TVHMediaEntitiesDataSource)dataSource;
- (TVHMediaEntitiesGridViewController)gridViewController;
- (TVHPhotosItemsViewController)initWithMediaLibrary:(id)a3;
- (TVHPhotosItemsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHPhotosItemsViewController)initWithMediaLibrary:(id)a3 playlist:(id)a4 playlistsFetchContext:(id)a5;
- (id)_initWithMediaLibrary:(id)a3 playlist:(id)a4 playlistsFetchContext:(id)a5;
- (id)_title;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_handlePlaySlideshowButtonAction;
- (void)_handleSetScreenSaverButtonAction;
- (void)_playSlideshowWithShowSettings:(BOOL)a3;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)setCellSize:(CGSize)a3;
- (void)setDataSource:(id)a3;
- (void)setGridViewController:(id)a3;
@end

@implementation TVHPhotosItemsViewController

- (TVHPhotosItemsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHPhotosItemsViewController)initWithMediaLibrary:(id)a3
{
  return (TVHPhotosItemsViewController *)-[TVHPhotosItemsViewController _initWithMediaLibrary:playlist:playlistsFetchContext:]( self,  "_initWithMediaLibrary:playlist:playlistsFetchContext:",  a3,  0LL,  0LL);
}

- (TVHPhotosItemsViewController)initWithMediaLibrary:(id)a3 playlist:(id)a4 playlistsFetchContext:(id)a5
{
  return (TVHPhotosItemsViewController *)-[TVHPhotosItemsViewController _initWithMediaLibrary:playlist:playlistsFetchContext:]( self,  "_initWithMediaLibrary:playlist:playlistsFetchContext:",  a3,  a4,  a5);
}

- (id)_initWithMediaLibrary:(id)a3 playlist:(id)a4 playlistsFetchContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest playlistItemsFetchRequestWithPlaylistIdentifier:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "playlistItemsFetchRequestWithPlaylistIdentifier:",  v11));
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  9LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_descendingCreationDateSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_descendingCreationDateSortDescriptor"));
    v24 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
    [v12 setSortDescriptors:v14];
  }

  uint64_t v15 = TVHKPhotoMediaItemProperties();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v12 setProperties:v16];
  [v12 setIdentifier:@"PhotoItemsFetchRequestIdentifier"];

  v23 = v12;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVHPhotosItemsViewController;
  v18 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v22,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v10,  v17,  0LL,  v8,  v9);

  if (v18)
  {
    id v19 = [(id)objc_opt_class(v18) _noContentErrorMessageForSourcePlaylist:v8];
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v18, "setNoContentErrorMessage:", v20);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v18, "setDelegate:", v18);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v18,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
  }

  return v18;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a4;
  id v8 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithFetchResultIdentifier:",  @"PhotoItemsFetchRequestIdentifier");
  -[TVHPhotosItemsViewController setDataSource:](self, "setDataSource:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntitiesGridViewLayout mediaEntitiesGridViewLayoutWithImageSize:]( &OBJC_CLASS___TVHMediaEntitiesGridViewLayout,  "mediaEntitiesGridViewLayoutWithImageSize:",  308.0,  308.0));
  id v10 = -[TVHMediaEntitiesGridViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesGridViewController),  "initWithDataSource:layout:",  v8,  v9);
  -[TVHPhotosItemsViewController setGridViewController:](self, "setGridViewController:", v10);
  -[TVHMediaEntitiesGridViewController setDelegate:](v10, "setDelegate:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButton playSlideshowButton](&OBJC_CLASS___TVHButton, "playSlideshowButton"));
  [v11 addTarget:self action:"_handlePlaySlideshowButtonAction" forControlEvents:0x2000];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButton setScreenSaverButton](&OBJC_CLASS___TVHButton, "setScreenSaverButton"));
  [v12 addTarget:self action:"_handleSetScreenSaverButtonAction" forControlEvents:0x2000];
  v16[0] = v11;
  v16[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosItemsViewController _title](self, "_title"));
  -[TVHMediaEntitiesGridViewController setHeaderTitle:controls:andSortOptions:]( v10,  "setHeaderTitle:controls:andSortOptions:",  v14,  v13,  0LL);

  -[TVHPhotosItemsViewController _updateWithFetchControllerResultSet:](self, "_updateWithFetchControllerResultSet:", v7);
  return v10;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  +[TVHPosterLockupConfigurator configurePhotoPosterLockup:withMediaEntity:mediaLibrary:includeTitle:]( &OBJC_CLASS___TVHPosterLockupConfigurator,  "configurePhotoPosterLockup:withMediaEntity:mediaLibrary:includeTitle:",  v8,  v7,  v9,  0LL);
}

- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 type]);
  id v7 = [v6 mediaItemType];

  if (v7 == (id)2)
  {
    id v8 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    v16 = -[TVHPlayerPlaylist initWithHomeSharingMediaItem:mediaLibrary:]( v8,  "initWithHomeSharingMediaItem:mediaLibrary:",  v5,  v9);

    id v10 = (TVHPhotosOneUpViewController *)objc_claimAutoreleasedReturnValue( -[TVHPhotosItemsViewController tvh_playbackManager]( self,  "tvh_playbackManager"));
    -[TVHPhotosOneUpViewController playPlaylist:](v10, "playPlaylist:", v16);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosItemsViewController dataSource](self, "dataSource"));
    v16 = (TVHPlayerPlaylist *)objc_claimAutoreleasedReturnValue([v11 mediaEntities]);

    v12 = objc_alloc(&OBJC_CLASS___TVHPhotosOneUpViewController);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    id v14 = -[TVHPlayerPlaylist indexOfObjectIdenticalTo:](v16, "indexOfObjectIdenticalTo:", v5);

    id v10 = -[TVHPhotosOneUpViewController initWithMediaItems:mediaLibrary:startIndex:]( v12,  "initWithMediaItems:mediaLibrary:startIndex:",  v16,  v13,  v14);
    if (v10)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosItemsViewController navigationController](self, "navigationController"));
      [v15 pushViewController:v10 animated:1];
    }
  }
}

- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4
{
  id v11 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v11 type]);
  id v6 = [v5 mediaItemType];

  if (v6 == (id)2)
  {
    id v7 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    id v9 = -[TVHPlayerPlaylist initWithHomeSharingMediaItem:mediaLibrary:]( v7,  "initWithHomeSharingMediaItem:mediaLibrary:",  v11,  v8);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosItemsViewController tvh_playbackManager](self, "tvh_playbackManager"));
    [v10 playPlaylist:v9];
  }

  else
  {
    -[TVHPhotosItemsViewController _playSlideshowWithShowSettings:](self, "_playSlideshowWithShowSettings:", 0LL);
  }
}

- (void)_handlePlaySlideshowButtonAction
{
}

- (void)_handleSetScreenSaverButtonAction
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosItemsViewController tvh_mediaLibrariesEnviroment](self, "tvh_mediaLibrariesEnviroment"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 screenSaverPicker]);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController sourceMediaEntityCollection](self, "sourceMediaEntityCollection"));
  [v6 setScreenSaverWithMediaLibrary:v4 mediaCategoryType:9 mediaEntityCollection:v5];
}

+ (id)_noContentErrorMessageForSourcePlaylist:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = v4;
  if (a3) {
    id v6 = @"NO_PHOTOS_IN_PLAYLIST_ERROR_MESSAGE";
  }
  else {
    id v6 = @"NO_PHOTOS_ERROR_MESSAGE";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v6 value:0 table:0]);

  return v7;
}

- (id)_title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController sourceMediaEntityCollection](self, "sourceMediaEntityCollection"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tvh_displayTitle"));
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"PHOTOS_TITLE" value:0 table:0]);
  }

  return v4;
}

- (void)_playSlideshowWithShowSettings:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosItemsViewController dataSource](self, "dataSource"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 mediaEntities]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVHPhotosSlideshowViewControllerFactory viewControllerWithMediaItems:mediaLibrary:showSettings:]( &OBJC_CLASS___TVHPhotosSlideshowViewControllerFactory,  "viewControllerWithMediaItems:mediaLibrary:showSettings:",  v9,  v6,  v3));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosItemsViewController navigationController](self, "navigationController"));
    [v8 pushViewController:v7 animated:1];
  }
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvh_firstMediaEntities"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntityUtilities mediaItemsByMediaItemTypeFromMediaItems:]( &OBJC_CLASS___TVHMediaEntityUtilities,  "mediaItemsByMediaItemTypeFromMediaItems:",  v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:&off_100105F70]);
  id v8 = [v7 count];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:&off_100105F88]);
  id v10 = [v9 count];

  if (v8) {
    BOOL v11 = v10 == 0LL;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"SD_PHOTO_IMAGES_COUNT_FORMAT" value:0 table:0]);

    goto LABEL_14;
  }

  if (v8) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v10 == 0LL;
  }
  if (!v12)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"SD_PHOTO_VIDEOS_COUNT_FORMAT" value:0 table:0]);

    v18 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v17, v10, v22);
LABEL_15:
    v13 = (void *)objc_claimAutoreleasedReturnValue(v18);

    goto LABEL_16;
  }

  v13 = 0LL;
  if (v8 && v10)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"SD_PHOTO_IMAGES_VIDEOS_COUNT_FORMAT" value:0 table:0]);

    id v22 = v10;
LABEL_14:
    v18 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v17, v8, v22);
    goto LABEL_15;
  }

- (CGSize)cellSize
{
  double width = self->_cellSize.width;
  double height = self->_cellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (TVHMediaEntitiesGridViewController)gridViewController
{
  return self->_gridViewController;
}

- (void)setGridViewController:(id)a3
{
}

- (TVHMediaEntitiesDataSource)dataSource
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