@interface MASAutoAssetControlStatisticsBySize
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetControlStatisticsBySize

+ (id)newServerMessageClasses:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize))
    {
      id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetControlStatisticsBySize)];
      v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
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
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize),
        char v5 = objc_opt_respondsToSelector(v4, "init"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize);
    if ((objc_opt_respondsToSelector(v6, "patchedAssets") & 1) != 0) {
      objc_msgSend(v6, "setPatchedAssets:", objc_msgSend(v3, "patchedAssets"));
    }
    if ((objc_opt_respondsToSelector(v6, "patchedBytes") & 1) != 0) {
      objc_msgSend(v6, "setPatchedBytes:", objc_msgSend(v3, "patchedBytes"));
    }
    if ((objc_opt_respondsToSelector(v6, "fullAssets") & 1) != 0) {
      objc_msgSend(v6, "setFullAssets:", objc_msgSend(v3, "fullAssets"));
    }
    if ((objc_opt_respondsToSelector(v6, "fullBytes") & 1) != 0) {
      objc_msgSend(v6, "setFullBytes:", objc_msgSend(v3, "fullBytes"));
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize),
        char v5 = objc_opt_respondsToSelector(v4, "init"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = v3;
    v7 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetControlStatisticsBySize);
    if ((objc_opt_respondsToSelector(v6, "patchedAssets") & 1) != 0) {
      -[MANAutoAssetControlStatisticsBySize setPatchedAssets:]( v7,  "setPatchedAssets:",  [v6 patchedAssets]);
    }
    if ((objc_opt_respondsToSelector(v6, "patchedBytes") & 1) != 0) {
      -[MANAutoAssetControlStatisticsBySize setPatchedBytes:](v7, "setPatchedBytes:", [v6 patchedBytes]);
    }
    if ((objc_opt_respondsToSelector(v6, "fullAssets") & 1) != 0) {
      -[MANAutoAssetControlStatisticsBySize setFullAssets:](v7, "setFullAssets:", [v6 fullAssets]);
    }
    if ((objc_opt_respondsToSelector(v6, "fullBytes") & 1) != 0) {
      -[MANAutoAssetControlStatisticsBySize setFullBytes:](v7, "setFullBytes:", [v6 fullBytes]);
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
    id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize);
    char v10 = objc_opt_respondsToSelector(v9, "init");

    if ((v10 & 1) != 0)
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetControlStatisticsBySize)];
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetControlStatisticsBySize newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsBySize,  "newShimmedFromFramework:",  v12);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

@end