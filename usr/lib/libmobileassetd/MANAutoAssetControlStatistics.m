@interface MANAutoAssetControlStatistics
+ (BOOL)supportsSecureCoding;
+ (id)allocStringForBytes:(int64_t)a3;
- (BOOL)garbageCollectionPerformed;
- (BOOL)garbageCollectionReclaimSpace;
- (MANAutoAssetControlStatistics)init;
- (MANAutoAssetControlStatistics)initWithCoder:(id)a3;
- (MANAutoAssetControlStatistics)initWithInitialValue:(int64_t)a3;
- (MANAutoAssetControlStatisticsByCommand)totalClientRepliesFailure;
- (MANAutoAssetControlStatisticsByCommand)totalClientRepliesSuccess;
- (MANAutoAssetControlStatisticsByCommand)totalClientRequests;
- (MANAutoAssetControlStatisticsByCommand)totalDequeuedClientRequests;
- (MANAutoAssetControlStatisticsByCommand)totalQueuedClientRequests;
- (MANAutoAssetControlStatisticsBySize)previouslyDownloaded;
- (MANAutoAssetControlStatisticsBySize)totalDownloaded;
- (MANAutoAssetControlStatisticsBySize)totalPromoted;
- (MANAutoAssetControlStatisticsBySize)totalRemoved;
- (MANAutoAssetControlStatisticsBySize)totalStaged;
- (MANAutoAssetControlStatisticsBySize)totalUnstaged;
- (id)copy;
- (id)description;
- (id)summary;
- (int64_t)finishedJobClientNetworkFailure;
- (int64_t)finishedJobClientNotNetworkRelated;
- (int64_t)finishedJobSchedulerNetworkFailure;
- (int64_t)finishedJobSchedulerNotNetworkRelated;
- (int64_t)garbageCollectionReclaimedLockedNeverRemoveCount;
- (int64_t)garbageCollectionReclaimedLockedNeverRemoveSpace;
- (int64_t)garbageCollectionReclaimedLockedOverridableCount;
- (int64_t)garbageCollectionReclaimedLockedOverridableSpace;
- (int64_t)garbageCollectionReclaimedMetadataBlockedCount;
- (int64_t)garbageCollectionReclaimedMetadataBlockedSpace;
- (int64_t)garbageCollectionReclaimedStagedCount;
- (int64_t)garbageCollectionReclaimedStagedSpace;
- (int64_t)garbageCollectionReclaimedUnlockedCount;
- (int64_t)garbageCollectionReclaimedUnlockedSpace;
- (int64_t)garbageCollectionReclaimedV2AssetCount;
- (int64_t)garbageCollectionReclaimedV2AssetSpace;
- (int64_t)garbageCollectionTotalReclaimedSpace;
- (int64_t)totalAutoAssetJobsStarted;
- (int64_t)totalAutoJobsFinished;
- (int64_t)totalFailuresToStartJobs;
- (int64_t)totalResumedInFlightJobs;
- (int64_t)totalSchedulerTriggeredJobs;
- (int64_t)totalStagerDetermineJobsFinished;
- (int64_t)totalStagerDetermineJobsStarted;
- (int64_t)totalStagerDownloadJobsFinished;
- (int64_t)totalStagerDownloadJobsStarted;
- (void)encodeWithCoder:(id)a3;
- (void)setFinishedJobClientNetworkFailure:(int64_t)a3;
- (void)setFinishedJobClientNotNetworkRelated:(int64_t)a3;
- (void)setFinishedJobSchedulerNetworkFailure:(int64_t)a3;
- (void)setFinishedJobSchedulerNotNetworkRelated:(int64_t)a3;
- (void)setGarbageCollectionPerformed:(BOOL)a3;
- (void)setGarbageCollectionReclaimSpace:(BOOL)a3;
- (void)setGarbageCollectionReclaimedLockedNeverRemoveCount:(int64_t)a3;
- (void)setGarbageCollectionReclaimedLockedNeverRemoveSpace:(int64_t)a3;
- (void)setGarbageCollectionReclaimedLockedOverridableCount:(int64_t)a3;
- (void)setGarbageCollectionReclaimedLockedOverridableSpace:(int64_t)a3;
- (void)setGarbageCollectionReclaimedMetadataBlockedCount:(int64_t)a3;
- (void)setGarbageCollectionReclaimedMetadataBlockedSpace:(int64_t)a3;
- (void)setGarbageCollectionReclaimedStagedCount:(int64_t)a3;
- (void)setGarbageCollectionReclaimedStagedSpace:(int64_t)a3;
- (void)setGarbageCollectionReclaimedUnlockedCount:(int64_t)a3;
- (void)setGarbageCollectionReclaimedUnlockedSpace:(int64_t)a3;
- (void)setGarbageCollectionReclaimedV2AssetCount:(int64_t)a3;
- (void)setGarbageCollectionReclaimedV2AssetSpace:(int64_t)a3;
- (void)setGarbageCollectionTotalReclaimedSpace:(int64_t)a3;
- (void)setPreviouslyDownloaded:(id)a3;
- (void)setTotalAutoAssetJobsStarted:(int64_t)a3;
- (void)setTotalAutoJobsFinished:(int64_t)a3;
- (void)setTotalClientRepliesFailure:(id)a3;
- (void)setTotalClientRepliesSuccess:(id)a3;
- (void)setTotalClientRequests:(id)a3;
- (void)setTotalDequeuedClientRequests:(id)a3;
- (void)setTotalDownloaded:(id)a3;
- (void)setTotalFailuresToStartJobs:(int64_t)a3;
- (void)setTotalPromoted:(id)a3;
- (void)setTotalQueuedClientRequests:(id)a3;
- (void)setTotalRemoved:(id)a3;
- (void)setTotalResumedInFlightJobs:(int64_t)a3;
- (void)setTotalSchedulerTriggeredJobs:(int64_t)a3;
- (void)setTotalStaged:(id)a3;
- (void)setTotalStagerDetermineJobsFinished:(int64_t)a3;
- (void)setTotalStagerDetermineJobsStarted:(int64_t)a3;
- (void)setTotalStagerDownloadJobsFinished:(int64_t)a3;
- (void)setTotalStagerDownloadJobsStarted:(int64_t)a3;
- (void)setTotalUnstaged:(id)a3;
@end

@implementation MANAutoAssetControlStatistics

- (MANAutoAssetControlStatisticsByCommand)totalClientRequests
{
  return self->_totalClientRequests;
}

- (MANAutoAssetControlStatisticsByCommand)totalClientRepliesSuccess
{
  return self->_totalClientRepliesSuccess;
}

- (MANAutoAssetControlStatistics)init
{
  return -[MANAutoAssetControlStatistics initWithInitialValue:](self, "initWithInitialValue:", 0LL);
}

