@interface MASAutoAssetSetOverview
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedArrayToFramework:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetOverview

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

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetOverview))
      {
        id v6 = [v4 setByAddingObject:objc_opt_class(MAAutoAssetSetOverview)];
        uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

        v4 = (void *)v7;
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
  if (!a3) {
    return 0LL;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", 0LL));
  id v4 = +[MASAutoAssetSetOverview newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetOverview,  "newShimmedArrayToFramework:",  v3);
  id v5 = v4;
  if (v4) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)newShimmedArrayToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry)
    && (p_ivars = &MobileAssetKeyManager__metaData.ivars, objc_opt_class(&OBJC_CLASS___MAAutoAssetSetOverview))
    && (id v5 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetOverview),
        char v6 = objc_opt_respondsToSelector( v5,  "initWithDomainName:forAssetSetIdentifier:withConfiguredAssetEntries:withLatestDownloadedAtomicInstance:wi thDownloadedAtomicInstances:withDiscoveredAtomicInstance:withActiveClientCount:withActiveMonitorCount:wit hMaximumClientCount:withTotalClientCount:"),  v5,  (v6 & 1) != 0))
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v21 = (char *)[v3 count];
    if ((uint64_t)v21 >= 1)
    {
      v19 = v7;
      id v20 = v3;
      for (i = 0LL; i != v21; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:i]);
        v10 = v9;
        if (v9)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue([v9 configuredAssetEntries]);
          id v23 = +[MASAutoAssetSetEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayToFramework:",  v11);

          id v22 = objc_alloc((Class)p_ivars[158]);
          v12 = (void *)objc_claimAutoreleasedReturnValue([v10 clientDomainName]);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSetIdentifier]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v10 latestDownloadedAtomicInstance]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v10 downloadedAtomicInstances]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v10 discoveredAtomicInstance]);
          id v17 = objc_msgSend( v22,  "initWithDomainName:forAssetSetIdentifier:withConfiguredAssetEntries:withLatestDownloadedAtomicInstance :withDownloadedAtomicInstances:withDiscoveredAtomicInstance:withActiveClientCount:withActiveMonitorCou nt:withMaximumClientCount:withTotalClientCount:",  v12,  v13,  v23,  v14,  v15,  v16,  objc_msgSend(v10, "activeClientCount"),  objc_msgSend(v10, "activeMonitorCount"),  objc_msgSend(v10, "maximumClientCount"),  objc_msgSend(v10, "totalClientCount"));

          if (v17) {
            -[NSMutableArray addObject:](v19, "addObject:", v17);
          }

          id v3 = v20;
          p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
        }
      }

      uint64_t v7 = v19;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetOverview)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetOverview),
        char v5 = objc_opt_respondsToSelector( v4,  "initWithDomainName:forAssetSetIdentifier:withConfiguredAssetEntries:withLatestDownloadedAtomicInstance:wi thDownloadedAtomicInstances:withDiscoveredAtomicInstance:withActiveClientCount:withActiveMonitorCount:wit hMaximumClientCount:withTotalClientCount:"),  v4,  (v5 & 1) != 0))
  {
    id v6 = v3;
    v19 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetOverview);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 clientDomainName]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 assetSetIdentifier]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 configuredAssetEntries]);
    id v7 = +[MASAutoAssetSetEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayFromFramework:",  v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 latestDownloadedAtomicInstance]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadedAtomicInstances]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 discoveredAtomicInstance]);
    id v11 = [v6 activeClientCount];
    id v12 = [v6 activeMonitorCount];
    id v13 = [v6 maximumClientCount];
    id v14 = [v6 totalClientCount];

    v15 = -[MANAutoAssetSetOverview initWithDomainName:forAssetSetIdentifier:withConfiguredAssetEntries:withLatestDownloadedAtomicInstance:withDownloadedAtomicInstances:withDiscoveredAtomicInstance:withActiveClientCount:withActiveMonitorCount:withMaximumClientCount:withTotalClientCount:]( v19,  "initWithDomainName:forAssetSetIdentifier:withConfiguredAssetEntries:withLatestDownloadedAtomicInstance:withD ownloadedAtomicInstances:withDiscoveredAtomicInstance:withActiveClientCount:withActiveMonitorCount:withMaxim umClientCount:withTotalClientCount:",  v18,  v17,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14);
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
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
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetOverview)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetOverview),
          char v10 = objc_opt_respondsToSelector( v9,  "initWithDomainName:forAssetSetIdentifier:withConfiguredAssetEntries:withLatestDownloadedAtomicInstance :withDownloadedAtomicInstances:withDiscoveredAtomicInstance:withActiveClientCount:withActiveMonitorCou nt:withMaximumClientCount:withTotalClientCount:"),  v9,  (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetOverview)];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetSetOverview newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetOverview,  "newShimmedFromFramework:",  v12);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

@end