@interface TVHMusicMainGenresSection
+ (id)new;
- (NSArray)items;
- (NSDictionary)itemByIdentifier;
- (NSMutableArray)genreItems;
- (NSString)fetchRequestIdentifier;
- (NSString)identifier;
- (NSString)title;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHMusicMainGenresSection)init;
- (TVHMusicMainGenresSection)initWithMediaLibrary:(id)a3 fetchRequestIdentifier:(id)a4;
- (id)itemForIdentifier:(id)a3;
- (void)setGenreItems:(id)a3;
- (void)setItemByIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateWithMediaEntitiesFetchControllerResult:(id)a3;
@end

@implementation TVHMusicMainGenresSection

+ (id)new
{
  return 0LL;
}

- (TVHMusicMainGenresSection)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMusicMainGenresSection)initWithMediaLibrary:(id)a3 fetchRequestIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVHMusicMainGenresSection;
  v9 = -[TVHMusicMainGenresSection init](&v22, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibrary, a3);
    v11 = (NSString *)[v8 copy];
    fetchRequestIdentifier = v10->_fetchRequestIdentifier;
    v10->_fetchRequestIdentifier = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:@"GENRES_TITLE" value:0 table:0]);
    title = v10->_title;
    v10->_title = (NSString *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 UUIDString]);
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    genreItems = v10->_genreItems;
    v10->_genreItems = v19;
  }

  return v10;
}

- (NSArray)items
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainGenresSection genreItems](self, "genreItems"));
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (id)itemForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainGenresSection itemByIdentifier](self, "itemByIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  return v6;
}

- (void)updateWithMediaEntitiesFetchControllerResult:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 response]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 changeSet]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntitiesResult]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntitiesChangeSet]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainGenresSection genreItems](self, "genreItems"));
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_1000733F0;
  uint64_t v14 = &unk_1000FDB88;
  id v15 = v7;
  v16 = self;
  id v10 = v7;
  objc_msgSend( v9,  "tvhk_applyChangeSetIfAvailable:destinationObjectsBlock:replaceContentsOnNilChangeSet:",  v8,  &v11,  1);

  -[TVHMusicMainGenresSection setItemByIdentifier:](self, "setItemByIdentifier:", 0LL, v11, v12, v13, v14);
}

- (NSDictionary)itemByIdentifier
{
  itemByIdentifier = self->_itemByIdentifier;
  if (!itemByIdentifier)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainGenresSection genreItems](self, "genreItems", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, v11);
        }

        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v7);
    }

    uint64_t v12 = (NSDictionary *)-[NSMutableDictionary copy](v4, "copy");
    v13 = self->_itemByIdentifier;
    self->_itemByIdentifier = v12;

    itemByIdentifier = self->_itemByIdentifier;
  }

  return itemByIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)fetchRequestIdentifier
{
  return self->_fetchRequestIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (NSMutableArray)genreItems
{
  return self->_genreItems;
}

- (void)setGenreItems:(id)a3
{
}

- (void)setItemByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end