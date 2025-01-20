@interface MASAutoAssetSetProgress
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetProgress

+ (id)newShimmedToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetProgress)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetProgress),
        char v5 = objc_opt_respondsToSelector(v4, "init"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetSetProgress);
    if ((objc_opt_respondsToSelector(v6, "downloadedAssetCount") & 1) != 0) {
      objc_msgSend(v6, "setDownloadedAssetCount:", objc_msgSend(v3, "downloadedAssetCount"));
    }
    if ((objc_opt_respondsToSelector(v6, "remainingAssetCount") & 1) != 0) {
      objc_msgSend(v6, "setRemainingAssetCount:", objc_msgSend(v3, "remainingAssetCount"));
    }
    if ((objc_opt_respondsToSelector(v6, "totalExpectedBytes") & 1) != 0) {
      objc_msgSend(v6, "setTotalExpectedBytes:", objc_msgSend(v3, "totalExpectedBytes"));
    }
    if ((objc_opt_respondsToSelector(v6, "totalWrittenBytes") & 1) != 0) {
      objc_msgSend(v6, "setTotalWrittenBytes:", objc_msgSend(v3, "totalWrittenBytes"));
    }
    if ((objc_opt_respondsToSelector(v6, "isStalled") & 1) != 0) {
      objc_msgSend(v6, "setIsStalled:", objc_msgSend(v3, "isStalled"));
    }
    if ((objc_opt_respondsToSelector(v6, "expectedTimeRemainingSecs") & 1) != 0)
    {
      [v3 expectedTimeRemainingSecs];
      objc_msgSend(v6, "setExpectedTimeRemainingSecs:");
    }
  }

  else
  {
    id v6 = 0LL;
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
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetProgress))
      {
        id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSetProgress)];
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

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetProgress)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetProgress),
        char v5 = objc_opt_respondsToSelector(v4, "init"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = v3;
    v7 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetProgress);
    if ((objc_opt_respondsToSelector(v6, "downloadedAssetCount") & 1) != 0) {
      -[MANAutoAssetSetProgress setDownloadedAssetCount:]( v7,  "setDownloadedAssetCount:",  [v6 downloadedAssetCount]);
    }
    if ((objc_opt_respondsToSelector(v6, "remainingAssetCount") & 1) != 0) {
      -[MANAutoAssetSetProgress setRemainingAssetCount:]( v7,  "setRemainingAssetCount:",  [v6 remainingAssetCount]);
    }
    if ((objc_opt_respondsToSelector(v6, "totalExpectedBytes") & 1) != 0) {
      -[MANAutoAssetSetProgress setTotalExpectedBytes:]( v7,  "setTotalExpectedBytes:",  [v6 totalExpectedBytes]);
    }
    if ((objc_opt_respondsToSelector(v6, "totalWrittenBytes") & 1) != 0) {
      -[MANAutoAssetSetProgress setTotalWrittenBytes:]( v7,  "setTotalWrittenBytes:",  [v6 totalWrittenBytes]);
    }
    if ((objc_opt_respondsToSelector(v6, "isStalled") & 1) != 0) {
      -[MANAutoAssetSetProgress setIsStalled:](v7, "setIsStalled:", [v6 isStalled]);
    }
    if ((objc_opt_respondsToSelector(v6, "expectedTimeRemainingSecs") & 1) != 0)
    {
      [v6 expectedTimeRemainingSecs];
      -[MANAutoAssetSetProgress setExpectedTimeRemainingSecs:](v7, "setExpectedTimeRemainingSecs:");
    }
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    if (__isPlatformVersionAtLeast(3, 17, 0, 0)
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetProgress)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetProgress),
          char v10 = objc_opt_respondsToSelector(v9, "init"),
          v9,
          (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetProgress)];
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetSetProgress newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetProgress,  "newShimmedFromFramework:",  v12);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

@end