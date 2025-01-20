@interface NSError
- (BOOL)isOnlyThrottlingError;
- (BOOL)isOnlyTimeoutError;
- (id)_detailedErrors;
- (id)_underlyingErrorsRTMultiError;
- (id)flattenErrors;
@end

@implementation NSError

- (BOOL)isOnlyThrottlingError
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError flattenErrors](self, "flattenErrors", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v3)
  {
    BOOL v15 = 1;
    goto LABEL_19;
  }

  id v4 = v3;
  uint64_t v5 = *(void *)v18;
  uint64_t v6 = GEOErrorHttpStatusCodeKey;
  while (2)
  {
    for (i = 0LL; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v18 != v5) {
        objc_enumerationMutation(v2);
      }
      v8 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
      uint64_t v10 = GEOErrorDomain();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (([v9 isEqualToString:v11] & 1) == 0)
      {

LABEL_18:
        BOOL v15 = 0;
        goto LABEL_19;
      }

      if ([v8 code] == (id)-7)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v6]);
        if ([v13 integerValue] == (id)429)
        {

          continue;
        }

        id v14 = [v8 code];
      }

      else
      {
        id v14 = [v8 code];
      }

      if (v14 != (id)-3LL) {
        goto LABEL_18;
      }
    }

    id v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    BOOL v15 = 1;
    if (v4) {
      continue;
    }
    break;
  }

- (BOOL)isOnlyTimeoutError
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError flattenErrors](self, "flattenErrors", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    uint64_t v6 = RTErrorDomain;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
        if (![v9 isEqualToString:v6])
        {

LABEL_13:
          BOOL v11 = 0;
          goto LABEL_14;
        }

        id v10 = [v8 code];

        if (v10 != (id)15) {
          goto LABEL_13;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      BOOL v11 = 1;
      if (v4) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v11 = 1;
  }

- (id)_underlyingErrorsRTMultiError
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if (![v3 isEqualToString:RTErrorDomain] || (id)-[NSError code](self, "code") != (id)9)
  {

    goto LABEL_6;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  uint64_t v5 = RTDetailedErrorsKey;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:RTDetailedErrorsKey]);

  if (!v6)
  {
LABEL_6:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    return v8;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v5]);

  return v8;
}

- (id)_detailedErrors
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError _underlyingErrorsRTMultiError](self, "_underlyingErrorsRTMultiError"));
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError underlyingErrors](self, "underlyingErrors"));
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (id)flattenErrors
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError _detailedErrors](self, "_detailedErrors"));
  if ([v4 count])
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "flattenErrors", (void)v12));
          [v3 addObjectsFromArray:v10];

          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v7);
    }
  }

  else
  {
    [v3 addObject:self];
  }

  return v3;
}

@end