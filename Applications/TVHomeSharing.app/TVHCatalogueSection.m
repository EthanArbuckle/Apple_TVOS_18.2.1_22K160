@interface TVHCatalogueSection
+ (id)new;
- (NSArray)displayableItems;
- (NSArray)fetchResponseHandlingItems;
- (NSDictionary)itemByIdentifier;
- (NSDictionary)itemsByFetchRequestIdentifier;
- (NSString)identifier;
- (NSString)title;
- (TVHCatalogueSection)init;
- (TVHCatalogueSection)initWithItems:(id)a3;
- (id)_itemForIdentifier:(id)a3;
- (id)_itemsForFetchRequestIdentifier:(id)a3;
- (id)itemForIdentifier:(id)a3;
- (void)setItemByIdentifier:(id)a3;
- (void)setItemsByFetchRequestIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateWithMediaEntitiesFetchControllerResultSet:(id)a3 itemIdentifiersOfAmendedItems:(id *)a4;
@end

@implementation TVHCatalogueSection

+ (id)new
{
  return 0LL;
}

- (TVHCatalogueSection)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHCatalogueSection)initWithItems:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___TVHCatalogueSection;
  v5 = -[TVHCatalogueSection init](&v32, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = (NSArray *)[v4 copy];
    fetchResponseHandlingItems = v5->_fetchResponseHandlingItems;
    v5->_fetchResponseHandlingItems = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    v27 = v5;
    v13 = v5->_fetchResponseHandlingItems;
    id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier", v27));
          -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v18, v19);

          v20 = (void *)objc_claimAutoreleasedReturnValue([v18 fetchRequestIdentifier]);
          v21 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v12, "objectForKey:", v20));
          if (!v21)
          {
            v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
            -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v21, v20);
          }

          -[NSMutableSet addObject:](v21, "addObject:", v18);
        }

        id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
      }

      while (v15);
    }

    v22 = (NSDictionary *)-[NSMutableDictionary copy](v11, "copy");
    v5 = v27;
    itemByIdentifier = v27->_itemByIdentifier;
    v27->_itemByIdentifier = v22;

    v24 = (NSDictionary *)-[NSMutableDictionary copy](v12, "copy");
    itemsByFetchRequestIdentifier = v27->_itemsByFetchRequestIdentifier;
    v27->_itemsByFetchRequestIdentifier = v24;
  }

  return v5;
}

- (NSArray)displayableItems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueSection fetchResponseHandlingItems](self, "fetchResponseHandlingItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_mapNoNulls:", &stru_1000FD448));

  return (NSArray *)v3;
}

- (id)itemForIdentifier:(id)a3
{
  return -[TVHCatalogueSection _itemForIdentifier:](self, "_itemForIdentifier:", a3);
}

- (void)updateWithMediaEntitiesFetchControllerResultSet:(id)a3 itemIdentifiersOfAmendedItems:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 requests]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001D880;
  v11[3] = &unk_1000FD470;
  v11[4] = self;
  id v12 = v6;
  v10 = v7;
  v13 = v10;
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:v11];
  if (a4) {
    *a4 = -[NSMutableSet copy](v10, "copy");
  }
}

- (id)_itemForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueSection itemByIdentifier](self, "itemByIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  return v6;
}

- (id)_itemsForFetchRequestIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueSection itemsByFetchRequestIdentifier](self, "itemsByFetchRequestIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  return v6;
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

- (NSArray)fetchResponseHandlingItems
{
  return self->_fetchResponseHandlingItems;
}

- (NSDictionary)itemByIdentifier
{
  return self->_itemByIdentifier;
}

- (void)setItemByIdentifier:(id)a3
{
}

- (NSDictionary)itemsByFetchRequestIdentifier
{
  return self->_itemsByFetchRequestIdentifier;
}

- (void)setItemsByFetchRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end