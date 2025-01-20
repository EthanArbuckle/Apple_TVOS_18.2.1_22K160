@interface MASAutoAssetSetStatus
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetStatus

+ (id)newShimmedToFramework:(id)a3
{
  id v3 = a3;
  if (!v3
    || !__isPlatformVersionAtLeast(3, 17, 0, 0)
    || !objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry)
    || !objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry)
    || !objc_opt_class(&OBJC_CLASS___MAAutoAssetSetNotifications)
    || !objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy)
    || !objc_opt_class(&OBJC_CLASS___MAAutoAssetSetProgress)
    || !objc_opt_class(&OBJC_CLASS___MAAutoAssetSetStatus))
  {
    goto LABEL_25;
  }

  id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
  char v5 = objc_opt_respondsToSelector( v4,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCa talogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerA tomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloaded AtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloa dedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSc hedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownl oadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockU sage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:");

  id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    char v19 = objc_opt_respondsToSelector( v6,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:wit hCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:with NewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatest DowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive :withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNe edPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:withDownloadUserInitiated:withDow nloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsFor Staging:withAvailableForUseError:withNewerVersionError:");

    id v20 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
    v21 = v20;
    if ((v19 & 1) != 0)
    {
      v163 = (void *)objc_claimAutoreleasedReturnValue([v3 clientDomainName]);
      v162 = (void *)objc_claimAutoreleasedReturnValue([v3 assetSetIdentifier]);
      v141 = (void *)objc_claimAutoreleasedReturnValue([v3 configuredAssetEntries]);
      id v161 = +[MASAutoAssetSetEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayToFramework:",  v141);
      uint64_t v115 = objc_claimAutoreleasedReturnValue([v3 atomicInstancesDownloaded]);
      uint64_t v133 = objc_claimAutoreleasedReturnValue([v3 catalogCachedAssetSetID]);
      uint64_t v127 = objc_claimAutoreleasedReturnValue([v3 catalogDownloadedFromLive]);
      id v160 = (id)objc_claimAutoreleasedReturnValue([v3 catalogLastTimeChecked]);
      uint64_t v121 = objc_claimAutoreleasedReturnValue([v3 catalogPostedDate]);
      v155 = (void *)objc_claimAutoreleasedReturnValue([v3 newerAtomicInstanceDiscovered]);
      v112 = v21;
      id v142 = (id)objc_claimAutoreleasedReturnValue([v3 newerDiscoveredAtomicEntries]);
      id v154 = +[MASAutoAssetSetAtomicEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayToFramework:");
      id v158 = (id)objc_claimAutoreleasedReturnValue([v3 latestDownloadedAtomicInstance]);
      v140 = (void *)objc_claimAutoreleasedReturnValue([v3 latestDowloadedAtomicInstanceEntries]);
      id v156 = +[MASAutoAssetSetAtomicEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayToFramework:");
      v149 = (void *)objc_claimAutoreleasedReturnValue([v3 downloadedCatalogCachedAssetSetID]);
      id v152 = (id)objc_claimAutoreleasedReturnValue([v3 downloadedCatalogDownloadedFromLive]);
      v148 = (void *)objc_claimAutoreleasedReturnValue([v3 downloadedCatalogLastTimeChecked]);
      id v150 = (id)objc_claimAutoreleasedReturnValue([v3 downloadedCatalogPostedDate]);
      v139 = (void *)objc_claimAutoreleasedReturnValue([v3 currentNotifications]);
      id v146 = +[MASAutoAssetSetNotifications newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetNotifications,  "newShimmedToFramework:");
      v138 = (void *)objc_claimAutoreleasedReturnValue([v3 currentNeedPolicy]);
      id v22 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:");
      uint64_t v110 = objc_claimAutoreleasedReturnValue([v3 schedulerPolicy]);
      id v101 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:",  v110);
      v107 = (void *)objc_claimAutoreleasedReturnValue([v3 stagerPolicy]);
      id v95 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:",  v107);
      unsigned __int8 v144 = [v3 haveReceivedLookupResponse];
      unsigned __int8 v98 = [v3 downloadUserInitiated];
      v104 = (void *)objc_claimAutoreleasedReturnValue([v3 downloadProgress]);
      id v92 = +[MASAutoAssetSetProgress newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetProgress,  "newShimmedToFramework:",  v104);
      id v23 = [v3 downloadedNetworkBytes];
      id v24 = [v3 downloadedFilesystemBytes];
      v90 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLockUsage]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v3 selectorsForStaging]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v3 availableForUseError]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v3 newerVersionError]);
      BYTE1(v85) = v98;
      LOBYTE(v85) = v144;
      v28 = v101;
      id v143 = v22;
      v14 = (void *)v115;
      v15 = (void *)v133;
      id v17 = objc_msgSend( v112,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:w ithCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate: withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:with LatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloaded FromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:wit hCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:withDownloadUserIniti ated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:wi thSelectorsForStaging:withAvailableForUseError:withNewerVersionError:",  v163,  v162,  v161,  v115,  v133,  v127,  v160,  v121,  v155,  v154,  v158,  v156,  v149,  v152,  v148,  v150,  v146,  v22,  v101,  v95,  v85,  v92,  v23,  v24,  v90,  v25,  v26,  v27);

      v13 = (void *)v121;
      v16 = (void *)v127;

      v29 = v95;
LABEL_15:

LABEL_16:
      v18 = (void *)v110;
      goto LABEL_17;
    }

    char v30 = objc_opt_respondsToSelector( v20,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:wit hCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:with NewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatest DowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive :withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNe edPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedN etworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseEr ror:withNewerVersionError:");

    id v31 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
    v32 = v31;
    if ((v30 & 1) != 0)
    {
      v163 = (void *)objc_claimAutoreleasedReturnValue([v3 clientDomainName]);
      v162 = (void *)objc_claimAutoreleasedReturnValue([v3 assetSetIdentifier]);
      v141 = (void *)objc_claimAutoreleasedReturnValue([v3 configuredAssetEntries]);
      id v161 = +[MASAutoAssetSetEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayToFramework:",  v141);
      uint64_t v116 = objc_claimAutoreleasedReturnValue([v3 atomicInstancesDownloaded]);
      uint64_t v134 = objc_claimAutoreleasedReturnValue([v3 catalogCachedAssetSetID]);
      uint64_t v128 = objc_claimAutoreleasedReturnValue([v3 catalogDownloadedFromLive]);
      id v160 = (id)objc_claimAutoreleasedReturnValue([v3 catalogLastTimeChecked]);
      uint64_t v122 = objc_claimAutoreleasedReturnValue([v3 catalogPostedDate]);
      v155 = (void *)objc_claimAutoreleasedReturnValue([v3 newerAtomicInstanceDiscovered]);
      id v142 = (id)objc_claimAutoreleasedReturnValue([v3 newerDiscoveredAtomicEntries]);
      id v154 = +[MASAutoAssetSetAtomicEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayToFramework:");
      id v158 = (id)objc_claimAutoreleasedReturnValue([v3 latestDownloadedAtomicInstance]);
      v140 = (void *)objc_claimAutoreleasedReturnValue([v3 latestDowloadedAtomicInstanceEntries]);
      id v156 = +[MASAutoAssetSetAtomicEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayToFramework:");
      v149 = (void *)objc_claimAutoreleasedReturnValue([v3 downloadedCatalogCachedAssetSetID]);
      id v152 = (id)objc_claimAutoreleasedReturnValue([v3 downloadedCatalogDownloadedFromLive]);
      v148 = (void *)objc_claimAutoreleasedReturnValue([v3 downloadedCatalogLastTimeChecked]);
      id v150 = (id)objc_claimAutoreleasedReturnValue([v3 downloadedCatalogPostedDate]);
      v139 = (void *)objc_claimAutoreleasedReturnValue([v3 currentNotifications]);
      id v146 = +[MASAutoAssetSetNotifications newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetNotifications,  "newShimmedToFramework:");
      v138 = (void *)objc_claimAutoreleasedReturnValue([v3 currentNeedPolicy]);
      id v33 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:");
      uint64_t v110 = objc_claimAutoreleasedReturnValue([v3 schedulerPolicy]);
      id v102 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:",  v110);
      v107 = (void *)objc_claimAutoreleasedReturnValue([v3 stagerPolicy]);
      id v99 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:",  v107);
      unsigned __int8 v145 = [v3 downloadUserInitiated];
      v105 = (void *)objc_claimAutoreleasedReturnValue([v3 downloadProgress]);
      id v96 = +[MASAutoAssetSetProgress newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetProgress,  "newShimmedToFramework:",  v105);
      id v34 = [v3 downloadedNetworkBytes];
      id v35 = [v3 downloadedFilesystemBytes];
      v93 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLockUsage]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v3 selectorsForStaging]);
      v37 = (void *)objc_claimAutoreleasedReturnValue([v3 availableForUseError]);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v3 newerVersionError]);
      id v87 = v34;
      LOBYTE(v85) = v145;
      v28 = v102;
      id v143 = v33;
      v14 = (void *)v116;
      v16 = (void *)v128;
      id v17 = [v32 initStatusForClientDomain:v163 forAssetSetIdentifier:v162 withConfiguredAssetEntries:v161 withAtomicInstancesDownloaded:v116 w ithCatalogCachedAssetSetID:v134 withCatalogDownloadedFromLive:v128 withCatalogLastTimeChecked:v160 withCatalogPostedDate:v122  withNewerAtomicInstanceDiscovered:v155 withNewerDiscoveredAtomicEntries:v154 withLatestDownloadedAtomicInstance:v158 with LatestDowloadedAtomicInstanceEntries:v156 withDownloadedCatalogCachedAssetSetID:v149 withDownloadedCatalogDownloaded FromLive:v152 withDownloadedCatalogLastTimeChecked:v148 withDownloadedCatalogPostedDate:v150 withCurrentNotifications:v146 wit hCurrentNeedPolicy:v33 withSchedulerPolicy:v102 withStagerPolicy:v99 withDownloadUserInitiated:v85 withDownloadProgress:v96 wit hDownloadedNetworkBytes:v87 withDownloadedFilesystemBytes:v35 withCurrentLockUsage:v93 withSelectorsForStaging:v36 withAva ilableForUseError:v37 withNewerVersionError:v38];

      v13 = (void *)v122;
      v15 = (void *)v134;
      v29 = v99;
      goto LABEL_15;
    }

    char v39 = objc_opt_respondsToSelector( v31,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:wit hCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:with NewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatest DowloadedAtomicInstanceEntries:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStager Policy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemByt es:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:");

    id v40 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
    v41 = v40;
    if ((v39 & 1) != 0)
    {
      v163 = (void *)objc_claimAutoreleasedReturnValue([v3 clientDomainName]);
      v162 = (void *)objc_claimAutoreleasedReturnValue([v3 assetSetIdentifier]);
      v141 = (void *)objc_claimAutoreleasedReturnValue([v3 configuredAssetEntries]);
      id v161 = +[MASAutoAssetSetEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayToFramework:",  v141);
      uint64_t v117 = objc_claimAutoreleasedReturnValue([v3 atomicInstancesDownloaded]);
      uint64_t v135 = objc_claimAutoreleasedReturnValue([v3 catalogCachedAssetSetID]);
      uint64_t v129 = objc_claimAutoreleasedReturnValue([v3 catalogDownloadedFromLive]);
      id v160 = (id)objc_claimAutoreleasedReturnValue([v3 catalogLastTimeChecked]);
      uint64_t v123 = objc_claimAutoreleasedReturnValue([v3 catalogPostedDate]);
      v155 = (void *)objc_claimAutoreleasedReturnValue([v3 newerAtomicInstanceDiscovered]);
      v113 = v41;
      id v142 = (id)objc_claimAutoreleasedReturnValue([v3 newerDiscoveredAtomicEntries]);
      id v154 = +[MASAutoAssetSetAtomicEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayToFramework:");
      id v158 = (id)objc_claimAutoreleasedReturnValue([v3 latestDownloadedAtomicInstance]);
      v140 = (void *)objc_claimAutoreleasedReturnValue([v3 latestDowloadedAtomicInstanceEntries]);
      id v156 = +[MASAutoAssetSetAtomicEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayToFramework:");
      v149 = (void *)objc_claimAutoreleasedReturnValue([v3 currentNotifications]);
      id v152 = +[MASAutoAssetSetNotifications newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetNotifications,  "newShimmedToFramework:");
      v148 = (void *)objc_claimAutoreleasedReturnValue([v3 currentNeedPolicy]);
      id v150 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:");
      v139 = (void *)objc_claimAutoreleasedReturnValue([v3 schedulerPolicy]);
      id v42 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:");
      v138 = (void *)objc_claimAutoreleasedReturnValue([v3 stagerPolicy]);
      id v43 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:");
      unsigned __int8 v147 = [v3 downloadUserInitiated];
      uint64_t v110 = objc_claimAutoreleasedReturnValue([v3 downloadProgress]);
      id v44 = +[MASAutoAssetSetProgress newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetProgress,  "newShimmedToFramework:",  v110);
      id v45 = [v3 downloadedNetworkBytes];
      id v46 = [v3 downloadedFilesystemBytes];
      v108 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLockUsage]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v3 selectorsForStaging]);
      v48 = (void *)objc_claimAutoreleasedReturnValue([v3 availableForUseError]);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v3 newerVersionError]);
      id v81 = v45;
      id v84 = v46;
      v14 = (void *)v117;
      id v80 = v44;
      v50 = v44;
      LOBYTE(v77) = v147;
      id v143 = v43;
      id v146 = v42;
      v13 = (void *)v123;
      v16 = (void *)v129;
      id v17 = [v113 initStatusForClientDomain:v163 forAssetSetIdentifier:v162 withConfiguredAssetEntries:v161 withAtomicInstancesDownloaded:v117 w ithCatalogCachedAssetSetID:v135 withCatalogDownloadedFromLive:v129 withCatalogLastTimeChecked:v160 withCatalogPostedDate:v123  withNewerAtomicInstanceDiscovered:v155 withNewerDiscoveredAtomicEntries:v154 withLatestDownloadedAtomicInstance:v158 with LatestDowloadedAtomicInstanceEntries:v156 withCurrentNotifications:v152 withCurrentNeedPolicy:v150 withSchedulerPolicy:v42 wi thStagerPolicy:v43 withDownloadUserInitiated:v77 withDownloadProgress:v80 withDownloadedNetworkBytes:v81 withDownloadedFil esystemBytes:v84 withCurrentLockUsage:v108 withSelectorsForStaging:v47 withAvailableForUseError:v48 withNewerVersionError:v49];

      v15 = (void *)v135;
      goto LABEL_16;
    }

    char v51 = objc_opt_respondsToSelector( v40,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:wit hNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLates tDowloadedAtomicInstanceEntries:withAllDownloadedAtomicInstanceEntries:withCurrentNotifications:withCurrentN eedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloaded NetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseE rror:withNewerVersionError:");

    id v52 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
    v53 = v52;
    if ((v51 & 1) != 0)
    {
      v163 = (void *)objc_claimAutoreleasedReturnValue([v3 clientDomainName]);
      v162 = (void *)objc_claimAutoreleasedReturnValue([v3 assetSetIdentifier]);
      v141 = (void *)objc_claimAutoreleasedReturnValue([v3 configuredAssetEntries]);
      id v161 = +[MASAutoAssetSetEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayToFramework:");
      uint64_t v118 = objc_claimAutoreleasedReturnValue([v3 atomicInstancesDownloaded]);
      uint64_t v136 = objc_claimAutoreleasedReturnValue([v3 newerAtomicInstanceDiscovered]);
      uint64_t v130 = objc_claimAutoreleasedReturnValue([v3 newerDiscoveredAtomicEntries]);
      id v160 = +[MASAutoAssetSetAtomicEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayToFramework:",  v130);
      uint64_t v124 = objc_claimAutoreleasedReturnValue([v3 latestDownloadedAtomicInstance]);
      v155 = (void *)objc_claimAutoreleasedReturnValue([v3 latestDowloadedAtomicInstanceEntries]);
      id v142 = +[MASAutoAssetSetAtomicEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayToFramework:");
      id v154 = (id)objc_claimAutoreleasedReturnValue([v3 currentNotifications]);
      id v158 = +[MASAutoAssetSetNotifications newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetNotifications,  "newShimmedToFramework:");
      v140 = (void *)objc_claimAutoreleasedReturnValue([v3 currentNeedPolicy]);
      id v156 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:");
      v149 = (void *)objc_claimAutoreleasedReturnValue([v3 schedulerPolicy]);
      id v54 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:");
      v148 = (void *)objc_claimAutoreleasedReturnValue([v3 stagerPolicy]);
      id v55 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:");
      unsigned __int8 v153 = [v3 downloadUserInitiated];
      v139 = (void *)objc_claimAutoreleasedReturnValue([v3 downloadProgress]);
      id v56 = +[MASAutoAssetSetProgress newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetProgress,  "newShimmedToFramework:");
      id v151 = [v3 downloadedNetworkBytes];
      id v57 = [v3 downloadedFilesystemBytes];
      uint64_t v58 = objc_claimAutoreleasedReturnValue([v3 currentLockUsage]);
      uint64_t v59 = objc_claimAutoreleasedReturnValue([v3 selectorsForStaging]);
      v60 = (void *)objc_claimAutoreleasedReturnValue([v3 availableForUseError]);
      v61 = (void *)objc_claimAutoreleasedReturnValue([v3 newerVersionError]);
      id v143 = (id)v59;
      uint64_t v82 = v59;
      v138 = (void *)v58;
      id v78 = v57;
      v16 = (void *)v130;
      id v75 = v151;
      v15 = (void *)v136;
      id v146 = v56;
      LOBYTE(v73) = v153;
      id v150 = v55;
      id v152 = v54;
      id v17 = [v53 initStatusForClientDomain:v163 forAssetSetIdentifier:v162 withConfiguredAssetEntries:v161 withAtomicInstancesDownloaded:v118 w ithNewerAtomicInstanceDiscovered:v136 withNewerDiscoveredAtomicEntries:v160 withLatestDownloadedAtomicInstance:v124 withL atestDowloadedAtomicInstanceEntries:v142 withAllDownloadedAtomicInstanceEntries:0 withCurrentNotifications:v158 withCu rrentNeedPolicy:v156 withSchedulerPolicy:v54 withStagerPolicy:v55 withDownloadUserInitiated:v73 withDownloadProgress:v56 withDo wnloadedNetworkBytes:v75 withDownloadedFilesystemBytes:v78 withCurrentLockUsage:v58 withSelectorsForStaging:v82 withAvaila bleForUseError:v60 withNewerVersionError:v61];

      v14 = (void *)v118;
      v13 = (void *)v124;
      goto LABEL_18;
    }

    char v62 = objc_opt_respondsToSelector( v52,  "initStatusForClientDomain:forAssetSetIdentifier:withAtomicInstancesDownloaded:withNewerAtomicInstanceDiscove red:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEnt ries:withAllDownloadedAtomicInstanceEntries:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPoli cy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloaded FilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:");

    if ((v62 & 1) != 0)
    {
      id v119 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
      v163 = (void *)objc_claimAutoreleasedReturnValue([v3 clientDomainName]);
      v162 = (void *)objc_claimAutoreleasedReturnValue([v3 assetSetIdentifier]);
      v141 = (void *)objc_claimAutoreleasedReturnValue([v3 atomicInstancesDownloaded]);
      id v161 = (id)objc_claimAutoreleasedReturnValue([v3 newerAtomicInstanceDiscovered]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v3 newerDiscoveredAtomicEntries]);
      id v137 = +[MASAutoAssetSetAtomicEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayToFramework:",  v14);
      uint64_t v131 = objc_claimAutoreleasedReturnValue([v3 latestDownloadedAtomicInstance]);
      id v160 = (id)objc_claimAutoreleasedReturnValue([v3 latestDowloadedAtomicInstanceEntries]);
      id v125 = +[MASAutoAssetSetAtomicEntry newShimmedArrayToFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayToFramework:");
      v155 = (void *)objc_claimAutoreleasedReturnValue([v3 currentNotifications]);
      id v142 = +[MASAutoAssetSetNotifications newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetNotifications,  "newShimmedToFramework:");
      id v154 = (id)objc_claimAutoreleasedReturnValue([v3 currentNeedPolicy]);
      id v63 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:");
      v140 = (void *)objc_claimAutoreleasedReturnValue([v3 schedulerPolicy]);
      id v64 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:");
      v149 = (void *)objc_claimAutoreleasedReturnValue([v3 stagerPolicy]);
      id v65 = +[MASAutoAssetSetPolicy newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedToFramework:");
      unsigned __int8 v159 = [v3 downloadUserInitiated];
      v148 = (void *)objc_claimAutoreleasedReturnValue([v3 downloadProgress]);
      id v66 = +[MASAutoAssetSetProgress newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetSetProgress,  "newShimmedToFramework:");
      id v157 = [v3 downloadedNetworkBytes];
      id v67 = [v3 downloadedFilesystemBytes];
      uint64_t v68 = objc_claimAutoreleasedReturnValue([v3 currentLockUsage]);
      uint64_t v69 = objc_claimAutoreleasedReturnValue([v3 selectorsForStaging]);
      uint64_t v70 = objc_claimAutoreleasedReturnValue([v3 availableForUseError]);
      id v143 = (id)objc_claimAutoreleasedReturnValue([v3 newerVersionError]);
      v138 = (void *)v70;
      uint64_t v83 = v70;
      id v146 = (id)v69;
      v139 = (void *)v68;
      id v76 = v67;
      uint64_t v79 = v68;
      v16 = (void *)v131;
      v13 = v125;
      id v74 = v157;
      v15 = v137;
      id v150 = v66;
      LOBYTE(v72) = v159;
      id v152 = v65;
      id v156 = v64;
      id v158 = v63;
      id v17 = [v119 initStatusForClientDomain:v163 forAssetSetIdentifier:v162 withAtomicInstancesDownloaded:v141 withNewerAtomicInstanceDisco vered:v161 withNewerDiscoveredAtomicEntries:v137 withLatestDownloadedAtomicInstance:v131 withLatestDowloadedAtomicInstanc eEntries:v125 withAllDownloadedAtomicInstanceEntries:0 withCurrentNotifications:v142 withCurrentNeedPolicy:v63 withSchedul erPolicy:v64 withStagerPolicy:v65 withDownloadUserInitiated:v72 withDownloadProgress:v66 withDownloadedNetworkBytes:v74 withDo wnloadedFilesystemBytes:v76 withCurrentLockUsage:v79 withSelectorsForStaging:v69 withAvailableForUseError:v83 withNewerVersionError:v143];
      goto LABEL_18;
    }

+ (id)newServerMessageClasses:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSelector)];
    char v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (__isPlatformVersionAtLeast(3, 17, 0, 0))
    {
      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry))
      {
        id v6 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetAtomicEntry)];
        uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

        char v5 = (void *)v7;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetNotifications))
      {
        id v8 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetNotifications)];
        uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

        char v5 = (void *)v9;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy))
      {
        id v10 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetPolicy)];
        uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);

        char v5 = (void *)v11;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetProgress))
      {
        id v12 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetProgress)];
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);

        char v5 = (void *)v13;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetStatus))
      {
        id v14 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetStatus)];
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);

        char v5 = (void *)v15;
      }

      if (objc_opt_class(&OBJC_CLASS___MAAutoAssetSetEntry))
      {
        id v16 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetSetEntry)];
        uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);

        char v5 = (void *)v17;
      }
    }
  }

  else
  {
    char v5 = 0LL;
  }

  return v5;
}

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (!v3
    || !__isPlatformVersionAtLeast(3, 17, 0, 0)
    || !objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry)
    || !objc_opt_class(&OBJC_CLASS___MAAutoAssetSetNotifications)
    || !objc_opt_class(&OBJC_CLASS___MAAutoAssetSetPolicy)
    || !objc_opt_class(&OBJC_CLASS___MAAutoAssetSetProgress)
    || !objc_opt_class(&OBJC_CLASS___MAAutoAssetSetStatus))
  {
    goto LABEL_24;
  }

  id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
  char v5 = objc_opt_respondsToSelector( v4,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCa talogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerA tomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloaded AtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloa dedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSc hedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownl oadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockU sage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:");

  if ((v5 & 1) != 0)
  {
    id v6 = v3;
    uint64_t v110 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetStatus);
    id v160 = (void *)objc_claimAutoreleasedReturnValue([v6 clientDomainName]);
    id v158 = (void *)objc_claimAutoreleasedReturnValue([v6 assetSetIdentifier]);
    id v142 = (void *)objc_claimAutoreleasedReturnValue([v6 configuredAssetEntries]);
    id v159 = +[MASAutoAssetSetEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayFromFramework:",  v142);
    uint64_t v133 = objc_claimAutoreleasedReturnValue([v6 atomicInstancesDownloaded]);
    uint64_t v127 = objc_claimAutoreleasedReturnValue([v6 catalogCachedAssetSetID]);
    uint64_t v115 = objc_claimAutoreleasedReturnValue([v6 catalogDownloadedFromLive]);
    id v157 = (id)objc_claimAutoreleasedReturnValue([v6 catalogLastTimeChecked]);
    uint64_t v121 = objc_claimAutoreleasedReturnValue([v6 catalogPostedDate]);
    id v156 = (void *)objc_claimAutoreleasedReturnValue([v6 newerAtomicInstanceDiscovered]);
    id v143 = (id)objc_claimAutoreleasedReturnValue([v6 newerDiscoveredAtomicEntries]);
    id v155 = +[MASAutoAssetSetAtomicEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayFromFramework:");
    id v162 = (id)objc_claimAutoreleasedReturnValue([v6 latestDownloadedAtomicInstance]);
    v141 = (void *)objc_claimAutoreleasedReturnValue([v6 latestDowloadedAtomicInstanceEntries]);
    id v161 = +[MASAutoAssetSetAtomicEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayFromFramework:");
    unsigned __int8 v147 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadedCatalogCachedAssetSetID]);
    id v152 = (id)objc_claimAutoreleasedReturnValue([v6 downloadedCatalogDownloadedFromLive]);
    id v146 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadedCatalogLastTimeChecked]);
    id v149 = (id)objc_claimAutoreleasedReturnValue([v6 downloadedCatalogPostedDate]);
    v140 = (void *)objc_claimAutoreleasedReturnValue([v6 currentNotifications]);
    id v148 = +[MASAutoAssetSetNotifications newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetNotifications,  "newShimmedFromFramework:");
    v139 = (void *)objc_claimAutoreleasedReturnValue([v6 currentNeedPolicy]);
    id v144 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:");
    uint64_t v108 = objc_claimAutoreleasedReturnValue([v6 schedulerPolicy]);
    id v92 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:",  v108);
    v104 = (void *)objc_claimAutoreleasedReturnValue([v6 stagerPolicy]);
    id v7 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:",  v104);
    unsigned __int8 v98 = [v6 haveReceivedLookupResponse];
    unsigned __int8 v95 = [v6 vendingAtomicInstanceForConfiguredEntries];
    unsigned __int8 v89 = [v6 downloadUserInitiated];
    id v101 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadProgress]);
    id v86 = +[MASAutoAssetSetProgress newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetProgress,  "newShimmedFromFramework:",  v101);
    id v8 = [v6 downloadedNetworkBytes];
    id v9 = [v6 downloadedFilesystemBytes];
    uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue([v6 currentLockUsage]);
    id v84 = (void *)objc_claimAutoreleasedReturnValue([v6 selectorsForStaging]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 availableForUseError]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 newerVersionError]);

    BYTE2(v82) = v89;
    BYTE1(v82) = v95;
    LOBYTE(v82) = v98;
    id v12 = v7;
    id v80 = v7;
    uint64_t v13 = (void *)v115;
    id v14 = (void *)v121;
    uint64_t v15 = (void *)v127;
    id v16 = (void *)v133;
    id v17 = -[MANAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:]( v110,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:wit hCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:with NewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatest DowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive :withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNe edPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfigure dEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemB ytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:",  v160,  v158,  v159,  v133,  v127,  v115,  v157,  v121,  v156,  v155,  v162,  v161,  v147,  v152,  v146,  v149,  v148,  v144,  v92,  v80,  v82,  v86,  v8,  v9,  v85,  v84,  v10,  v11);

LABEL_17:
    v28 = (void *)v108;
    goto LABEL_18;
  }

  id v18 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
  char v19 = objc_opt_respondsToSelector( v18,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withC atalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewe rAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloa dedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDow nloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:w ithSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:withDownloadUserInitiated:withDownloadProgres s:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAv ailableForUseError:withNewerVersionError:");

  if ((v19 & 1) == 0)
  {
    id v29 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
    char v30 = objc_opt_respondsToSelector( v29,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:wit hCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:with NewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatest DowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive :withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNe edPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedN etworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseEr ror:withNewerVersionError:");

    if ((v30 & 1) != 0)
    {
      id v31 = v3;
      v112 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetStatus);
      id v160 = (void *)objc_claimAutoreleasedReturnValue([v31 clientDomainName]);
      id v158 = (void *)objc_claimAutoreleasedReturnValue([v31 assetSetIdentifier]);
      id v142 = (void *)objc_claimAutoreleasedReturnValue([v31 configuredAssetEntries]);
      id v159 = +[MASAutoAssetSetEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayFromFramework:",  v142);
      uint64_t v135 = objc_claimAutoreleasedReturnValue([v31 atomicInstancesDownloaded]);
      uint64_t v129 = objc_claimAutoreleasedReturnValue([v31 catalogCachedAssetSetID]);
      uint64_t v117 = objc_claimAutoreleasedReturnValue([v31 catalogDownloadedFromLive]);
      id v157 = (id)objc_claimAutoreleasedReturnValue([v31 catalogLastTimeChecked]);
      uint64_t v123 = objc_claimAutoreleasedReturnValue([v31 catalogPostedDate]);
      id v156 = (void *)objc_claimAutoreleasedReturnValue([v31 newerAtomicInstanceDiscovered]);
      id v143 = (id)objc_claimAutoreleasedReturnValue([v31 newerDiscoveredAtomicEntries]);
      id v155 = +[MASAutoAssetSetAtomicEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayFromFramework:");
      id v162 = (id)objc_claimAutoreleasedReturnValue([v31 latestDownloadedAtomicInstance]);
      v141 = (void *)objc_claimAutoreleasedReturnValue([v31 latestDowloadedAtomicInstanceEntries]);
      id v161 = +[MASAutoAssetSetAtomicEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayFromFramework:");
      unsigned __int8 v147 = (void *)objc_claimAutoreleasedReturnValue([v31 downloadedCatalogCachedAssetSetID]);
      id v152 = (id)objc_claimAutoreleasedReturnValue([v31 downloadedCatalogDownloadedFromLive]);
      id v146 = (void *)objc_claimAutoreleasedReturnValue([v31 downloadedCatalogLastTimeChecked]);
      id v149 = (id)objc_claimAutoreleasedReturnValue([v31 downloadedCatalogPostedDate]);
      v140 = (void *)objc_claimAutoreleasedReturnValue([v31 currentNotifications]);
      id v148 = +[MASAutoAssetSetNotifications newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetNotifications,  "newShimmedFromFramework:");
      v139 = (void *)objc_claimAutoreleasedReturnValue([v31 currentNeedPolicy]);
      id v144 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:");
      uint64_t v108 = objc_claimAutoreleasedReturnValue([v31 schedulerPolicy]);
      id v100 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:",  v108);
      v106 = (void *)objc_claimAutoreleasedReturnValue([v31 stagerPolicy]);
      id v94 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:",  v106);
      unsigned __int8 v97 = [v31 downloadUserInitiated];
      id v103 = (void *)objc_claimAutoreleasedReturnValue([v31 downloadProgress]);
      id v91 = +[MASAutoAssetSetProgress newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetProgress,  "newShimmedFromFramework:",  v103);
      id v32 = [v31 downloadedNetworkBytes];
      id v33 = [v31 downloadedFilesystemBytes];
      v88 = (void *)objc_claimAutoreleasedReturnValue([v31 currentLockUsage]);
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v31 selectorsForStaging]);
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v31 availableForUseError]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v31 newerVersionError]);

      LOBYTE(v82) = v97;
      v37 = v100;
      uint64_t v13 = (void *)v117;
      uint64_t v15 = (void *)v129;
      id v17 = -[MANAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:]( v112,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:w ithCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate: withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:with LatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloaded FromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:wit hCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:wit hDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAva ilableForUseError:withNewerVersionError:",  v160,  v158,  v159,  v135,  v129,  v117,  v157,  v123,  v156,  v155,  v162,  v161,  v147,  v152,  v146,  v149,  v148,  v144,  v100,  v94,  v82,  v91,  v32,  v33,  v88,  v34,  v35,  v36);

      id v16 = (void *)v135;
      id v14 = (void *)v123;

LABEL_16:
      goto LABEL_17;
    }

    id v38 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
    char v39 = objc_opt_respondsToSelector( v38,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:wit hCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:with NewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatest DowloadedAtomicInstanceEntries:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStager Policy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemByt es:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:");

    if ((v39 & 1) != 0)
    {
      id v40 = v3;
      v113 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetStatus);
      id v160 = (void *)objc_claimAutoreleasedReturnValue([v40 clientDomainName]);
      id v158 = (void *)objc_claimAutoreleasedReturnValue([v40 assetSetIdentifier]);
      id v142 = (void *)objc_claimAutoreleasedReturnValue([v40 configuredAssetEntries]);
      id v159 = +[MASAutoAssetSetEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayFromFramework:",  v142);
      uint64_t v136 = objc_claimAutoreleasedReturnValue([v40 atomicInstancesDownloaded]);
      uint64_t v130 = objc_claimAutoreleasedReturnValue([v40 catalogCachedAssetSetID]);
      uint64_t v118 = objc_claimAutoreleasedReturnValue([v40 catalogDownloadedFromLive]);
      id v157 = (id)objc_claimAutoreleasedReturnValue([v40 catalogLastTimeChecked]);
      uint64_t v124 = objc_claimAutoreleasedReturnValue([v40 catalogPostedDate]);
      id v156 = (void *)objc_claimAutoreleasedReturnValue([v40 newerAtomicInstanceDiscovered]);
      id v143 = (id)objc_claimAutoreleasedReturnValue([v40 newerDiscoveredAtomicEntries]);
      id v155 = +[MASAutoAssetSetAtomicEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayFromFramework:");
      id v162 = (id)objc_claimAutoreleasedReturnValue([v40 latestDownloadedAtomicInstance]);
      v141 = (void *)objc_claimAutoreleasedReturnValue([v40 latestDowloadedAtomicInstanceEntries]);
      id v161 = +[MASAutoAssetSetAtomicEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayFromFramework:");
      unsigned __int8 v147 = (void *)objc_claimAutoreleasedReturnValue([v40 currentNotifications]);
      id v152 = +[MASAutoAssetSetNotifications newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetNotifications,  "newShimmedFromFramework:");
      id v146 = (void *)objc_claimAutoreleasedReturnValue([v40 currentNeedPolicy]);
      id v149 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:");
      v140 = (void *)objc_claimAutoreleasedReturnValue([v40 schedulerPolicy]);
      id v148 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:");
      v139 = (void *)objc_claimAutoreleasedReturnValue([v40 stagerPolicy]);
      id v41 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:");
      unsigned __int8 v145 = [v40 downloadUserInitiated];
      uint64_t v108 = objc_claimAutoreleasedReturnValue([v40 downloadProgress]);
      id v42 = +[MASAutoAssetSetProgress newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetProgress,  "newShimmedFromFramework:",  v108);
      id v43 = [v40 downloadedNetworkBytes];
      id v44 = [v40 downloadedFilesystemBytes];
      v107 = (void *)objc_claimAutoreleasedReturnValue([v40 currentLockUsage]);
      id v45 = (void *)objc_claimAutoreleasedReturnValue([v40 selectorsForStaging]);
      id v46 = (void *)objc_claimAutoreleasedReturnValue([v40 availableForUseError]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v40 newerVersionError]);

      id v81 = v44;
      id v16 = (void *)v136;
      id v78 = v42;
      v37 = v42;
      LOBYTE(v75) = v145;
      id v144 = v41;
      uint64_t v13 = (void *)v118;
      id v14 = (void *)v124;
      id v17 = -[MANAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:]( v113,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:w ithCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate: withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:with LatestDowloadedAtomicInstanceEntries:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:wi thStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFil esystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:",  v160,  v158,  v159,  v136,  v130,  v118,  v157,  v124,  v156,  v155,  v162,  v161,  v152,  v149,  v148,  v41,  v75,  v78,  v43,  v81,  v107,  v45,  v46,  v47);

      uint64_t v15 = (void *)v130;
      goto LABEL_16;
    }

    id v48 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
    char v49 = objc_opt_respondsToSelector( v48,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:wit hNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLates tDowloadedAtomicInstanceEntries:withAllDownloadedAtomicInstanceEntries:withCurrentNotifications:withCurrentN eedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloaded NetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseE rror:withNewerVersionError:");

    if ((v49 & 1) != 0)
    {
      id v50 = v3;
      uint64_t v114 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetStatus);
      id v160 = (void *)objc_claimAutoreleasedReturnValue([v50 clientDomainName]);
      id v158 = (void *)objc_claimAutoreleasedReturnValue([v50 assetSetIdentifier]);
      id v142 = (void *)objc_claimAutoreleasedReturnValue([v50 configuredAssetEntries]);
      id v159 = +[MASAutoAssetSetEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetEntry,  "newShimmedArrayFromFramework:",  v142);
      uint64_t v137 = objc_claimAutoreleasedReturnValue([v50 atomicInstancesDownloaded]);
      uint64_t v131 = objc_claimAutoreleasedReturnValue([v50 newerAtomicInstanceDiscovered]);
      uint64_t v119 = objc_claimAutoreleasedReturnValue([v50 newerDiscoveredAtomicEntries]);
      id v157 = +[MASAutoAssetSetAtomicEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayFromFramework:",  v119);
      uint64_t v125 = objc_claimAutoreleasedReturnValue([v50 latestDownloadedAtomicInstance]);
      id v156 = (void *)objc_claimAutoreleasedReturnValue([v50 latestDowloadedAtomicInstanceEntries]);
      id v143 = +[MASAutoAssetSetAtomicEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayFromFramework:");
      id v155 = (id)objc_claimAutoreleasedReturnValue([v50 currentNotifications]);
      id v162 = +[MASAutoAssetSetNotifications newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetNotifications,  "newShimmedFromFramework:");
      v141 = (void *)objc_claimAutoreleasedReturnValue([v50 currentNeedPolicy]);
      id v161 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:");
      unsigned __int8 v147 = (void *)objc_claimAutoreleasedReturnValue([v50 schedulerPolicy]);
      id v51 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:");
      id v146 = (void *)objc_claimAutoreleasedReturnValue([v50 stagerPolicy]);
      id v52 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:");
      unsigned __int8 v153 = [v50 downloadUserInitiated];
      v140 = (void *)objc_claimAutoreleasedReturnValue([v50 downloadProgress]);
      id v53 = +[MASAutoAssetSetProgress newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetProgress,  "newShimmedFromFramework:");
      id v150 = [v50 downloadedNetworkBytes];
      id v54 = [v50 downloadedFilesystemBytes];
      uint64_t v55 = objc_claimAutoreleasedReturnValue([v50 currentLockUsage]);
      uint64_t v56 = objc_claimAutoreleasedReturnValue([v50 selectorsForStaging]);
      id v57 = (void *)objc_claimAutoreleasedReturnValue([v50 availableForUseError]);
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v50 newerVersionError]);

      id v144 = (id)v56;
      v139 = (void *)v55;
      id v76 = v54;
      uint64_t v15 = (void *)v131;
      id v73 = v150;
      id v148 = v53;
      id v71 = v53;
      LOBYTE(v70) = v153;
      id v16 = (void *)v137;
      id v149 = v52;
      id v152 = v51;
      id v17 = -[MANAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withAllDownloadedAtomicInstanceEntries:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:]( v114,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:w ithNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withL atestDowloadedAtomicInstanceEntries:withAllDownloadedAtomicInstanceEntries:withCurrentNotifications:withCu rrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDo wnloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvaila bleForUseError:withNewerVersionError:",  v160,  v158,  v159,  v137,  v131,  v157,  v125,  v143,  0LL,  v162,  v161,  v51,  v52,  v70,  v71,  v73,  v76,  v55,  v56,  v57,  v58);

      id v14 = (void *)v125;
      uint64_t v13 = (void *)v119;
      goto LABEL_19;
    }

    id v59 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
    char v60 = objc_opt_respondsToSelector( v59,  "initStatusForClientDomain:forAssetSetIdentifier:withAtomicInstancesDownloaded:withNewerAtomicInstanceDiscove red:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEnt ries:withAllDownloadedAtomicInstanceEntries:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPoli cy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloaded FilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:");

    if ((v60 & 1) != 0)
    {
      id v61 = v3;
      uint64_t v120 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetStatus);
      id v160 = (void *)objc_claimAutoreleasedReturnValue([v61 clientDomainName]);
      id v158 = (void *)objc_claimAutoreleasedReturnValue([v61 assetSetIdentifier]);
      id v142 = (void *)objc_claimAutoreleasedReturnValue([v61 atomicInstancesDownloaded]);
      id v159 = (id)objc_claimAutoreleasedReturnValue([v61 newerAtomicInstanceDiscovered]);
      uint64_t v138 = objc_claimAutoreleasedReturnValue([v61 newerDiscoveredAtomicEntries]);
      id v132 = +[MASAutoAssetSetAtomicEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayFromFramework:",  v138);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v61 latestDownloadedAtomicInstance]);
      id v157 = (id)objc_claimAutoreleasedReturnValue([v61 latestDowloadedAtomicInstanceEntries]);
      id v126 = +[MASAutoAssetSetAtomicEntry newShimmedArrayFromFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedArrayFromFramework:");
      id v156 = (void *)objc_claimAutoreleasedReturnValue([v61 currentNotifications]);
      id v143 = +[MASAutoAssetSetNotifications newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetNotifications,  "newShimmedFromFramework:");
      id v155 = (id)objc_claimAutoreleasedReturnValue([v61 currentNeedPolicy]);
      id v162 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:");
      v141 = (void *)objc_claimAutoreleasedReturnValue([v61 schedulerPolicy]);
      id v161 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:");
      unsigned __int8 v147 = (void *)objc_claimAutoreleasedReturnValue([v61 stagerPolicy]);
      id v62 = +[MASAutoAssetSetPolicy newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetPolicy,  "newShimmedFromFramework:");
      unsigned __int8 v154 = [v61 downloadUserInitiated];
      id v146 = (void *)objc_claimAutoreleasedReturnValue([v61 downloadProgress]);
      id v63 = +[MASAutoAssetSetProgress newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetProgress,  "newShimmedFromFramework:");
      id v151 = [v61 downloadedNetworkBytes];
      id v64 = [v61 downloadedFilesystemBytes];
      uint64_t v65 = objc_claimAutoreleasedReturnValue([v61 currentLockUsage]);
      uint64_t v66 = objc_claimAutoreleasedReturnValue([v61 selectorsForStaging]);
      uint64_t v67 = objc_claimAutoreleasedReturnValue([v61 availableForUseError]);
      uint64_t v68 = objc_claimAutoreleasedReturnValue([v61 newerVersionError]);

      id v144 = (id)v68;
      v139 = (void *)v67;
      id v148 = (id)v66;
      v140 = (void *)v65;
      id v77 = v64;
      uint64_t v79 = v65;
      uint64_t v15 = v132;
      id v14 = v126;
      id v74 = v151;
      id v149 = v63;
      id v72 = v63;
      LOBYTE(v70) = v154;
      id v16 = (void *)v138;
      id v152 = v62;
      id v17 = -[MANAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withAllDownloadedAtomicInstanceEntries:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:]( v120,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:w ithNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withL atestDowloadedAtomicInstanceEntries:withAllDownloadedAtomicInstanceEntries:withCurrentNotifications:withCu rrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDo wnloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvaila bleForUseError:withNewerVersionError:",  v160,  v158,  0LL,  v142,  v159,  v132,  v13,  v126,  0LL,  v143,  v162,  v161,  v62,  v70,  v72,  v74,  v77,  v79,  v66,  v67,  v68);
      goto LABEL_19;
    }

+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    if (!objc_opt_class(&OBJC_CLASS___MAAutoAssetSetStatus)) {
      goto LABEL_11;
    }
    id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
    char v10 = objc_opt_respondsToSelector( v9,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:wit hCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:with NewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatest DowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive :withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNe edPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:withDownloadUserInitiated:withDow nloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsFor Staging:withAvailableForUseError:withNewerVersionError:");

    if ((v10 & 1) != 0) {
      goto LABEL_10;
    }
    id v11 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
    char v12 = objc_opt_respondsToSelector( v11,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:wit hCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:with NewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatest DowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive :withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNe edPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedN etworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseEr ror:withNewerVersionError:");

    if ((v12 & 1) != 0) {
      goto LABEL_10;
    }
    id v13 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus);
    char v14 = objc_opt_respondsToSelector( v13,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:wit hCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:with NewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatest DowloadedAtomicInstanceEntries:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStager Policy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemByt es:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:");

    if ((v14 & 1) != 0
      || (id v15 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus),
          char v16 = objc_opt_respondsToSelector( v15,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownload ed:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstan ce:withLatestDowloadedAtomicInstanceEntries:withAllDownloadedAtomicInstanceEntries:withCurrentNotifica tions:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloa dProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsF orStaging:withAvailableForUseError:withNewerVersionError:"),  v15,  (v16 & 1) != 0)
      || (id v17 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetStatus),
          char v18 = objc_opt_respondsToSelector( v17,  "initStatusForClientDomain:forAssetSetIdentifier:withAtomicInstancesDownloaded:withNewerAtomicInstanceD iscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomi cInstanceEntries:withAllDownloadedAtomicInstanceEntries:withCurrentNotifications:withCurrentNeedPolicy :withSchedulerPolicy:withStagerPolicy:withDownloadUserInitiated:withDownloadProgress:withDownloadedNet workBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForU seError:withNewerVersionError:"),  v17,  (v18 & 1) != 0))
    {
LABEL_10:
      id v19 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetStatus)];
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      id v8 = +[MASAutoAssetSetStatus newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetStatus,  "newShimmedFromFramework:",  v20);
    }

    else
    {
LABEL_11:
      id v8 = 0LL;
    }
  }

  return v8;
}

@end