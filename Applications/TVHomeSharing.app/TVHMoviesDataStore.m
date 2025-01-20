@interface TVHMoviesDataStore
+ (id)new;
- (BOOL)_shouldUpdateCatalogueDataSource;
- (NSArray)fetchRequests;
- (NSString)fetchControllerIdentifier;
- (TVHCatalogueDataSource)catalogueDataSource;
- (TVHKMediaEntitiesFetchRequest)moviePlaylistsFetchRequest;
- (TVHKMediaEntitiesFetchRequest)movieRentalsFetchRequest;
- (TVHKMediaEntitiesFetchRequest)moviesFetchRequest;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHMoviesDataStore)init;
- (TVHMoviesDataStore)initWithMediaLibrary:(id)a3 mode:(unint64_t)a4;
- (TVHMoviesInfoCenter)movieRentalsInfoCenter;
- (TVHMoviesInfoCenter)moviesInfoCenter;
- (id)_allContentCatalogueDataSource;
- (id)_movieRentalsFetchResponseFromFetchControllerResultSet:(id)a3;
- (id)_moviesFetchResponseFromFetchControllerResultSet:(id)a3;
- (unint64_t)completedFetchCount;
- (unint64_t)mode;
- (void)setCompletedFetchCount:(unint64_t)a3;
- (void)setMoviePlaylistsFetchRequest:(id)a3;
- (void)setMovieRentalsFetchRequest:(id)a3;
- (void)setMoviesFetchRequest:(id)a3;
- (void)updateWithMediaEntitiesFetchControllerResultSet:(id)a3;
@end

@implementation TVHMoviesDataStore

+ (id)new
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v3);

  return 0LL;
}

- (TVHMoviesDataStore)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMoviesDataStore)initWithMediaLibrary:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___TVHMoviesDataStore;
  v8 = -[TVHMoviesDataStore init](&v34, "init");
  v9 = v8;
  if (!v8) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v8->_mediaLibrary, a3);
  v9->_unint64_t mode = a4;
  v10 = -[TVHMoviesInfoCenter initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMoviesInfoCenter),  "initWithMediaLibrary:",  v7);
  moviesInfoCenter = v9->_moviesInfoCenter;
  v9->_moviesInfoCenter = v10;

  v12 = -[TVHMoviesInfoCenter initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMoviesInfoCenter),  "initWithMediaLibrary:",  v7);
  movieRentalsInfoCenter = v9->_movieRentalsInfoCenter;
  v9->_movieRentalsInfoCenter = v12;

  unint64_t mode = v9->_mode;
  switch(mode)
  {
    case 2uLL:
      id v25 = sub_1000328F0();
      uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
      movieRentalsFetchRequest = v9->_movieRentalsFetchRequest;
      v9->_movieRentalsFetchRequest = (TVHKMediaEntitiesFetchRequest *)v26;

      v35 = v9->_movieRentalsFetchRequest;
      v23 = &v35;
LABEL_8:
      uint64_t v24 = 1LL;
      goto LABEL_9;
    case 1uLL:
      id v28 = sub_100032760();
      uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
      moviesFetchRequest = v9->_moviesFetchRequest;
      v9->_moviesFetchRequest = (TVHKMediaEntitiesFetchRequest *)v29;

      v36 = v9->_moviesFetchRequest;
      v23 = &v36;
      goto LABEL_8;
    case 0uLL:
      id v15 = sub_100032760();
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
      v17 = v9->_moviesFetchRequest;
      v9->_moviesFetchRequest = (TVHKMediaEntitiesFetchRequest *)v16;

      id v18 = sub_1000328F0();
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = v9->_movieRentalsFetchRequest;
      v9->_movieRentalsFetchRequest = (TVHKMediaEntitiesFetchRequest *)v19;

      uint64_t v21 = objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest tvh_toplevelPlaylistsFetchRequestWithIdentifier:playlistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "tvh_toplevelPlaylistsFetchRequestWithIdentifier:playlistItemMediaCategoryTypes:",  @"MoviePlaylistsFetchRequestIdentifier",  &off_100106B78));
      moviePlaylistsFetchRequest = v9->_moviePlaylistsFetchRequest;
      v9->_moviePlaylistsFetchRequest = (TVHKMediaEntitiesFetchRequest *)v21;

      __int128 v37 = *(_OWORD *)&v9->_moviesFetchRequest;
      v38 = v9->_moviePlaylistsFetchRequest;
      v23 = (TVHKMediaEntitiesFetchRequest **)&v37;
      uint64_t v24 = 3LL;
