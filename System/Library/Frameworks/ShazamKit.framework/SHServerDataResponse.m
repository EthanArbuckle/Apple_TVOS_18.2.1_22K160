@interface SHServerDataResponse
- (NSArray)dataArray;
- (NSArray)hapticItemIDs;
- (NSArray)shazamIDs;
- (SHServerDataResponse)initWithDataArray:(id)a3;
- (void)setDataArray:(id)a3;
@end

@implementation SHServerDataResponse

- (SHServerDataResponse)initWithDataArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHServerDataResponse;
  v6 = -[SHServerDataResponse init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataArray, a3);
  }

  return v7;
}

- (NSArray)shazamIDs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerDataResponse dataArray](self, "dataArray"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerDataResponse dataArray](self, "dataArray", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      objc_super v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) objectForKeyedSubscript:@"id"]);
        if (v10) {
          [v4 addObject:v10];
        }

        objc_super v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = [v4 copy];
  return (NSArray *)v11;
}

- (NSArray)hapticItemIDs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerDataResponse dataArray](self, "dataArray"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerDataResponse dataArray](self, "dataArray", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      objc_super v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) objectForKeyedSubscript:@"id"]);
        if (v10) {
          [v4 addObject:v10];
        }

        objc_super v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = [v4 copy];
  return (NSArray *)v11;
}

- (NSArray)dataArray
{
  return self->_dataArray;
}

- (void)setDataArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end