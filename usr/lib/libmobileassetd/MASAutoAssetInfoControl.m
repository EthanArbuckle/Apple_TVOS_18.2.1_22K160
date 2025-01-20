@interface MASAutoAssetInfoControl
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
+ (int64_t)shimmedSimulateEndFromFramework:(int64_t)a3;
+ (int64_t)shimmedSimulateEndToFramework:(int64_t)a3;
+ (int64_t)shimmedSimulateOperationFromFramework:(int64_t)a3;
+ (int64_t)shimmedSimulateOperationToFramework:(int64_t)a3;
@end

@implementation MASAutoAssetInfoControl

+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetInfoControl)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl),
          char v10 = objc_opt_respondsToSelector(v9, "initForSimulateOperation:withSimulateEnd:"),
          v9,
          (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetInfoControl)];
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetInfoControl newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetInfoControl,  "newShimmedFromFramework:",  v12);
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
  if (v3 && objc_opt_class(&OBJC_CLASS___MAAutoAssetInfoControl))
  {
    id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl);
    char v5 = objc_opt_respondsToSelector(v4, "initWithVolumeToReclaim:withUrgency:targetingPurgeAmount:");

    if ((v5 & 1) != 0)
    {
      id v6 = v3;
      if ((objc_opt_respondsToSelector(v6, "volumeToReclaim") & 1) != 0
        && (objc_opt_respondsToSelector(v6, "cacheDeleteUrgency") & 1) != 0
        && (objc_opt_respondsToSelector(v6, "cacheDeleteUrgency") & 1) != 0)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue([v6 volumeToReclaim]);
        if (v7 || [v6 cacheDeleteUrgency])
        {

LABEL_10:
          id v8 = objc_alloc(&OBJC_CLASS___MANAutoAssetInfoControl);
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 volumeToReclaim]);
          char v10 = -[MANAutoAssetInfoControl initWithVolumeToReclaim:withUrgency:targetingPurgeAmount:]( v8,  "initWithVolumeToReclaim:withUrgency:targetingPurgeAmount:",  v9,  [v6 cacheDeleteUrgency],  objc_msgSend(v6, "targetingPurgeAmount"));

LABEL_31:
          goto LABEL_32;
        }

        if ([v6 targetingPurgeAmount]) {
          goto LABEL_10;
        }
      }
    }

    id v11 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl);
    char v12 = objc_opt_respondsToSelector(v11, "initForSimulateOperation:withSimulateEnd:");

    if ((v12 & 1) != 0)
    {
      id v13 = v3;
      if ((objc_opt_respondsToSelector(v13, "simulateOperation") & 1) != 0
        && (objc_opt_respondsToSelector(v13, "simulateEnd") & 1) != 0)
      {
        unint64_t v14 = (unint64_t)[v13 simulateOperation];
        unint64_t v15 = (unint64_t)[v13 simulateEnd];
        if (v14 | v15)
        {
          v16 = -[MANAutoAssetInfoControl initForSimulateOperation:withSimulateEnd:]( objc_alloc(&OBJC_CLASS___MANAutoAssetInfoControl),  "initForSimulateOperation:withSimulateEnd:",  +[MASAutoAssetInfoControl shimmedSimulateOperationFromFramework:]( &OBJC_CLASS___MASAutoAssetInfoControl,  "shimmedSimulateOperationFromFramework:",  v14),  +[MASAutoAssetInfoControl shimmedSimulateEndFromFramework:]( &OBJC_CLASS___MASAutoAssetInfoControl,  "shimmedSimulateEndFromFramework:",  v15));
LABEL_28:
          char v10 = v16;
          goto LABEL_31;
        }
      }
    }

    id v17 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl);
    char v18 = objc_opt_respondsToSelector(v17, "initClearingAfter:limitedToAssetTypes:");

    if ((v18 & 1) != 0)
    {
      id v19 = v3;
      if ((objc_opt_respondsToSelector(v19, "clearingAfter") & 1) != 0
        && (objc_opt_respondsToSelector(v19, "limitedToAssetTypes") & 1) != 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 limitedToAssetTypes]);

        if (v20)
        {
          v21 = objc_alloc(&OBJC_CLASS___MANAutoAssetInfoControl);
          id v22 = [v19 clearingAfter];
          v23 = (void *)objc_claimAutoreleasedReturnValue([v19 limitedToAssetTypes]);
          char v10 = -[MANAutoAssetInfoControl initClearingAfter:limitedToAssetTypes:]( v21,  "initClearingAfter:limitedToAssetTypes:",  v22,  v23);

          goto LABEL_31;
        }
      }
    }

    id v24 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl);
    char v25 = objc_opt_respondsToSelector(v24, "initClearingAfter:");

    if ((v25 & 1) != 0)
    {
      id v26 = v3;
      if ((objc_opt_respondsToSelector(v26, "clearingAfter") & 1) == 0)
      {
        char v10 = 0LL;
        goto LABEL_31;
      }

      v16 = -[MANAutoAssetInfoControl initClearingAfter:]( [MANAutoAssetInfoControl alloc],  "initClearingAfter:",  [v26 clearingAfter]);
      goto LABEL_28;
    }
  }

  char v10 = 0LL;
