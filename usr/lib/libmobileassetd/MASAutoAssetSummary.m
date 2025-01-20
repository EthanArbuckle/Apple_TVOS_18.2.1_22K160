@interface MASAutoAssetSummary
+ (id)newAssetRepresentationName:(int64_t)a3;
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedArrayToFramework:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSummary

+ (id)newServerMessageClasses:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSelector)];
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetStatus))
    {
      id v6 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetStatus)];
      uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

      v5 = (void *)v7;
    }

    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSummary))
    {
      id v8 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSummary)];
      uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

      v5 = (void *)v9;
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
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetStatus)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSummary)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSummary),
        char v5 = objc_opt_respondsToSelector( v4,  "initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:withSch eduledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCo unt:withMaximumClientCount:withTotalClientCount:"),  v4,  (v5 & 1) != 0))
  {
    v13 = objc_alloc(&OBJC_CLASS___MAAutoAssetSummary);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 assetSelector]);
    id v12 = [v3 assetRepresentation];
    unsigned int v11 = [v3 assetWasPatched];
    id v7 = [v3 assetIsStaged];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 jobStatus]);
    uint64_t v9 = -[MAAutoAssetSummary initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:withScheduledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:withMaximumClientCount:withTotalClientCount:]( v13,  "initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:withSchedul edIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:with MaximumClientCount:withTotalClientCount:",  v6,  v12,  v11,  v7,  v8,  [v3 scheduledIntervalSecs],  objc_msgSend(v3, "scheduledRemainingSecs"),  objc_msgSend(v3, "pushDelaySecs"),  objc_msgSend(v3, "activeClientCount"),  objc_msgSend(v3, "activeMonitorCount"),  objc_msgSend(v3, "maximumClientCount"),  objc_msgSend(v3, "totalClientCount"));
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

+ (id)newShimmedArrayToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetStatus)
    && (p_ivars = &MobileAssetKeyManager__metaData.ivars, objc_opt_class(&OBJC_CLASS___MAAutoAssetSummary))
    && (char v5 = objc_alloc(&OBJC_CLASS___MAAutoAssetSummary),
        char v6 = objc_opt_respondsToSelector( v5,  "initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:withSch eduledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCo unt:withMaximumClientCount:withTotalClientCount:"),  v5,  (v6 & 1) != 0))
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v15 = (char *)[v3 count];
    if ((uint64_t)v15 >= 1)
    {
      id v14 = v3;
      for (i = 0LL; i != v15; ++i)
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:i]);
        if (v9)
        {
          id v19 = objc_alloc((Class)p_ivars[216]);
          v10 = (void *)objc_claimAutoreleasedReturnValue([v9 assetSelector]);
          id v18 = [v9 assetRepresentation];
          unsigned int v17 = [v9 assetWasPatched];
          unsigned int v16 = [v9 assetIsStaged];
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 jobStatus]);
          id v12 = objc_msgSend( v19,  "initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:with ScheduledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMon itorCount:withMaximumClientCount:withTotalClientCount:",  v10,  v18,  v17,  v16,  v11,  objc_msgSend(v9, "scheduledIntervalSecs"),  objc_msgSend(v9, "scheduledRemainingSecs"),  objc_msgSend(v9, "pushDelaySecs"),  objc_msgSend(v9, "activeClientCount"),  objc_msgSend(v9, "activeMonitorCount"),  objc_msgSend(v9, "maximumClientCount"),  objc_msgSend(v9, "totalClientCount"));

          if (v12) {
            -[NSMutableArray addObject:](v7, "addObject:", v12);
          }

          id v3 = v14;
          p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
        }
      }
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetStatus)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSummary)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSummary),
        char v5 = objc_opt_respondsToSelector( v4,  "initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:withSch eduledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCo unt:withMaximumClientCount:withTotalClientCount:"),  v4,  (v5 & 1) != 0))
  {
    id v6 = v3;
    v21 = objc_alloc(&OBJC_CLASS___MANAutoAssetSummary);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 assetSelector]);
    id v20 = [v6 assetRepresentation];
    unsigned int v19 = [v6 assetWasPatched];
    unsigned int v18 = [v6 assetIsStaged];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 jobStatus]);
    id v17 = [v6 scheduledIntervalSecs];
    id v9 = [v6 scheduledRemainingSecs];
    id v10 = [v6 pushDelaySecs];
    id v11 = [v6 activeClientCount];
    id v12 = [v6 activeMonitorCount];
    id v13 = [v6 maximumClientCount];
    id v14 = [v6 totalClientCount];

    v15 = -[MANAutoAssetSummary initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:withScheduledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:withMaximumClientCount:withTotalClientCount:]( v21,  "initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:withSchedu ledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:wi thMaximumClientCount:withTotalClientCount:",  v7,  v20,  v19,  v18,  v8,  v17,  v9,  v10,  v11,  v12,  v13,  v14);
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
    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSummary)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSummary),
          char v10 = objc_opt_respondsToSelector( v9,  "initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:with ScheduledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMon itorCount:withMaximumClientCount:withTotalClientCount:"),  v9,  (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSummary)];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetSummary newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSummary,  "newShimmedFromFramework:",  v12);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

+ (id)newAssetRepresentationName:(int64_t)a3
{
  id result = (id)objc_opt_class(&OBJC_CLASS___MAAutoAssetSummary);
  if (result)
  {
    if ((objc_opt_respondsToSelector(&OBJC_CLASS___MAAutoAssetSummary, "assetRepresentationName:") & 1) != 0) {
      return (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetSummary assetRepresentationName:]( &OBJC_CLASS___MAAutoAssetSummary,  "assetRepresentationName:",  a3));
    }
    else {
      return -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"representation:%ld",  a3);
    }
  }

  return result;
}

@end