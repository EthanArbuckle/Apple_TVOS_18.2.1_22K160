@interface ContactPool
- (ContactPool)initWithContacts:(id)a3;
- (NSArray)allContacts;
- (NSDictionary)contactByIdCache;
- (id)allContactIds;
- (id)contactWithId:(id)a3;
- (id)contactsWithIds:(id)a3;
- (unint64_t)count;
@end

@implementation ContactPool

- (ContactPool)initWithContacts:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___ContactPool;
  v5 = -[ContactPool init](&v24, "init");
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    allContacts = v5->_allContacts;
    v5->_allContacts = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier", (void)v20));

          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, v16);
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }

      while (v11);
    }

    v17 = (NSDictionary *)-[NSMutableDictionary copy](v8, "copy");
    contactByIdCache = v5->_contactByIdCache;
    v5->_contactByIdCache = v17;
  }

  return v5;
}

- (unint64_t)count
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContactPool allContacts](self, "allContacts"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)allContactIds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContactPool contactByIdCache](self, "contactByIdCache"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  return v4;
}

- (id)contactWithId:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactPool contactByIdCache](self, "contactByIdCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (id)contactsWithIds:(id)a3
{
  id v4 = a3;
  v5 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[ContactPool contactWithId:]( self,  "contactWithId:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10),  (void)v14));
        if (v11) {
          -[NSMutableArray addObject:](v5, "addObject:", v11);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  id v12 = -[NSMutableArray copy](v5, "copy");
  return v12;
}

- (NSArray)allContacts
{
  return self->_allContacts;
}

- (NSDictionary)contactByIdCache
{
  return self->_contactByIdCache;
}

- (void).cxx_destruct
{
}

@end