LABEL_9:
      uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, v24));
      fetchRequests = v9->_fetchRequests;
      v9->_fetchRequests = (NSArray *)v31;

      break;
  }

- (TVHCatalogueDataSource)catalogueDataSource
{
  if (!self->_catalogueDataSource)
  {
    if (-[TVHMoviesDataStore _shouldUpdateCatalogueDataSource](self, "_shouldUpdateCatalogueDataSource")) {
      v3 = (TVHCatalogueDataSource *)objc_claimAutoreleasedReturnValue( -[TVHMoviesDataStore _allContentCatalogueDataSource]( self,  "_allContentCatalogueDataSource"));
    }
    else {
      v3 = -[TVHCatalogueDataSource initWithSections:]( objc_alloc(&OBJC_CLASS___TVHCatalogueDataSource),  "initWithSections:",  &__NSArray0__struct);
    }
    catalogueDataSource = self->_catalogueDataSource;
    self->_catalogueDataSource = v3;
  }

  return self->_catalogueDataSource;
}

- (void)updateWithMediaEntitiesFetchControllerResultSet:(id)a3
{
  id v10 = a3;
  if (-[TVHMoviesDataStore _shouldUpdateCatalogueDataSource](self, "_shouldUpdateCatalogueDataSource"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesDataStore catalogueDataSource](self, "catalogueDataSource"));
    [v4 updateWithMediaEntitiesFetchControllerResultSet:v10];
  }

  unint64_t v5 = -[TVHMoviesDataStore completedFetchCount](self, "completedFetchCount");
  if (!v5 || [v10 hasChanges])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMoviesDataStore _moviesFetchResponseFromFetchControllerResultSet:]( self,  "_moviesFetchResponseFromFetchControllerResultSet:",  v10));
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesDataStore moviesInfoCenter](self, "moviesInfoCenter"));
      [v7 updateWithFetchResponse:v6];
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMoviesDataStore _movieRentalsFetchResponseFromFetchControllerResultSet:]( self,  "_movieRentalsFetchResponseFromFetchControllerResultSet:",  v10));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesDataStore movieRentalsInfoCenter](self, "movieRentalsInfoCenter"));
      [v9 updateWithFetchResponse:v8];
    }
  }

  -[TVHMoviesDataStore setCompletedFetchCount:](self, "setCompletedFetchCount:", v5 + 1);
}

- (BOOL)_shouldUpdateCatalogueDataSource
{
  return -[TVHMoviesDataStore mode](self, "mode") == 0;
}

- (id)_moviesFetchResponseFromFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  if (-[TVHMoviesDataStore mode](self, "mode") > 1)
  {
    v6 = 0LL;
  }

  else
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 resultForRequestIdentifier:@"MoviesFetchRequestIdentifier"]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 response]);
  }

  return v6;
}

- (id)_movieRentalsFetchResponseFromFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  if ((-[TVHMoviesDataStore mode](self, "mode") | 2) == 2)
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 resultForRequestIdentifier:@"MovieRentalsFetchRequestIdentifier"]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 response]);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (id)_allContentCatalogueDataSource
{
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesDataStore moviesFetchRequest](self, "moviesFetchRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v31 identifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"RECENTLY_ADDED_TITLE" value:0 table:0]);

  id v25 = -[TVHCatalogueRecentlyAddedItem initWithTitle:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHCatalogueRecentlyAddedItem),  "initWithTitle:fetchRequestIdentifier:",  v30,  v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"MOVIES_TITLE" value:0 table:0]);

  uint64_t v24 = -[TVHCatalogueItem initWithTitle:hideable:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHCatalogueItem),  "initWithTitle:hideable:fetchRequestIdentifier:",  v29,  0LL,  v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"UNWATCHED_TITLE" value:0 table:0]);

  v23 = -[TVHCataloguePlayedStateItem initWithTitle:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHCataloguePlayedStateItem),  "initWithTitle:fetchRequestIdentifier:",  v28,  v3);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesDataStore movieRentalsFetchRequest](self, "movieRentalsFetchRequest"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"MOVIE_RENTALS_TITLE" value:0 table:0]);

  v8 = objc_alloc(&OBJC_CLASS___TVHCatalogueItem);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
  id v10 = -[TVHCatalogueItem initWithTitle:hideable:fetchRequestIdentifier:]( v8,  "initWithTitle:hideable:fetchRequestIdentifier:",  v26,  1LL,  v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesDataStore moviePlaylistsFetchRequest](self, "moviePlaylistsFetchRequest"));
  v12 = objc_alloc(&OBJC_CLASS___TVHCataloguePlaylistsItem);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  v14 = -[TVHCataloguePlaylistsItem initWithPlaylistItemMediaCategoryTypes:fetchRequestIdentifier:]( v12,  "initWithPlaylistItemMediaCategoryTypes:fetchRequestIdentifier:",  &off_100106B60,  v13);

  v33[0] = v25;
  v33[1] = v10;
  v33[2] = v24;
  v33[3] = v23;
  v33[4] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 5LL));
  uint64_t v16 = -[TVHCatalogueSection initWithItems:](objc_alloc(&OBJC_CLASS___TVHCatalogueSection), "initWithItems:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedStringForKey:@"GENRES_TITLE" value:0 table:0]);

  uint64_t v19 = -[TVHCatalogueGroupingSection initWithGroupingKey:title:fetchRequestIdentifier:]( objc_alloc(&OBJC_CLASS___TVHCatalogueGroupingSection),  "initWithGroupingKey:title:fetchRequestIdentifier:",  @"genreTitle",  v18,  v3);
  v32[0] = v16;
  v32[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
  uint64_t v21 = -[TVHCatalogueDataSource initWithSections:]( objc_alloc(&OBJC_CLASS___TVHCatalogueDataSource),  "initWithSections:",  v20);

  return v21;
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSArray)fetchRequests
{
  return self->_fetchRequests;
}

- (TVHMoviesInfoCenter)moviesInfoCenter
{
  return self->_moviesInfoCenter;
}

- (TVHMoviesInfoCenter)movieRentalsInfoCenter
{
  return self->_movieRentalsInfoCenter;
}

- (NSString)fetchControllerIdentifier
{
  return self->_fetchControllerIdentifier;
}

- (TVHKMediaEntitiesFetchRequest)moviesFetchRequest
{
  return self->_moviesFetchRequest;
}

- (void)setMoviesFetchRequest:(id)a3
{
}

- (TVHKMediaEntitiesFetchRequest)movieRentalsFetchRequest
{
  return self->_movieRentalsFetchRequest;
}

- (void)setMovieRentalsFetchRequest:(id)a3
{
}

- (TVHKMediaEntitiesFetchRequest)moviePlaylistsFetchRequest
{
  return self->_moviePlaylistsFetchRequest;
}

- (void)setMoviePlaylistsFetchRequest:(id)a3
{
}

- (unint64_t)completedFetchCount
{
  return self->_completedFetchCount;
}

- (void)setCompletedFetchCount:(unint64_t)a3
{
  self->_completedFetchCount = a3;
}

- (void).cxx_destruct
{
}

@end