@interface CSDCallDataSourceMap
- (CSDCallDataSourceMap)init;
- (NSArray)dataSources;
- (NSMapTable)dataSourceToIdentifierToCalls;
- (id)callsForDataSource:(id)a3 identifier:(id)a4;
- (void)addCalls:(id)a3 forIdentifier:(id)a4;
- (void)setDataSourceToIdentifierToCalls:(id)a3;
@end

@implementation CSDCallDataSourceMap

- (CSDCallDataSourceMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSDCallDataSourceMap;
  v2 = -[CSDCallDataSourceMap init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    dataSourceToIdentifierToCalls = v2->_dataSourceToIdentifierToCalls;
    v2->_dataSourceToIdentifierToCalls = (NSMapTable *)v3;
  }

  return v2;
}

- (NSArray)dataSources
{
  v2 = (NSMapTable *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSourceMap dataSourceToIdentifierToCalls](self, "dataSourceToIdentifierToCalls"));
  uint64_t v3 = NSAllMapTableKeys(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSArray *)v4;
}

- (void)addCalls:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dataSource]);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSourceMap dataSourceToIdentifierToCalls](self, "dataSourceToIdentifierToCalls"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v13]);

        if (!v15)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSourceMap dataSourceToIdentifierToCalls](self, "dataSourceToIdentifierToCalls"));
          [v16 setObject:v15 forKey:v13];
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v7]);
        if (!v17)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          [v15 setObject:v17 forKeyedSubscript:v7];
        }

        [v17 addObject:v12];
      }

      id v9 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }
}

- (id)callsForDataSource:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSourceMap dataSourceToIdentifierToCalls](self, "dataSourceToIdentifierToCalls"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v7]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);
  if (v10) {
    id v11 = [v10 copy];
  }
  else {
    id v11 = &__NSArray0__struct;
  }

  return v11;
}

- (NSMapTable)dataSourceToIdentifierToCalls
{
  return self->_dataSourceToIdentifierToCalls;
}

- (void)setDataSourceToIdentifierToCalls:(id)a3
{
}

- (void).cxx_destruct
{
}

@end