@interface NSError
- (BOOL)mad_isDownloadThrottling;
@end

@implementation NSError

- (BOOL)mad_isDownloadThrottling
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  uint64_t v4 = CPLErrorDomain;
  if ([v3 isEqual:CPLErrorDomain])
  {
    NSInteger v5 = -[NSError code](self, "code");

    if (v5 == 1004) {
      return 1;
    }
  }

  else
  {
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError underlyingErrors](self, "underlyingErrors", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
        if ([v13 isEqual:v4])
        {
          id v14 = [v12 code];

          if (v14 == (id)1004)
          {
            BOOL v6 = 1;
            goto LABEL_17;
          }
        }

        else
        {
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  BOOL v6 = 0;
LABEL_17:

  return v6;
}

@end