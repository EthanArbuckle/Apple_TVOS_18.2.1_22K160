@interface MASAutoAssetSetNotifications
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetNotifications

+ (id)newShimmedToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetNotifications)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetNotifications),
        char v5 = objc_opt_respondsToSelector(v4, "init"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetSetNotifications);
    if ((objc_opt_respondsToSelector(v6, "atomicInstanceDiscovered") & 1) != 0) {
      objc_msgSend(v6, "setAtomicInstanceDiscovered:", objc_msgSend(v3, "atomicInstanceDiscovered"));
    }
    if ((objc_opt_respondsToSelector(v6, "atomicInstanceAvailableForUse") & 1) != 0) {
      objc_msgSend(v6, "setAtomicInstanceAvailableForUse:", objc_msgSend(v3, "atomicInstanceAvailableForUse"));
    }
    if ((objc_opt_respondsToSelector(v6, "lockUsageCheck") & 1) != 0) {
      objc_msgSend(v6, "setLockUsageCheck:", objc_msgSend(v3, "lockUsageCheck"));
    }
    if ((objc_opt_respondsToSelector(v6, "filesystemSpaceCritical") & 1) != 0) {
      objc_msgSend(v6, "setFilesystemSpaceCritical:", objc_msgSend(v3, "filesystemSpaceCritical"));
    }
    if ((objc_opt_respondsToSelector(v6, "atomicInstancePurged") & 1) != 0) {
      objc_msgSend(v6, "setAtomicInstancePurged:", objc_msgSend(v3, "atomicInstancePurged"));
    }
    if ((objc_opt_respondsToSelector(v6, "downloadPending") & 1) != 0) {
      objc_msgSend(v6, "setDownloadPending:", objc_msgSend(v3, "downloadPending"));
    }
    if ((objc_opt_respondsToSelector(v6, "downloadProgress") & 1) != 0) {
      objc_msgSend(v6, "setDownloadProgress:", objc_msgSend(v3, "downloadProgress"));
    }
    if ((objc_opt_respondsToSelector(v6, "downloadAbandoned") & 1) != 0) {
      objc_msgSend(v6, "setDownloadAbandoned:", objc_msgSend(v3, "downloadAbandoned"));
    }
    if ((objc_opt_respondsToSelector(v6, "downloadedBecameIncomplete") & 1) != 0) {
      objc_msgSend(v6, "setDownloadedBecameIncomplete:", objc_msgSend(v3, "downloadedBecameIncomplete"));
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
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetNotifications))
      {
        id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSetNotifications)];
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
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetNotifications)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetNotifications),
        char v5 = objc_opt_respondsToSelector(v4, "init"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = v3;
    v7 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetNotifications);
    if ((objc_opt_respondsToSelector(v6, "atomicInstanceDiscovered") & 1) != 0) {
      -[MANAutoAssetSetNotifications setAtomicInstanceDiscovered:]( v7,  "setAtomicInstanceDiscovered:",  [v6 atomicInstanceDiscovered]);
    }
    if ((objc_opt_respondsToSelector(v6, "atomicInstanceAvailableForUse") & 1) != 0) {
      -[MANAutoAssetSetNotifications setAtomicInstanceAvailableForUse:]( v7,  "setAtomicInstanceAvailableForUse:",  [v6 atomicInstanceAvailableForUse]);
    }
    if ((objc_opt_respondsToSelector(v6, "lockUsageCheck") & 1) != 0) {
      -[MANAutoAssetSetNotifications setLockUsageCheck:](v7, "setLockUsageCheck:", [v6 lockUsageCheck]);
    }
    if ((objc_opt_respondsToSelector(v6, "filesystemSpaceCritical") & 1) != 0) {
      -[MANAutoAssetSetNotifications setFilesystemSpaceCritical:]( v7,  "setFilesystemSpaceCritical:",  [v6 filesystemSpaceCritical]);
    }
    if ((objc_opt_respondsToSelector(v6, "atomicInstancePurged") & 1) != 0) {
      -[MANAutoAssetSetNotifications setAtomicInstancePurged:]( v7,  "setAtomicInstancePurged:",  [v6 atomicInstancePurged]);
    }
    if ((objc_opt_respondsToSelector(v6, "downloadPending") & 1) != 0) {
      -[MANAutoAssetSetNotifications setDownloadPending:]( v7,  "setDownloadPending:",  [v6 downloadPending]);
    }
    if ((objc_opt_respondsToSelector(v6, "downloadProgress") & 1) != 0) {
      -[MANAutoAssetSetNotifications setDownloadProgress:]( v7,  "setDownloadProgress:",  [v6 downloadProgress]);
    }
    if ((objc_opt_respondsToSelector(v6, "downloadAbandoned") & 1) != 0) {
      -[MANAutoAssetSetNotifications setDownloadAbandoned:]( v7,  "setDownloadAbandoned:",  [v6 downloadAbandoned]);
    }
    if ((objc_opt_respondsToSelector(v6, "downloadedBecameIncomplete") & 1) != 0) {
      -[MANAutoAssetSetNotifications setDownloadedBecameIncomplete:]( v7,  "setDownloadedBecameIncomplete:",  [v6 downloadedBecameIncomplete]);
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
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetNotifications)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetNotifications),
          char v10 = objc_opt_respondsToSelector(v9, "init"),
          v9,
          (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetNotifications)];
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetSetNotifications newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetNotifications,  "newShimmedFromFramework:",  v12);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

@end