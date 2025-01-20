@interface HMDMatterCommandActionUtilities
+ (id)commandsInMemoryRepresentation:(id)a3;
+ (id)commandsInStoreRepresentation:(id)a3;
@end

@implementation HMDMatterCommandActionUtilities

+ (id)commandsInStoreRepresentation:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    uint64_t v9 = HMCommandExpectedValuesKey;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v12 = [v11 mutableCopy];
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v9]);
        id v14 = [v13 mutableCopy];

        if (v14)
        {
          id v15 = [v14 mutableCopy];
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472LL;
          v21[2] = sub_100001BF0;
          v21[3] = &unk_1000287B0;
          id v22 = v15;
          id v16 = v15;
          [v16 enumerateObjectsUsingBlock:v21];
          id v17 = [v16 copy];
          [v12 setObject:v17 forKey:v9];

          id v18 = [v12 copy];
          [v4 addObject:v18];
        }

        else
        {
          [v4 addObject:v11];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v7);
  }

  id v19 = [v4 copy];
  return v19;
}

+ (id)commandsInMemoryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    uint64_t v9 = HMCommandExpectedValuesKey;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v12 = [v11 mutableCopy];
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v9]);
        id v14 = [v13 mutableCopy];

        if (v14)
        {
          id v15 = [v14 mutableCopy];
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472LL;
          v21[2] = sub_10000194C;
          v21[3] = &unk_1000287B0;
          id v22 = v15;
          id v16 = v15;
          objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);
          id v17 = [v16 copy];
          [v12 setObject:v17 forKey:v9];

          id v18 = [v12 copy];
          [v4 addObject:v18];
        }

        else
        {
          [v4 addObject:v11];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v7);
  }

  id v19 = [v4 copy];
  return v19;
}

@end