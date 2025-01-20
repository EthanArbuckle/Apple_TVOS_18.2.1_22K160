@interface MASAutoAssetControlStatistics
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetControlStatistics

+ (id)newServerMessageClasses:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatistics))
    {
      id v5 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetControlStatistics)];
      v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
    }

    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand))
    {
      id v6 = [v4 setByAddingObject:objc_opt_class(MAAutoAssetControlStatisticsByCommand)];
      uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

      v4 = (void *)v7;
    }

    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize))
    {
      id v8 = [v4 setByAddingObject:objc_opt_class(MAAutoAssetControlStatisticsBySize)];
      uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

      v4 = (void *)v9;
    }

    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatistics))
    {
      id v10 = [v4 setByAddingObject:objc_opt_class(MAAutoAssetControlStatistics)];
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);

      v4 = (void *)v11;
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
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatistics)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatistics),
        char v5 = objc_opt_respondsToSelector(v4, "init"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetControlStatistics);
    if ((objc_opt_respondsToSelector(v6, "totalClientRequests") & 1) != 0)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 totalClientRequests]);
      id v8 = +[MASAutoAssetControlStatisticsByCommand newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsByCommand,  "newShimmedToFramework:",  v7);
      [v6 setTotalClientRequests:v8];
    }

    if ((objc_opt_respondsToSelector(v6, "totalClientRepliesSuccess") & 1) != 0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 totalClientRepliesSuccess]);
      id v10 = +[MASAutoAssetControlStatisticsByCommand newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsByCommand,  "newShimmedToFramework:",  v9);
      [v6 setTotalClientRepliesSuccess:v10];
    }

    if ((objc_opt_respondsToSelector(v6, "totalClientRepliesFailure") & 1) != 0)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 totalClientRepliesFailure]);
      id v12 = +[MASAutoAssetControlStatisticsByCommand newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsByCommand,  "newShimmedToFramework:",  v11);
      [v6 setTotalClientRepliesFailure:v12];
    }

    if ((objc_opt_respondsToSelector(v6, "totalQueuedClientRequests") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v3 totalQueuedClientRequests]);
      id v14 = +[MASAutoAssetControlStatisticsByCommand newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsByCommand,  "newShimmedToFramework:",  v13);
      [v6 setTotalQueuedClientRequests:v14];
    }

    if ((objc_opt_respondsToSelector(v6, "totalDequeuedClientRequests") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v3 totalDequeuedClientRequests]);
      id v16 = +[MASAutoAssetControlStatisticsByCommand newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsByCommand,  "newShimmedToFramework:",  v15);
      [v6 setTotalDequeuedClientRequests:v16];
    }

    if ((objc_opt_respondsToSelector(v6, "totalAutoAssetJobsStarted") & 1) != 0) {
      objc_msgSend(v6, "setTotalAutoAssetJobsStarted:", objc_msgSend(v3, "totalAutoAssetJobsStarted"));
    }
    if ((objc_opt_respondsToSelector(v6, "totalAutoJobsFinished") & 1) != 0) {
      objc_msgSend(v6, "setTotalAutoJobsFinished:", objc_msgSend(v3, "totalAutoJobsFinished"));
    }
    if ((objc_opt_respondsToSelector(v6, "totalStagerDetermineJobsStarted") & 1) != 0) {
      objc_msgSend(v6, "setTotalStagerDetermineJobsStarted:", objc_msgSend(v3, "totalStagerDetermineJobsStarted"));
    }
    if ((objc_opt_respondsToSelector(v6, "totalStagerDetermineJobsFinished") & 1) != 0) {
      objc_msgSend(v6, "setTotalStagerDetermineJobsFinished:", objc_msgSend(v3, "totalStagerDetermineJobsFinished"));
    }
    if ((objc_opt_respondsToSelector(v6, "totalStagerDownloadJobsStarted") & 1) != 0) {
      objc_msgSend(v6, "setTotalStagerDownloadJobsStarted:", objc_msgSend(v3, "totalStagerDownloadJobsStarted"));
    }
    if ((objc_opt_respondsToSelector(v6, "totalStagerDownloadJobsFinished") & 1) != 0) {
      objc_msgSend(v6, "setTotalStagerDownloadJobsFinished:", objc_msgSend(v3, "totalStagerDownloadJobsFinished"));
    }
    if ((objc_opt_respondsToSelector(v6, "totalResumedInFlightJobs") & 1) != 0) {
      objc_msgSend(v6, "setTotalResumedInFlightJobs:", objc_msgSend(v3, "totalResumedInFlightJobs"));
    }
    if ((objc_opt_respondsToSelector(v6, "totalSchedulerTriggeredJobs") & 1) != 0) {
      objc_msgSend(v6, "setTotalSchedulerTriggeredJobs:", objc_msgSend(v3, "totalSchedulerTriggeredJobs"));
    }
    if ((objc_opt_respondsToSelector(v6, "totalFailuresToStartJobs") & 1) != 0) {
      objc_msgSend(v6, "setTotalFailuresToStartJobs:", objc_msgSend(v3, "totalFailuresToStartJobs"));
    }
    if ((objc_opt_respondsToSelector(v6, "previouslyDownloaded") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v3 previouslyDownloaded]);
      id v18 = +[MASAutoAssetControlStatisticsBySize newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsBySize,  "newShimmedToFramework:",  v17);
      [v6 setPreviouslyDownloaded:v18];
    }

    if ((objc_opt_respondsToSelector(v6, "totalDownloaded") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v3 totalDownloaded]);
      id v20 = +[MASAutoAssetControlStatisticsBySize newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsBySize,  "newShimmedToFramework:",  v19);
      [v6 setTotalDownloaded:v20];
    }

    if ((objc_opt_respondsToSelector(v6, "totalStaged") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v3 totalStaged]);
      id v22 = +[MASAutoAssetControlStatisticsBySize newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsBySize,  "newShimmedToFramework:",  v21);
      [v6 setTotalStaged:v22];
    }

    if ((objc_opt_respondsToSelector(v6, "totalUnstaged") & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v3 totalUnstaged]);
      id v24 = +[MASAutoAssetControlStatisticsBySize newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsBySize,  "newShimmedToFramework:",  v23);
      [v6 setTotalUnstaged:v24];
    }

    if ((objc_opt_respondsToSelector(v6, "totalPromoted") & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v3 totalPromoted]);
      id v26 = +[MASAutoAssetControlStatisticsBySize newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsBySize,  "newShimmedToFramework:",  v25);
      [v6 setTotalPromoted:v26];
    }

    if ((objc_opt_respondsToSelector(v6, "totalRemoved") & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v3 totalRemoved]);
      id v28 = +[MASAutoAssetControlStatisticsBySize newShimmedToFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsBySize,  "newShimmedToFramework:",  v27);
      [v6 setTotalRemoved:v28];
    }

    if ((objc_opt_respondsToSelector(v6, "finishedJobSchedulerNetworkFailure") & 1) != 0) {
      objc_msgSend(v6, "setFinishedJobSchedulerNetworkFailure:", objc_msgSend(v3, "finishedJobSchedulerNetworkFailure"));
    }
    if ((objc_opt_respondsToSelector(v6, "finishedJobSchedulerNotNetworkRelated") & 1) != 0) {
      objc_msgSend( v6,  "setFinishedJobSchedulerNotNetworkRelated:",  objc_msgSend(v3, "finishedJobSchedulerNotNetworkRelated"));
    }
    if ((objc_opt_respondsToSelector(v6, "finishedJobClientNetworkFailure") & 1) != 0) {
      objc_msgSend(v6, "setFinishedJobClientNetworkFailure:", objc_msgSend(v3, "finishedJobClientNetworkFailure"));
    }
    if ((objc_opt_respondsToSelector(v6, "finishedJobClientNotNetworkRelated") & 1) != 0) {
      objc_msgSend(v6, "setFinishedJobClientNotNetworkRelated:", objc_msgSend(v3, "finishedJobClientNotNetworkRelated"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionPerformed") & 1) != 0) {
      objc_msgSend(v6, "setGarbageCollectionPerformed:", objc_msgSend(v3, "garbageCollectionPerformed"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimSpace") & 1) != 0) {
      objc_msgSend(v6, "setGarbageCollectionReclaimSpace:", objc_msgSend(v3, "garbageCollectionReclaimSpace"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionTotalReclaimedSpace") & 1) != 0) {
      objc_msgSend( v6,  "setGarbageCollectionTotalReclaimedSpace:",  objc_msgSend(v3, "garbageCollectionTotalReclaimedSpace"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedV2AssetCount") & 1) != 0) {
      objc_msgSend( v6,  "setGarbageCollectionReclaimedV2AssetCount:",  objc_msgSend(v3, "garbageCollectionReclaimedV2AssetCount"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedV2AssetSpace") & 1) != 0) {
      objc_msgSend( v6,  "setGarbageCollectionReclaimedV2AssetSpace:",  objc_msgSend(v3, "garbageCollectionReclaimedV2AssetSpace"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedUnlockedCount") & 1) != 0) {
      objc_msgSend( v6,  "setGarbageCollectionReclaimedUnlockedCount:",  objc_msgSend(v3, "garbageCollectionReclaimedUnlockedCount"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedUnlockedSpace") & 1) != 0) {
      objc_msgSend( v6,  "setGarbageCollectionReclaimedUnlockedSpace:",  objc_msgSend(v3, "garbageCollectionReclaimedUnlockedSpace"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedLockedOverridableCount") & 1) != 0) {
      objc_msgSend( v6,  "setGarbageCollectionReclaimedLockedOverridableCount:",  objc_msgSend(v3, "garbageCollectionReclaimedLockedOverridableCount"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedLockedOverridableSpace") & 1) != 0) {
      objc_msgSend( v6,  "setGarbageCollectionReclaimedLockedOverridableSpace:",  objc_msgSend(v3, "garbageCollectionReclaimedLockedOverridableSpace"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedLockedNeverRemoveCount") & 1) != 0) {
      objc_msgSend( v6,  "setGarbageCollectionReclaimedLockedNeverRemoveCount:",  objc_msgSend(v3, "garbageCollectionReclaimedLockedNeverRemoveCount"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedLockedNeverRemoveSpace") & 1) != 0) {
      objc_msgSend( v6,  "setGarbageCollectionReclaimedLockedNeverRemoveSpace:",  objc_msgSend(v3, "garbageCollectionReclaimedLockedNeverRemoveSpace"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedStagedCount") & 1) != 0) {
      objc_msgSend( v6,  "setGarbageCollectionReclaimedStagedCount:",  objc_msgSend(v3, "garbageCollectionReclaimedStagedCount"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedStagedSpace") & 1) != 0) {
      objc_msgSend( v6,  "setGarbageCollectionReclaimedStagedSpace:",  objc_msgSend(v3, "garbageCollectionReclaimedStagedSpace"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedMetadataBlockedCount") & 1) != 0) {
      objc_msgSend( v6,  "setGarbageCollectionReclaimedMetadataBlockedCount:",  objc_msgSend(v3, "garbageCollectionReclaimedMetadataBlockedCount"));
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedMetadataBlockedSpace") & 1) != 0) {
      objc_msgSend( v6,  "setGarbageCollectionReclaimedMetadataBlockedSpace:",  objc_msgSend(v3, "garbageCollectionReclaimedMetadataBlockedSpace"));
    }
    id v29 = v6;
  }

  else
  {
    id v29 = 0LL;
  }

  id v30 = v29;

  return v30;
}

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatistics)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatistics),
        char v5 = objc_opt_respondsToSelector(v4, "init"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = v3;
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetControlStatistics);
    if ((objc_opt_respondsToSelector(v6, "totalClientRequests") & 1) != 0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 totalClientRequests]);
      id v9 = +[MASAutoAssetControlStatisticsByCommand newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsByCommand,  "newShimmedFromFramework:",  v8);
      -[MANAutoAssetControlStatistics setTotalClientRequests:](v7, "setTotalClientRequests:", v9);
    }

    if ((objc_opt_respondsToSelector(v6, "totalClientRepliesSuccess") & 1) != 0)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 totalClientRepliesSuccess]);
      id v11 = +[MASAutoAssetControlStatisticsByCommand newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsByCommand,  "newShimmedFromFramework:",  v10);
      -[MANAutoAssetControlStatistics setTotalClientRepliesSuccess:](v7, "setTotalClientRepliesSuccess:", v11);
    }

    if ((objc_opt_respondsToSelector(v6, "totalClientRepliesFailure") & 1) != 0)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 totalClientRepliesFailure]);
      id v13 = +[MASAutoAssetControlStatisticsByCommand newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsByCommand,  "newShimmedFromFramework:",  v12);
      -[MANAutoAssetControlStatistics setTotalClientRepliesFailure:](v7, "setTotalClientRepliesFailure:", v13);
    }

    if ((objc_opt_respondsToSelector(v6, "totalQueuedClientRequests") & 1) != 0)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 totalQueuedClientRequests]);
      id v15 = +[MASAutoAssetControlStatisticsByCommand newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsByCommand,  "newShimmedFromFramework:",  v14);
      -[MANAutoAssetControlStatistics setTotalQueuedClientRequests:](v7, "setTotalQueuedClientRequests:", v15);
    }

    if ((objc_opt_respondsToSelector(v6, "totalDequeuedClientRequests") & 1) != 0)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 totalDequeuedClientRequests]);
      id v17 = +[MASAutoAssetControlStatisticsByCommand newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsByCommand,  "newShimmedFromFramework:",  v16);
      -[MANAutoAssetControlStatistics setTotalDequeuedClientRequests:](v7, "setTotalDequeuedClientRequests:", v17);
    }

    if ((objc_opt_respondsToSelector(v6, "totalAutoAssetJobsStarted") & 1) != 0) {
      -[MANAutoAssetControlStatistics setTotalAutoAssetJobsStarted:]( v7,  "setTotalAutoAssetJobsStarted:",  [v6 totalAutoAssetJobsStarted]);
    }
    if ((objc_opt_respondsToSelector(v6, "totalAutoJobsFinished") & 1) != 0) {
      -[MANAutoAssetControlStatistics setTotalAutoJobsFinished:]( v7,  "setTotalAutoJobsFinished:",  [v6 totalAutoJobsFinished]);
    }
    if ((objc_opt_respondsToSelector(v6, "totalStagerDetermineJobsStarted") & 1) != 0) {
      -[MANAutoAssetControlStatistics setTotalStagerDetermineJobsStarted:]( v7,  "setTotalStagerDetermineJobsStarted:",  [v6 totalStagerDetermineJobsStarted]);
    }
    if ((objc_opt_respondsToSelector(v6, "totalStagerDetermineJobsFinished") & 1) != 0) {
      -[MANAutoAssetControlStatistics setTotalStagerDetermineJobsFinished:]( v7,  "setTotalStagerDetermineJobsFinished:",  [v6 totalStagerDetermineJobsFinished]);
    }
    if ((objc_opt_respondsToSelector(v6, "totalStagerDownloadJobsStarted") & 1) != 0) {
      -[MANAutoAssetControlStatistics setTotalStagerDownloadJobsStarted:]( v7,  "setTotalStagerDownloadJobsStarted:",  [v6 totalStagerDownloadJobsStarted]);
    }
    if ((objc_opt_respondsToSelector(v6, "totalStagerDownloadJobsFinished") & 1) != 0) {
      -[MANAutoAssetControlStatistics setTotalStagerDownloadJobsFinished:]( v7,  "setTotalStagerDownloadJobsFinished:",  [v6 totalStagerDownloadJobsFinished]);
    }
    if ((objc_opt_respondsToSelector(v6, "totalResumedInFlightJobs") & 1) != 0) {
      -[MANAutoAssetControlStatistics setTotalResumedInFlightJobs:]( v7,  "setTotalResumedInFlightJobs:",  [v6 totalResumedInFlightJobs]);
    }
    if ((objc_opt_respondsToSelector(v6, "totalSchedulerTriggeredJobs") & 1) != 0) {
      -[MANAutoAssetControlStatistics setTotalSchedulerTriggeredJobs:]( v7,  "setTotalSchedulerTriggeredJobs:",  [v6 totalSchedulerTriggeredJobs]);
    }
    if ((objc_opt_respondsToSelector(v6, "totalFailuresToStartJobs") & 1) != 0) {
      -[MANAutoAssetControlStatistics setTotalFailuresToStartJobs:]( v7,  "setTotalFailuresToStartJobs:",  [v6 totalFailuresToStartJobs]);
    }
    if ((objc_opt_respondsToSelector(v6, "previouslyDownloaded") & 1) != 0)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 previouslyDownloaded]);
      id v19 = +[MASAutoAssetControlStatisticsBySize newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsBySize,  "newShimmedFromFramework:",  v18);
      -[MANAutoAssetControlStatistics setPreviouslyDownloaded:](v7, "setPreviouslyDownloaded:", v19);
    }

    if ((objc_opt_respondsToSelector(v6, "totalDownloaded") & 1) != 0)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 totalDownloaded]);
      id v21 = +[MASAutoAssetControlStatisticsBySize newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsBySize,  "newShimmedFromFramework:",  v20);
      -[MANAutoAssetControlStatistics setTotalDownloaded:](v7, "setTotalDownloaded:", v21);
    }

    if ((objc_opt_respondsToSelector(v6, "totalStaged") & 1) != 0)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 totalStaged]);
      id v23 = +[MASAutoAssetControlStatisticsBySize newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsBySize,  "newShimmedFromFramework:",  v22);
      -[MANAutoAssetControlStatistics setTotalStaged:](v7, "setTotalStaged:", v23);
    }

    if ((objc_opt_respondsToSelector(v6, "totalUnstaged") & 1) != 0)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 totalUnstaged]);
      id v25 = +[MASAutoAssetControlStatisticsBySize newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsBySize,  "newShimmedFromFramework:",  v24);
      -[MANAutoAssetControlStatistics setTotalUnstaged:](v7, "setTotalUnstaged:", v25);
    }

    if ((objc_opt_respondsToSelector(v6, "totalPromoted") & 1) != 0)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v6 totalPromoted]);
      id v27 = +[MASAutoAssetControlStatisticsBySize newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsBySize,  "newShimmedFromFramework:",  v26);
      -[MANAutoAssetControlStatistics setTotalPromoted:](v7, "setTotalPromoted:", v27);
    }

    if ((objc_opt_respondsToSelector(v6, "totalRemoved") & 1) != 0)
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v6 totalRemoved]);
      id v29 = +[MASAutoAssetControlStatisticsBySize newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetControlStatisticsBySize,  "newShimmedFromFramework:",  v28);
      -[MANAutoAssetControlStatistics setTotalRemoved:](v7, "setTotalRemoved:", v29);
    }

    if ((objc_opt_respondsToSelector(v6, "finishedJobSchedulerNetworkFailure") & 1) != 0) {
      -[MANAutoAssetControlStatistics setFinishedJobSchedulerNetworkFailure:]( v7,  "setFinishedJobSchedulerNetworkFailure:",  [v6 finishedJobSchedulerNetworkFailure]);
    }
    if ((objc_opt_respondsToSelector(v6, "finishedJobSchedulerNotNetworkRelated") & 1) != 0) {
      -[MANAutoAssetControlStatistics setFinishedJobSchedulerNotNetworkRelated:]( v7,  "setFinishedJobSchedulerNotNetworkRelated:",  [v6 finishedJobSchedulerNotNetworkRelated]);
    }
    if ((objc_opt_respondsToSelector(v6, "finishedJobClientNetworkFailure") & 1) != 0) {
      -[MANAutoAssetControlStatistics setFinishedJobClientNetworkFailure:]( v7,  "setFinishedJobClientNetworkFailure:",  [v6 finishedJobClientNetworkFailure]);
    }
    if ((objc_opt_respondsToSelector(v6, "finishedJobClientNotNetworkRelated") & 1) != 0) {
      -[MANAutoAssetControlStatistics setFinishedJobClientNotNetworkRelated:]( v7,  "setFinishedJobClientNotNetworkRelated:",  [v6 finishedJobClientNotNetworkRelated]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionPerformed") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionPerformed:]( v7,  "setGarbageCollectionPerformed:",  [v6 garbageCollectionPerformed]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimSpace") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionReclaimSpace:]( v7,  "setGarbageCollectionReclaimSpace:",  [v6 garbageCollectionReclaimSpace]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionTotalReclaimedSpace") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionTotalReclaimedSpace:]( v7,  "setGarbageCollectionTotalReclaimedSpace:",  [v6 garbageCollectionTotalReclaimedSpace]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedV2AssetCount") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedV2AssetCount:]( v7,  "setGarbageCollectionReclaimedV2AssetCount:",  [v6 garbageCollectionReclaimedV2AssetCount]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedV2AssetSpace") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedV2AssetSpace:]( v7,  "setGarbageCollectionReclaimedV2AssetSpace:",  [v6 garbageCollectionReclaimedV2AssetSpace]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedUnlockedCount") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedUnlockedCount:]( v7,  "setGarbageCollectionReclaimedUnlockedCount:",  [v6 garbageCollectionReclaimedUnlockedCount]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedUnlockedSpace") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedUnlockedSpace:]( v7,  "setGarbageCollectionReclaimedUnlockedSpace:",  [v6 garbageCollectionReclaimedUnlockedSpace]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedLockedOverridableCount") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedLockedOverridableCount:]( v7,  "setGarbageCollectionReclaimedLockedOverridableCount:",  [v6 garbageCollectionReclaimedLockedOverridableCount]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedLockedOverridableSpace") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedLockedOverridableSpace:]( v7,  "setGarbageCollectionReclaimedLockedOverridableSpace:",  [v6 garbageCollectionReclaimedLockedOverridableSpace]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedLockedNeverRemoveCount") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedLockedNeverRemoveCount:]( v7,  "setGarbageCollectionReclaimedLockedNeverRemoveCount:",  [v6 garbageCollectionReclaimedLockedNeverRemoveCount]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedLockedNeverRemoveSpace") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedLockedNeverRemoveSpace:]( v7,  "setGarbageCollectionReclaimedLockedNeverRemoveSpace:",  [v6 garbageCollectionReclaimedLockedNeverRemoveSpace]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedStagedCount") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedStagedCount:]( v7,  "setGarbageCollectionReclaimedStagedCount:",  [v6 garbageCollectionReclaimedStagedCount]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedStagedSpace") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedStagedSpace:]( v7,  "setGarbageCollectionReclaimedStagedSpace:",  [v6 garbageCollectionReclaimedStagedSpace]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedMetadataBlockedCount") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedMetadataBlockedCount:]( v7,  "setGarbageCollectionReclaimedMetadataBlockedCount:",  [v6 garbageCollectionReclaimedMetadataBlockedCount]);
    }
    if ((objc_opt_respondsToSelector(v6, "garbageCollectionReclaimedMetadataBlockedSpace") & 1) != 0) {
      -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedMetadataBlockedSpace:]( v7,  "setGarbageCollectionReclaimedMetadataBlockedSpace:",  [v6 garbageCollectionReclaimedMetadataBlockedSpace]);
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  id v30 = v7;

  return v30;
}

+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    if (objc_opt_class(&OBJC_CLASS___MAAutoAssetControlStatistics)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatistics),
          char v10 = objc_opt_respondsToSelector(v9, "init"),
          v9,
          (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetControlStatistics)];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetControlStatistics newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetControlStatistics,  "newShimmedFromFramework:",  v12);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

@end