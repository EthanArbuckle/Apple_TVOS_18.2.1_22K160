@interface NSDictionary
- (id)asOneLineString;
@end

@implementation NSDictionary

- (id)asOneLineString
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 0LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](v2, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingSelector:"compare:"]);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", v11));
        [v3 appendFormat:@"%@=%@,", v11, v12, (void)v15];
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "substringToIndex:",  (char *)objc_msgSend(v3, "length") - (objc_msgSend(v3, "length") != 0)));
  return v13;
}

@end