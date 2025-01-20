@interface TVHMusicAlbumArtistsViewController
- (CGSize)cellSize;
- (TVHMediaEntitiesDataSource)gridDataSource;
- (TVHMediaEntitiesGridViewController)gridViewController;
- (TVHMusicAlbumArtistsViewController)initWithMediaLibrary:(id)a3;
- (TVHMusicAlbumArtistsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)setCellSize:(CGSize)a3;
- (void)setGridDataSource:(id)a3;
- (void)setGridViewController:(id)a3;
@end

@implementation TVHMusicAlbumArtistsViewController

- (TVHMusicAlbumArtistsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHMusicAlbumArtistsViewController)initWithMediaLibrary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:",  2LL,  1LL));
  uint64_t v6 = TVHKMusicAlbumArtistProperties([v5 setIdentifier:@"MusicAlbumArtistsFetchRequestIdentifier"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setProperties:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
  v23 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  [v5 setSortDescriptors:v9];

  uint64_t v21 = TVHKMediaEntitiesFetchRequestOptionCalculateIndexBarItems;
  v22 = &__kCFBooleanTrue;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  [v5 setOptions:v10];

  v20 = v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVHMusicAlbumArtistsViewController;
  v12 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v19,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v4,  v11,  0LL,  0LL,  0LL);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    v14 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithFetchResultIdentifier:",  v13);
    gridDataSource = v12->_gridDataSource;
    v12->_gridDataSource = v14;

    -[TVHMediaEntitiesDataSource setProvideIndexTitles:](v12->_gridDataSource, "setProvideIndexTitles:", 1LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"NO_ALBUM_ARTISTS_FOUND_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v12, "setNoContentErrorMessage:", v17);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v12, "setDelegate:", v12);
  }

  return v12;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumArtistsViewController gridDataSource](self, "gridDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntitiesGridViewLayout mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:]( &OBJC_CLASS___TVHMediaEntitiesGridViewLayout,  "mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:",  0LL,  273.0,  273.0));
  [v9 setMinimumInteritemSpacing:40.0];
  [v9 setMinimumLineSpacing:64.0];
  v10 = -[TVHMediaEntitiesGridViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesGridViewController),  "initWithDataSource:layout:",  v8,  v9);
  -[TVHMusicAlbumArtistsViewController setGridViewController:](self, "setGridViewController:", v10);
  +[TVHMusicMainViewController defaultMusicCategoryContentInset]( &OBJC_CLASS___TVHMusicMainViewController,  "defaultMusicCategoryContentInset");
  -[TVHMediaEntitiesGridViewController setGridContentInset:](v10, "setGridContentInset:");
  -[TVHMediaEntitiesGridViewController setGridLockupClass:]( v10,  "setGridLockupClass:",  objc_opt_class(&OBJC_CLASS___TVHCircularLockup));
  -[TVHMediaEntitiesGridViewController setDelegate:](v10, "setDelegate:", self);
  -[TVHMusicAlbumArtistsViewController _updateWithFetchControllerResultSet:]( self,  "_updateWithFetchControllerResultSet:",  v7);

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
  +[TVHCircularLockupConfigurator configureCircularLockup:withMediaEntity:mediaLibrary:]( &OBJC_CLASS___TVHCircularLockupConfigurator,  "configureCircularLockup:withMediaEntity:mediaLibrary:",  v8,  v7,  v9);
}

- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchControllerIdentifier](self, "fetchControllerIdentifier"));
  v12 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v6,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v7,  @"MusicAlbumArtistsFetchRequestIdentifier");

  id v8 = objc_alloc(&OBJC_CLASS___TVHMusicAlbumArtistViewController);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v10 = -[TVHMusicAlbumArtistViewController initWithAlbumArtist:mediaLibrary:albumArtistsFetchContext:]( v8,  "initWithAlbumArtist:mediaLibrary:albumArtistsFetchContext:",  v5,  v9,  v12);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumArtistsViewController navigationController](self, "navigationController"));
  [v11 pushViewController:v10 animated:1];
}

- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  1LL));
  uint64_t v7 = TVHKMusicMediaItemProperties(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v6 setProperties:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaItemAlbumArtistIdentifierPredicateWithIdentifier:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaItemAlbumArtistIdentifierPredicateWithIdentifier:",  v5));
  [v6 setPredicate:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
  v16 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  [v6 setSortDescriptors:v11];

  v12 = objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v14 = -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:]( v12,  "initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:",  v13,  v6,  0LL,  1LL);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumArtistsViewController navigationController](self, "navigationController"));
  [v15 pushViewController:v14 animated:1];
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = -[TVHMediaEntitiesDataSourceFetchResult initWithFetchControllerResultSet:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithFetchControllerResultSet:",  v4);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumArtistsViewController gridViewController](self, "gridViewController"));
  id v8 = v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  [v6 updateWithMediaEntitiesDataSourceFetchResults:v7];
}

- (TVHMediaEntitiesDataSource)gridDataSource
{
  return self->_gridDataSource;
}

- (void)setGridDataSource:(id)a3
{
}

- (TVHMediaEntitiesGridViewController)gridViewController
{
  return self->_gridViewController;
}

- (void)setGridViewController:(id)a3
{
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

- (void).cxx_destruct
{
}

@end