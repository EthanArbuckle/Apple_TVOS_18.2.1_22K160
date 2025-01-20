@interface MASAutoAssetSetSummary
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetSummary

+ (id)newServerMessageClasses:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSelector)];
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (__isPlatformVersionAtLeast(3, 17, 0, 0))
    {
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry))
      {
        id v6 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetAtomicEntry)];
        uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

        v5 = (void *)v7;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetNotifications))
      {
        id v8 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetNotifications)];
        uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

        v5 = (void *)v9;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy))
      {
        id v10 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetPolicy)];
        uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);

        v5 = (void *)v11;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetProgress))
      {
        id v12 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetProgress)];
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);

        v5 = (void *)v13;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetStatus))
      {
        id v14 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetStatus)];
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);

        v5 = (void *)v15;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetSummary))
      {
        id v16 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetSummary)];
        uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);

        v5 = (void *)v17;
      }
    }
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

+ (id)newShimmedToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetStatus)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetSummary)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetSummary),
        char v5 = objc_opt_respondsToSelector( v4,  "initWithDomainName:forAssetSetIdentifier:withAssetSetRepresentation:withSetJobStatus:withScheduledInterva lSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:withMaxim umClientCount:withTotalClientCount:"),  v4,  (v5 & 1) != 0))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 setJobStatus]);
    id v12 = +[MASAutoAssetSetStatus newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetStatus,  "newShimmedToFramework:",  v6);

    id v11 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetSummary);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 clientDomainName]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 assetSetIdentifier]);
    id v9 = objc_msgSend( v11,  "initWithDomainName:forAssetSetIdentifier:withAssetSetRepresentation:withSetJobStatus:withScheduledIntervalSec s:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:withMaximumClient Count:withTotalClientCount:",  v7,  v8,  objc_msgSend(v3, "assetSetRepresentation"),  v12,  objc_msgSend(v3, "scheduledIntervalSecs"),  objc_msgSend(v3, "scheduledRemainingSecs"),  objc_msgSend(v3, "pushDelaySecs"),  objc_msgSend(v3, "activeClientCount"),  objc_msgSend(v3, "activeMonitorCount"),  objc_msgSend(v3, "maximumClientCount"),  objc_msgSend(v3, "totalClientCount"));
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetStatus)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetSummary)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetSummary),
        char v5 = objc_opt_respondsToSelector( v4,  "initWithDomainName:forAssetSetIdentifier:withAssetSetRepresentation:withSetJobStatus:withScheduledInterva lSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:withMaxim umClientCount:withTotalClientCount:"),  v4,  (v5 & 1) != 0))
  {
    id v6 = v3;
    v21 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetSummary);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 clientDomainName]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 assetSetIdentifier]);
    id v18 = [v6 assetSetRepresentation];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 setJobStatus]);
    id v8 = +[MASAutoAssetSetStatus newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetStatus,  "newShimmedFromFramework:",  v7);
    id v17 = [v6 scheduledIntervalSecs];
    id v9 = [v6 scheduledRemainingSecs];
    id v10 = [v6 pushDelaySecs];
    id v11 = [v6 activeClientCount];
    id v12 = [v6 activeMonitorCount];
    id v13 = [v6 maximumClientCount];
    id v14 = [v6 totalClientCount];

    uint64_t v15 = -[MANAutoAssetSetSummary initWithDomainName:forAssetSetIdentifier:withAssetSetRepresentation:withSetJobStatus:withScheduledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:withMaximumClientCount:withTotalClientCount:]( v21,  "initWithDomainName:forAssetSetIdentifier:withAssetSetRepresentation:withSetJobStatus:withScheduledIntervalSe cs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:withMaximumClie ntCount:withTotalClientCount:",  v20,  v19,  v18,  v8,  v17,  v9,  v10,  v11,  v12,  v13,  v14);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
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
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetSummary)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetSummary),
          char v10 = objc_opt_respondsToSelector( v9,  "initWithDomainName:forAssetSetIdentifier:withAssetSetRepresentation:withSetJobStatus:withScheduledInte rvalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:wit hMaximumClientCount:withTotalClientCount:"),  v9,  (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetSummary)];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetSetSummary newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetSummary,  "newShimmedFromFramework:",  v12);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

@end