- (MANAutoAssetControlStatistics)initWithInitialValue:(int64_t)a3
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MANAutoAssetControlStatistics;
  v4 = -[MANAutoAssetControlStatistics init](&v28, "init");
  if (v4)
  {
    v5 = -[MANAutoAssetControlStatisticsByCommand initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MANAutoAssetControlStatisticsByCommand),  "initWithInitialValue:",  a3);
    totalClientRequests = v4->_totalClientRequests;
    v4->_totalClientRequests = v5;

    v7 = -[MANAutoAssetControlStatisticsByCommand initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MANAutoAssetControlStatisticsByCommand),  "initWithInitialValue:",  a3);
    totalClientRepliesSuccess = v4->_totalClientRepliesSuccess;
    v4->_totalClientRepliesSuccess = v7;

    v9 = -[MANAutoAssetControlStatisticsByCommand initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MANAutoAssetControlStatisticsByCommand),  "initWithInitialValue:",  a3);
    totalClientRepliesFailure = v4->_totalClientRepliesFailure;
    v4->_totalClientRepliesFailure = v9;

    v11 = -[MANAutoAssetControlStatisticsByCommand initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MANAutoAssetControlStatisticsByCommand),  "initWithInitialValue:",  a3);
    totalQueuedClientRequests = v4->_totalQueuedClientRequests;
    v4->_totalQueuedClientRequests = v11;

    v13 = -[MANAutoAssetControlStatisticsByCommand initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MANAutoAssetControlStatisticsByCommand),  "initWithInitialValue:",  a3);
    totalDequeuedClientRequests = v4->_totalDequeuedClientRequests;
    v4->_totalDequeuedClientRequests = v13;

    v4->_totalAutoAssetJobsStarted = a3;
    v4->_totalAutoJobsFinished = a3;
    v4->_totalStagerDetermineJobsStarted = a3;
    v4->_totalStagerDetermineJobsFinished = a3;
    v4->_totalStagerDownloadJobsStarted = a3;
    v4->_totalStagerDownloadJobsFinished = a3;
    v4->_totalResumedInFlightJobs = a3;
    v4->_totalSchedulerTriggeredJobs = a3;
    v4->_totalFailuresToStartJobs = a3;
    v15 = -[MANAutoAssetControlStatisticsBySize initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MANAutoAssetControlStatisticsBySize),  "initWithInitialValue:",  a3);
    previouslyDownloaded = v4->_previouslyDownloaded;
    v4->_previouslyDownloaded = v15;

    v17 = -[MANAutoAssetControlStatisticsBySize initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MANAutoAssetControlStatisticsBySize),  "initWithInitialValue:",  a3);
    totalDownloaded = v4->_totalDownloaded;
    v4->_totalDownloaded = v17;

    v19 = -[MANAutoAssetControlStatisticsBySize initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MANAutoAssetControlStatisticsBySize),  "initWithInitialValue:",  a3);
    totalStaged = v4->_totalStaged;
    v4->_totalStaged = v19;

    v21 = -[MANAutoAssetControlStatisticsBySize initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MANAutoAssetControlStatisticsBySize),  "initWithInitialValue:",  a3);
    totalUnstaged = v4->_totalUnstaged;
    v4->_totalUnstaged = v21;

    v23 = -[MANAutoAssetControlStatisticsBySize initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MANAutoAssetControlStatisticsBySize),  "initWithInitialValue:",  a3);
    totalPromoted = v4->_totalPromoted;
    v4->_totalPromoted = v23;

    v25 = -[MANAutoAssetControlStatisticsBySize initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MANAutoAssetControlStatisticsBySize),  "initWithInitialValue:",  a3);
    totalRemoved = v4->_totalRemoved;
    v4->_totalRemoved = v25;

    v4->_finishedJobSchedulerNetworkFailure = a3;
    v4->_finishedJobSchedulerNotNetworkRelated = a3;
    v4->_finishedJobClientNetworkFailure = a3;
    v4->_finishedJobClientNotNetworkRelated = a3;
    *(_WORD *)&v4->_garbageCollectionPerformed = 0;
    *(_OWORD *)&v4->_garbageCollectionTotalReclaimedSpace = 0u;
    *(_OWORD *)&v4->_garbageCollectionReclaimedV2AssetSpace = 0u;
    *(_OWORD *)&v4->_garbageCollectionReclaimedUnlockedSpace = 0u;
    *(_OWORD *)&v4->_garbageCollectionReclaimedLockedOverridableSpace = 0u;
    *(_OWORD *)&v4->_garbageCollectionReclaimedLockedNeverRemoveSpace = 0u;
    *(_OWORD *)&v4->_garbageCollectionReclaimedStagedSpace = 0u;
    v4->_garbageCollectionReclaimedMetadataBlockedSpace = 0LL;
  }

  return v4;
}

