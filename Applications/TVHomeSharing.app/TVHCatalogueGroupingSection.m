@interface TVHCatalogueGroupingSection
+ (id)new;
- (NSArray)displayableItems;
- (NSArray)items;
- (NSDictionary)groupItemByIdentifier;
- (NSMutableArray)groupItems;
- (NSString)fetchRequestIdentifier;
- (NSString)groupingKey;
- (NSString)identifier;
- (NSString)title;
- (TVHCatalogueGroupingSection)init;
- (TVHCatalogueGroupingSection)initWithGroupingKey:(id)a3 title:(id)a4 fetchRequestIdentifier:(id)a5;
- (id)_itemForIdentifier:(id)a3;
- (id)_itemsWithGrouping:(id)a3 atGroupIndexes:(id)a4;
- (id)_mediaEntitiesDataSourceFetchResultWithGroup:(id)a3 changeSet:(id)a4;
- (id)itemForIdentifier:(id)a3;
- (void)setGroupItemByIdentifier:(id)a3;
- (void)setGroupItems:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateWithMediaEntitiesFetchControllerResultSet:(id)a3 itemIdentifiersOfAmendedItems:(id *)a4;
@end

@implementation TVHCatalogueGroupingSection

+ (id)new
{
  return 0LL;
}

- (TVHCatalogueGroupingSection)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHCatalogueGroupingSection)initWithGroupingKey:(id)a3 title:(id)a4 fetchRequestIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVHCatalogueGroupingSection;
  v11 = -[TVHCatalogueGroupingSection init](&v24, "init");
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    groupingKey = v11->_groupingKey;
    v11->_groupingKey = v12;

    v14 = (NSString *)[v9 copy];
    title = v11->_title;
    v11->_title = v14;

    v16 = (NSString *)[v10 copy];
    fetchRequestIdentifier = v11->_fetchRequestIdentifier;
    v11->_fetchRequestIdentifier = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 UUIDString]);
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v19;

    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    groupItems = v11->_groupItems;
    v11->_groupItems = v21;
  }

  return v11;
}

- (NSArray)items
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueGroupingSection groupItems](self, "groupItems"));
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (NSArray)displayableItems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueGroupingSection items](self, "items"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_mapNoNulls:", &stru_1000FE6B8));

  return (NSArray *)v3;
}

- (id)itemForIdentifier:(id)a3
{
  return -[TVHCatalogueGroupingSection _itemForIdentifier:](self, "_itemForIdentifier:", a3);
}

- (void)updateWithMediaEntitiesFetchControllerResultSet:(id)a3 itemIdentifiersOfAmendedItems:(id *)a4
{
  id v5 = a3;
  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueGroupingSection groupingKey](self, "groupingKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueGroupingSection fetchRequestIdentifier](self, "fetchRequestIdentifier"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 resultForRequestIdentifier:v7]);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 response]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v19 groupings]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v6]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 changeSet]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 groupingChangeSets]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v6]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueGroupingSection groupItems](self, "groupItems"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10005F4A4;
  v24[3] = &unk_1000FDB88;
  v24[4] = self;
  id v25 = v10;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10005F4B4;
  v20[3] = &unk_1000FE6E0;
  id v21 = v25;
  v22 = self;
  v15 = v17;
  v23 = v15;
  id v16 = v25;
  objc_msgSend( v14,  "tvhk_applyChangeSetIfAvailable:destinationObjectsBlock:amendObjectBlock:replaceContentsOnNilChangeSet:",  v13,  v24,  v20,  1);

  -[TVHCatalogueGroupingSection setGroupItemByIdentifier:](self, "setGroupItemByIdentifier:", 0LL);
  if (a4) {
    *a4 = -[NSMutableSet copy](v15, "copy");
  }
}

- (NSDictionary)groupItemByIdentifier
{
  groupItemByIdentifier = self->_groupItemByIdentifier;
  if (!groupItemByIdentifier)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueGroupingSection groupItems](self, "groupItems", 0LL));
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

    v12 = (NSDictionary *)-[NSMutableDictionary copy](v4, "copy");
    v13 = self->_groupItemByIdentifier;
    self->_groupItemByIdentifier = v12;

    groupItemByIdentifier = self->_groupItemByIdentifier;
  }

  return groupItemByIdentifier;
}

- (id)_itemForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueGroupingSection groupItemByIdentifier](self, "groupItemByIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  return v6;
}

- (id)_itemsWithGrouping:(id)a3 atGroupIndexes:(id)a4
{
  id v6 = (NSIndexSet *)a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 groups]);
  if (!v6) {
    id v6 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  0,  [v7 count]);
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectsAtIndexes:v6]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10005F808;
  v11[3] = &unk_1000FE708;
  v11[4] = self;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_map:", v11));

  return v9;
}

- (id)_mediaEntitiesDataSourceFetchResultWithGroup:(id)a3 changeSet:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntities]);
  id v10 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( v7,  "initWithIdentifier:mediaEntities:",  v8,  v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 indexBarItems]);
  -[TVHMediaEntitiesDataSourceFetchResult setIndexBarItems:](v10, "setIndexBarItems:", v11);

  -[TVHMediaEntitiesDataSourceFetchResult setChangeSet:](v10, "setChangeSet:", v5);
  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)groupingKey
{
  return self->_groupingKey;
}

- (NSString)fetchRequestIdentifier
{
  return self->_fetchRequestIdentifier;
}

- (NSMutableArray)groupItems
{
  return self->_groupItems;
}

- (void)setGroupItems:(id)a3
{
}

- (void)setGroupItemByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end