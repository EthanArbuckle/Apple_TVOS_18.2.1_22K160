@interface MASAutoAssetSetEntry
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedArrayFromFramework:(id)a3;
+ (id)newShimmedArrayToFramework:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetEntry

+ (id)newShimmedArrayFromFramework:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (__isPlatformVersionAtLeast(3, 17, 0, 0))
    {
      p_ivars = &MobileAssetKeyManager__metaData.ivars;
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry))
      {
        id v5 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetEntry);
        char v6 = objc_opt_respondsToSelector( v5,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:");

        if ((v6 & 1) != 0)
        {
          id v7 = v3;
          uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
          {
            v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            v10 = (char *)[v7 count];
            if ((uint64_t)v10 >= 1)
            {
              v11 = v10;
              id v44 = v7;
              v46 = v9;
              id v42 = v3;
              v43 = v10;
              for (i = 0LL; i != v11; ++i)
              {
                v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:i]);
                if (v13)
                {
                  uint64_t v14 = objc_opt_class(p_ivars[157]);
                  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
                  {
                    v15 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetEntry);
                    v47 = (void *)objc_claimAutoreleasedReturnValue([v13 assetSelector]);
                    v16 = (void *)objc_claimAutoreleasedReturnValue([v47 assetType]);
                    v17 = (void *)objc_claimAutoreleasedReturnValue([v13 assetSelector]);
                    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 assetSpecifier]);
                    v19 = (void *)objc_claimAutoreleasedReturnValue([v13 assetSelector]);
                    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 assetVersion]);
                    v21 = (void *)objc_claimAutoreleasedReturnValue([v13 assetSelector]);
                    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 downloadDecryptionKey]);
                    id v23 = -[MANAutoAssetSetEntry initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:]( v15,  "initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:",  v16,  v18,  v20,  v22,  [v13 assetLockedInhibitsRemoval]);

                    if (v23) {
                      -[NSMutableArray addObject:](v46, "addObject:", v23);
                    }

                    p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
                    v11 = v43;
                    id v7 = v44;
                  }
                }
              }

+ (id)newShimmedArrayToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && (p_ivars = &MobileAssetKeyManager__metaData.ivars, objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry))
    && (id v5 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetEntry),
        char v6 = objc_opt_respondsToSelector( v5,  "initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:"),  v5,  (v6 & 1) != 0))
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v22 = (char *)[v3 count];
    if ((uint64_t)v22 >= 1)
    {
      v20 = v7;
      id v21 = v3;
      uint64_t v8 = 0LL;
      do
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:v8]);
        if (v9)
        {
          v10 = p_ivars;
          id v11 = objc_alloc((Class)p_ivars[157]);
          v12 = (void *)objc_claimAutoreleasedReturnValue([v9 assetSelector]);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assetType]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 assetSelector]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 assetSpecifier]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v9 assetSelector]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 downloadDecryptionKey]);
          id v18 = objc_msgSend( v11,  "initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:",  v13,  v15,  v17,  objc_msgSend(v9, "assetLockedInhibitsRemoval"));

          if (v18) {
            -[NSMutableArray addObject:](v20, "addObject:", v18);
          }

          p_ivars = v10;
          id v3 = v21;
        }

        ++v8;
      }

      while (v22 != v8);
      id v7 = v20;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)newServerMessageClasses:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    if (__isPlatformVersionAtLeast(3, 17, 0, 0))
    {
      v4 = v3;
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry))
      {
        id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSetEntry)];
        v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
      }
    }
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

+ (id)newShimmedToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetEntry),
        char v5 = objc_opt_respondsToSelector( v4,  "initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:"),  v4,  (v5 & 1) != 0))
  {
    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetEntry);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 assetSelector]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 assetSelector]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 assetSpecifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 assetSelector]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 downloadDecryptionKey]);
    id v13 = objc_msgSend( v6,  "initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:",  v8,  v10,  v12,  objc_msgSend(v3, "assetLockedInhibitsRemoval"));
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (!v3
    || !__isPlatformVersionAtLeast(3, 17, 0, 0)
    || !objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry))
  {
    goto LABEL_9;
  }

  id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetEntry);
  char v5 = objc_opt_respondsToSelector( v4,  "initForAssetType:withAssetSpecifier:withAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:");

  if ((v5 & 1) == 0)
  {
    id v17 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetEntry);
    char v18 = objc_opt_respondsToSelector( v17,  "initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:");

    if ((v18 & 1) != 0)
    {
      id v19 = v3;
      v20 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetEntry);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v19 assetSelector]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v16 assetType]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v19 assetSelector]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assetSpecifier]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v19 assetSelector]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 downloadDecryptionKey]);
      id v21 = [v19 assetLockedInhibitsRemoval];

      id v15 = -[MANAutoAssetSetEntry initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:]( v20,  "initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:",  v7,  v9,  v11,  v21);
      goto LABEL_8;
    }

+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    if (__isPlatformVersionAtLeast(3, 17, 0, 0)
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry)
      && ((id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetEntry),
           char v10 = objc_opt_respondsToSelector( v9,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:"),  v9,  (v10 & 1) != 0)
       || (id v11 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetEntry),
           char v12 = objc_opt_respondsToSelector( v11,  "initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:"),  v11,  (v12 & 1) != 0)))
    {
      id v13 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetEntry)];
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      id v8 = +[MASAutoAssetSetEntry newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedFromFramework:",  v14);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

@end