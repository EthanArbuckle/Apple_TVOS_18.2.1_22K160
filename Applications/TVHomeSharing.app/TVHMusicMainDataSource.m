@interface TVHMusicMainDataSource
+ (TVHMusicMainDataSource)new;
- (BOOL)hasProcessedInitialMediaEntitiesFetchControllerResultSet;
- (NSArray)indexTitles;
- (NSArray)sections;
- (NSDictionary)sectionByIdentifier;
- (NSOrderedSet)sectionIdentifiers;
- (TVHDiffableDataSourceContentProviderDelegate)diffableDataSourceContentProviderDelegate;
- (TVHMusicMainDataSource)init;
- (TVHMusicMainDataSource)initWithSections:(id)a3;
- (id)_itemInSection:(id)a3 atIndex:(unint64_t)a4;
- (id)_sectionAtIndex:(unint64_t)a3;
- (id)_sectionForIdentifier:(id)a3;
- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4;
- (id)itemForIdentifier:(id)a3;
- (id)itemForIndexPath:(id)a3;
- (id)itemIdentifierForIndexPath:(id)a3;
- (id)itemIdentifiersInSectionWithIdentifier:(id)a3;
- (id)sectionTitleAIndex:(unint64_t)a3;
- (void)setDiffableDataSourceContentProviderDelegate:(id)a3;
- (void)setHasProcessedInitialMediaEntitiesFetchControllerResultSet:(BOOL)a3;
- (void)setSectionByIdentifier:(id)a3;
- (void)updateWithMediaEntitiesFetchControllerResultSet:(id)a3;
@end

@implementation TVHMusicMainDataSource

+ (TVHMusicMainDataSource)new
{
  return 0LL;
}

- (TVHMusicMainDataSource)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMusicMainDataSource)initWithSections:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVHMusicMainDataSource;
  v5 = -[TVHMusicMainDataSource init](&v23, "init");
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    sections = v5->_sections;
    v5->_sections = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    v9 = v5->_sections;
    id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier", (void)v19));
          -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v14, v15);
        }

        id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
      }

      while (v11);
    }

    v16 = (NSDictionary *)-[NSMutableDictionary copy](v8, "copy");
    sectionByIdentifier = v5->_sectionByIdentifier;
    v5->_sectionByIdentifier = v16;
  }

  return v5;
}

- (void)updateWithMediaEntitiesFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainDataSource sections](self, "sections"));
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    v17 = self;
    unsigned __int8 v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ([v11 conformsToProtocol:&OBJC_PROTOCOL___TVHMusicMainFetchResponseHandlingSection])
        {
          id v12 = v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 fetchRequestIdentifier]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v4 resultForRequestIdentifier:v13]);

          if (v14)
          {
            if ((v8 & 1) != 0) {
              unsigned __int8 v8 = 1;
            }
            else {
              unsigned __int8 v8 = [v14 hasChanges];
            }
            [v12 updateWithMediaEntitiesFetchControllerResult:v14];
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);

    self = v17;
    if ((v8 & 1) != 0)
    {
      uint64_t v15 = 1LL;
LABEL_20:
      -[TVHMusicMainDataSource setHasProcessedInitialMediaEntitiesFetchControllerResultSet:]( self,  "setHasProcessedInitialMediaEntitiesFetchControllerResultSet:",  1LL);
      v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMusicMainDataSource diffableDataSourceContentProviderDelegate]( self,  "diffableDataSourceContentProviderDelegate"));
      [v16 diffableDataSourceContentProvider:self contentDidChangeWithAnimateChanges:v15 itemIdentifiersOfAmendedItems:0];

      goto LABEL_21;
    }
  }

  else
  {
  }

  if (!-[TVHMusicMainDataSource hasProcessedInitialMediaEntitiesFetchControllerResultSet]( self,  "hasProcessedInitialMediaEntitiesFetchControllerResultSet"))
  {
    uint64_t v15 = 0LL;
    goto LABEL_20;
  }

- (id)itemForIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainDataSource sections](self, "sections", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) itemForIdentifier:v4]);
        if (v10)
        {
          id v11 = (void *)v10;
          goto LABEL_11;
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = 0LL;
LABEL_11:

  return v11;
}

- (id)itemForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainDataSource _sectionAtIndex:](self, "_sectionAtIndex:", [v4 section]));
  id v6 = [v4 item];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainDataSource _itemInSection:atIndex:](self, "_itemInSection:atIndex:", v5, v6));
  return v7;
}

- (NSOrderedSet)sectionIdentifiers
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainDataSource sections](self, "sections", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) identifier]);
        -[NSMutableOrderedSet addObject:](v3, "addObject:", v9);

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  id v10 = -[NSMutableOrderedSet copy](v3, "copy");
  return (NSOrderedSet *)v10;
}

- (id)sectionTitleAIndex:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainDataSource _sectionAtIndex:](self, "_sectionAtIndex:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);

  return v4;
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainDataSource _sectionForIdentifier:](self, "_sectionForIdentifier:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 items]);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "identifier", (void)v13));
        -[NSMutableOrderedSet addObject:](v5, "addObject:", v11);

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainDataSource itemForIndexPath:](self, "itemForIndexPath:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  return v4;
}

- (NSArray)indexTitles
{
  return 0LL;
}

- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  return 0LL;
}

- (id)_sectionAtIndex:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainDataSource sections](self, "sections"));
  else {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:a3]);
  }

  return v5;
}

- (id)_sectionForIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainDataSource sectionByIdentifier](self, "sectionByIdentifier"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)_itemInSection:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 items]);
  else {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:a4]);
  }

  return v6;
}

- (TVHDiffableDataSourceContentProviderDelegate)diffableDataSourceContentProviderDelegate
{
  return (TVHDiffableDataSourceContentProviderDelegate *)objc_loadWeakRetained((id *)&self->_diffableDataSourceContentProviderDelegate);
}

- (void)setDiffableDataSourceContentProviderDelegate:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (BOOL)hasProcessedInitialMediaEntitiesFetchControllerResultSet
{
  return self->_hasProcessedInitialMediaEntitiesFetchControllerResultSet;
}

- (void)setHasProcessedInitialMediaEntitiesFetchControllerResultSet:(BOOL)a3
{
  self->_hasProcessedInitialMediaEntitiesFetchControllerResultSet = a3;
}

- (NSDictionary)sectionByIdentifier
{
  return self->_sectionByIdentifier;
}

- (void)setSectionByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end