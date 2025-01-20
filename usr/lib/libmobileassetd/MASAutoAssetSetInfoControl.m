@interface MASAutoAssetSetInfoControl
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetInfoControl

+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    if (__isPlatformVersionAtLeast(3, 17, 0, 0)
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoControl)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoControl),
          char v10 = objc_opt_respondsToSelector(v9, "initClearingAfter:limitedToSetIdentifiers:"),
          v9,
          (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetInfoControl)];
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetSetInfoControl newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetInfoControl,  "newShimmedFromFramework:",  v12);
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
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoControl)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoControl),
        char v5 = objc_opt_respondsToSelector(v4, "initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = v3;
    v7 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetInfoControl);
    id v8 = [v6 clearingAfter];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 limitedToClientDomains]);
    char v10 = (void *)objc_claimAutoreleasedReturnValue([v6 limitedToSetIdentifiers]);

    id v11 = -[MANAutoAssetSetInfoControl initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:]( v7,  "initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:",  v8,  v9,  v10);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
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
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoControl))
      {
        id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSetInfoControl)];
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
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoControl)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoControl),
        char v5 = objc_opt_respondsToSelector(v4, "initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoControl);
    id v7 = [v3 clearingAfter];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 limitedToClientDomains]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 limitedToSetIdentifiers]);
    id v10 = [v6 initClearingAfter:v7 limitedToClientDomains:v8 limitedToSetIdentifiers:v9];
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

@end