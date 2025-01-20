@interface TVHCatalogueDataSource
+ (TVHCatalogueDataSource)new;
- (BOOL)hasProcessedInitialMediaEntitiesFetchControllerResultSet;
- (NSArray)indexTitles;
- (NSArray)sections;
- (NSDictionary)sectionByIdentifier;
- (NSOrderedSet)sectionIdentifiers;
- (NSString)headerTitle;
- (TVHCatalogueDataSource)init;
- (TVHCatalogueDataSource)initWithSections:(id)a3;
- (TVHCataloguePlaylistsItem)playlistsItem;
- (TVHDiffableDataSourceContentProviderDelegate)diffableDataSourceContentProviderDelegate;
- (id)_itemInSection:(id)a3 atIndex:(unint64_t)a4;
- (id)_sectionAtIndex:(unint64_t)a3;
- (id)_sectionForIdentifier:(id)a3;
- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4;
- (id)itemForIdentifier:(id)a3;
- (id)itemForIndexPath:(id)a3;
- (id)itemIdentifierForIndexPath:(id)a3;
- (id)itemIdentifiersInSectionWithIdentifier:(id)a3;
- (id)relatedContentForIndexPath:(id)a3;
- (id)sectionTitleAIndex:(unint64_t)a3;
- (void)setDiffableDataSourceContentProviderDelegate:(id)a3;
- (void)setHasProcessedInitialMediaEntitiesFetchControllerResultSet:(BOOL)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setSectionByIdentifier:(id)a3;
- (void)updateWithMediaEntitiesFetchControllerResultSet:(id)a3;
@end

@implementation TVHCatalogueDataSource

+ (TVHCatalogueDataSource)new
{
  return 0LL;
}

- (TVHCatalogueDataSource)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHCatalogueDataSource)initWithSections:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___TVHCatalogueDataSource;
  v5 = -[TVHCatalogueDataSource init](&v37, "init");
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    sections = v5->_sections;
    v5->_sections = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    v26 = v5;
    obj = v5->_sections;
    id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v39,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v34;
      p_playlistsItem = (id *)&v5->_playlistsItem;
      do
      {
        v13 = 0LL;
        id v27 = v10;
        do
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
          -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v14, v15);

          if (!*p_playlistsItem)
          {
            __int128 v31 = 0u;
            __int128 v32 = 0u;
            __int128 v29 = 0u;
            __int128 v30 = 0u;
            v16 = (void *)objc_claimAutoreleasedReturnValue([v14 items]);
            id v17 = [v16 countByEnumeratingWithState:&v29 objects:v38 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v30;
              while (2)
              {
                for (i = 0LL; i != v18; i = (char *)i + 1)
                {
                  if (*(void *)v30 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  v21 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
                  uint64_t v22 = objc_opt_class(&OBJC_CLASS___TVHCataloguePlaylistsItem);
                  if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
                  {
                    objc_storeStrong(p_playlistsItem, v21);
                    goto LABEL_18;
                  }
                }

                id v18 = [v16 countByEnumeratingWithState:&v29 objects:v38 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
            }

- (void)updateWithMediaEntitiesFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueDataSource sections](self, "sections"));
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v10);
        id v15 = 0LL;
        [v11 updateWithMediaEntitiesFetchControllerResultSet:v4 itemIdentifiersOfAmendedItems:&v15];
        id v12 = v15;
        if (v12) {
          -[NSMutableSet unionSet:](v5, "unionSet:", v12);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  id v13 = [v4 hasChanges];
  if ((v13 & 1) != 0
    || !-[TVHCatalogueDataSource hasProcessedInitialMediaEntitiesFetchControllerResultSet]( self,  "hasProcessedInitialMediaEntitiesFetchControllerResultSet"))
  {
    -[TVHCatalogueDataSource setHasProcessedInitialMediaEntitiesFetchControllerResultSet:]( self,  "setHasProcessedInitialMediaEntitiesFetchControllerResultSet:",  1LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVHCatalogueDataSource diffableDataSourceContentProviderDelegate]( self,  "diffableDataSourceContentProviderDelegate"));
    [v14 diffableDataSourceContentProvider:self contentDidChangeWithAnimateChanges:v13 itemIdentifiersOfAmendedItems:v5];
  }
}

- (id)itemForIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueDataSource sections](self, "sections", 0LL));
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
          uint64_t v11 = (void *)v10;
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

  uint64_t v11 = 0LL;
LABEL_11:

  return v11;
}

- (id)itemForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueDataSource _sectionAtIndex:](self, "_sectionAtIndex:", [v4 section]));
  id v6 = [v4 item];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueDataSource _itemInSection:atIndex:](self, "_itemInSection:atIndex:", v5, v6));
  return v7;
}

- (id)relatedContentForIndexPath:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueDataSource itemForIndexPath:](self, "itemForIndexPath:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 relatedContent]);

  return v4;
}

- (NSOrderedSet)sectionIdentifiers
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueDataSource sections](self, "sections", 0LL));
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueDataSource _sectionAtIndex:](self, "_sectionAtIndex:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);

  return v4;
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueDataSource _sectionForIdentifier:](self, "_sectionForIdentifier:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayableItems]);
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
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "identifier", (void)v13));
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueDataSource itemForIndexPath:](self, "itemForIndexPath:", a3));
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
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueDataSource sections](self, "sections"));
  else {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:a3]);
  }

  return v5;
}

- (id)_sectionForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueDataSource sectionByIdentifier](self, "sectionByIdentifier"));
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
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 displayableItems]);
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

- (TVHCataloguePlaylistsItem)playlistsItem
{
  return self->_playlistsItem;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
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