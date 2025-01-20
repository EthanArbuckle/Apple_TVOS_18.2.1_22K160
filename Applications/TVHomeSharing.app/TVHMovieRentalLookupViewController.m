@interface TVHMovieRentalLookupViewController
- (TVHKMediaEntityIdentifier)movieIdentifier;
- (TVHMovieRentalLookupViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHMovieRentalLookupViewController)initWithMovieRentalIdentifier:(id)a3 mediaLibrary:(id)a4;
- (TVHMoviesDataStore)dataStore;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_updateDataStoreWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
@end

@implementation TVHMovieRentalLookupViewController

- (TVHMovieRentalLookupViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHMovieRentalLookupViewController)initWithMovieRentalIdentifier:(id)a3 mediaLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[TVHMoviesDataStore initWithMediaLibrary:mode:]( objc_alloc(&OBJC_CLASS___TVHMoviesDataStore),  "initWithMediaLibrary:mode:",  v8,  2LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesDataStore fetchRequests](v9, "fetchRequests"));
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHMovieRentalLookupViewController;
  v11 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v15,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v8,  v10,  0LL,  0LL,  0LL);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_movieIdentifier, a3);
    objc_storeStrong((id *)&v11->_dataStore, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:@"NO_MOVIE_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v11, "setNoContentErrorMessage:", v13);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v11, "setDelegate:", v11);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v11,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
  }

  return v11;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieRentalLookupViewController dataStore](self, "dataStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 movieRentalsInfoCenter]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 movieByIdentifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieRentalLookupViewController movieIdentifier](self, "movieIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);

  if (v11)
  {
    v12 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchControllerIdentifier](self, "fetchControllerIdentifier"));
    v14 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v12,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v13,  @"MovieRentalsFetchRequestIdentifier");

    objc_super v15 = objc_alloc(&OBJC_CLASS___TVHMovieViewController);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
    v17 = -[TVHMovieViewController initWithMovie:mediaLibrary:moviesFetchContext:moviesInfoCenter:]( v15,  "initWithMovie:mediaLibrary:moviesFetchContext:moviesInfoCenter:",  v11,  v16,  v14,  v8);
  }

  else
  {
    v17 = 0LL;
  }

  return v17;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)_updateDataStoreWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMovieRentalLookupViewController dataStore](self, "dataStore"));
  [v5 updateWithMediaEntitiesFetchControllerResultSet:v4];
}

- (TVHKMediaEntityIdentifier)movieIdentifier
{
  return self->_movieIdentifier;
}

- (TVHMoviesDataStore)dataStore
{
  return self->_dataStore;
}

- (void).cxx_destruct
{
}

@end