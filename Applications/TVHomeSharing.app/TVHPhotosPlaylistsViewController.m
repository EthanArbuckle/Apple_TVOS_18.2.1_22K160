@interface TVHPhotosPlaylistsViewController
+ (id)_noContentErrorMessageForMode:(unint64_t)a3;
+ (id)_titleForDisplayType:(unint64_t)a3 andSourceFolder:(id)a4;
- (CGSize)cellSize;
- (TVHMediaEntitiesGridViewController)gridViewController;
- (TVHPhotosPlaylistsViewController)initWithMediaLibrary:(id)a3 displayType:(unint64_t)a4;
- (TVHPhotosPlaylistsViewController)initWithMediaLibrary:(id)a3 displayType:(unint64_t)a4 sourceFolder:(id)a5 sourceFoldersFetchContext:(id)a6;
- (TVHPhotosPlaylistsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (id)_initWithMediaLibrary:(id)a3 displayType:(unint64_t)a4 sourceFolder:(id)a5 sourceFoldersFetchContext:(id)a6;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (unint64_t)displayType;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)setCellSize:(CGSize)a3;
- (void)setDisplayType:(unint64_t)a3;
- (void)setGridViewController:(id)a3;
@end

@implementation TVHPhotosPlaylistsViewController

- (TVHPhotosPlaylistsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHPhotosPlaylistsViewController)initWithMediaLibrary:(id)a3 displayType:(unint64_t)a4
{
  return (TVHPhotosPlaylistsViewController *)-[TVHPhotosPlaylistsViewController _initWithMediaLibrary:displayType:sourceFolder:sourceFoldersFetchContext:]( self,  "_initWithMediaLibrary:displayType:sourceFolder:sourceFoldersFetchContext:",  a3,  a4,  0LL,  0LL);
}

- (TVHPhotosPlaylistsViewController)initWithMediaLibrary:(id)a3 displayType:(unint64_t)a4 sourceFolder:(id)a5 sourceFoldersFetchContext:(id)a6
{
  return (TVHPhotosPlaylistsViewController *)-[TVHPhotosPlaylistsViewController _initWithMediaLibrary:displayType:sourceFolder:sourceFoldersFetchContext:]( self,  "_initWithMediaLibrary:displayType:sourceFolder:sourceFoldersFetchContext:",  a3,  a4,  a5,  a6);
}

- (id)_initWithMediaLibrary:(id)a3 displayType:(unint64_t)a4 sourceFolder:(id)a5 sourceFoldersFetchContext:(id)a6
{
  id v27 = a6;
  id v9 = a5;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  if (a4 > 2) {
    v12 = 0LL;
  }
  else {
    v12 = off_1000FE578[a4];
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest playlistsFetchRequestWithPlaylistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "playlistsFetchRequestWithPlaylistItemMediaCategoryTypes:",  &off_100106D10,  self));
  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_equalPredicateWithKeyPath:value:]( &OBJC_CLASS___NSPredicate,  "tvhk_equalPredicateWithKeyPath:value:",  @"parentPlaylistIdentifier",  v11));
  -[NSMutableArray tvhk_addObjectIfNotNil:](v14, "tvhk_addObjectIfNotNil:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_includeAnyPlaylistTypePredicate:]( &OBJC_CLASS___NSPredicate,  "tvhk_includeAnyPlaylistTypePredicate:",  v12));
  -[NSMutableArray tvhk_addObjectIfNotNil:](v14, "tvhk_addObjectIfNotNil:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_predicateWithSubpredicates:compoundPredicateType:]( &OBJC_CLASS___NSPredicate,  "tvhk_predicateWithSubpredicates:compoundPredicateType:",  v14,  1LL));
  uint64_t v18 = TVHKPlaylistProperties([v13 setPredicate:v17]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v13 setProperties:v19];

  [v13 setIdentifier:@"PhotosPlaylistsFetchRequestIdentifier"];
  v29 = v13;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
  v28.receiver = v26;
  v28.super_class = (Class)&OBJC_CLASS___TVHPhotosPlaylistsViewController;
  v21 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v28,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v10,  v20,  0LL,  v9,  v27);

  if (v21)
  {
    v21->_displayType = a4;
    id v22 = [(id)objc_opt_class(v21) _noContentErrorMessageForMode:a4];
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v21, "setNoContentErrorMessage:", v23);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v21, "setDelegate:", v21);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v21,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
  }

  return v21;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a4;
  v8 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithFetchResultIdentifier:",  @"PhotosPlaylistsFetchRequestIdentifier");
  -[TVHMediaEntitiesDataSource setProvideIndexTitles:](v8, "setProvideIndexTitles:", 1LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntitiesGridViewLayout mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:]( &OBJC_CLASS___TVHMediaEntitiesGridViewLayout,  "mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:",  0LL,  308.0,  308.0));
  id v10 = -[TVHMediaEntitiesGridViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesGridViewController),  "initWithDataSource:layout:",  v8,  v9);
  -[TVHPhotosPlaylistsViewController setGridViewController:](self, "setGridViewController:", v10);
  v11 = (void *)objc_opt_class(self);
  unint64_t v12 = -[TVHPhotosPlaylistsViewController displayType](self, "displayType");
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController sourceMediaEntityCollection]( self,  "sourceMediaEntityCollection"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 _titleForDisplayType:v12 andSourceFolder:v13]);

  -[TVHMediaEntitiesGridViewController setHeaderTitle:](v10, "setHeaderTitle:", v14);
  -[TVHMediaEntitiesGridViewController setDelegate:](v10, "setDelegate:", self);
  -[TVHPhotosPlaylistsViewController _updateWithFetchControllerResultSet:]( self,  "_updateWithFetchControllerResultSet:",  v7);

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
  +[TVHPosterLockupConfigurator configurePhotoPosterLockup:withMediaEntity:mediaLibrary:includeTitle:]( &OBJC_CLASS___TVHPosterLockupConfigurator,  "configurePhotoPosterLockup:withMediaEntity:mediaLibrary:includeTitle:",  v8,  v7,  v9,  1LL);
}

- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    if ([v6 playlistType] == (id)1)
    {
      id v8 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchControllerIdentifier](self, "fetchControllerIdentifier"));
      id v10 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v8,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v9,  @"PhotosPlaylistsFetchRequestIdentifier");

      v11 = objc_alloc(&OBJC_CLASS___TVHPhotosPlaylistsViewController);
      unint64_t v12 = (TVHKMediaEntitiesFetchContext *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
      v13 = -[TVHPhotosPlaylistsViewController initWithMediaLibrary:displayType:sourceFolder:sourceFoldersFetchContext:]( v11,  "initWithMediaLibrary:displayType:sourceFolder:sourceFoldersFetchContext:",  v12,  0LL,  v7,  v10);
    }

    else
    {
      id v10 = (TVHKMediaEntitiesFetchContext *)objc_claimAutoreleasedReturnValue( -[TVHPhotosPlaylistsViewController tvh_mediaLibrariesEnviroment]( self,  "tvh_mediaLibrariesEnviroment"));
      if (-[TVHKMediaEntitiesFetchContext isConfiguringScreenSaverOnly]( v10,  "isConfiguringScreenSaverOnly"))
      {
        unint64_t v12 = (TVHKMediaEntitiesFetchContext *)objc_claimAutoreleasedReturnValue( -[TVHKMediaEntitiesFetchContext screenSaverPicker]( v10,  "screenSaverPicker"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
        -[TVHKMediaEntitiesFetchContext setScreenSaverWithMediaLibrary:mediaCategoryType:mediaEntityCollection:]( v12,  "setScreenSaverWithMediaLibrary:mediaCategoryType:mediaEntityCollection:",  v14,  9LL,  v7);
        v13 = 0LL;
      }

      else
      {
        v15 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
        v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesFetchViewController fetchControllerIdentifier]( self,  "fetchControllerIdentifier"));
        unint64_t v12 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v15,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v16,  @"PhotosPlaylistsFetchRequestIdentifier");

        v17 = objc_alloc(&OBJC_CLASS___TVHPhotosItemsViewController);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
        v13 = -[TVHPhotosItemsViewController initWithMediaLibrary:playlist:playlistsFetchContext:]( v17,  "initWithMediaLibrary:playlist:playlistsFetchContext:",  v14,  v7,  v12);
      }
    }

    if (v13)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosPlaylistsViewController navigationController](self, "navigationController"));
      [v18 pushViewController:v13 animated:1];
    }
  }
}

+ (id)_noContentErrorMessageForMode:(unint64_t)a3
{
  if (a3 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v4 = v3;
    v5 = @"NO_FACES_FOUND_ERROR_MESSAGE";
  }

  else if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v4 = v3;
    v5 = @"NO_EVENTS_FOUND_ERROR_MESSAGE";
  }

  else
  {
    if (a3)
    {
      id v6 = 0LL;
      return v6;
    }

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v4 = v3;
    v5 = @"NO_ALBUMS_FOUND_ERROR_MESSAGE";
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v5 value:0 table:0]);

  return v6;
}

+ (id)_titleForDisplayType:(unint64_t)a3 andSourceFolder:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvh_displayTitle"));
  }

  else
  {
    if (a3 == 2)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v9 = v8;
      id v10 = @"FACES_TITLE";
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v9 = v8;
      if (a3 == 1) {
        id v10 = @"EVENTS_TITLE";
      }
      else {
        id v10 = @"PHOTOS_ALBUMS_TITLE";
      }
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v10 value:0 table:0]);
  }

  return v7;
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = -[TVHMediaEntitiesDataSourceFetchResult initWithFetchControllerResultSet:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithFetchControllerResultSet:",  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosPlaylistsViewController gridViewController](self, "gridViewController"));
  id v8 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  [v6 updateWithMediaEntitiesDataSourceFetchResults:v7];
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(unint64_t)a3
{
  self->_displayType = a3;
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

- (void).cxx_destruct
{
}

@end