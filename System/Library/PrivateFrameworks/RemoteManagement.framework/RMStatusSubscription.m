@interface RMStatusSubscription
- (id)reportDetails;
@end

@implementation RMStatusSubscription

- (id)reportDetails
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscription sourceIdentifier](self, "sourceIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"sourceIdentifier");

  unsigned int v5 = -[RMStatusSubscription sourceType](self, "sourceType");
  if (v5 > 3) {
    v6 = @"unknown";
  }
  else {
    v6 = *(&off_10001C760 + (int)v5);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"sourceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscription items](self, "items"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusSubscription items](self, "items", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)v13) reportDetails]);
        [v8 addObject:v14];

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v11);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"items");
  return v3;
}

@end