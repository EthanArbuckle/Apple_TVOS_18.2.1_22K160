@interface MASAutoAssetControlStatisticsByCommand
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetControlStatisticsByCommand

+ (id)newServerMessageClasses:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand))
    {
      id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetControlStatisticsByCommand)];
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
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand),
        char v5 = objc_opt_respondsToSelector(v4, "init"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand);
    if ((objc_opt_respondsToSelector(v6, "checkForNewer") & 1) != 0) {
      objc_msgSend(v6, "setCheckForNewer:", objc_msgSend(v3, "checkForNewer"));
    }
    if ((objc_opt_respondsToSelector(v6, "determineIfAvailable") & 1) != 0) {
      objc_msgSend(v6, "setDetermineIfAvailable:", objc_msgSend(v3, "determineIfAvailable"));
    }
    if ((objc_opt_respondsToSelector(v6, "currentStatus") & 1) != 0) {
      objc_msgSend(v6, "setCurrentStatus:", objc_msgSend(v3, "currentStatus"));
    }
    if ((objc_opt_respondsToSelector(v6, "lockContent") & 1) != 0) {
      objc_msgSend(v6, "setLockContent:", objc_msgSend(v3, "lockContent"));
    }
    if ((objc_opt_respondsToSelector(v6, "continueLockUsage") & 1) != 0) {
      objc_msgSend(v6, "setContinueLockUsage:", objc_msgSend(v3, "continueLockUsage"));
    }
    if ((objc_opt_respondsToSelector(v6, "endLockUsage") & 1) != 0) {
      objc_msgSend(v6, "setEndLockUsage:", objc_msgSend(v3, "endLockUsage"));
    }
    if ((objc_opt_respondsToSelector(v6, "endPreviousLocks") & 1) != 0) {
      objc_msgSend(v6, "setEndPreviousLocks:", objc_msgSend(v3, "endPreviousLocks"));
    }
    if ((objc_opt_respondsToSelector(v6, "endAllPreviousLocks") & 1) != 0) {
      objc_msgSend(v6, "setEndAllPreviousLocks:", objc_msgSend(v3, "endAllPreviousLocks"));
    }
    if ((objc_opt_respondsToSelector(v6, "eliminateAllForSelector") & 1) != 0) {
      objc_msgSend(v6, "setEliminateAllForSelector:", objc_msgSend(v3, "eliminateAllForSelector"));
    }
    if ((objc_opt_respondsToSelector(v6, "eliminateAllForAssetType") & 1) != 0) {
      objc_msgSend(v6, "setEliminateAllForAssetType:", objc_msgSend(v3, "eliminateAllForAssetType"));
    }
    if ((objc_opt_respondsToSelector(v6, "eliminatePromotedNeverLockedForSelector") & 1) != 0) {
      objc_msgSend( v6,  "setEliminatePromotedNeverLockedForSelector:",  objc_msgSend(v3, "eliminatePromotedNeverLockedForSelector"));
    }
    if ((objc_opt_respondsToSelector(v6, "stageDetermineAllAvailable") & 1) != 0) {
      objc_msgSend(v6, "setStageDetermineAllAvailable:", objc_msgSend(v3, "stageDetermineAllAvailable"));
    }
    if ((objc_opt_respondsToSelector(v6, "stageDownloadAll") & 1) != 0) {
      objc_msgSend(v6, "setStageDownloadAll:", objc_msgSend(v3, "stageDownloadAll"));
    }
    if ((objc_opt_respondsToSelector(v6, "stagePurgeAll") & 1) != 0) {
      objc_msgSend(v6, "setStagePurgeAll:", objc_msgSend(v3, "stagePurgeAll"));
    }
    if ((objc_opt_respondsToSelector(v6, "stageEraseAll") & 1) != 0) {
      objc_msgSend(v6, "setStageEraseAll:", objc_msgSend(v3, "stageEraseAll"));
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
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand),
        char v5 = objc_opt_respondsToSelector(v4, "init"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = v3;
    v7 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetControlStatisticsByCommand);
    if ((objc_opt_respondsToSelector(v6, "interestInContent") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setInterestInContent:]( v7,  "setInterestInContent:",  [v6 interestInContent]);
    }
    if ((objc_opt_respondsToSelector(v6, "checkForNewer") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setCheckForNewer:]( v7,  "setCheckForNewer:",  [v6 checkForNewer]);
    }
    if ((objc_opt_respondsToSelector(v6, "determineIfAvailable") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setDetermineIfAvailable:]( v7,  "setDetermineIfAvailable:",  [v6 determineIfAvailable]);
    }
    if ((objc_opt_respondsToSelector(v6, "currentStatus") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setCurrentStatus:]( v7,  "setCurrentStatus:",  [v6 currentStatus]);
    }
    if ((objc_opt_respondsToSelector(v6, "lockContent") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setLockContent:](v7, "setLockContent:", [v6 lockContent]);
    }
    if ((objc_opt_respondsToSelector(v6, "continueLockUsage") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setContinueLockUsage:]( v7,  "setContinueLockUsage:",  [v6 continueLockUsage]);
    }
    if ((objc_opt_respondsToSelector(v6, "endLockUsage") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setEndLockUsage:]( v7,  "setEndLockUsage:",  [v6 endLockUsage]);
    }
    if ((objc_opt_respondsToSelector(v6, "endPreviousLocks") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setEndPreviousLocks:]( v7,  "setEndPreviousLocks:",  [v6 endPreviousLocks]);
    }
    if ((objc_opt_respondsToSelector(v6, "endAllPreviousLocks") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setEndAllPreviousLocks:]( v7,  "setEndAllPreviousLocks:",  [v6 endAllPreviousLocks]);
    }
    if ((objc_opt_respondsToSelector(v6, "eliminateAllForSelector") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setEliminateAllForSelector:]( v7,  "setEliminateAllForSelector:",  [v6 eliminateAllForSelector]);
    }
    if ((objc_opt_respondsToSelector(v6, "eliminateAllForAssetType") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setEliminateAllForAssetType:]( v7,  "setEliminateAllForAssetType:",  [v6 eliminateAllForAssetType]);
    }
    if ((objc_opt_respondsToSelector(v6, "eliminatePromotedNeverLockedForSelector") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setEliminatePromotedNeverLockedForSelector:]( v7,  "setEliminatePromotedNeverLockedForSelector:",  [v6 eliminatePromotedNeverLockedForSelector]);
    }
    if ((objc_opt_respondsToSelector(v6, "stageDetermineAllAvailable") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setStageDetermineAllAvailable:]( v7,  "setStageDetermineAllAvailable:",  [v6 stageDetermineAllAvailable]);
    }
    if ((objc_opt_respondsToSelector(v6, "stageDownloadAll") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setStageDownloadAll:]( v7,  "setStageDownloadAll:",  [v6 stageDownloadAll]);
    }
    if ((objc_opt_respondsToSelector(v6, "stagePurgeAll") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setStagePurgeAll:]( v7,  "setStagePurgeAll:",  [v6 stagePurgeAll]);
    }
    if ((objc_opt_respondsToSelector(v6, "stageEraseAll") & 1) != 0) {
      -[MANAutoAssetControlStatisticsByCommand setStageEraseAll:]( v7,  "setStageEraseAll:",  [v6 stageEraseAll]);
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
    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand),
          char v10 = objc_opt_respondsToSelector(v9, "init"),
          v9,
          (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetControlStatisticsByCommand)];
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetControlStatisticsByCommand newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsByCommand,  "newShimmedFromFramework:",  v12);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

@end