@interface MSDBasePrepareOperation
- (BOOL)_prepareStagingArea;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDBasePrepareOperation

- (id)methodSelectors
{
  if (+[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly"))
  {
    v3 = (void *)objc_opt_new(&OBJC_CLASS___NSArray, v2);
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_prepareStagingArea"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v4, 0LL));
  }

  return v3;
}

- (int64_t)type
{
  return 1LL;
}

- (BOOL)_prepareStagingArea
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stagingRootPath]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 secondaryStagingRootPath]);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 secondaryStagingRootPath]);
    [v5 addObject:v10];
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    id v13 = v12;
    v14 = 0LL;
    uint64_t v15 = *(void *)v26;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        if (([v6 fileExistsAtPath:v17] & 1) == 0)
        {
          id v24 = v14;
          unsigned __int8 v18 = [v6 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v24];
          id v19 = v24;

          if ((v18 & 1) == 0)
          {
            id v21 = sub_10003A95C();
            v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_10009900C(v17, v19, v22);
            }

            BOOL v20 = 0;
            goto LABEL_18;
          }

          v14 = v19;
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13) {
        continue;
      }
      break;
    }

    BOOL v20 = 1;
    id v19 = v14;
  }

  else
  {
    id v19 = 0LL;
    BOOL v20 = 1;
  }

@end