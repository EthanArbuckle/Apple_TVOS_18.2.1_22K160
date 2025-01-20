@interface MASAutoAssetSetInfoFound
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetInfoFound

+ (id)newShimmedToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetStatus)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoFound)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoFound),
        char v5 = objc_opt_respondsToSelector(v4, "initForAssetSetIdentifier:reportingStatus:"),
        v4,
        (v5 & 1) != 0))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 currentSetStatus]);
    id v7 = +[MASAutoAssetSetStatus newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetStatus,  "newShimmedToFramework:",  v6);

    id v8 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoFound);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 assetSetIdentifier]);
    id v10 = [v8 initForAssetSetIdentifier:v9 reportingStatus:v7];
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

+ (id)newServerMessageClasses:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSelector)];
    char v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (__isPlatformVersionAtLeast(3, 17, 0, 0))
    {
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry))
      {
        id v6 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetAtomicEntry)];
        uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

        char v5 = (void *)v7;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetNotifications))
      {
        id v8 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetNotifications)];
        uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

        char v5 = (void *)v9;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy))
      {
        id v10 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetPolicy)];
        uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);

        char v5 = (void *)v11;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetProgress))
      {
        id v12 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetProgress)];
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);

        char v5 = (void *)v13;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetStatus))
      {
        id v14 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetStatus)];
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);

        char v5 = (void *)v15;
      }
    }
  }

  else
  {
    char v5 = 0LL;
  }

  return v5;
}

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetStatus)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoFound)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoFound),
        char v5 = objc_opt_respondsToSelector(v4, "initForAssetSetIdentifier:reportingStatus:"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = v3;
    uint64_t v7 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetInfoFound);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 assetSetIdentifier]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 currentSetStatus]);

    id v10 = +[MASAutoAssetSetStatus newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetStatus,  "newShimmedFromFramework:",  v9);
    id v11 = -[MANAutoAssetSetInfoFound initForAssetSetIdentifier:reportingStatus:]( v7,  "initForAssetSetIdentifier:reportingStatus:",  v8,  v10);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    if (__isPlatformVersionAtLeast(3, 17, 0, 0)
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoFound)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoFound),
          char v10 = objc_opt_respondsToSelector(v9, "initForAssetSetIdentifier:reportingStatus:"),
          v9,
          (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetInfoFound)];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetSetInfoFound newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetInfoFound,  "newShimmedFromFramework:",  v12);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

@end