LABEL_32:

  return v10;
}

+ (id)newServerMessageClasses:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetInfoControl))
    {
      id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetInfoControl)];
      id v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
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
  if (!v3 || !objc_opt_class(&OBJC_CLASS___MAAutoAssetInfoControl)) {
    goto LABEL_19;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 volumeToReclaim]);
  if (v4 || [v3 cacheDeleteUrgency])
  {
  }

  else if (![v3 targetingPurgeAmount])
  {
    if ([v3 simulateOperation] || objc_msgSend(v3, "simulateEnd"))
    {
      id v10 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl);
      char v11 = objc_opt_respondsToSelector(v10, "initForSimulateOperation:withSimulateEnd:");

      if ((v11 & 1) == 0) {
        goto LABEL_19;
      }
      id v12 = objc_msgSend( [MAAutoAssetInfoControl alloc],  "initForSimulateOperation:withSimulateEnd:",  +[MASAutoAssetInfoControl shimmedSimulateOperationToFramework:]( MASAutoAssetInfoControl,  "shimmedSimulateOperationToFramework:",  objc_msgSend(v3, "simulateOperation")),  +[MASAutoAssetInfoControl shimmedSimulateEndToFramework:]( MASAutoAssetInfoControl,  "shimmedSimulateEndToFramework:",  objc_msgSend(v3, "simulateEnd")));
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 limitedToAssetTypes]);

      id v14 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl);
      unint64_t v15 = v14;
      if (v13)
      {
        char v16 = objc_opt_respondsToSelector(v14, "initClearingAfter:limitedToAssetTypes:");

        if ((v16 & 1) != 0)
        {
          id v17 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl);
          id v18 = [v3 clearingAfter];
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 limitedToAssetTypes]);
          id v9 = [v17 initClearingAfter:v18 limitedToAssetTypes:v19];

          goto LABEL_20;
        }

+ (int64_t)shimmedSimulateOperationToFramework:(int64_t)a3
{
  int64_t result = objc_opt_class(&OBJC_CLASS___MAAutoAssetInfoControl);
  if (result)
  {
    id v5 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl);
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      else {
        return a3;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

+ (int64_t)shimmedSimulateOperationFromFramework:(int64_t)a3
{
  int64_t result = objc_opt_class(&OBJC_CLASS___MAAutoAssetInfoControl);
  if (result)
  {
    id v5 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl);
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      else {
        return a3;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

+ (int64_t)shimmedSimulateEndToFramework:(int64_t)a3
{
  int64_t result = objc_opt_class(&OBJC_CLASS___MAAutoAssetInfoControl);
  if (result)
  {
    id v5 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl);
    unsigned __int8 v6 = objc_opt_respondsToSelector();

    return (a3 == 1) & v6;
  }

  return result;
}

+ (int64_t)shimmedSimulateEndFromFramework:(int64_t)a3
{
  int64_t result = objc_opt_class(&OBJC_CLASS___MAAutoAssetInfoControl);
  if (result)
  {
    id v5 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl);
    unsigned __int8 v6 = objc_opt_respondsToSelector();

    return (a3 == 1) & v6;
  }

  return result;
}

@end