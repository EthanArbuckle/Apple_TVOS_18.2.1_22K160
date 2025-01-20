@interface TVHMoviesInfoCenter
+ (id)new;
- (NSArray)movies;
- (NSDictionary)movieByIdentifier;
- (NSDictionary)moviesByContributorTitle;
- (NSDictionary)moviesByGenreTitle;
- (NSHashTable)observers;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHMoviesInfoCenter)init;
- (TVHMoviesInfoCenter)initWithMediaLibrary:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setMovieByIdentifier:(id)a3;
- (void)setMovies:(id)a3;
- (void)setMoviesByContributorTitle:(id)a3;
- (void)setMoviesByGenreTitle:(id)a3;
- (void)setObservers:(id)a3;
- (void)updateWithFetchResponse:(id)a3;
@end

@implementation TVHMoviesInfoCenter

+ (id)new
{
  return 0LL;
}

- (TVHMoviesInfoCenter)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMoviesInfoCenter)initWithMediaLibrary:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHMoviesInfoCenter;
  v6 = -[TVHMoviesInfoCenter init](&v14, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_mediaLibrary, a3);
    moviesByContributorTitle = v6->_moviesByContributorTitle;
    v6->_moviesByContributorTitle = (NSDictionary *)&__NSDictionary0__struct;

    movieByIdentifier = v6->_movieByIdentifier;
    v6->_movieByIdentifier = (NSDictionary *)&__NSDictionary0__struct;

    moviesByGenreTitle = v6->_moviesByGenreTitle;
    v6->_moviesByGenreTitle = (NSDictionary *)&__NSDictionary0__struct;

    movies = v6->_movies;
    v6->_movies = (NSArray *)&__NSArray0__struct;
  }

  return v6;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMoviesInfoCenter observers](self, "observers"));
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMoviesInfoCenter observers](self, "observers"));
  [v5 removeObject:v4];
}

- (void)updateWithFetchResponse:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaEntitiesResult]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntities]);

  -[TVHMoviesInfoCenter setMovies:](self, "setMovies:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntityUtilities mediaItemByIdentifierFromMediaItems:]( &OBJC_CLASS___TVHMediaEntityUtilities,  "mediaItemByIdentifierFromMediaItems:",  v6));
  -[TVHMoviesInfoCenter setMovieByIdentifier:](self, "setMovieByIdentifier:");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntityUtilities mediaItemsByContributorFromMediaItems:]( &OBJC_CLASS___TVHMediaEntityUtilities,  "mediaItemsByContributorFromMediaItems:",  v6));
  -[TVHMoviesInfoCenter setMoviesByContributorTitle:](self, "setMoviesByContributorTitle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 groupings]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"genreTitle"]);

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntityUtilities mediaItemsByGroupTitleFromGrouping:]( &OBJC_CLASS___TVHMediaEntityUtilities,  "mediaItemsByGroupTitleFromGrouping:",  v9));
  -[TVHMoviesInfoCenter setMoviesByGenreTitle:](self, "setMoviesByGenreTitle:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesInfoCenter observers](self, "observers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v17) moviesInfoCenterDidChange:self];
        v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v15);
  }
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (NSArray)movies
{
  return self->_movies;
}

- (void)setMovies:(id)a3
{
}

- (NSDictionary)moviesByContributorTitle
{
  return self->_moviesByContributorTitle;
}

- (void)setMoviesByContributorTitle:(id)a3
{
}

- (NSDictionary)movieByIdentifier
{
  return self->_movieByIdentifier;
}

- (void)setMovieByIdentifier:(id)a3
{
}

- (NSDictionary)moviesByGenreTitle
{
  return self->_moviesByGenreTitle;
}

- (void)setMoviesByGenreTitle:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end