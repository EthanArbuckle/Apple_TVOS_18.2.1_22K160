@interface MASAutoAssetSetTarget
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedArrayFromFramework:(id)a3;
+ (id)newShimmedArrayToFramework:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetTarget

+ (id)newShimmedArrayFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && (p_ivars = &MobileAssetKeyManager__metaData.ivars, objc_opt_class(&OBJC_CLASS___MAAutoAssetSetTarget))
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry)
    && (id v5 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetTarget),
        char v6 = objc_opt_respondsToSelector(v5, "initForMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:"),
        v5,
        (v6 & 1) != 0))
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
        v12 = 0LL;
        id v22 = v7;
        do
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v12]);
          if (v13)
          {
            uint64_t v14 = objc_opt_class(p_ivars[265]);
            if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
            {
              v15 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetTarget);
              v16 = (void *)objc_claimAutoreleasedReturnValue([v13 minTargetOSVersion]);
              v17 = (void *)objc_claimAutoreleasedReturnValue([v13 maxTargetOSVersion]);
              v18 = (void *)objc_claimAutoreleasedReturnValue([v13 autoAssetEntries]);
              id v19 = +[MASAutoAssetSetEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayFromFramework:",  v18);
              id v20 = -[MANAutoAssetSetTarget initForMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:]( v15,  "initForMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:",  v16,  v17,  v19);

              if (v20) {
                -[NSMutableArray addObject:](v9, "addObject:", v20);
              }

              p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
              id v7 = v22;
            }
          }

          ++v12;
        }

        while (v11 != v12);
      }
    }

    else
    {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

+ (id)newShimmedArrayToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetTarget)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetTarget),
        char v5 = objc_opt_respondsToSelector(v4, "initForMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:"),
        v4,
        (v5 & 1) != 0))
  {
    char v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v7 = (char *)[v3 count];
    if ((uint64_t)v7 >= 1)
    {
      uint64_t v8 = v7;
      for (i = 0LL; i != v8; ++i)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:i]);
        if (v10)
        {
          id v11 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetTarget);
          v12 = (void *)objc_claimAutoreleasedReturnValue([v10 minTargetOSVersion]);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v10 maxTargetOSVersion]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 autoAssetEntries]);
          id v15 = +[MASAutoAssetSetEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayToFramework:",  v14);
          id v16 = [v11 initForMinTargetOSVersion:v12 toMaxTargetOSVersion:v13 asEntriesWhenTargeting:v15];

          if (v16) {
            -[NSMutableArray addObject:](v6, "addObject:", v16);
          }
        }
      }
    }
  }

  else
  {
    char v6 = 0LL;
  }

  return v6;
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
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetTarget))
      {
        id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSetTarget)];
        id v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
      }
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)newShimmedToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetTarget)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetTarget),
        char v5 = objc_opt_respondsToSelector(v4, "initForMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetTarget);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 minTargetOSVersion]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 maxTargetOSVersion]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 autoAssetEntries]);
    id v10 = +[MASAutoAssetSetEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayToFramework:",  v9);
    id v11 = [v6 initForMinTargetOSVersion:v7 toMaxTargetOSVersion:v8 asEntriesWhenTargeting:v10];
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetTarget)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetTarget),
        char v5 = objc_opt_respondsToSelector(v4, "initForMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = v3;
    id v7 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetTarget);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 minTargetOSVersion]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 maxTargetOSVersion]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 autoAssetEntries]);

    id v11 = +[MASAutoAssetSetEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayFromFramework:",  v10);
    id v12 = -[MANAutoAssetSetTarget initForMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:]( v7,  "initForMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:",  v8,  v9,  v11);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
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
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetTarget)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetTarget),
          char v10 = objc_opt_respondsToSelector( v9,  "initForMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:"),  v9,  (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetTarget)];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetSetTarget newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetTarget,  "newShimmedFromFramework:",  v12);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

@end