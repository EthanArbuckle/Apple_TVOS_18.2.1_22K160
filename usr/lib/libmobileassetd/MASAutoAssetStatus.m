@interface MASAutoAssetStatus
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetStatus

+ (id)newServerMessageClasses:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSelector)];
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetNotifications))
    {
      id v6 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetNotifications)];
      uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

      v5 = (void *)v7;
    }

    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetProgress))
    {
      id v8 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetProgress)];
      uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

      v5 = (void *)v9;
    }

    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetStatus))
    {
      id v10 = [v5 setByAddingObject:objc_opt_class(MAAutoAssetStatus)];
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);

      v5 = (void *)v11;
    }
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

+ (id)newShimmedToFramework:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MANAutoAssetStatus);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MASAutoAssetStatus newShimmedToFramework:].cold.1(v6);
    }
  }

  if (v3 && objc_opt_class(&OBJC_CLASS___MAAutoAssetStatus))
  {
    else {
      v67 = 0LL;
    }
    id v8 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
    char v9 = objc_opt_respondsToSelector( v8,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBee nLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemByt es:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted :withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvail ableForUseError:withPatchingAttemptError:withNewerVersionError:");

    id v10 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
    uint64_t v11 = v10;
    if ((v9 & 1) != 0)
    {
      uint64_t v61 = objc_claimAutoreleasedReturnValue([v3 assetSelector]);
      uint64_t v59 = objc_claimAutoreleasedReturnValue([v3 notifications]);
      uint64_t v55 = objc_claimAutoreleasedReturnValue([v3 availableForUseAttributes]);
      uint64_t v57 = objc_claimAutoreleasedReturnValue([v3 newerVersionAttributes]);
      [v3 neverBeenLocked];
      [v3 downloadUserInitiated];
      uint64_t v53 = objc_claimAutoreleasedReturnValue([v3 downloadProgress]);
      id v50 = [v3 downloadedNetworkBytes];
      id v48 = [v3 downloadedFilesystemBytes];
      unsigned __int8 v46 = [v3 downloadedAsPatch];
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v3 patchedFromBaseSelector]);
      id v65 = [v3 patchedFromBaseFilesystemBytes];
      unsigned __int8 v13 = [v3 patchingAttempted];
      unsigned __int8 v14 = [v3 stagedPriorToAvailable];
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v3 stagedFromOSVersion]);
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v3 stagedFromBuildVersion]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v3 availableForUseError]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v3 patchingAttemptError]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v3 newerVersionError]);
      v63 = (void *)v16;
      uint64_t v45 = v16;
      v64 = (void *)v15;
      uint64_t v43 = v15;
      BYTE1(v41) = v14;
      v20 = (void *)v55;
      LOBYTE(v41) = v13;
      v21 = (void *)v59;
      id v40 = v65;
      v22 = (void *)v61;
      v66 = (void *)v12;
      uint64_t v37 = v12;
      LOBYTE(v35) = v46;
      v23 = (void *)v53;
      v24 = (void *)v57;
      v25 = -[MAAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:]( v11,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNever BeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesys temBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatching Attempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsa ge:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:",  v61,  v59,  v55,  v53,  v50,  v48,  v35,  v37,  v40,  v41,  v43,  v45,  v67,  v17,  v18,  v19);
    }

    else
    {
      char v26 = objc_opt_respondsToSelector( v10,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownl oadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloa dedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStaged PriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForU seError:withPatchingAttemptError:withNewerVersionError:");

      if ((v26 & 1) == 0)
      {
        uint64_t v7 = 0LL;
        goto LABEL_17;
      }

      v52 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
      uint64_t v62 = objc_claimAutoreleasedReturnValue([v3 assetSelector]);
      uint64_t v60 = objc_claimAutoreleasedReturnValue([v3 notifications]);
      uint64_t v56 = objc_claimAutoreleasedReturnValue([v3 availableForUseAttributes]);
      uint64_t v58 = objc_claimAutoreleasedReturnValue([v3 newerVersionAttributes]);
      [v3 downloadUserInitiated];
      uint64_t v54 = objc_claimAutoreleasedReturnValue([v3 downloadProgress]);
      id v51 = [v3 downloadedNetworkBytes];
      id v49 = [v3 downloadedFilesystemBytes];
      unsigned __int8 v47 = [v3 downloadedAsPatch];
      uint64_t v27 = objc_claimAutoreleasedReturnValue([v3 patchedFromBaseSelector]);
      id v28 = [v3 patchedFromBaseFilesystemBytes];
      unsigned __int8 v29 = [v3 patchingAttempted];
      unsigned __int8 v30 = [v3 stagedPriorToAvailable];
      uint64_t v31 = objc_claimAutoreleasedReturnValue([v3 stagedFromOSVersion]);
      uint64_t v32 = objc_claimAutoreleasedReturnValue([v3 stagedFromBuildVersion]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v3 availableForUseError]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v3 patchingAttemptError]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v3 newerVersionError]);
      v63 = (void *)v32;
      uint64_t v44 = v32;
      v64 = (void *)v31;
      uint64_t v42 = v31;
      BYTE1(v39) = v30;
      LOBYTE(v39) = v29;
      v21 = (void *)v60;
      id v38 = v28;
      v20 = (void *)v56;
      v66 = (void *)v27;
      uint64_t v36 = v27;
      LOBYTE(v34) = v47;
      v22 = (void *)v62;
      v24 = (void *)v58;
      v23 = (void *)v54;
      v25 = -[MAAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:]( v52,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownl oadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloa dedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStaged PriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForU seError:withPatchingAttemptError:withNewerVersionError:",  v62,  v60,  v56,  v51,  v49,  v34,  v36,  v38,  v39,  v42,  v44,  v67,  v17,  v18,  v19);
    }

    uint64_t v7 = v25;

