@interface NSError
- (BOOL)isInvalidRouteError;
@end

@implementation NSError

- (BOOL)isInvalidRouteError
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if ([v3 isEqualToString:MPAVRouteConnectionErrorDomain])
  {
    NSInteger v4 = -[NSError code](self, "code");

    if (v4 == 2) {
      return 1;
    }
  }

  else
  {
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MPRequestUnderlyingErrorsUserInfoKey]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend( *(id *)(*((void *)&v16 + 1) + 8 * (void)i),  "isInvalidRouteError",  (void)v16))
        {
          unsigned __int8 v5 = 1;
          v13 = v8;
          goto LABEL_15;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:NSUnderlyingErrorKey]);
  unsigned __int8 v5 = [v14 isInvalidRouteError];

LABEL_15:
  return v5;
}

@end