@interface TVHShowsInfoCenter
+ (TVHShowsInfoCenter)new;
- (NSArray)shows;
- (NSDictionary)showByIdentifier;
- (NSDictionary)showsByGenreTitle;
- (NSHashTable)observers;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHShowsInfoCenter)init;
- (TVHShowsInfoCenter)initWithMediaLibrary:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setShowByIdentifier:(id)a3;
- (void)setShows:(id)a3;
- (void)setShowsByGenreTitle:(id)a3;
- (void)updateWithFetchResponse:(id)a3;
@end

@implementation TVHShowsInfoCenter

+ (TVHShowsInfoCenter)new
{
  return 0LL;
}

- (TVHShowsInfoCenter)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHShowsInfoCenter)initWithMediaLibrary:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHShowsInfoCenter;
  v6 = -[TVHShowsInfoCenter init](&v13, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_mediaLibrary, a3);
    showByIdentifier = v6->_showByIdentifier;
    v6->_showByIdentifier = (NSDictionary *)&__NSDictionary0__struct;

    showsByGenreTitle = v6->_showsByGenreTitle;
    v6->_showsByGenreTitle = (NSDictionary *)&__NSDictionary0__struct;

    shows = v6->_shows;
    v6->_shows = (NSArray *)&__NSArray0__struct;
  }

  return v6;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHShowsInfoCenter observers](self, "observers"));
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHShowsInfoCenter observers](self, "observers"));
  [v5 removeObject:v4];
}

- (void)updateWithFetchResponse:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaEntitiesResult]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntities]);

  -[TVHShowsInfoCenter setShows:](self, "setShows:", v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntityUtilities mediaEntityCollectionByIdentifierFromMediaEntityCollections:]( &OBJC_CLASS___TVHMediaEntityUtilities,  "mediaEntityCollectionByIdentifierFromMediaEntityCollections:",  v6));
  -[TVHShowsInfoCenter setShowByIdentifier:](self, "setShowByIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 groupings]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"genreTitle"]);

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntityUtilities mediaEntityCollectionsByGroupTitleFromGrouping:]( &OBJC_CLASS___TVHMediaEntityUtilities,  "mediaEntityCollectionsByGroupTitleFromGrouping:",  v9));
  -[TVHShowsInfoCenter setShowsByGenreTitle:](self, "setShowsByGenreTitle:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowsInfoCenter observers](self, "observers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v17), "showsInfoCenterDidChange:", self, (void)v18);
        v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v15);
  }
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (NSArray)shows
{
  return self->_shows;
}

- (void)setShows:(id)a3
{
}

- (NSDictionary)showByIdentifier
{
  return self->_showByIdentifier;
}

- (void)setShowByIdentifier:(id)a3
{
}

- (NSDictionary)showsByGenreTitle
{
  return self->_showsByGenreTitle;
}

- (void)setShowsByGenreTitle:(id)a3
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