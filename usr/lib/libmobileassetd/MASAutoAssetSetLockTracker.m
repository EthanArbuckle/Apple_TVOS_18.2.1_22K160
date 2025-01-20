@interface MASAutoAssetSetLockTracker
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetLockTracker

+ (id)newServerMessageClasses:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    if (__isPlatformVersionAtLeast(3, 17, 0, 0))
    {
      v4 = v3;
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetLockReason))
      {
        id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetLockReason)];
        v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy))
      {
        id v6 = [v4 setByAddingObject:objc_opt_class(MAAutoAssetSetPolicy)];
        uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

        v4 = (void *)v7;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetLockTracker))
      {
        id v8 = [v4 setByAddingObject:objc_opt_class(MAAutoAssetSetLockTracker)];
        uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

        v4 = (void *)v9;
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
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetLockTracker)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetLockTracker),
        char v5 = objc_opt_respondsToSelector(v4, "initForClientLockReason:lockingWithUsagePolicy:"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 lockUsagePolicy]);
    id v7 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:",  v6);

    id v8 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetLockTracker);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 clientLockReason]);
    id v10 = [v8 initForClientLockReason:v9 lockingWithUsagePolicy:v7];

    if ((objc_opt_respondsToSelector(v10, "activeLockCount") & 1) != 0) {
      objc_msgSend(v10, "setActiveLockCount:", objc_msgSend(v3, "activeLockCount"));
    }
    if ((objc_opt_respondsToSelector(v10, "maximumLockCount") & 1) != 0) {
      objc_msgSend(v10, "setMaximumLockCount:", objc_msgSend(v3, "maximumLockCount"));
    }
    if ((objc_opt_respondsToSelector(v10, "totalLockCount") & 1) != 0) {
      objc_msgSend(v10, "setTotalLockCount:", objc_msgSend(v3, "totalLockCount"));
    }
    if ((objc_opt_respondsToSelector(v10, "continueCount") & 1) != 0) {
      objc_msgSend(v10, "setContinueCount:", objc_msgSend(v3, "continueCount"));
    }
    if ((objc_opt_respondsToSelector(v10, "firstLockTimestamp") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v3 firstLockTimestamp]);
      [v10 setFirstLockTimestamp:v11];
    }

    if ((objc_opt_respondsToSelector(v10, "lastRefreshTimestamp") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v3 lastRefreshTimestamp]);
      [v10 setLastRefreshTimestamp:v12];
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetLockTracker)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetLockTracker),
        char v5 = objc_opt_respondsToSelector(v4, "initForClientLockReason:lockingWithUsagePolicy:"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = v3;
    id v7 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetLockTracker);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 clientLockReason]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 lockUsagePolicy]);
    id v10 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:",  v9);
    id v11 = -[MANAutoAssetSetLockTracker initForClientLockReason:lockingWithUsagePolicy:]( v7,  "initForClientLockReason:lockingWithUsagePolicy:",  v8,  v10);

    if ((objc_opt_respondsToSelector(v6, "activeLockCount") & 1) != 0) {
      objc_msgSend(v11, "setActiveLockCount:", objc_msgSend(v6, "activeLockCount"));
    }
    if ((objc_opt_respondsToSelector(v6, "maximumLockCount") & 1) != 0) {
      objc_msgSend(v11, "setMaximumLockCount:", objc_msgSend(v6, "maximumLockCount"));
    }
    if ((objc_opt_respondsToSelector(v6, "totalLockCount") & 1) != 0) {
      objc_msgSend(v11, "setTotalLockCount:", objc_msgSend(v6, "totalLockCount"));
    }
    if ((objc_opt_respondsToSelector(v6, "continueCount") & 1) != 0) {
      objc_msgSend(v11, "setContinueCount:", objc_msgSend(v6, "continueCount"));
    }
    if ((objc_opt_respondsToSelector(v6, "firstLockTimestamp") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 firstLockTimestamp]);
      [v11 setFirstLockTimestamp:v12];
    }

    if ((objc_opt_respondsToSelector(v6, "lastRefreshTimestamp") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v6 lastRefreshTimestamp]);
      [v11 setLastRefreshTimestamp:v13];
    }
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
  id v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    if (__isPlatformVersionAtLeast(3, 17, 0, 0)
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetLockTracker)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetLockTracker),
          char v10 = objc_opt_respondsToSelector(v9, "initForClientLockReason:lockingWithUsagePolicy:"),
          v9,
          (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetLockTracker)];
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetSetLockTracker newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetLockTracker,  "newShimmedFromFramework:",  v12);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

@end