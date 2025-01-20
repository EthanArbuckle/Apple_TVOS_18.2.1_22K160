@interface VSRequestAppInstallUtility
+ (void)configureInstallMetadata:(id)a3 withApp:(id)a4;
+ (void)markSTBProviderAppsForInstallation:(id)a3 rootAppPlacementPosition:(id)a4;
@end

@implementation VSRequestAppInstallUtility

+ (void)markSTBProviderAppsForInstallation:(id)a3 rootAppPlacementPosition:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  uint64_t v8 = VSDefaultLogObject(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "+[VSRequestAppInstallUtility markSTBProviderAppsForInstallation:rootAppPlacementPosition:]";
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  uint64_t v11 = VSDefaultLogObject(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Pineboard Available, Using New Install Method", buf, 2u);
  }

  id v13 = [v6 count];
  uint64_t v14 = VSDefaultLogObject(v13);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v38 = v7;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Installing root app at placement position: %@", buf, 0xCu);
    }

    v31 = v7;

    id v17 = [v6 mutableCopy];
    v30 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);
    [v17 removeObjectAtIndex:0];
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    v15 = (os_log_s *)v17;
    id v19 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        v22 = 0LL;
        do
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v15);
          }
          uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v22);
          id v24 = objc_alloc_init(&OBJC_CLASS___PBSVideoSubscriberAccountApplicationInstallMetadata);
          [a1 configureInstallMetadata:v24 withApp:v23];
          -[NSMutableArray addObject:](v18, "addObject:", v24);

          v22 = (char *)v22 + 1;
        }

        while (v20 != v22);
        id v20 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
      }

      while (v20);
    }

    id v25 = objc_alloc(&OBJC_CLASS___PBSVideoSubscriberAccountApplicationInstallMetadata);
    id v26 = -[NSMutableArray copy](v18, "copy");
    v7 = v31;
    id v27 = [v25 initWithInstallPosition:v31 additionalInstalls:v26];

    [a1 configureInstallMetadata:v27 withApp:v30];
    v28 = objc_alloc_init(&OBJC_CLASS___VSPreferences);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v27 dictionaryRepresentation]);
    -[VSPreferences noteDesiredApp:](v28, "noteDesiredApp:", v29);
  }

  else if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "No app descriptions to mark for install", buf, 2u);
  }
}

+ (void)configureInstallMetadata:(id)a3 withApp:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  [v5 setBundleIdentifier:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 sellerName]);
  [v5 setVendorName:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 buyParams]);
  if (!v9) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [appDescription buyParams] parameter must not be nil.");
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 buyParams]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[VSACAccount sharedInstance](&OBJC_CLASS___VSACAccount, "sharedInstance"));
  unsigned __int8 v12 = [v11 hasAccount];

  if ((v12 & 1) == 0)
  {
    [v5 setDSIDLess:1];
    id v13 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
    -[NSURLComponents setPercentEncodedQuery:](v13, "setPercentEncodedQuery:", v10);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v13, "queryItems"));
    id v15 = [v14 mutableCopy];

    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v6 externalVersionID]);
    if (v16)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 externalVersionID]);

      if (!v17) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [appDescription externalVersionID] parameter must not be nil.");
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue([v6 externalVersionID]);
      id v19 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"externalVersionId",  v18);
      [v15 addObject:v19];
    }

    else
    {
      __int128 v35 = v13;
      v36 = v10;
      id v37 = v5;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v20 = v15;
      id v21 = [v15 copy];
      id v22 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v39;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v39 != v24) {
              objc_enumerationMutation(v21);
            }
            id v26 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 name]);
            unsigned int v28 = [v27 isEqualToString:@"appExtVrsId"];

            if (v28)
            {
              v29 = objc_alloc(&OBJC_CLASS___NSURLQueryItem);
              v30 = (void *)objc_claimAutoreleasedReturnValue([v26 value]);
              v31 = -[NSURLQueryItem initWithName:value:](v29, "initWithName:value:", @"externalVersionId", v30);
              [v20 addObject:v31];
            }
          }

          id v23 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }

        while (v23);
      }

      id v5 = v37;
      id v13 = v35;
      uint64_t v10 = v36;
      id v15 = v20;
    }

    __int128 v32 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
    -[NSURLComponents setQueryItems:](v32, "setQueryItems:", v15);
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents percentEncodedQuery](v32, "percentEncodedQuery"));

    if (!v33) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [modifiedComponents percentEncodedQuery] parameter must not be nil.");
    }
    uint64_t v34 = objc_claimAutoreleasedReturnValue(-[NSURLComponents percentEncodedQuery](v32, "percentEncodedQuery"));

    uint64_t v10 = (void *)v34;
  }

  [v5 setBuyParameters:v10];
}

@end