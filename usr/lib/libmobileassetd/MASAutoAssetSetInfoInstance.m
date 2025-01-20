@interface MASAutoAssetSetInfoInstance
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetInfoInstance

+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    if (__isPlatformVersionAtLeast(3, 17, 0, 0)
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoInstance)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance),
          char v10 = objc_opt_respondsToSelector( v9,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInsta nce:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:"),  v9,  (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetInfoInstance)];
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetSetInfoInstance newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetInfoInstance,  "newShimmedFromFramework:",  v12);
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
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetTarget)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoInstance)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance),
        char v5 = objc_opt_respondsToSelector( v4,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance :comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:"),  v4,  (v5 & 1) != 0))
  {
    id v6 = v3;
    v7 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetInfoInstance);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 clientDomainName]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 autoAssetSetClientName]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 clientProcessName]);
    id v17 = [v6 clientProcessID];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 assetSetIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 atomicInstance]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 autoAssetEntries]);
    id v10 = +[MASAutoAssetSetEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayFromFramework:",  v18);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 entriesWhenTargeting]);
    id v12 = +[MASAutoAssetSetTarget newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetTarget,  "newShimmedArrayFromFramework:",  v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 frameworkInstanceUUID]);

    id v14 = -[MANAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v7,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v20,  v19,  v16,  v17,  v8,  v9,  v10,  v12,  v13);
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

+ (id)newShimmedToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetTarget)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoInstance)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance),
        char v5 = objc_opt_respondsToSelector( v4,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance :comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:"),  v4,  (v5 & 1) != 0))
  {
    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v3 clientDomainName]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v3 autoAssetSetClientName]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 clientProcessName]);
    id v16 = [v3 clientProcessID];
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 assetSetIdentifier]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 atomicInstance]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v3 autoAssetEntries]);
    id v9 = +[MASAutoAssetSetEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayToFramework:",  v18);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 entriesWhenTargeting]);
    id v11 = +[MASAutoAssetSetTarget newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetTarget,  "newShimmedArrayToFramework:",  v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 frameworkInstanceUUID]);
    id v13 = [v6 initUsingClientDomain:v15 forClientName:v19 withProcessName:v17 withProcessID:v16 forAssetSetIdentifier:v7 forAtomicInstance:v8 co mprisedOfEntries:v9 asEntriesWhenTargeting:v11 associatingFrameworkUUID:v12];
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
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
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry))
      {
        id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSetEntry)];
        id v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetTarget))
      {
        id v6 = [v4 setByAddingObject:objc_opt_class(MAAutoAssetSetTarget)];
        uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

        id v4 = (void *)v7;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoInstance))
      {
        id v8 = [v4 setByAddingObject:objc_opt_class(MAAutoAssetSetInfoInstance)];
        uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

        id v4 = (void *)v9;
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