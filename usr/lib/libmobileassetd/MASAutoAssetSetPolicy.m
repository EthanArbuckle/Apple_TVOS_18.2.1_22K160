@interface MASAutoAssetSetPolicy
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetPolicy

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetPolicy),
        char v5 = objc_opt_respondsToSelector(v4, "init"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = v3;
    v7 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetPolicy);
    if ((objc_opt_respondsToSelector(v6, "userInitiated") & 1) != 0) {
      -[MANAutoAssetSetPolicy setUserInitiated:](v7, "setUserInitiated:", [v6 userInitiated]);
    }
    if ((objc_opt_respondsToSelector(v6, "lockInhibitsEmergencyRemoval") & 1) != 0) {
      -[MANAutoAssetSetPolicy setLockInhibitsEmergencyRemoval:]( v7,  "setLockInhibitsEmergencyRemoval:",  [v6 lockInhibitsEmergencyRemoval]);
    }
    if ((objc_opt_respondsToSelector(v6, "supportingShortTermLocks") & 1) != 0) {
      -[MANAutoAssetSetPolicy setSupportingShortTermLocks:]( v7,  "setSupportingShortTermLocks:",  [v6 supportingShortTermLocks]);
    }
    if ((objc_opt_respondsToSelector(v6, "allowCheckDownloadOnBattery") & 1) != 0) {
      -[MANAutoAssetSetPolicy setAllowCheckDownloadOnBattery:]( v7,  "setAllowCheckDownloadOnBattery:",  [v6 allowCheckDownloadOnBattery]);
    }
    if ((objc_opt_respondsToSelector(v6, "allowCheckDownloadWhenBatteryLow") & 1) != 0) {
      -[MANAutoAssetSetPolicy setAllowCheckDownloadWhenBatteryLow:]( v7,  "setAllowCheckDownloadWhenBatteryLow:",  [v6 allowCheckDownloadWhenBatteryLow]);
    }
    if ((objc_opt_respondsToSelector(v6, "allowCheckDownloadWhenCPUHigh") & 1) != 0) {
      -[MANAutoAssetSetPolicy setAllowCheckDownloadWhenCPUHigh:]( v7,  "setAllowCheckDownloadWhenCPUHigh:",  [v6 allowCheckDownloadWhenCPUHigh]);
    }
    if ((objc_opt_respondsToSelector(v6, "allowCheckDownloadOverExpensive") & 1) != 0) {
      -[MANAutoAssetSetPolicy setAllowCheckDownloadOverExpensive:]( v7,  "setAllowCheckDownloadOverExpensive:",  [v6 allowCheckDownloadOverExpensive]);
    }
    if ((objc_opt_respondsToSelector(v6, "allowCheckDownloadOverCellular") & 1) != 0) {
      -[MANAutoAssetSetPolicy setAllowCheckDownloadOverCellular:]( v7,  "setAllowCheckDownloadOverCellular:",  [v6 allowCheckDownloadOverCellular]);
    }
    if ((objc_opt_respondsToSelector(v6, "blockCheckDownload") & 1) != 0) {
      -[MANAutoAssetSetPolicy setBlockCheckDownload:]( v7,  "setBlockCheckDownload:",  [v6 blockCheckDownload]);
    }
    if ((objc_opt_respondsToSelector(v6, "additionalPolicyControl") & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 additionalPolicyControl]);
      -[MANAutoAssetSetPolicy setAdditionalPolicyControl:](v7, "setAdditionalPolicyControl:", v8);
    }
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

+ (id)newShimmedToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetPolicy),
        char v5 = objc_opt_respondsToSelector(v4, "init"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetSetPolicy);
    if ((objc_opt_respondsToSelector(v6, "userInitiated") & 1) != 0) {
      objc_msgSend(v6, "setUserInitiated:", objc_msgSend(v3, "userInitiated"));
    }
    if ((objc_opt_respondsToSelector(v6, "lockInhibitsEmergencyRemoval") & 1) != 0) {
      objc_msgSend(v6, "setLockInhibitsEmergencyRemoval:", objc_msgSend(v3, "lockInhibitsEmergencyRemoval"));
    }
    if ((objc_opt_respondsToSelector(v6, "supportingShortTermLocks") & 1) != 0) {
      objc_msgSend(v6, "setSupportingShortTermLocks:", objc_msgSend(v3, "supportingShortTermLocks"));
    }
    if ((objc_opt_respondsToSelector(v6, "allowCheckDownloadOnBattery") & 1) != 0) {
      objc_msgSend(v6, "setAllowCheckDownloadOnBattery:", objc_msgSend(v3, "allowCheckDownloadOnBattery"));
    }
    if ((objc_opt_respondsToSelector(v6, "allowCheckDownloadWhenBatteryLow") & 1) != 0) {
      objc_msgSend(v6, "setAllowCheckDownloadWhenBatteryLow:", objc_msgSend(v3, "allowCheckDownloadWhenBatteryLow"));
    }
    if ((objc_opt_respondsToSelector(v6, "allowCheckDownloadWhenCPUHigh") & 1) != 0) {
      objc_msgSend(v6, "setAllowCheckDownloadWhenCPUHigh:", objc_msgSend(v3, "allowCheckDownloadWhenCPUHigh"));
    }
    if ((objc_opt_respondsToSelector(v6, "allowCheckDownloadOverExpensive") & 1) != 0) {
      objc_msgSend(v6, "setAllowCheckDownloadOverExpensive:", objc_msgSend(v3, "allowCheckDownloadOverExpensive"));
    }
    if ((objc_opt_respondsToSelector(v6, "allowCheckDownloadOverCellular") & 1) != 0) {
      objc_msgSend(v6, "setAllowCheckDownloadOverCellular:", objc_msgSend(v3, "allowCheckDownloadOverCellular"));
    }
    if ((objc_opt_respondsToSelector(v6, "blockCheckDownload") & 1) != 0) {
      objc_msgSend(v6, "setBlockCheckDownload:", objc_msgSend(v3, "blockCheckDownload"));
    }
    if ((objc_opt_respondsToSelector(v6, "additionalPolicyControl") & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v3 additionalPolicyControl]);
      [v6 setAdditionalPolicyControl:v7];
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
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy))
      {
        id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSetPolicy)];
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

+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    if (__isPlatformVersionAtLeast(3, 17, 0, 0)
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetPolicy),
          char v10 = objc_opt_respondsToSelector(v9, "init"),
          v9,
          (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetPolicy)];
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:",  v12);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

@end