@interface NSDictionary
- (id)queryString;
@end

@implementation NSDictionary

- (id)queryString
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v4 = self;
  id v5 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v9));
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pf_stringWithPercentEscape"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pf_stringWithPercentEscape"));
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  v13,  v14,  (void)v18));
        -[NSMutableArray addObject:](v3, "addObject:", v15);
      }

      id v6 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v6);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @"&"));
  return v16;
}

@end