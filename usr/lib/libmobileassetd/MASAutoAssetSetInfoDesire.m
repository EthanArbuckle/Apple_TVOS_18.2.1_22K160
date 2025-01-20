@interface MASAutoAssetSetInfoDesire
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetInfoDesire

+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    if (__isPlatformVersionAtLeast(3, 17, 0, 0)
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoDesire)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire),
          char v10 = objc_opt_respondsToSelector(v9, "init"),
          v9,
          (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetInfoDesire)];
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetSetInfoDesire newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetInfoDesire,  "newShimmedFromFramework:",  v12);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoDesire)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire),
        char v5 = objc_opt_respondsToSelector( v4,  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitT imeout:desiringProgress:"),  v4,  (v5 & 1) != 0))
  {
    id v6 = v3;
    v7 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetInfoDesire);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 clientAssetSetPolicy]);
    id v9 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:",  v8);
    char v10 = (void *)objc_claimAutoreleasedReturnValue([v6 desireReason]);
    id v11 = [v6 awaitDownloadingOfDiscovered];
    id v12 = [v6 checkWaitTimeoutSecs];
    id v13 = [v6 lockWaitTimeoutSecs];
    id v14 = [v6 downloadProgressDesired];

    id v15 = -[MANAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( v7,  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTime out:desiringProgress:",  v9,  v10,  v11,  v12,  v13,  v14);
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

+ (id)newShimmedToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoDesire)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire),
        char v5 = objc_opt_respondsToSelector( v4,  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitT imeout:desiringProgress:"),  v4,  (v5 & 1) != 0))
  {
    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 clientAssetSetPolicy]);
    id v8 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:",  v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 desireReason]);
    id v10 = objc_msgSend( v6,  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTime out:desiringProgress:",  v8,  v9,  objc_msgSend(v3, "awaitDownloadingOfDiscovered"),  objc_msgSend(v3, "checkWaitTimeoutSecs"),  objc_msgSend(v3, "lockWaitTimeoutSecs"),  objc_msgSend(v3, "downloadProgressDesired"));
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
    id v4 = v3;
    if (__isPlatformVersionAtLeast(3, 17, 0, 0))
    {
      id v4 = v3;
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy))
      {
        id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSetPolicy)];
        id v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoDesire))
      {
        id v6 = [v4 setByAddingObject:objc_opt_class(MAAutoAssetSetInfoDesire)];
        uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

        id v4 = (void *)v7;
      }
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

@end