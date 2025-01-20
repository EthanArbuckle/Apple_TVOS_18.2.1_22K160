@interface TVHMediaEntitiesDataSourceSection
- (NSArray)indexTitles;
- (NSArray)itemCollections;
- (NSArray)mediaEntities;
- (NSString)fetchResultIdentifier;
- (NSString)identifier;
- (NSString)title;
- (TVHMediaEntitiesDataSourceSection)initWithIdentifier:(id)a3 fetchResultIdentifier:(id)a4 itemCollections:(id)a5;
- (id)_itemCollectionForItemIndex:(unint64_t)a3 adjustedIndex:(unint64_t *)a4;
- (id)mediaEntityForIndex:(unint64_t)a3;
- (int64_t)itemIndexForIndexTitle:(id)a3;
- (unint64_t)numberOfMediaEntities;
- (void)setTitle:(id)a3;
@end

@implementation TVHMediaEntitiesDataSourceSection

- (TVHMediaEntitiesDataSourceSection)initWithIdentifier:(id)a3 fetchResultIdentifier:(id)a4 itemCollections:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesDataSourceSection;
  v11 = -[TVHMediaEntitiesDataSourceSection init](&v19, "init");
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = v12;

    v14 = (NSString *)[v9 copy];
    fetchResultIdentifier = v11->_fetchResultIdentifier;
    v11->_fetchResultIdentifier = v14;

    v16 = (NSArray *)[v10 copy];
    itemCollections = v11->_itemCollections;
    v11->_itemCollections = v16;
  }

  return v11;
}

- (unint64_t)numberOfMediaEntities
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSourceSection itemCollections](self, "itemCollections", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v10 + 1) + 8 * (void)i) mediaEntities]);
        v5 += (unint64_t)[v8 count];
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return v5;
}

- (NSArray)mediaEntities
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSourceSection itemCollections](self, "itemCollections", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) mediaEntities]);
        -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v9);

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  id v10 = -[NSMutableArray copy](v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)indexTitles
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSourceSection itemCollections](self, "itemCollections", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0LL;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)i) indexTitle]);
        if (v8)
        {
          if (!v5) {
            id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          -[NSMutableArray addObject:](v5, "addObject:", v8);
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }

  else
  {
    id v5 = 0LL;
  }

  id v9 = -[NSMutableArray copy](v5, "copy");
  return (NSArray *)v9;
}

- (int64_t)itemIndexForIndexTitle:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSourceSection itemCollections](self, "itemCollections", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    int64_t v8 = 0LL;
    uint64_t v9 = *(void *)v17;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v5);
      }
      __int128 v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 indexTitle]);
      unsigned __int8 v13 = [v12 isEqualToString:v4];

      if ((v13 & 1) != 0) {
        break;
      }
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v11 mediaEntities]);
      v8 += (int64_t)[v14 count];

      if (v7 == (id)++v10)
      {
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (id)mediaEntityForIndex:(unint64_t)a3
{
  uint64_t v8 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesDataSourceSection _itemCollectionForItemIndex:adjustedIndex:]( self,  "_itemCollectionForItemIndex:adjustedIndex:",  a3,  &v8));
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaEntities]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v8]);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_itemCollectionForItemIndex:(unint64_t)a3 adjustedIndex:(unint64_t *)a4
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSourceSection itemCollections](self, "itemCollections", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      uint64_t v10 = 0LL;
      __int128 v11 = v8;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v10);
        unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaEntities]);
        id v14 = [v13 count];

        if (v14)
        {
          uint64_t v8 = &v11[(void)v14];
          if ((unint64_t)(v8 - 1) >= a3)
          {
            id v15 = v12;
            id v7 = v15;
            if (a4) {
              *a4 = a3 - (void)v11;
            }
            goto LABEL_15;
          }
        }

        else
        {
          uint64_t v8 = v11;
        }

        uint64_t v10 = (char *)v10 + 1;
        __int128 v11 = v8;
      }

      while (v7 != v10);
      id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)fetchResultIdentifier
{
  return self->_fetchResultIdentifier;
}

- (NSArray)itemCollections
{
  return self->_itemCollections;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end