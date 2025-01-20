@interface MASAutoAssetSetInfoEnd
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetInfoEnd

+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    if (__isPlatformVersionAtLeast(3, 17, 0, 0)
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoEnd)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoEnd),
          char v10 = objc_opt_respondsToSelector(v9, "initWithLockReason:endingLockCount:"),
          v9,
          (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetInfoEnd)];
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetSetInfoEnd newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetInfoEnd,  "newShimmedFromFramework:",  v12);
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
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoEnd)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoEnd),
        char v5 = objc_opt_respondsToSelector(v4, "initWithLockReason:endingLockCount:"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = v3;
    v7 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetInfoEnd);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 endLockReason]);
    id v9 = [v6 endLockCount];

    char v10 = -[MANAutoAssetSetInfoEnd initWithLockReason:endingLockCount:]( v7,  "initWithLockReason:endingLockCount:",  v8,  v9);
  }

  else
  {
    char v10 = 0LL;
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
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoEnd))
      {
        id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSetInfoEnd)];
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
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInfoEnd)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoEnd),
        char v5 = objc_opt_respondsToSelector(v4, "initWithLockReason:endingLockCount:"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoEnd);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 endLockReason]);
    id v8 = objc_msgSend(v6, "initWithLockReason:endingLockCount:", v7, objc_msgSend(v3, "endLockCount"));
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

@end