- (MANAutoAssetControlStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___MANAutoAssetControlStatistics;
  v5 = -[MANAutoAssetControlStatistics init](&v40, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetControlStatisticsByCommand) forKey:@"totalClientRequests"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    totalClientRequests = v5->_totalClientRequests;
    v5->_totalClientRequests = (MANAutoAssetControlStatisticsByCommand *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetControlStatisticsByCommand) forKey:@"totalClientRepliesSuccess"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    totalClientRepliesSuccess = v5->_totalClientRepliesSuccess;
    v5->_totalClientRepliesSuccess = (MANAutoAssetControlStatisticsByCommand *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetControlStatisticsByCommand) forKey:@"totalClientRepliesFailure"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    totalClientRepliesFailure = v5->_totalClientRepliesFailure;
    v5->_totalClientRepliesFailure = (MANAutoAssetControlStatisticsByCommand *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetControlStatisticsByCommand) forKey:@"totalQueuedClientRequests"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    totalQueuedClientRequests = v5->_totalQueuedClientRequests;
    v5->_totalQueuedClientRequests = (MANAutoAssetControlStatisticsByCommand *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetControlStatisticsByCommand) forKey:@"totalDequeuedClientRequests"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    totalDequeuedClientRequests = v5->_totalDequeuedClientRequests;
    v5->_totalDequeuedClientRequests = (MANAutoAssetControlStatisticsByCommand *)v19;

    v5->_totalAutoAssetJobsStarted = (int64_t)[v4 decodeInt64ForKey:@"totalAutoAssetJobsStarted"];
    v5->_totalAutoJobsFinished = (int64_t)[v4 decodeInt64ForKey:@"totalAutoJobsFinished"];
    v5->_totalStagerDetermineJobsStarted = (int64_t)[v4 decodeInt64ForKey:@"totalStagerDetermineJobsStarted"];
    v5->_totalStagerDetermineJobsFinished = (int64_t)[v4 decodeInt64ForKey:@"totalStagerDetermineJobsFinished"];
    v5->_totalStagerDownloadJobsStarted = (int64_t)[v4 decodeInt64ForKey:@"totalStagerDownloadJobsStarted"];
    v5->_totalStagerDownloadJobsFinished = (int64_t)[v4 decodeInt64ForKey:@"totalStagerDownloadJobsFinished"];
    v5->_totalResumedInFlightJobs = (int64_t)[v4 decodeInt64ForKey:@"totalResumedInFlightJobs"];
    v5->_totalSchedulerTriggeredJobs = (int64_t)[v4 decodeInt64ForKey:@"totalSchedulerTriggeredJobs"];
    v5->_totalFailuresToStartJobs = (int64_t)[v4 decodeInt64ForKey:@"totalFailuresToStartJobs"];
    id v21 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetControlStatisticsBySize) forKey:@"previouslyDownloaded"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    previouslyDownloaded = v5->_previouslyDownloaded;
    v5->_previouslyDownloaded = (MANAutoAssetControlStatisticsBySize *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetControlStatisticsBySize) forKey:@"totalDownloaded"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    totalDownloaded = v5->_totalDownloaded;
    v5->_totalDownloaded = (MANAutoAssetControlStatisticsBySize *)v25;

    id v27 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetControlStatisticsBySize) forKey:@"totalStaged"];
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    totalStaged = v5->_totalStaged;
    v5->_totalStaged = (MANAutoAssetControlStatisticsBySize *)v28;

    id v30 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetControlStatisticsBySize) forKey:@"totalUnstaged"];
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
    totalUnstaged = v5->_totalUnstaged;
    v5->_totalUnstaged = (MANAutoAssetControlStatisticsBySize *)v31;

    id v33 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetControlStatisticsBySize) forKey:@"totalPromoted"];
    uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
    totalPromoted = v5->_totalPromoted;
    v5->_totalPromoted = (MANAutoAssetControlStatisticsBySize *)v34;

    id v36 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetControlStatisticsBySize) forKey:@"totalRemoved"];
    uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);
    totalRemoved = v5->_totalRemoved;
    v5->_totalRemoved = (MANAutoAssetControlStatisticsBySize *)v37;

    v5->_finishedJobSchedulerNetworkFailure = (int64_t)[v4 decodeInt64ForKey:@"finishedJobSchedulerNetworkFailure"];
    v5->_finishedJobSchedulerNotNetworkRelated = (int64_t)[v4 decodeInt64ForKey:@"finishedJobSchedulerNotNetworkRelated"];
    v5->_finishedJobClientNetworkFailure = (int64_t)[v4 decodeInt64ForKey:@"finishedJobClientNetworkFailure"];
    v5->_finishedJobClientNotNetworkRelated = (int64_t)[v4 decodeInt64ForKey:@"finishedJobClientNotNetworkRelated"];
    v5->_garbageCollectionPerformed = [v4 decodeBoolForKey:@"garbageCollectionPerformed"];
    v5->_garbageCollectionReclaimSpace = [v4 decodeBoolForKey:@"garbageCollectionReclaimSpace"];
    v5->_garbageCollectionTotalReclaimedSpace = (int64_t)[v4 decodeInt64ForKey:@"garbageCollectionTotalReclaimedSpace"];
    v5->_garbageCollectionReclaimedV2AssetCount = (int64_t)[v4 decodeInt64ForKey:@"garbageCollectionReclaimedV2AssetCount"];
    v5->_garbageCollectionReclaimedV2AssetSpace = (int64_t)[v4 decodeInt64ForKey:@"garbageCollectionReclaimedV2AssetSpace"];
    v5->_garbageCollectionReclaimedUnlockedCount = (int64_t)[v4 decodeInt64ForKey:@"garbageCollectionReclaimedUnlockedCount"];
    v5->_garbageCollectionReclaimedUnlockedSpace = (int64_t)[v4 decodeInt64ForKey:@"garbageCollectionReclaimedUnlockedSpace"];
    v5->_garbageCollectionReclaimedLockedOverridableCount = (int64_t)[v4 decodeInt64ForKey:@"garbageCollectionReclaimedLockedOverridableCount"];
    v5->_garbageCollectionReclaimedLockedOverridableSpace = (int64_t)[v4 decodeInt64ForKey:@"garbageCollectionReclaimedLockedOverridableSpace"];
    v5->_garbageCollectionReclaimedLockedNeverRemoveCount = (int64_t)[v4 decodeInt64ForKey:@"garbageCollectionReclaimedLockedNeverRemoveCount"];
    v5->_garbageCollectionReclaimedLockedNeverRemoveSpace = (int64_t)[v4 decodeInt64ForKey:@"garbageCollectionReclaimedLockedNeverRemoveSpace"];
    v5->_garbageCollectionReclaimedStagedCount = (int64_t)[v4 decodeInt64ForKey:@"garbageCollectionReclaimedStagedCount"];
    v5->_garbageCollectionReclaimedStagedSpace = (int64_t)[v4 decodeInt64ForKey:@"garbageCollectionReclaimedStagedSpace"];
    v5->_garbageCollectionReclaimedMetadataBlockedCount = (int64_t)[v4 decodeInt64ForKey:@"garbageCollectionReclaimedMetadataBlockedCount"];
    v5->_garbageCollectionReclaimedMetadataBlockedSpace = (int64_t)[v4 decodeInt64ForKey:@"garbageCollectionReclaimedMetadataBlockedSpace"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  [v15 encodeObject:v4 forKey:@"totalClientRequests"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  [v15 encodeObject:v5 forKey:@"totalClientRepliesSuccess"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  [v15 encodeObject:v6 forKey:@"totalClientRepliesFailure"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  [v15 encodeObject:v7 forKey:@"totalQueuedClientRequests"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  [v15 encodeObject:v8 forKey:@"totalDequeuedClientRequests"];

  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics totalAutoAssetJobsStarted](self, "totalAutoAssetJobsStarted"),  @"totalAutoAssetJobsStarted");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics totalAutoJobsFinished](self, "totalAutoJobsFinished"),  @"totalAutoJobsFinished");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics totalStagerDetermineJobsStarted](self, "totalStagerDetermineJobsStarted"),  @"totalStagerDetermineJobsStarted");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics totalStagerDetermineJobsFinished](self, "totalStagerDetermineJobsFinished"),  @"totalStagerDetermineJobsFinished");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics totalStagerDownloadJobsStarted](self, "totalStagerDownloadJobsStarted"),  @"totalStagerDownloadJobsStarted");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics totalStagerDownloadJobsFinished](self, "totalStagerDownloadJobsFinished"),  @"totalStagerDownloadJobsFinished");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics totalResumedInFlightJobs](self, "totalResumedInFlightJobs"),  @"totalResumedInFlightJobs");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics totalSchedulerTriggeredJobs](self, "totalSchedulerTriggeredJobs"),  @"totalSchedulerTriggeredJobs");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics totalFailuresToStartJobs](self, "totalFailuresToStartJobs"),  @"totalFailuresToStartJobs");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded"));
  [v15 encodeObject:v9 forKey:@"previouslyDownloaded"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded"));
  [v15 encodeObject:v10 forKey:@"totalDownloaded"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalStaged](self, "totalStaged"));
  [v15 encodeObject:v11 forKey:@"totalStaged"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged"));
  [v15 encodeObject:v12 forKey:@"totalUnstaged"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalPromoted](self, "totalPromoted"));
  [v15 encodeObject:v13 forKey:@"totalPromoted"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalRemoved](self, "totalRemoved"));
  [v15 encodeObject:v14 forKey:@"totalRemoved"];

  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics finishedJobSchedulerNetworkFailure](self, "finishedJobSchedulerNetworkFailure"),  @"finishedJobSchedulerNetworkFailure");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics finishedJobSchedulerNotNetworkRelated]( self,  "finishedJobSchedulerNotNetworkRelated"),  @"finishedJobSchedulerNotNetworkRelated");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics finishedJobClientNetworkFailure](self, "finishedJobClientNetworkFailure"),  @"finishedJobClientNetworkFailure");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics finishedJobClientNotNetworkRelated](self, "finishedJobClientNotNetworkRelated"),  @"finishedJobClientNotNetworkRelated");
  objc_msgSend( v15,  "encodeBool:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionPerformed](self, "garbageCollectionPerformed"),  @"garbageCollectionPerformed");
  objc_msgSend( v15,  "encodeBool:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimSpace](self, "garbageCollectionReclaimSpace"),  @"garbageCollectionReclaimSpace");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionTotalReclaimedSpace](self, "garbageCollectionTotalReclaimedSpace"),  @"garbageCollectionTotalReclaimedSpace");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedV2AssetCount]( self,  "garbageCollectionReclaimedV2AssetCount"),  @"garbageCollectionReclaimedV2AssetCount");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedV2AssetSpace]( self,  "garbageCollectionReclaimedV2AssetSpace"),  @"garbageCollectionReclaimedV2AssetSpace");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedUnlockedCount]( self,  "garbageCollectionReclaimedUnlockedCount"),  @"garbageCollectionReclaimedUnlockedCount");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedUnlockedSpace]( self,  "garbageCollectionReclaimedUnlockedSpace"),  @"garbageCollectionReclaimedUnlockedSpace");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableCount]( self,  "garbageCollectionReclaimedLockedOverridableCount"),  @"garbageCollectionReclaimedLockedOverridableCount");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableSpace]( self,  "garbageCollectionReclaimedLockedOverridableSpace"),  @"garbageCollectionReclaimedLockedOverridableSpace");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveCount]( self,  "garbageCollectionReclaimedLockedNeverRemoveCount"),  @"garbageCollectionReclaimedLockedNeverRemoveCount");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveSpace]( self,  "garbageCollectionReclaimedLockedNeverRemoveSpace"),  @"garbageCollectionReclaimedLockedNeverRemoveSpace");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedStagedCount]( self,  "garbageCollectionReclaimedStagedCount"),  @"garbageCollectionReclaimedStagedCount");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedStagedSpace]( self,  "garbageCollectionReclaimedStagedSpace"),  @"garbageCollectionReclaimedStagedSpace");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedCount]( self,  "garbageCollectionReclaimedMetadataBlockedCount"),  @"garbageCollectionReclaimedMetadataBlockedCount");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedSpace]( self,  "garbageCollectionReclaimedMetadataBlockedSpace"),  @"garbageCollectionReclaimedMetadataBlockedSpace");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetControlStatistics);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v5 = [v4 copy];
  -[MANAutoAssetControlStatistics setTotalClientRequests:](v3, "setTotalClientRequests:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v7 = [v6 copy];
  -[MANAutoAssetControlStatistics setTotalClientRepliesSuccess:](v3, "setTotalClientRepliesSuccess:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v9 = [v8 copy];
  -[MANAutoAssetControlStatistics setTotalClientRepliesFailure:](v3, "setTotalClientRepliesFailure:", v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v11 = [v10 copy];
  -[MANAutoAssetControlStatistics setTotalQueuedClientRequests:](v3, "setTotalQueuedClientRequests:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  id v13 = [v12 copy];
  -[MANAutoAssetControlStatistics setTotalDequeuedClientRequests:](v3, "setTotalDequeuedClientRequests:", v13);

  -[MANAutoAssetControlStatistics setTotalAutoAssetJobsStarted:]( v3,  "setTotalAutoAssetJobsStarted:",  -[MANAutoAssetControlStatistics totalAutoAssetJobsStarted](self, "totalAutoAssetJobsStarted"));
  -[MANAutoAssetControlStatistics setTotalAutoJobsFinished:]( v3,  "setTotalAutoJobsFinished:",  -[MANAutoAssetControlStatistics totalAutoJobsFinished](self, "totalAutoJobsFinished"));
  -[MANAutoAssetControlStatistics setTotalStagerDetermineJobsStarted:]( v3,  "setTotalStagerDetermineJobsStarted:",  -[MANAutoAssetControlStatistics totalStagerDetermineJobsStarted](self, "totalStagerDetermineJobsStarted"));
  -[MANAutoAssetControlStatistics setTotalStagerDetermineJobsFinished:]( v3,  "setTotalStagerDetermineJobsFinished:",  -[MANAutoAssetControlStatistics totalStagerDetermineJobsFinished](self, "totalStagerDetermineJobsFinished"));
  -[MANAutoAssetControlStatistics setTotalStagerDownloadJobsStarted:]( v3,  "setTotalStagerDownloadJobsStarted:",  -[MANAutoAssetControlStatistics totalStagerDownloadJobsStarted](self, "totalStagerDownloadJobsStarted"));
  -[MANAutoAssetControlStatistics setTotalStagerDownloadJobsFinished:]( v3,  "setTotalStagerDownloadJobsFinished:",  -[MANAutoAssetControlStatistics totalStagerDownloadJobsFinished](self, "totalStagerDownloadJobsFinished"));
  -[MANAutoAssetControlStatistics setTotalResumedInFlightJobs:]( v3,  "setTotalResumedInFlightJobs:",  -[MANAutoAssetControlStatistics totalResumedInFlightJobs](self, "totalResumedInFlightJobs"));
  -[MANAutoAssetControlStatistics setTotalSchedulerTriggeredJobs:]( v3,  "setTotalSchedulerTriggeredJobs:",  -[MANAutoAssetControlStatistics totalSchedulerTriggeredJobs](self, "totalSchedulerTriggeredJobs"));
  -[MANAutoAssetControlStatistics setTotalFailuresToStartJobs:]( v3,  "setTotalFailuresToStartJobs:",  -[MANAutoAssetControlStatistics totalFailuresToStartJobs](self, "totalFailuresToStartJobs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded"));
  id v15 = [v14 copy];
  -[MANAutoAssetControlStatistics setPreviouslyDownloaded:](v3, "setPreviouslyDownloaded:", v15);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded"));
  id v17 = [v16 copy];
  -[MANAutoAssetControlStatistics setTotalDownloaded:](v3, "setTotalDownloaded:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalStaged](self, "totalStaged"));
  id v19 = [v18 copy];
  -[MANAutoAssetControlStatistics setTotalStaged:](v3, "setTotalStaged:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged"));
  id v21 = [v20 copy];
  -[MANAutoAssetControlStatistics setTotalUnstaged:](v3, "setTotalUnstaged:", v21);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalPromoted](self, "totalPromoted"));
  id v23 = [v22 copy];
  -[MANAutoAssetControlStatistics setTotalPromoted:](v3, "setTotalPromoted:", v23);

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalRemoved](self, "totalRemoved"));
  id v25 = [v24 copy];
  -[MANAutoAssetControlStatistics setTotalRemoved:](v3, "setTotalRemoved:", v25);

  -[MANAutoAssetControlStatistics setFinishedJobSchedulerNetworkFailure:]( v3,  "setFinishedJobSchedulerNetworkFailure:",  -[MANAutoAssetControlStatistics finishedJobSchedulerNetworkFailure](self, "finishedJobSchedulerNetworkFailure"));
  -[MANAutoAssetControlStatistics setFinishedJobSchedulerNotNetworkRelated:]( v3,  "setFinishedJobSchedulerNotNetworkRelated:",  -[MANAutoAssetControlStatistics finishedJobSchedulerNotNetworkRelated]( self,  "finishedJobSchedulerNotNetworkRelated"));
  -[MANAutoAssetControlStatistics setFinishedJobClientNetworkFailure:]( v3,  "setFinishedJobClientNetworkFailure:",  -[MANAutoAssetControlStatistics finishedJobClientNetworkFailure](self, "finishedJobClientNetworkFailure"));
  -[MANAutoAssetControlStatistics setFinishedJobClientNotNetworkRelated:]( v3,  "setFinishedJobClientNotNetworkRelated:",  -[MANAutoAssetControlStatistics finishedJobClientNotNetworkRelated](self, "finishedJobClientNotNetworkRelated"));
  -[MANAutoAssetControlStatistics setGarbageCollectionPerformed:]( v3,  "setGarbageCollectionPerformed:",  -[MANAutoAssetControlStatistics garbageCollectionPerformed](self, "garbageCollectionPerformed"));
  -[MANAutoAssetControlStatistics setGarbageCollectionReclaimSpace:]( v3,  "setGarbageCollectionReclaimSpace:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimSpace](self, "garbageCollectionReclaimSpace"));
  -[MANAutoAssetControlStatistics setGarbageCollectionTotalReclaimedSpace:]( v3,  "setGarbageCollectionTotalReclaimedSpace:",  -[MANAutoAssetControlStatistics garbageCollectionTotalReclaimedSpace](self, "garbageCollectionTotalReclaimedSpace"));
  -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedV2AssetCount:]( v3,  "setGarbageCollectionReclaimedV2AssetCount:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedV2AssetCount]( self,  "garbageCollectionReclaimedV2AssetCount"));
  -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedV2AssetSpace:]( v3,  "setGarbageCollectionReclaimedV2AssetSpace:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedV2AssetSpace]( self,  "garbageCollectionReclaimedV2AssetSpace"));
  -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedUnlockedCount:]( v3,  "setGarbageCollectionReclaimedUnlockedCount:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedUnlockedCount]( self,  "garbageCollectionReclaimedUnlockedCount"));
  -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedUnlockedSpace:]( v3,  "setGarbageCollectionReclaimedUnlockedSpace:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedUnlockedSpace]( self,  "garbageCollectionReclaimedUnlockedSpace"));
  -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedLockedOverridableCount:]( v3,  "setGarbageCollectionReclaimedLockedOverridableCount:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableCount]( self,  "garbageCollectionReclaimedLockedOverridableCount"));
  -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedLockedOverridableSpace:]( v3,  "setGarbageCollectionReclaimedLockedOverridableSpace:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableSpace]( self,  "garbageCollectionReclaimedLockedOverridableSpace"));
  -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedLockedNeverRemoveCount:]( v3,  "setGarbageCollectionReclaimedLockedNeverRemoveCount:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveCount]( self,  "garbageCollectionReclaimedLockedNeverRemoveCount"));
  -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedLockedNeverRemoveSpace:]( v3,  "setGarbageCollectionReclaimedLockedNeverRemoveSpace:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveSpace]( self,  "garbageCollectionReclaimedLockedNeverRemoveSpace"));
  -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedStagedCount:]( v3,  "setGarbageCollectionReclaimedStagedCount:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedStagedCount]( self,  "garbageCollectionReclaimedStagedCount"));
  -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedStagedSpace:]( v3,  "setGarbageCollectionReclaimedStagedSpace:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedStagedSpace]( self,  "garbageCollectionReclaimedStagedSpace"));
  -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedMetadataBlockedCount:]( v3,  "setGarbageCollectionReclaimedMetadataBlockedCount:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedCount]( self,  "garbageCollectionReclaimedMetadataBlockedCount"));
  -[MANAutoAssetControlStatistics setGarbageCollectionReclaimedMetadataBlockedSpace:]( v3,  "setGarbageCollectionReclaimedMetadataBlockedSpace:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedSpace]( self,  "garbageCollectionReclaimedMetadataBlockedSpace"));
  return v3;
}

+ (id)allocStringForBytes:(int64_t)a3
{
  if (!a3) {
    return @"0 bytes";
  }
  id v4 = &stru_355768;
  if (a3 >= 0)
  {
    int64_t v5 = a3;
  }

  else
  {
    id v4 = @"NEGATIVE ";
    int64_t v5 = a3 + 0x3FFFFFFF;
  }

  id v6 = v4;
  int64_t v7 = a3 - (v5 & 0xFFFFFFFFC0000000LL);
  else {
    int64_t v8 = v7 + 0xFFFFF;
  }
  uint64_t v9 = v7 - (v8 & 0xFFFFFFFFFFF00000LL);
  else {
    uint64_t v10 = v9 + 1023;
  }
  uint64_t v11 = v9 - (v10 & 0xFFFFFFFFFFFFFC00LL);
  if (v11 == 1)
  {
    id v12 = @" 1 byte";
  }

  else if (v11 < 2)
  {
    id v12 = &stru_355768;
  }

  else
  {
    id v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @" %lld bytes",  v9 - (v10 & 0xFFFFFFFFFFFFFC00LL));
  }

  uint64_t v14 = v8 >> 20;
  if (a3 < 0x40000000)
  {
    if (v7 < 0x100000)
    {
      uint64_t v16 = objc_alloc(&OBJC_CLASS___NSString);
      if (v9 < 1024) {
        id v15 = -[NSString initWithFormat:](v16, "initWithFormat:", @"%@%lld bytes", v6, a3, v18, v19, v20);
      }
      else {
        id v15 = -[NSString initWithFormat:](v16, "initWithFormat:", @"%@%lldKB%@", v6, v10 >> 10, v12, v19, v20);
      }
    }

    else
    {
      id v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@%lldMB %lldKB%@",  v6,  v14,  v10 >> 10,  v12,  v20);
    }
  }

  else
  {
    id v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@%lldGB %lldMB %lldKB%@",  v6,  v5 >> 30,  v14,  v10 >> 10,  v12);
  }

  id v13 = v15;

  return v13;
}

- (id)description
{
  v160 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v132 = [v160 interestInContent];
  v159 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v130 = [v159 checkForNewer];
  v158 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v128 = [v158 determineIfAvailable];
  v157 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v126 = [v157 currentStatus];
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v124 = [v156 lockContent];
  v155 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v123 = [v155 continueLockUsage];
  v154 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v121 = [v154 endLockUsage];
  v153 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v119 = [v153 endPreviousLocks];
  v152 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v117 = [v152 endAllPreviousLocks];
  v151 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v115 = [v151 stageDetermineAllAvailable];
  v150 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v114 = [v150 stageDownloadAll];
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v112 = [v149 stagePurgeAll];
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v110 = [v148 stageEraseAll];
  v147 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v108 = [v147 interestInContent];
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v107 = [v146 checkForNewer];
  v145 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v105 = [v145 determineIfAvailable];
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v103 = [v144 currentStatus];
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v101 = [v143 lockContent];
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v99 = [v142 continueLockUsage];
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v98 = [v141 endLockUsage];
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v96 = [v140 endPreviousLocks];
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v94 = [v139 endAllPreviousLocks];
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v92 = [v138 stageDetermineAllAvailable];
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v90 = [v137 stageDownloadAll];
  v136 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v89 = [v136 stagePurgeAll];
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v87 = [v135 stageEraseAll];
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v85 = [v134 interestInContent];
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v83 = [v133 checkForNewer];
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v82 = [v131 determineIfAvailable];
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v80 = [v129 currentStatus];
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v74 = [v127 lockContent];
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v72 = [v125 continueLockUsage];
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v70 = [v122 endLockUsage];
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v69 = [v120 endPreviousLocks];
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v67 = [v118 endAllPreviousLocks];
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v65 = [v116 stageDetermineAllAvailable];
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v63 = [v113 stageDownloadAll];
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v62 = [v111 stagePurgeAll];
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v60 = [v109 stageEraseAll];
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v58 = [v106 interestInContent];
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v56 = [v104 checkForNewer];
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v55 = [v102 determineIfAvailable];
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v53 = [v100 currentStatus];
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v52 = [v97 lockContent];
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v51 = [v95 continueLockUsage];
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v50 = [v93 endLockUsage];
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v49 = [v91 endPreviousLocks];
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v47 = [v88 endAllPreviousLocks];
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v46 = [v86 stageDetermineAllAvailable];
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v44 = [v84 stageDownloadAll];
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v42 = [v81 stagePurgeAll];
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v40 = [v79 stageEraseAll];
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  id v39 = [v78 interestInContent];
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  id v37 = [v77 checkForNewer];
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  id v35 = [v76 determineIfAvailable];
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  id v34 = [v75 currentStatus];
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  id v32 = [v73 lockContent];
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  id v30 = [v71 continueLockUsage];
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  id v28 = [v68 endLockUsage];
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  id v27 = [v66 endPreviousLocks];
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  [v64 endAllPreviousLocks];
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  [v61 stageDetermineAllAvailable];
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  [v59 stageDownloadAll];
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  [v57 stagePurgeAll];
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  [v54 stageEraseAll];
  -[MANAutoAssetControlStatistics totalAutoAssetJobsStarted](self, "totalAutoAssetJobsStarted");
  -[MANAutoAssetControlStatistics totalAutoJobsFinished](self, "totalAutoJobsFinished");
  -[MANAutoAssetControlStatistics totalStagerDetermineJobsStarted](self, "totalStagerDetermineJobsStarted");
  -[MANAutoAssetControlStatistics totalStagerDetermineJobsFinished](self, "totalStagerDetermineJobsFinished");
  -[MANAutoAssetControlStatistics totalStagerDownloadJobsStarted](self, "totalStagerDownloadJobsStarted");
  -[MANAutoAssetControlStatistics totalStagerDownloadJobsFinished](self, "totalStagerDownloadJobsFinished");
  -[MANAutoAssetControlStatistics totalResumedInFlightJobs](self, "totalResumedInFlightJobs");
  -[MANAutoAssetControlStatistics totalSchedulerTriggeredJobs](self, "totalSchedulerTriggeredJobs");
  -[MANAutoAssetControlStatistics totalFailuresToStartJobs](self, "totalFailuresToStartJobs");
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded"));
  [v48 patchedAssets];
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded"));
  [v45 patchedBytes];
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded"));
  [v43 fullAssets];
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded"));
  [v41 fullBytes];
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded"));
  [v38 patchedAssets];
  id v36 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded"));
  [v36 patchedBytes];
  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded"));
  [v33 fullAssets];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded"));
  [v31 fullBytes];
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalStaged](self, "totalStaged"));
  [v29 patchedAssets];
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalStaged](self, "totalStaged"));
  [v26 patchedBytes];
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalStaged](self, "totalStaged"));
  [v25 fullAssets];
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalStaged](self, "totalStaged"));
  [v24 fullBytes];
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged"));
  [v23 patchedAssets];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged"));
  [v22 patchedBytes];
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged"));
  [v21 fullAssets];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged"));
  [v20 fullBytes];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalPromoted](self, "totalPromoted"));
  [v19 patchedAssets];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalPromoted](self, "totalPromoted"));
  [v18 patchedBytes];
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalPromoted](self, "totalPromoted"));
  [v17 fullAssets];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalPromoted](self, "totalPromoted"));
  [v16 fullBytes];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalRemoved](self, "totalRemoved"));
  [v15 patchedAssets];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalRemoved](self, "totalRemoved"));
  [v14 patchedBytes];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalRemoved](self, "totalRemoved"));
  [v13 fullAssets];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalRemoved](self, "totalRemoved"));
  [v12 fullBytes];
  -[MANAutoAssetControlStatistics finishedJobSchedulerNetworkFailure](self, "finishedJobSchedulerNetworkFailure");
  -[MANAutoAssetControlStatistics finishedJobSchedulerNotNetworkRelated](self, "finishedJobSchedulerNotNetworkRelated");
  -[MANAutoAssetControlStatistics finishedJobClientNetworkFailure](self, "finishedJobClientNetworkFailure");
  -[MANAutoAssetControlStatistics finishedJobClientNotNetworkRelated](self, "finishedJobClientNotNetworkRelated");
  -[MANAutoAssetControlStatistics garbageCollectionPerformed](self, "garbageCollectionPerformed");
  -[MANAutoAssetControlStatistics garbageCollectionReclaimSpace](self, "garbageCollectionReclaimSpace");
  id v11 = +[MANAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MANAutoAssetControlStatistics,  "allocStringForBytes:",  -[MANAutoAssetControlStatistics garbageCollectionTotalReclaimedSpace]( self,  "garbageCollectionTotalReclaimedSpace"));
  -[MANAutoAssetControlStatistics garbageCollectionReclaimedV2AssetCount]( self,  "garbageCollectionReclaimedV2AssetCount");
  id v10 = +[MANAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MANAutoAssetControlStatistics,  "allocStringForBytes:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedV2AssetSpace]( self,  "garbageCollectionReclaimedV2AssetSpace"));
  -[MANAutoAssetControlStatistics garbageCollectionReclaimedUnlockedCount]( self,  "garbageCollectionReclaimedUnlockedCount");
  id v9 = +[MANAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MANAutoAssetControlStatistics,  "allocStringForBytes:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedUnlockedSpace]( self,  "garbageCollectionReclaimedUnlockedSpace"));
  -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableCount]( self,  "garbageCollectionReclaimedLockedOverridableCount");
  id v8 = +[MANAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MANAutoAssetControlStatistics,  "allocStringForBytes:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableSpace]( self,  "garbageCollectionReclaimedLockedOverridableSpace"));
  -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveCount]( self,  "garbageCollectionReclaimedLockedNeverRemoveCount");
  id v3 = +[MANAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MANAutoAssetControlStatistics,  "allocStringForBytes:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveSpace]( self,  "garbageCollectionReclaimedLockedNeverRemoveSpace"));
  -[MANAutoAssetControlStatistics garbageCollectionReclaimedStagedCount](self, "garbageCollectionReclaimedStagedCount");
  id v4 = +[MANAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MANAutoAssetControlStatistics,  "allocStringForBytes:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedStagedSpace]( self,  "garbageCollectionReclaimedStagedSpace"));
  -[MANAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedCount]( self,  "garbageCollectionReclaimedMetadataBlockedCount");
  id v7 = +[MANAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MANAutoAssetControlStatistics,  "allocStringForBytes:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedSpace]( self,  "garbageCollectionReclaimedMetadataBlockedSpace"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  &cfstr_CategoryStatis,  v132,  v130,  v128,  v126,  v124,  v123,  v121,  v119,  v117,  v115,  v114,  v112,  v110,  v108,  v107,  v105,  v103,  v101,  v99,  v98,  v96,  v94,  v92,  v90,  v89,  v87,  v85,  v83,  v82,  v80,  v74,  v72,  v70,  v69,  v67,  v65,  v63,  v62,  v60,  v58,  v56,  v55,  v53,  v52,  v51,
                   v50,
                   v49,
                   v47,
                   v46,
                   v44,
                   v42,
                   v40,
                   v39,
                   v37,
                   v35,
                   v34,
                   v32,
                   v30,
                   v28,
                   v27));

  return v5;
}

- (id)summary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests"));
  id v105 = [v3 total];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess"));
  id v104 = [v4 total];

  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure"));
  id v103 = [v5 total];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests"));
  id v102 = [v6 total];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests"));
  id v101 = [v7 total];

  int64_t v97 = -[MANAutoAssetControlStatistics totalAutoAssetJobsStarted](self, "totalAutoAssetJobsStarted");
  int64_t v96 = -[MANAutoAssetControlStatistics totalStagerDetermineJobsStarted](self, "totalStagerDetermineJobsStarted");
  int64_t v95 = -[MANAutoAssetControlStatistics totalStagerDownloadJobsStarted](self, "totalStagerDownloadJobsStarted");
  int64_t v94 = -[MANAutoAssetControlStatistics totalAutoJobsFinished](self, "totalAutoJobsFinished");
  int64_t v93 = -[MANAutoAssetControlStatistics totalStagerDetermineJobsFinished](self, "totalStagerDetermineJobsFinished");
  int64_t v92 = -[MANAutoAssetControlStatistics totalStagerDownloadJobsFinished](self, "totalStagerDownloadJobsFinished");
  int64_t v100 = -[MANAutoAssetControlStatistics totalResumedInFlightJobs](self, "totalResumedInFlightJobs");
  int64_t v99 = -[MANAutoAssetControlStatistics totalSchedulerTriggeredJobs](self, "totalSchedulerTriggeredJobs");
  int64_t v98 = -[MANAutoAssetControlStatistics totalFailuresToStartJobs](self, "totalFailuresToStartJobs");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded"));
  v91 = (char *)[v8 patchedAssets];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded"));
  id v90 = [v9 fullAssets];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded"));
  id v89 = (char *)[v10 patchedBytes];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded"));
  id v88 = [v11 fullBytes];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded"));
  id v87 = (char *)[v12 patchedAssets];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded"));
  id v86 = [v13 fullAssets];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded"));
  id v85 = (char *)[v14 patchedBytes];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded"));
  id v84 = [v15 fullBytes];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalStaged](self, "totalStaged"));
  id v17 = (char *)[v16 patchedAssets];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalStaged](self, "totalStaged"));
  id v83 = [v18 fullAssets];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalStaged](self, "totalStaged"));
  id v82 = (char *)[v19 patchedBytes];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalStaged](self, "totalStaged"));
  id v81 = [v20 fullBytes];

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged"));
  id v80 = (char *)[v21 patchedAssets];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged"));
  id v79 = [v22 fullAssets];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged"));
  id v24 = (char *)[v23 patchedBytes];
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged"));
  id v78 = [v25 fullBytes];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalPromoted](self, "totalPromoted"));
  id v27 = (char *)[v26 patchedAssets];
  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalPromoted](self, "totalPromoted"));
  id v76 = [v28 fullAssets];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalPromoted](self, "totalPromoted"));
  id v30 = (char *)[v29 patchedBytes];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalPromoted](self, "totalPromoted"));
  id v74 = [v31 fullBytes];

  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalRemoved](self, "totalRemoved"));
  v73 = (char *)[v32 patchedAssets];
  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalRemoved](self, "totalRemoved"));
  id v72 = [v33 fullAssets];

  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalRemoved](self, "totalRemoved"));
  id v35 = (char *)[v34 patchedBytes];
  id v36 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetControlStatistics totalRemoved](self, "totalRemoved"));
  id v71 = [v36 fullBytes];

  v75 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"|jobFinished schedNWFail:%lld,schedOther:%lld,clientNWFail:%lld,clientOther:%lld",  -[MANAutoAssetControlStatistics finishedJobSchedulerNetworkFailure]( self,  "finishedJobSchedulerNetworkFailure"),  -[MANAutoAssetControlStatistics finishedJobSchedulerNotNetworkRelated]( self,  "finishedJobSchedulerNotNetworkRelated"),  -[MANAutoAssetControlStatistics finishedJobClientNetworkFailure](self, "finishedJobClientNetworkFailure"),  -[MANAutoAssetControlStatistics finishedJobClientNotNetworkRelated]( self,  "finishedJobClientNotNetworkRelated"));
  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  if (-[MANAutoAssetControlStatistics garbageCollectionPerformed](self, "garbageCollectionPerformed"))
  {
    id v69 = objc_alloc(&OBJC_CLASS___NSString);
    unsigned int v38 = -[MANAutoAssetControlStatistics garbageCollectionReclaimSpace](self, "garbageCollectionReclaimSpace");
    id v39 = @"garbageDetermined";
    if (v38) {
      id v39 = @"garbageReclaimed";
    }
    v66 = v39;
    int64_t v65 = -[MANAutoAssetControlStatistics garbageCollectionReclaimedV2AssetCount]( self,  "garbageCollectionReclaimedV2AssetCount");
    id v64 = +[MANAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MANAutoAssetControlStatistics,  "allocStringForBytes:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedV2AssetSpace]( self,  "garbageCollectionReclaimedV2AssetSpace"));
    int64_t v63 = -[MANAutoAssetControlStatistics garbageCollectionReclaimedUnlockedCount]( self,  "garbageCollectionReclaimedUnlockedCount");
    id v62 = +[MANAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MANAutoAssetControlStatistics,  "allocStringForBytes:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedUnlockedSpace]( self,  "garbageCollectionReclaimedUnlockedSpace"));
    int64_t v61 = -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableCount]( self,  "garbageCollectionReclaimedLockedOverridableCount");
    v68 = v24;
    id v60 = +[MANAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MANAutoAssetControlStatistics,  "allocStringForBytes:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableSpace]( self,  "garbageCollectionReclaimedLockedOverridableSpace"));
    int64_t v59 = -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveCount]( self,  "garbageCollectionReclaimedLockedNeverRemoveCount");
    id v40 = +[MANAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MANAutoAssetControlStatistics,  "allocStringForBytes:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveSpace]( self,  "garbageCollectionReclaimedLockedNeverRemoveSpace"));
    v41 = v27;
    id v42 = v17;
    int64_t v43 = -[MANAutoAssetControlStatistics garbageCollectionReclaimedStagedCount]( self,  "garbageCollectionReclaimedStagedCount");
    id v44 = +[MANAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MANAutoAssetControlStatistics,  "allocStringForBytes:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedStagedSpace]( self,  "garbageCollectionReclaimedStagedSpace"));
    int64_t v45 = -[MANAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedCount]( self,  "garbageCollectionReclaimedMetadataBlockedCount");
    id v67 = v35;
    id v46 = +[MANAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MANAutoAssetControlStatistics,  "allocStringForBytes:",  -[MANAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedSpace]( self,  "garbageCollectionReclaimedMetadataBlockedSpace"));
    id v47 = v30;
    id v48 = +[MANAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MANAutoAssetControlStatistics,  "allocStringForBytes:",  -[MANAutoAssetControlStatistics garbageCollectionTotalReclaimedSpace]( self,  "garbageCollectionTotalReclaimedSpace"));
    int64_t v58 = v43;
    id v17 = v42;
    id v27 = v41;
    id v70 = -[NSString initWithFormat:]( v69,  "initWithFormat:",  @"|%@ v2Assets:%ld(%@),unlocked:%ld(%@),lockedOverridable:%ld(%@),lockedNeverRemove:%ld(%@),staged:%ld(%@),metadataBlocked:%ld(%@),totalSpace:%@",  v66,  v65,  v64,  v63,  v62,  v61,  v60,  v59,  v40,  v58,  v44,  v45,  v46,  v48);

    id v30 = v47;
    id v35 = v67;

    p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
    id v24 = v68;
  }

  else
  {
    id v70 = &stru_355768;
  }

  v77 = &v27[(void)v76];
  id v49 = p_ivars;
  id v50 = -[__objc2_ivar_list allocStringForBytes:](p_ivars[164], "allocStringForBytes:", &v89[(void)v88]);
  id v51 = -[__objc2_ivar_list allocStringForBytes:](v49[164], "allocStringForBytes:", &v85[(void)v84]);
  id v52 = -[__objc2_ivar_list allocStringForBytes:](v49[164], "allocStringForBytes:", &v82[(void)v81]);
  id v53 = -[__objc2_ivar_list allocStringForBytes:](v49[164], "allocStringForBytes:", &v24[(void)v78]);
  id v54 = -[__objc2_ivar_list allocStringForBytes:](v49[164], "allocStringForBytes:", &v30[(void)v74]);
  id v55 = -[__objc2_ivar_list allocStringForBytes:](v49[164], "allocStringForBytes:", &v35[(void)v71]);
  id v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[totalClient requests:%lld,success:%lld,failure:%lld,queued:%lld,dequeued:%lld|totalJobs started:%lld,finished:%lld|totalInFlight:%lld|totalScheduler:%lld|totalFailuresToStart:%lld|previouslyDownloaded assets:%lld(%@)|totalDownloaded assets:%lld(%@)|totalStaged assets:%lld(%@)|totalUnstaged assets:%lld(%@)|totalPromoted assets:%lld(%@)|totalRemoved assets:%lld(%@)%@%@]",  v105,  v104,  v103,  v102,  v101,  v96 + v97 + v95,  v93 + v94 + v92,  v100,  v99,  v98,  &v91[(void)v90],  v50,  &v87[(void)v86],  v51,  &v17[(void)v83],  v52,  &v80[(void)v79],  v53,  v77,  v54,  &v73[(void)v72],  v55,  v75,  v70));

  return v56;
}

- (void)setTotalClientRequests:(id)a3
{
}

- (void)setTotalClientRepliesSuccess:(id)a3
{
}

- (MANAutoAssetControlStatisticsByCommand)totalClientRepliesFailure
{
  return self->_totalClientRepliesFailure;
}

- (void)setTotalClientRepliesFailure:(id)a3
{
}

- (MANAutoAssetControlStatisticsByCommand)totalQueuedClientRequests
{
  return self->_totalQueuedClientRequests;
}

- (void)setTotalQueuedClientRequests:(id)a3
{
}

- (MANAutoAssetControlStatisticsByCommand)totalDequeuedClientRequests
{
  return self->_totalDequeuedClientRequests;
}

- (void)setTotalDequeuedClientRequests:(id)a3
{
}

- (int64_t)totalAutoAssetJobsStarted
{
  return self->_totalAutoAssetJobsStarted;
}

- (void)setTotalAutoAssetJobsStarted:(int64_t)a3
{
  self->_totalAutoAssetJobsStarted = a3;
}

- (int64_t)totalAutoJobsFinished
{
  return self->_totalAutoJobsFinished;
}

- (void)setTotalAutoJobsFinished:(int64_t)a3
{
  self->_totalAutoJobsFinished = a3;
}

- (int64_t)totalStagerDetermineJobsStarted
{
  return self->_totalStagerDetermineJobsStarted;
}

- (void)setTotalStagerDetermineJobsStarted:(int64_t)a3
{
  self->_totalStagerDetermineJobsStarted = a3;
}

- (int64_t)totalStagerDetermineJobsFinished
{
  return self->_totalStagerDetermineJobsFinished;
}

- (void)setTotalStagerDetermineJobsFinished:(int64_t)a3
{
  self->_totalStagerDetermineJobsFinished = a3;
}

- (int64_t)totalStagerDownloadJobsStarted
{
  return self->_totalStagerDownloadJobsStarted;
}

- (void)setTotalStagerDownloadJobsStarted:(int64_t)a3
{
  self->_totalStagerDownloadJobsStarted = a3;
}

- (int64_t)totalStagerDownloadJobsFinished
{
  return self->_totalStagerDownloadJobsFinished;
}

- (void)setTotalStagerDownloadJobsFinished:(int64_t)a3
{
  self->_totalStagerDownloadJobsFinished = a3;
}

- (int64_t)totalResumedInFlightJobs
{
  return self->_totalResumedInFlightJobs;
}

- (void)setTotalResumedInFlightJobs:(int64_t)a3
{
  self->_totalResumedInFlightJobs = a3;
}

- (int64_t)totalSchedulerTriggeredJobs
{
  return self->_totalSchedulerTriggeredJobs;
}

- (void)setTotalSchedulerTriggeredJobs:(int64_t)a3
{
  self->_totalSchedulerTriggeredJobs = a3;
}

- (int64_t)totalFailuresToStartJobs
{
  return self->_totalFailuresToStartJobs;
}

- (void)setTotalFailuresToStartJobs:(int64_t)a3
{
  self->_totalFailuresToStartJobs = a3;
}

- (MANAutoAssetControlStatisticsBySize)previouslyDownloaded
{
  return self->_previouslyDownloaded;
}

- (void)setPreviouslyDownloaded:(id)a3
{
}

- (MANAutoAssetControlStatisticsBySize)totalDownloaded
{
  return self->_totalDownloaded;
}

- (void)setTotalDownloaded:(id)a3
{
}

- (MANAutoAssetControlStatisticsBySize)totalStaged
{
  return self->_totalStaged;
}

- (void)setTotalStaged:(id)a3
{
}

- (MANAutoAssetControlStatisticsBySize)totalUnstaged
{
  return self->_totalUnstaged;
}

- (void)setTotalUnstaged:(id)a3
{
}

- (MANAutoAssetControlStatisticsBySize)totalPromoted
{
  return self->_totalPromoted;
}

- (void)setTotalPromoted:(id)a3
{
}

- (MANAutoAssetControlStatisticsBySize)totalRemoved
{
  return self->_totalRemoved;
}

- (void)setTotalRemoved:(id)a3
{
}

- (int64_t)finishedJobSchedulerNetworkFailure
{
  return self->_finishedJobSchedulerNetworkFailure;
}

- (void)setFinishedJobSchedulerNetworkFailure:(int64_t)a3
{
  self->_finishedJobSchedulerNetworkFailure = a3;
}

- (int64_t)finishedJobSchedulerNotNetworkRelated
{
  return self->_finishedJobSchedulerNotNetworkRelated;
}

- (void)setFinishedJobSchedulerNotNetworkRelated:(int64_t)a3
{
  self->_finishedJobSchedulerNotNetworkRelated = a3;
}

- (int64_t)finishedJobClientNetworkFailure
{
  return self->_finishedJobClientNetworkFailure;
}

- (void)setFinishedJobClientNetworkFailure:(int64_t)a3
{
  self->_finishedJobClientNetworkFailure = a3;
}

- (int64_t)finishedJobClientNotNetworkRelated
{
  return self->_finishedJobClientNotNetworkRelated;
}

- (void)setFinishedJobClientNotNetworkRelated:(int64_t)a3
{
  self->_finishedJobClientNotNetworkRelated = a3;
}

- (BOOL)garbageCollectionPerformed
{
  return self->_garbageCollectionPerformed;
}

- (void)setGarbageCollectionPerformed:(BOOL)a3
{
  self->_garbageCollectionPerformed = a3;
}

- (BOOL)garbageCollectionReclaimSpace
{
  return self->_garbageCollectionReclaimSpace;
}

- (void)setGarbageCollectionReclaimSpace:(BOOL)a3
{
  self->_garbageCollectionReclaimSpace = a3;
}

- (int64_t)garbageCollectionTotalReclaimedSpace
{
  return self->_garbageCollectionTotalReclaimedSpace;
}

- (void)setGarbageCollectionTotalReclaimedSpace:(int64_t)a3
{
  self->_garbageCollectionTotalReclaimedSpace = a3;
}

- (int64_t)garbageCollectionReclaimedV2AssetCount
{
  return self->_garbageCollectionReclaimedV2AssetCount;
}

- (void)setGarbageCollectionReclaimedV2AssetCount:(int64_t)a3
{
  self->_garbageCollectionReclaimedV2AssetCount = a3;
}

- (int64_t)garbageCollectionReclaimedV2AssetSpace
{
  return self->_garbageCollectionReclaimedV2AssetSpace;
}

- (void)setGarbageCollectionReclaimedV2AssetSpace:(int64_t)a3
{
  self->_garbageCollectionReclaimedV2AssetSpace = a3;
}

- (int64_t)garbageCollectionReclaimedUnlockedCount
{
  return self->_garbageCollectionReclaimedUnlockedCount;
}

- (void)setGarbageCollectionReclaimedUnlockedCount:(int64_t)a3
{
  self->_garbageCollectionReclaimedUnlockedCount = a3;
}

- (int64_t)garbageCollectionReclaimedUnlockedSpace
{
  return self->_garbageCollectionReclaimedUnlockedSpace;
}

- (void)setGarbageCollectionReclaimedUnlockedSpace:(int64_t)a3
{
  self->_garbageCollectionReclaimedUnlockedSpace = a3;
}

- (int64_t)garbageCollectionReclaimedLockedOverridableCount
{
  return self->_garbageCollectionReclaimedLockedOverridableCount;
}

- (void)setGarbageCollectionReclaimedLockedOverridableCount:(int64_t)a3
{
  self->_garbageCollectionReclaimedLockedOverridableCount = a3;
}

- (int64_t)garbageCollectionReclaimedLockedOverridableSpace
{
  return self->_garbageCollectionReclaimedLockedOverridableSpace;
}

- (void)setGarbageCollectionReclaimedLockedOverridableSpace:(int64_t)a3
{
  self->_garbageCollectionReclaimedLockedOverridableSpace = a3;
}

- (int64_t)garbageCollectionReclaimedLockedNeverRemoveCount
{
  return self->_garbageCollectionReclaimedLockedNeverRemoveCount;
}

- (void)setGarbageCollectionReclaimedLockedNeverRemoveCount:(int64_t)a3
{
  self->_garbageCollectionReclaimedLockedNeverRemoveCount = a3;
}

- (int64_t)garbageCollectionReclaimedLockedNeverRemoveSpace
{
  return self->_garbageCollectionReclaimedLockedNeverRemoveSpace;
}

- (void)setGarbageCollectionReclaimedLockedNeverRemoveSpace:(int64_t)a3
{
  self->_garbageCollectionReclaimedLockedNeverRemoveSpace = a3;
}

- (int64_t)garbageCollectionReclaimedStagedCount
{
  return self->_garbageCollectionReclaimedStagedCount;
}

- (void)setGarbageCollectionReclaimedStagedCount:(int64_t)a3
{
  self->_garbageCollectionReclaimedStagedCount = a3;
}

- (int64_t)garbageCollectionReclaimedStagedSpace
{
  return self->_garbageCollectionReclaimedStagedSpace;
}

- (void)setGarbageCollectionReclaimedStagedSpace:(int64_t)a3
{
  self->_garbageCollectionReclaimedStagedSpace = a3;
}

- (int64_t)garbageCollectionReclaimedMetadataBlockedCount
{
  return self->_garbageCollectionReclaimedMetadataBlockedCount;
}

- (void)setGarbageCollectionReclaimedMetadataBlockedCount:(int64_t)a3
{
  self->_garbageCollectionReclaimedMetadataBlockedCount = a3;
}

- (int64_t)garbageCollectionReclaimedMetadataBlockedSpace
{
  return self->_garbageCollectionReclaimedMetadataBlockedSpace;
}

- (void)setGarbageCollectionReclaimedMetadataBlockedSpace:(int64_t)a3
{
  self->_garbageCollectionReclaimedMetadataBlockedSpace = a3;
}

- (void).cxx_destruct
{
}

@end