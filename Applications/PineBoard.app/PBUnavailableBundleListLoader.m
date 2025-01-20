@interface PBUnavailableBundleListLoader
- (id)_loadMappingInfoPromise;
- (id)_loadProgrammingInfoPromise;
- (id)_numberArrayFromStringArray:(id)a3;
- (id)_requestPromiseWithEndpoint:(id)a3;
- (id)_santizeMappingInfo:(id)a3 error:(id *)a4;
- (id)_santizeProgrammingInfo:(id)a3 error:(id *)a4;
- (id)fetchListWithCompletion:(id)a3;
@end

@implementation PBUnavailableBundleListLoader

- (id)fetchListWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUnavailableBundleListLoader _loadProgrammingInfoPromise](self, "_loadProgrammingInfoPromise"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBUnavailableBundleListLoader _loadMappingInfoPromise](self, "_loadMappingInfoPromise"));
  v17[0] = v5;
  v17[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithAll:](&OBJC_CLASS___AMSPromise, "promiseWithAll:", v7));

  [0 setPromise:v8];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10011BBE8;
  v14[3] = &unk_1003D8300;
  id v15 = 0LL;
  id v9 = v4;
  id v16 = v9;
  [v8 addSuccessBlock:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10011BD0C;
  v12[3] = &unk_1003D6180;
  id v13 = v9;
  id v10 = v9;
  [v8 addErrorBlock:v12];

  return 0LL;
}

- (id)_loadMappingInfoPromise
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBUnavailableBundleListLoader _requestPromiseWithEndpoint:]( self,  "_requestPromiseWithEndpoint:",  @"merchant-mapping-url"));
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10011BE58;
  v6[3] = &unk_1003D8328;
  objc_copyWeak(&v7, &location);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 continueWithBlock:v6]);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

- (id)_santizeMappingInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  v24 = a4;
  if (v5) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v5 count]));
  }
  else {
    id v7 = 0LL;
  }
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0) {
          id v15 = v13;
        }
        else {
          id v15 = 0LL;
        }
        id v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvs_stringForKey:", v16));
        v18 = v17;
        if (v17)
        {
          uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v17 longLongValue]));
          v20 = (void *)v19;
          if (v16) {
            BOOL v21 = v19 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (!v21) {
            [v7 setObject:v19 forKey:v16];
          }
        }

        else
        {
          v20 = 0LL;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v10);
  }

  if (v7)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v7));
  }

  else
  {
    v22 = 0LL;
    if (v24) {
      id *v24 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PBUnavailableBundleListLoaderErrorDomain",  1LL,  0LL));
    }
  }

  return v22;
}

- (id)_loadProgrammingInfoPromise
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBUnavailableBundleListLoader _requestPromiseWithEndpoint:]( self,  "_requestPromiseWithEndpoint:",  @"atv-headboard-url"));
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10011C2AC;
  v6[3] = &unk_1003D8328;
  objc_copyWeak(&v7, &location);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 continueWithBlock:v6]);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

- (id)_santizeProgrammingInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_arrayForKey:", @"contentIds"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[PBUnavailableBundleListLoader _numberArrayFromStringArray:](self, "_numberArrayFromStringArray:", v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_arrayForKey:", @"hideContentIds"));

  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[PBUnavailableBundleListLoader _numberArrayFromStringArray:](self, "_numberArrayFromStringArray:", v9));
  if (v10 | v8)
  {
    uint64_t v11 = (void *)v10;
    if (v8) {
      v12 = (void *)v8;
    }
    else {
      v12 = &__NSArray0__struct;
    }
    id v13 = v12;

    if (v11) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = &__NSArray0__struct;
    }
    id v15 = v14;

    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
    [v16 setObject:v13 forKey:@"PBAppProgrammingInfoKeyProvisionedAppIdentifiers"];
    [v16 setObject:v15 forKey:@"PBAppProgrammingInfoKeyDisabledAppIdentifiers"];
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v16));
  }

  else
  {
    id v13 = 0LL;
    id v15 = 0LL;
    v17 = 0LL;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PBUnavailableBundleListLoaderErrorDomain",  1LL,  0LL));
    }
  }

  id v18 = v17;

  return v18;
}

- (id)_requestPromiseWithEndpoint:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag pb_bag](&OBJC_CLASS___AMSBag, "pb_bag"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLForKey:v3]);

  id v6 = [[AMSURLRequestEncoder alloc] initWithBag:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 requestWithMethod:2 bagURL:v5 parameters:0]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 thenWithBlock:&stru_1003D8368]);

  return v8;
}

- (id)_numberArrayFromStringArray:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  }
  else {
    id v5 = 0LL;
  }
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  objc_msgSend(v11, "longLongValue", (void)v16)));
          if (v13)
          {
            uint64_t v14 = (void *)v13;
            [v5 addObject:v13];
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  return v5;
}

@end