LABEL_17:
    goto LABEL_18;
  }

  uint64_t v7 = 0LL;
LABEL_18:

  return v7;
}

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (v3 && objc_opt_class(&OBJC_CLASS___MAAutoAssetStatus))
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
    char v5 = objc_opt_respondsToSelector( v4,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBee nLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemByt es:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted :withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvail ableForUseError:withPatchingAttemptError:withNewerVersionError:");

    if ((v5 & 1) != 0)
    {
      id v6 = v3;
      else {
        v63 = 0LL;
      }
      id v49 = objc_alloc(&OBJC_CLASS___MANAutoAssetStatus);
      uint64_t v57 = objc_claimAutoreleasedReturnValue([v6 assetSelector]);
      uint64_t v55 = objc_claimAutoreleasedReturnValue([v6 notifications]);
      uint64_t v53 = objc_claimAutoreleasedReturnValue([v6 availableForUseAttributes]);
      uint64_t v51 = objc_claimAutoreleasedReturnValue([v6 newerVersionAttributes]);
      [v6 downloadUserInitiated];
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadProgress]);
      id v46 = [v6 downloadedNetworkBytes];
      id v44 = [v6 downloadedFilesystemBytes];
      unsigned __int8 v42 = [v6 downloadedAsPatch];
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v6 patchedFromBaseSelector]);
      id v61 = [v6 patchedFromBaseFilesystemBytes];
      unsigned __int8 v23 = [v6 patchingAttempted];
      unsigned __int8 v24 = [v6 stagedPriorToAvailable];
      uint64_t v25 = objc_claimAutoreleasedReturnValue([v6 stagedFromOSVersion]);
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v6 stagedFromBuildVersion]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 availableForUseError]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 patchingAttemptError]);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v6 newerVersionError]);
      uint64_t v58 = (void *)v26;
      uint64_t v36 = v26;
      uint64_t v59 = (void *)v25;
      uint64_t v34 = v25;
      BYTE1(v32) = v24;
      LOBYTE(v32) = v23;
      v18 = (void *)v55;
      id v31 = v61;
      v17 = (void *)v57;
      uint64_t v60 = (void *)v22;
      uint64_t v30 = v22;
      LOBYTE(v29) = v42;
      v19 = (void *)v53;
      v20 = (void *)v51;
      v21 = -[MANAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:]( v49,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNever BeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesys temBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatching Attempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsa ge:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:",  v57,  v55,  v53,  v62,  v46,  v44,  v29,  v30,  v31,  v32,  v34,  v36,  v63,  v15,  v16,  v27);

      goto LABEL_11;
    }

    uint64_t v7 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
    char v8 = objc_opt_respondsToSelector( v7,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownload UserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsP atch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAv ailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:with PatchingAttemptError:withNewerVersionError:");

    if ((v8 & 1) != 0)
    {
      id v9 = v3;
      id v48 = objc_alloc(&OBJC_CLASS___MANAutoAssetStatus);
      id v6 = (id)objc_claimAutoreleasedReturnValue([v9 assetSelector]);
      v63 = (void *)objc_claimAutoreleasedReturnValue([v9 notifications]);
      uint64_t v56 = objc_claimAutoreleasedReturnValue([v9 availableForUseAttributes]);
      uint64_t v54 = objc_claimAutoreleasedReturnValue([v9 newerVersionAttributes]);
      unsigned int v47 = [v9 neverBeenLocked];
      unsigned int v45 = [v9 downloadUserInitiated];
      uint64_t v52 = objc_claimAutoreleasedReturnValue([v9 downloadProgress]);
      id v43 = [v9 downloadedNetworkBytes];
      id v41 = [v9 downloadedFilesystemBytes];
      unsigned __int8 v40 = [v9 downloadedAsPatch];
      uint64_t v50 = objc_claimAutoreleasedReturnValue([v9 patchedFromBaseSelector]);
      id v39 = [v9 patchedFromBaseFilesystemBytes];
      unsigned __int8 v38 = [v9 patchingAttempted];
      unsigned __int8 v10 = [v9 stagedPriorToAvailable];
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 stagedFromOSVersion]);
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 stagedFromBuildVersion]);
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 currentLockUsage]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 availableForUseError]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 patchingAttemptError]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 newerVersionError]);

      uint64_t v58 = (void *)v14;
      uint64_t v37 = v14;
      uint64_t v59 = (void *)v13;
      uint64_t v60 = (void *)v12;
      uint64_t v35 = v12;
      uint64_t v62 = (void *)v11;
      uint64_t v33 = v11;
      BYTE1(v32) = v10;
      v17 = (void *)v56;
      LOBYTE(v32) = v38;
      v18 = (void *)v54;
      v19 = (void *)v52;
      v20 = (void *)v50;
      LOBYTE(v29) = v40;
      v21 = -[MANAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:]( v48,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNever BeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesys temBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatching Attempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsa ge:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:",  v6,  v63,  v56,  v54,  v47,  v45,  v52,  v43,  v41,  v29,  v50,  v39,  v32,  v33,  v35,  v13,  v37,  v15,  v16);
LABEL_11:

      goto LABEL_12;
    }
  }

  v21 = 0LL;
LABEL_12:

  return v21;
}

+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetStatus))
    {
      id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
      if ((objc_opt_respondsToSelector( v9,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNever BeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesys temBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatching Attempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsa ge:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:") & 1) != 0)
      {

LABEL_7:
        id v12 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetStatus)];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        id v8 = +[MASAutoAssetStatus newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetStatus,  "newShimmedFromFramework:",  v13);

        goto LABEL_9;
      }

      unsigned __int8 v10 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
      char v11 = objc_opt_respondsToSelector( v10,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownl oadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloa dedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStaged PriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForU seError:withPatchingAttemptError:withNewerVersionError:");

      if ((v11 & 1) != 0) {
        goto LABEL_7;
      }
    }

    id v8 = 0LL;
  }

+ (void)newShimmedToFramework:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "{MADAutoAssetStatus-newShimmedToFramework} WARNING: wrong class provided as daemonNativeToBeShimmed",  v1,  2u);
}

@end