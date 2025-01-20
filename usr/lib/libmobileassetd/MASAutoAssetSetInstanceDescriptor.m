@interface MASAutoAssetSetInstanceDescriptor
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetInstanceDescriptor

+ (id)newServerMessageClasses:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    if (__isPlatformVersionAtLeast(3, 17, 0, 0))
    {
      v4 = v3;
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry))
      {
        id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSetAtomicEntry)];
        v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInstanceDescriptor))
      {
        id v6 = [v4 setByAddingObject:objc_opt_class(MAAutoAssetSetInstanceDescriptor)];
        uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

        v4 = (void *)v7;
      }
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
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInstanceDescriptor)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInstanceDescriptor),
        char v5 = objc_opt_respondsToSelector( v4,  "initForClientDomainName:forAssetSetIdentifier:withAtomicInstanceEntries:withFullyDownloaded:withNeverBeen Locked:withDownloadUserInitiated:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withStagedPriorToAvailable:"),  v4,  (v5 & 1) != 0))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 atomicInstanceEntries]);
    id v7 = +[MASAutoAssetSetAtomicEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayToFramework:",  v6);

    id v8 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInstanceDescriptor);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 clientDomainName]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 assetSetIdentifier]);
    id v11 = [v3 isFullyDownloaded];
    id v12 = [v3 neverBeenLocked];
    id v13 = [v3 downloadUserInitiated];
    id v14 = [v3 downloadedNetworkBytes];
    id v15 = [v3 downloadedFilesystemBytes];
    LOBYTE(v18) = [v3 stagedPriorToAvailable];
    id v16 = [v8 initForClientDomainName:v9 forAssetSetIdentifier:v10 withAtomicInstanceEntries:v7 withFullyDownloaded:v11 withNeverBeenLoc ked:v12 withDownloadUserInitiated:v13 withDownloadedNetworkBytes:v14 withDownloadedFilesystemBytes:v15 withStagedPriorToAvailable:v18];
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetInstanceDescriptor)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInstanceDescriptor),
        char v5 = objc_opt_respondsToSelector( v4,  "initForClientDomainName:forAssetSetIdentifier:withAtomicInstanceEntries:withFullyDownloaded:withNeverBeen Locked:withDownloadUserInitiated:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withStagedPriorToAvailable:"),  v4,  (v5 & 1) != 0))
  {
    id v6 = v3;
    v20 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetInstanceDescriptor);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 clientDomainName]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 assetSetIdentifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 atomicInstanceEntries]);
    id v8 = +[MASAutoAssetSetAtomicEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayFromFramework:",  v7);
    id v9 = [v6 isFullyDownloaded];
    id v10 = [v6 neverBeenLocked];
    id v11 = [v6 downloadUserInitiated];
    id v12 = [v6 downloadedNetworkBytes];
    id v13 = [v6 downloadedFilesystemBytes];
    unsigned __int8 v14 = [v6 stagedPriorToAvailable];

    LOBYTE(v17) = v14;
    id v15 = -[MANAutoAssetSetInstanceDescriptor initForClientDomainName:forAssetSetIdentifier:withAtomicInstanceEntries:withFullyDownloaded:withNeverBeenLocked:withDownloadUserInitiated:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withStagedPriorToAvailable:]( v20,  "initForClientDomainName:forAssetSetIdentifier:withAtomicInstanceEntries:withFullyDownloaded:withNeverBeenLoc ked:withDownloadUserInitiated:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withStagedPriorToAvailable:",  v19,  v18,  v8,  v9,  v10,  v11,  v12,  v13,  v17);
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

@end