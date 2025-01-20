@interface NSURL
- (NSString)lib_sanitizedFilePath;
- (id)lib_URLByAppendingPathComponents:(id)a3;
- (id)lib_URLByAppendingQueryDictionary:(id)a3;
- (id)lib_URLByStrippingQuery;
- (id)lib_queryDictionary;
@end

@implementation NSURL

- (NSString)lib_sanitizedFilePath
{
  if (-[NSURL isFileURL](self, "isFileURL")) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
  }
  else {
    v3 = 0LL;
  }
  return (NSString *)v3;
}

- (id)lib_queryDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  self,  0LL);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v4, "queryItems", 0LL));
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
        v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v10 value]);
        if (v11) {
          [v3 setObject:v12 forKeyedSubscript:v11];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  id v13 = [v3 copy];
  return v13;
}

- (id)lib_URLByAppendingPathComponents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 count];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    if (v5 == (id)1)
    {
      id v7 = (NSURL *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( self,  "URLByAppendingPathComponent:isDirectory:",  v6,  0LL));
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( self,  "URLByAppendingPathComponent:isDirectory:",  v6,  1LL));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 1, (char *)objc_msgSend(v4, "count") - 1));
      id v7 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lib_URLByAppendingPathComponents:", v9));
    }
  }

  else
  {
    id v7 = self;
  }

  return v7;
}

- (id)lib_URLByAppendingQueryDictionary:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v27 = v4;
  if ([v4 count])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    v25 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](v5, "absoluteString"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsSeparatedByString:@"?"]);

    v24 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    if ((unint64_t)[v8 count] >= 2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
      [v6 appendString:v9];
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
    id v11 = [v10 mutableCopy];

    [v11 removeCharactersInString:@"?&%+=;"];
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v27 allKeys]);
    id v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(obj);
          }
          __int128 v16 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAddingPercentEncodingWithAllowedCharacters:v11]);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v16]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAddingPercentEncodingWithAllowedCharacters:v11]);

          if ([v6 length]) {
            v20 = @"&%@=%@";
          }
          else {
            v20 = @"%@=%@";
          }
          objc_msgSend(v6, "appendFormat:", v20, v17, v19);
        }

        id v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v13);
    }

    if (v6)
    {
      v21 = v24;
      if ([v6 length])
      {
        uint64_t v22 = objc_claimAutoreleasedReturnValue([v24 stringByAppendingFormat:@"?%@", v6]);

        v21 = (void *)v22;
      }
    }

    else
    {
      v21 = v24;
    }

    id v5 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v21));
  }

  return v5;
}

- (id)lib_URLByStrippingQuery
{
  v2 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  self,  0LL);
  -[NSURLComponents setQueryItems:](v2, "setQueryItems:", 0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v2, "URL"));

  return v3;
}

@end