@interface ICGetGeniusItemsRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 seedID:(unint64_t)a4 numberOfItems:(unsigned int)a5;
- (ICGetGeniusItemsRequest)initWithDatabaseID:(unsigned int)a3 seedID:(unint64_t)a4 numberOfItems:(unsigned int)a5;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICGetGeniusItemsRequest

+ (id)requestWithDatabaseID:(unsigned int)a3 seedID:(unint64_t)a4 numberOfItems:(unsigned int)a5
{
  return  objc_msgSend( objc_alloc((Class)objc_opt_class(a1, a2)),  "initWithDatabaseID:seedID:numberOfItems:",  *(void *)&a3,  a4,  *(void *)&a5);
}

- (ICGetGeniusItemsRequest)initWithDatabaseID:(unsigned int)a3 seedID:(unint64_t)a4 numberOfItems:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/getgeniusitems",  *(void *)&a3));
  v9 = -[ICDRequest initWithAction:](self, "initWithAction:", v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a4));
    -[ICDRequest setValue:forArgument:](v9, "setValue:forArgument:", v10, @"seed-id");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", v5));
    -[ICDRequest setValue:forArgument:](v9, "setValue:forArgument:", v11, @"num-items");
  }

  return v9;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICGetGeniusItemsResponse,  "responseWithResponse:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponseDataParser parseResponseData:]( &OBJC_CLASS___ICDResponseDataParser,  "parseResponseData:",  v4));

  v6 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", @"dmap.longitemid", (void)v15));
        if (!v13)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"dmap.itemid"]);
          if (!v13) {
            continue;
          }
        }

        -[NSMutableArray addObject:](v6, "addObject:", v13);
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  [v3 setItemIDs:v6];
  return v3;
}

@end