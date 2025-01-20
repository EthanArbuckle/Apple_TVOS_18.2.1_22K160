@interface MAAutoAssetControlStatistics
+ (BOOL)supportsSecureCoding;
+ (id)allocStringForBytes:(int64_t)a3;
- (BOOL)garbageCollectionPerformed;
- (BOOL)garbageCollectionReclaimSpace;
- (MAAutoAssetControlStatistics)init;
- (MAAutoAssetControlStatistics)initWithCoder:(id)a3;
- (MAAutoAssetControlStatistics)initWithInitialValue:(int64_t)a3;
- (MAAutoAssetControlStatisticsByCommand)totalClientRepliesFailure;
- (MAAutoAssetControlStatisticsByCommand)totalClientRepliesSuccess;
- (MAAutoAssetControlStatisticsByCommand)totalClientRequests;
- (MAAutoAssetControlStatisticsByCommand)totalDequeuedClientRequests;
- (MAAutoAssetControlStatisticsByCommand)totalQueuedClientRequests;
- (MAAutoAssetControlStatisticsBySize)previouslyDownloaded;
- (MAAutoAssetControlStatisticsBySize)totalDownloaded;
- (MAAutoAssetControlStatisticsBySize)totalPromoted;
- (MAAutoAssetControlStatisticsBySize)totalRemoved;
- (MAAutoAssetControlStatisticsBySize)totalStaged;
- (MAAutoAssetControlStatisticsBySize)totalUnstaged;
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

@implementation MAAutoAssetControlStatistics

- (MAAutoAssetControlStatistics)init
{
  return -[MAAutoAssetControlStatistics initWithInitialValue:](self, "initWithInitialValue:", 0LL);
}

- (MAAutoAssetControlStatistics)initWithInitialValue:(int64_t)a3
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MAAutoAssetControlStatistics;
  v4 = -[MAAutoAssetControlStatistics init](&v28, sel_init);
  if (v4)
  {
    v5 = -[MAAutoAssetControlStatisticsByCommand initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand),  "initWithInitialValue:",  a3);
    totalClientRequests = v4->_totalClientRequests;
    v4->_totalClientRequests = v5;

    v7 = -[MAAutoAssetControlStatisticsByCommand initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand),  "initWithInitialValue:",  a3);
    totalClientRepliesSuccess = v4->_totalClientRepliesSuccess;
    v4->_totalClientRepliesSuccess = v7;

    v9 = -[MAAutoAssetControlStatisticsByCommand initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand),  "initWithInitialValue:",  a3);
    totalClientRepliesFailure = v4->_totalClientRepliesFailure;
    v4->_totalClientRepliesFailure = v9;

    v11 = -[MAAutoAssetControlStatisticsByCommand initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand),  "initWithInitialValue:",  a3);
    totalQueuedClientRequests = v4->_totalQueuedClientRequests;
    v4->_totalQueuedClientRequests = v11;

    v13 = -[MAAutoAssetControlStatisticsByCommand initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand),  "initWithInitialValue:",  a3);
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
    v15 = -[MAAutoAssetControlStatisticsBySize initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize),  "initWithInitialValue:",  a3);
    previouslyDownloaded = v4->_previouslyDownloaded;
    v4->_previouslyDownloaded = v15;

    v17 = -[MAAutoAssetControlStatisticsBySize initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize),  "initWithInitialValue:",  a3);
    totalDownloaded = v4->_totalDownloaded;
    v4->_totalDownloaded = v17;

    v19 = -[MAAutoAssetControlStatisticsBySize initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize),  "initWithInitialValue:",  a3);
    totalStaged = v4->_totalStaged;
    v4->_totalStaged = v19;

    v21 = -[MAAutoAssetControlStatisticsBySize initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize),  "initWithInitialValue:",  a3);
    totalUnstaged = v4->_totalUnstaged;
    v4->_totalUnstaged = v21;

    v23 = -[MAAutoAssetControlStatisticsBySize initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize),  "initWithInitialValue:",  a3);
    totalPromoted = v4->_totalPromoted;
    v4->_totalPromoted = v23;

    v25 = -[MAAutoAssetControlStatisticsBySize initWithInitialValue:]( objc_alloc(&OBJC_CLASS___MAAutoAssetControlStatisticsBySize),  "initWithInitialValue:",  a3);
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

- (MAAutoAssetControlStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MAAutoAssetControlStatistics;
  v5 = -[MAAutoAssetControlStatistics init](&v29, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalClientRequests"];
    totalClientRequests = v5->_totalClientRequests;
    v5->_totalClientRequests = (MAAutoAssetControlStatisticsByCommand *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalClientRepliesSuccess"];
    totalClientRepliesSuccess = v5->_totalClientRepliesSuccess;
    v5->_totalClientRepliesSuccess = (MAAutoAssetControlStatisticsByCommand *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalClientRepliesFailure"];
    totalClientRepliesFailure = v5->_totalClientRepliesFailure;
    v5->_totalClientRepliesFailure = (MAAutoAssetControlStatisticsByCommand *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalQueuedClientRequests"];
    totalQueuedClientRequests = v5->_totalQueuedClientRequests;
    v5->_totalQueuedClientRequests = (MAAutoAssetControlStatisticsByCommand *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalDequeuedClientRequests"];
    totalDequeuedClientRequests = v5->_totalDequeuedClientRequests;
    v5->_totalDequeuedClientRequests = (MAAutoAssetControlStatisticsByCommand *)v14;

    v5->_totalAutoAssetJobsStarted = [v4 decodeInt64ForKey:@"totalAutoAssetJobsStarted"];
    v5->_totalAutoJobsFinished = [v4 decodeInt64ForKey:@"totalAutoJobsFinished"];
    v5->_totalStagerDetermineJobsStarted = [v4 decodeInt64ForKey:@"totalStagerDetermineJobsStarted"];
    v5->_totalStagerDetermineJobsFinished = [v4 decodeInt64ForKey:@"totalStagerDetermineJobsFinished"];
    v5->_totalStagerDownloadJobsStarted = [v4 decodeInt64ForKey:@"totalStagerDownloadJobsStarted"];
    v5->_totalStagerDownloadJobsFinished = [v4 decodeInt64ForKey:@"totalStagerDownloadJobsFinished"];
    v5->_totalResumedInFlightJobs = [v4 decodeInt64ForKey:@"totalResumedInFlightJobs"];
    v5->_totalSchedulerTriggeredJobs = [v4 decodeInt64ForKey:@"totalSchedulerTriggeredJobs"];
    v5->_totalFailuresToStartJobs = [v4 decodeInt64ForKey:@"totalFailuresToStartJobs"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previouslyDownloaded"];
    previouslyDownloaded = v5->_previouslyDownloaded;
    v5->_previouslyDownloaded = (MAAutoAssetControlStatisticsBySize *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalDownloaded"];
    totalDownloaded = v5->_totalDownloaded;
    v5->_totalDownloaded = (MAAutoAssetControlStatisticsBySize *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalStaged"];
    totalStaged = v5->_totalStaged;
    v5->_totalStaged = (MAAutoAssetControlStatisticsBySize *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalUnstaged"];
    totalUnstaged = v5->_totalUnstaged;
    v5->_totalUnstaged = (MAAutoAssetControlStatisticsBySize *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalPromoted"];
    totalPromoted = v5->_totalPromoted;
    v5->_totalPromoted = (MAAutoAssetControlStatisticsBySize *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalRemoved"];
    totalRemoved = v5->_totalRemoved;
    v5->_totalRemoved = (MAAutoAssetControlStatisticsBySize *)v26;

    v5->_finishedJobSchedulerNetworkFailure = [v4 decodeInt64ForKey:@"finishedJobSchedulerNetworkFailure"];
    v5->_finishedJobSchedulerNotNetworkRelated = [v4 decodeInt64ForKey:@"finishedJobSchedulerNotNetworkRelated"];
    v5->_finishedJobClientNetworkFailure = [v4 decodeInt64ForKey:@"finishedJobClientNetworkFailure"];
    v5->_finishedJobClientNotNetworkRelated = [v4 decodeInt64ForKey:@"finishedJobClientNotNetworkRelated"];
    v5->_garbageCollectionPerformed = [v4 decodeBoolForKey:@"garbageCollectionPerformed"];
    v5->_garbageCollectionReclaimSpace = [v4 decodeBoolForKey:@"garbageCollectionReclaimSpace"];
    v5->_garbageCollectionTotalReclaimedSpace = [v4 decodeInt64ForKey:@"garbageCollectionTotalReclaimedSpace"];
    v5->_garbageCollectionReclaimedV2AssetCount = [v4 decodeInt64ForKey:@"garbageCollectionReclaimedV2AssetCount"];
    v5->_garbageCollectionReclaimedV2AssetSpace = [v4 decodeInt64ForKey:@"garbageCollectionReclaimedV2AssetSpace"];
    v5->_garbageCollectionReclaimedUnlockedCount = [v4 decodeInt64ForKey:@"garbageCollectionReclaimedUnlockedCount"];
    v5->_garbageCollectionReclaimedUnlockedSpace = [v4 decodeInt64ForKey:@"garbageCollectionReclaimedUnlockedSpace"];
    v5->_garbageCollectionReclaimedLockedOverridableCount = [v4 decodeInt64ForKey:@"garbageCollectionReclaimedLockedOverridableCount"];
    v5->_garbageCollectionReclaimedLockedOverridableSpace = [v4 decodeInt64ForKey:@"garbageCollectionReclaimedLockedOverridableSpace"];
    v5->_garbageCollectionReclaimedLockedNeverRemoveCount = [v4 decodeInt64ForKey:@"garbageCollectionReclaimedLockedNeverRemoveCount"];
    v5->_garbageCollectionReclaimedLockedNeverRemoveSpace = [v4 decodeInt64ForKey:@"garbageCollectionReclaimedLockedNeverRemoveSpace"];
    v5->_garbageCollectionReclaimedStagedCount = [v4 decodeInt64ForKey:@"garbageCollectionReclaimedStagedCount"];
    v5->_garbageCollectionReclaimedStagedSpace = [v4 decodeInt64ForKey:@"garbageCollectionReclaimedStagedSpace"];
    v5->_garbageCollectionReclaimedMetadataBlockedCount = [v4 decodeInt64ForKey:@"garbageCollectionReclaimedMetadataBlockedCount"];
    v5->_garbageCollectionReclaimedMetadataBlockedSpace = [v4 decodeInt64ForKey:@"garbageCollectionReclaimedMetadataBlockedSpace"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 encodeObject:v4 forKey:@"totalClientRequests"];
  v5 = -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  [v15 encodeObject:v5 forKey:@"totalClientRepliesSuccess"];

  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 encodeObject:v6 forKey:@"totalClientRepliesFailure"];
  v7 = -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  [v15 encodeObject:v7 forKey:@"totalQueuedClientRequests"];

  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 encodeObject:v8 forKey:@"totalDequeuedClientRequests"];

  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics totalAutoAssetJobsStarted](self, "totalAutoAssetJobsStarted"),  @"totalAutoAssetJobsStarted");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics totalAutoJobsFinished](self, "totalAutoJobsFinished"),  @"totalAutoJobsFinished");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics totalStagerDetermineJobsStarted](self, "totalStagerDetermineJobsStarted"),  @"totalStagerDetermineJobsStarted");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics totalStagerDetermineJobsFinished](self, "totalStagerDetermineJobsFinished"),  @"totalStagerDetermineJobsFinished");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics totalStagerDownloadJobsStarted](self, "totalStagerDownloadJobsStarted"),  @"totalStagerDownloadJobsStarted");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics totalStagerDownloadJobsFinished](self, "totalStagerDownloadJobsFinished"),  @"totalStagerDownloadJobsFinished");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics totalResumedInFlightJobs](self, "totalResumedInFlightJobs"),  @"totalResumedInFlightJobs");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics totalSchedulerTriggeredJobs](self, "totalSchedulerTriggeredJobs"),  @"totalSchedulerTriggeredJobs");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics totalFailuresToStartJobs](self, "totalFailuresToStartJobs"),  @"totalFailuresToStartJobs");
  v9 = -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  [v15 encodeObject:v9 forKey:@"previouslyDownloaded"];

  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 encodeObject:v10 forKey:@"totalDownloaded"];
  v11 = -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  [v15 encodeObject:v11 forKey:@"totalStaged"];

  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 encodeObject:v12 forKey:@"totalUnstaged"];
  v13 = -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  [v15 encodeObject:v13 forKey:@"totalPromoted"];

  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 encodeObject:v14 forKey:@"totalRemoved"];

  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics finishedJobSchedulerNetworkFailure](self, "finishedJobSchedulerNetworkFailure"),  @"finishedJobSchedulerNetworkFailure");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics finishedJobSchedulerNotNetworkRelated](self, "finishedJobSchedulerNotNetworkRelated"),  @"finishedJobSchedulerNotNetworkRelated");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics finishedJobClientNetworkFailure](self, "finishedJobClientNetworkFailure"),  @"finishedJobClientNetworkFailure");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics finishedJobClientNotNetworkRelated](self, "finishedJobClientNotNetworkRelated"),  @"finishedJobClientNotNetworkRelated");
  objc_msgSend( v15,  "encodeBool:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionPerformed](self, "garbageCollectionPerformed"),  @"garbageCollectionPerformed");
  objc_msgSend( v15,  "encodeBool:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimSpace](self, "garbageCollectionReclaimSpace"),  @"garbageCollectionReclaimSpace");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionTotalReclaimedSpace](self, "garbageCollectionTotalReclaimedSpace"),  @"garbageCollectionTotalReclaimedSpace");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetCount]( self,  "garbageCollectionReclaimedV2AssetCount"),  @"garbageCollectionReclaimedV2AssetCount");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetSpace]( self,  "garbageCollectionReclaimedV2AssetSpace"),  @"garbageCollectionReclaimedV2AssetSpace");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedCount]( self,  "garbageCollectionReclaimedUnlockedCount"),  @"garbageCollectionReclaimedUnlockedCount");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedSpace]( self,  "garbageCollectionReclaimedUnlockedSpace"),  @"garbageCollectionReclaimedUnlockedSpace");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableCount]( self,  "garbageCollectionReclaimedLockedOverridableCount"),  @"garbageCollectionReclaimedLockedOverridableCount");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableSpace]( self,  "garbageCollectionReclaimedLockedOverridableSpace"),  @"garbageCollectionReclaimedLockedOverridableSpace");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveCount]( self,  "garbageCollectionReclaimedLockedNeverRemoveCount"),  @"garbageCollectionReclaimedLockedNeverRemoveCount");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveSpace]( self,  "garbageCollectionReclaimedLockedNeverRemoveSpace"),  @"garbageCollectionReclaimedLockedNeverRemoveSpace");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedCount](self, "garbageCollectionReclaimedStagedCount"),  @"garbageCollectionReclaimedStagedCount");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedSpace](self, "garbageCollectionReclaimedStagedSpace"),  @"garbageCollectionReclaimedStagedSpace");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedCount]( self,  "garbageCollectionReclaimedMetadataBlockedCount"),  @"garbageCollectionReclaimedMetadataBlockedCount");
  objc_msgSend( v15,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedSpace]( self,  "garbageCollectionReclaimedMetadataBlockedSpace"),  @"garbageCollectionReclaimedMetadataBlockedSpace");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetControlStatistics);
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)[v4 copy];
  -[MAAutoAssetControlStatistics setTotalClientRequests:](v3, "setTotalClientRequests:", v5);

  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v6 copy];
  -[MAAutoAssetControlStatistics setTotalClientRepliesSuccess:](v3, "setTotalClientRepliesSuccess:", v7);

  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v8 copy];
  -[MAAutoAssetControlStatistics setTotalClientRepliesFailure:](v3, "setTotalClientRepliesFailure:", v9);

  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)[v10 copy];
  -[MAAutoAssetControlStatistics setTotalQueuedClientRequests:](v3, "setTotalQueuedClientRequests:", v11);

  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)[v12 copy];
  -[MAAutoAssetControlStatistics setTotalDequeuedClientRequests:](v3, "setTotalDequeuedClientRequests:", v13);

  -[MAAutoAssetControlStatistics setTotalAutoAssetJobsStarted:]( v3,  "setTotalAutoAssetJobsStarted:",  -[MAAutoAssetControlStatistics totalAutoAssetJobsStarted](self, "totalAutoAssetJobsStarted"));
  -[MAAutoAssetControlStatistics setTotalAutoJobsFinished:]( v3,  "setTotalAutoJobsFinished:",  -[MAAutoAssetControlStatistics totalAutoJobsFinished](self, "totalAutoJobsFinished"));
  -[MAAutoAssetControlStatistics setTotalStagerDetermineJobsStarted:]( v3,  "setTotalStagerDetermineJobsStarted:",  -[MAAutoAssetControlStatistics totalStagerDetermineJobsStarted](self, "totalStagerDetermineJobsStarted"));
  -[MAAutoAssetControlStatistics setTotalStagerDetermineJobsFinished:]( v3,  "setTotalStagerDetermineJobsFinished:",  -[MAAutoAssetControlStatistics totalStagerDetermineJobsFinished](self, "totalStagerDetermineJobsFinished"));
  -[MAAutoAssetControlStatistics setTotalStagerDownloadJobsStarted:]( v3,  "setTotalStagerDownloadJobsStarted:",  -[MAAutoAssetControlStatistics totalStagerDownloadJobsStarted](self, "totalStagerDownloadJobsStarted"));
  -[MAAutoAssetControlStatistics setTotalStagerDownloadJobsFinished:]( v3,  "setTotalStagerDownloadJobsFinished:",  -[MAAutoAssetControlStatistics totalStagerDownloadJobsFinished](self, "totalStagerDownloadJobsFinished"));
  -[MAAutoAssetControlStatistics setTotalResumedInFlightJobs:]( v3,  "setTotalResumedInFlightJobs:",  -[MAAutoAssetControlStatistics totalResumedInFlightJobs](self, "totalResumedInFlightJobs"));
  -[MAAutoAssetControlStatistics setTotalSchedulerTriggeredJobs:]( v3,  "setTotalSchedulerTriggeredJobs:",  -[MAAutoAssetControlStatistics totalSchedulerTriggeredJobs](self, "totalSchedulerTriggeredJobs"));
  -[MAAutoAssetControlStatistics setTotalFailuresToStartJobs:]( v3,  "setTotalFailuresToStartJobs:",  -[MAAutoAssetControlStatistics totalFailuresToStartJobs](self, "totalFailuresToStartJobs"));
  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = (void *)[v14 copy];
  -[MAAutoAssetControlStatistics setPreviouslyDownloaded:](v3, "setPreviouslyDownloaded:", v15);

  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)[v16 copy];
  -[MAAutoAssetControlStatistics setTotalDownloaded:](v3, "setTotalDownloaded:", v17);

  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)[v18 copy];
  -[MAAutoAssetControlStatistics setTotalStaged:](v3, "setTotalStaged:", v19);

  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)[v20 copy];
  -[MAAutoAssetControlStatistics setTotalUnstaged:](v3, "setTotalUnstaged:", v21);

  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)[v22 copy];
  -[MAAutoAssetControlStatistics setTotalPromoted:](v3, "setTotalPromoted:", v23);

  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)[v24 copy];
  -[MAAutoAssetControlStatistics setTotalRemoved:](v3, "setTotalRemoved:", v25);

  -[MAAutoAssetControlStatistics setFinishedJobSchedulerNetworkFailure:]( v3,  "setFinishedJobSchedulerNetworkFailure:",  -[MAAutoAssetControlStatistics finishedJobSchedulerNetworkFailure](self, "finishedJobSchedulerNetworkFailure"));
  -[MAAutoAssetControlStatistics setFinishedJobSchedulerNotNetworkRelated:]( v3,  "setFinishedJobSchedulerNotNetworkRelated:",  -[MAAutoAssetControlStatistics finishedJobSchedulerNotNetworkRelated](self, "finishedJobSchedulerNotNetworkRelated"));
  -[MAAutoAssetControlStatistics setFinishedJobClientNetworkFailure:]( v3,  "setFinishedJobClientNetworkFailure:",  -[MAAutoAssetControlStatistics finishedJobClientNetworkFailure](self, "finishedJobClientNetworkFailure"));
  -[MAAutoAssetControlStatistics setFinishedJobClientNotNetworkRelated:]( v3,  "setFinishedJobClientNotNetworkRelated:",  -[MAAutoAssetControlStatistics finishedJobClientNotNetworkRelated](self, "finishedJobClientNotNetworkRelated"));
  -[MAAutoAssetControlStatistics setGarbageCollectionPerformed:]( v3,  "setGarbageCollectionPerformed:",  -[MAAutoAssetControlStatistics garbageCollectionPerformed](self, "garbageCollectionPerformed"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimSpace:]( v3,  "setGarbageCollectionReclaimSpace:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimSpace](self, "garbageCollectionReclaimSpace"));
  -[MAAutoAssetControlStatistics setGarbageCollectionTotalReclaimedSpace:]( v3,  "setGarbageCollectionTotalReclaimedSpace:",  -[MAAutoAssetControlStatistics garbageCollectionTotalReclaimedSpace](self, "garbageCollectionTotalReclaimedSpace"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedV2AssetCount:]( v3,  "setGarbageCollectionReclaimedV2AssetCount:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetCount]( self,  "garbageCollectionReclaimedV2AssetCount"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedV2AssetSpace:]( v3,  "setGarbageCollectionReclaimedV2AssetSpace:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetSpace]( self,  "garbageCollectionReclaimedV2AssetSpace"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedUnlockedCount:]( v3,  "setGarbageCollectionReclaimedUnlockedCount:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedCount]( self,  "garbageCollectionReclaimedUnlockedCount"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedUnlockedSpace:]( v3,  "setGarbageCollectionReclaimedUnlockedSpace:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedSpace]( self,  "garbageCollectionReclaimedUnlockedSpace"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedLockedOverridableCount:]( v3,  "setGarbageCollectionReclaimedLockedOverridableCount:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableCount]( self,  "garbageCollectionReclaimedLockedOverridableCount"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedLockedOverridableSpace:]( v3,  "setGarbageCollectionReclaimedLockedOverridableSpace:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableSpace]( self,  "garbageCollectionReclaimedLockedOverridableSpace"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedLockedNeverRemoveCount:]( v3,  "setGarbageCollectionReclaimedLockedNeverRemoveCount:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveCount]( self,  "garbageCollectionReclaimedLockedNeverRemoveCount"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedLockedNeverRemoveSpace:]( v3,  "setGarbageCollectionReclaimedLockedNeverRemoveSpace:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveSpace]( self,  "garbageCollectionReclaimedLockedNeverRemoveSpace"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedStagedCount:]( v3,  "setGarbageCollectionReclaimedStagedCount:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedCount](self, "garbageCollectionReclaimedStagedCount"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedStagedSpace:]( v3,  "setGarbageCollectionReclaimedStagedSpace:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedSpace](self, "garbageCollectionReclaimedStagedSpace"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedMetadataBlockedCount:]( v3,  "setGarbageCollectionReclaimedMetadataBlockedCount:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedCount]( self,  "garbageCollectionReclaimedMetadataBlockedCount"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedMetadataBlockedSpace:]( v3,  "setGarbageCollectionReclaimedMetadataBlockedSpace:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedSpace]( self,  "garbageCollectionReclaimedMetadataBlockedSpace"));
  return v3;
}

+ (id)allocStringForBytes:(int64_t)a3
{
  if (!a3) {
    return @"0 bytes";
  }
  id v4 = &stru_189FFC530;
  if (a3 >= 0)
  {
    int64_t v5 = a3;
  }

  else
  {
    id v4 = @"NEGATIVE ";
    int64_t v5 = a3 + 0x3FFFFFFF;
  }

  uint64_t v6 = v4;
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
    uint64_t v12 = @" 1 byte";
  }

  else if (v11 < 2)
  {
    uint64_t v12 = &stru_189FFC530;
  }

  else
  {
    uint64_t v12 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @" %lld bytes",  v9 - (v10 & 0xFFFFFFFFFFFFFC00));
  }

  uint64_t v14 = v8 >> 20;
  if (a3 < 0x40000000)
  {
    if (v7 < 0x100000)
    {
      id v16 = objc_alloc(NSString);
      if (v9 < 1024) {
        uint64_t v15 = [v16 initWithFormat:@"%@%lld bytes", v6, a3, v18, v19, v20];
      }
      else {
        uint64_t v15 = [v16 initWithFormat:@"%@%lldKB%@", v6, v10 >> 10, v12, v19, v20];
      }
    }

    else
    {
      uint64_t v15 = [objc_alloc(NSString) initWithFormat:@"%@%lldMB %lldKB%@", v6, v14, v10 >> 10, v12, v20];
    }
  }

  else
  {
    uint64_t v15 = [objc_alloc(NSString) initWithFormat:@"%@%lldGB %lldMB %lldKB%@", v6, v5 >> 30, v14, v10 >> 10, v12];
  }

  v13 = (void *)v15;

  return v13;
}

- (id)description
{
  v131 = (void *)NSString;
  v157 = -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  uint64_t v129 = [v157 interestInContent];
  v156 = -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  uint64_t v127 = [v156 checkForNewer];
  v155 = -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  uint64_t v125 = [v155 determineIfAvailable];
  v154 = -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  uint64_t v123 = [v154 currentStatus];
  v153 = -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  uint64_t v122 = [v153 lockContent];
  v152 = -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  uint64_t v120 = [v152 continueLockUsage];
  v151 = -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  uint64_t v118 = [v151 endLockUsage];
  v150 = -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  uint64_t v116 = [v150 endPreviousLocks];
  v149 = -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  uint64_t v114 = [v149 endAllPreviousLocks];
  v148 = -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  uint64_t v113 = [v148 stageDetermineAllAvailable];
  v147 = -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  uint64_t v111 = [v147 stageDownloadAll];
  v146 = -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  uint64_t v109 = [v146 stagePurgeAll];
  v145 = -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  uint64_t v107 = [v145 stageEraseAll];
  v144 = -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  uint64_t v105 = [v144 interestInContent];
  v143 = -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  uint64_t v104 = [v143 checkForNewer];
  v142 = -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  uint64_t v102 = [v142 determineIfAvailable];
  v141 = -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  uint64_t v100 = [v141 currentStatus];
  v140 = -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  uint64_t v98 = [v140 lockContent];
  v139 = -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  uint64_t v97 = [v139 continueLockUsage];
  v138 = -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  uint64_t v95 = [v138 endLockUsage];
  v137 = -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  uint64_t v93 = [v137 endPreviousLocks];
  v136 = -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  uint64_t v91 = [v136 endAllPreviousLocks];
  v135 = -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  uint64_t v89 = [v135 stageDetermineAllAvailable];
  v134 = -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  uint64_t v88 = [v134 stageDownloadAll];
  v133 = -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  uint64_t v86 = [v133 stagePurgeAll];
  v132 = -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  uint64_t v84 = [v132 interestInContent];
  v130 = -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  uint64_t v82 = [v130 checkForNewer];
  v128 = -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  uint64_t v80 = [v128 determineIfAvailable];
  v126 = -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  uint64_t v79 = [v126 currentStatus];
  v124 = -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  uint64_t v77 = [v124 lockContent];
  v121 = -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  uint64_t v71 = [v121 continueLockUsage];
  v119 = -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  uint64_t v69 = [v119 endLockUsage];
  v117 = -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  uint64_t v68 = [v117 endPreviousLocks];
  v115 = -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  uint64_t v66 = [v115 endAllPreviousLocks];
  v112 = -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  uint64_t v64 = [v112 stageDetermineAllAvailable];
  v110 = -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  uint64_t v62 = [v110 stageDownloadAll];
  v108 = -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  uint64_t v61 = [v108 stagePurgeAll];
  v106 = -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  uint64_t v59 = [v106 interestInContent];
  v103 = -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  uint64_t v57 = [v103 checkForNewer];
  v101 = -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  uint64_t v56 = [v101 determineIfAvailable];
  v99 = -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  uint64_t v55 = [v99 currentStatus];
  v96 = -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  uint64_t v54 = [v96 lockContent];
  v94 = -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  uint64_t v53 = [v94 continueLockUsage];
  v92 = -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  uint64_t v52 = [v92 endLockUsage];
  v90 = -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  uint64_t v50 = [v90 endPreviousLocks];
  v87 = -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  uint64_t v48 = [v87 endAllPreviousLocks];
  v85 = -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  uint64_t v47 = [v85 stageDetermineAllAvailable];
  v83 = -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  uint64_t v45 = [v83 stageDownloadAll];
  v81 = -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  uint64_t v43 = [v81 stagePurgeAll];
  v78 = -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  uint64_t v41 = [v78 interestInContent];
  v76 = -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  uint64_t v40 = [v76 checkForNewer];
  v75 = -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  uint64_t v38 = [v75 determineIfAvailable];
  v74 = -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  uint64_t v36 = [v74 currentStatus];
  v73 = -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  uint64_t v34 = [v73 lockContent];
  v72 = -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  uint64_t v33 = [v72 continueLockUsage];
  v70 = -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  uint64_t v31 = [v70 endLockUsage];
  v67 = -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  uint64_t v29 = [v67 endPreviousLocks];
  v65 = -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  uint64_t v27 = [v65 endAllPreviousLocks];
  v63 = -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  uint64_t v26 = [v63 stageDetermineAllAvailable];
  v60 = -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  uint64_t v24 = [v60 stageDownloadAll];
  v58 = -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  [v58 stagePurgeAll];
  -[MAAutoAssetControlStatistics totalAutoAssetJobsStarted](self, "totalAutoAssetJobsStarted");
  -[MAAutoAssetControlStatistics totalAutoJobsFinished](self, "totalAutoJobsFinished");
  -[MAAutoAssetControlStatistics totalStagerDetermineJobsStarted](self, "totalStagerDetermineJobsStarted");
  -[MAAutoAssetControlStatistics totalStagerDetermineJobsFinished](self, "totalStagerDetermineJobsFinished");
  -[MAAutoAssetControlStatistics totalStagerDownloadJobsStarted](self, "totalStagerDownloadJobsStarted");
  -[MAAutoAssetControlStatistics totalStagerDownloadJobsFinished](self, "totalStagerDownloadJobsFinished");
  -[MAAutoAssetControlStatistics totalResumedInFlightJobs](self, "totalResumedInFlightJobs");
  -[MAAutoAssetControlStatistics totalSchedulerTriggeredJobs](self, "totalSchedulerTriggeredJobs");
  -[MAAutoAssetControlStatistics totalFailuresToStartJobs](self, "totalFailuresToStartJobs");
  v51 = -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  [v51 patchedAssets];
  v49 = -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  [v49 patchedBytes];
  v46 = -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  [v46 fullAssets];
  v44 = -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  [v44 fullBytes];
  v42 = -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  [v42 patchedAssets];
  v39 = -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  [v39 patchedBytes];
  v37 = -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  [v37 fullAssets];
  v35 = -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  [v35 fullBytes];
  v32 = -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  [v32 patchedAssets];
  v30 = -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  [v30 patchedBytes];
  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  objc_super v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 fullAssets];
  v25 = -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  [v25 fullBytes];
  v23 = -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  [v23 patchedAssets];
  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 patchedBytes];
  v21 = -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  [v21 fullAssets];
  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 fullBytes];
  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 patchedAssets];
  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 patchedBytes];
  v17 = -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  [v17 fullAssets];
  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 fullBytes];
  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 patchedAssets];
  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 patchedBytes];
  v13 = -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  [v13 fullAssets];
  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 fullBytes];
  -[MAAutoAssetControlStatistics finishedJobSchedulerNetworkFailure](self, "finishedJobSchedulerNetworkFailure");
  -[MAAutoAssetControlStatistics finishedJobSchedulerNotNetworkRelated](self, "finishedJobSchedulerNotNetworkRelated");
  -[MAAutoAssetControlStatistics finishedJobClientNetworkFailure](self, "finishedJobClientNetworkFailure");
  -[MAAutoAssetControlStatistics finishedJobClientNotNetworkRelated](self, "finishedJobClientNotNetworkRelated");
  -[MAAutoAssetControlStatistics garbageCollectionPerformed](self, "garbageCollectionPerformed");
  -[MAAutoAssetControlStatistics garbageCollectionReclaimSpace](self, "garbageCollectionReclaimSpace");
  id v11 = +[MAAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MAAutoAssetControlStatistics,  "allocStringForBytes:",  -[MAAutoAssetControlStatistics garbageCollectionTotalReclaimedSpace]( self,  "garbageCollectionTotalReclaimedSpace"));
  -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetCount](self, "garbageCollectionReclaimedV2AssetCount");
  id v10 = +[MAAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MAAutoAssetControlStatistics,  "allocStringForBytes:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetSpace]( self,  "garbageCollectionReclaimedV2AssetSpace"));
  -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedCount]( self,  "garbageCollectionReclaimedUnlockedCount");
  id v9 = +[MAAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MAAutoAssetControlStatistics,  "allocStringForBytes:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedSpace]( self,  "garbageCollectionReclaimedUnlockedSpace"));
  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableCount]( self,  "garbageCollectionReclaimedLockedOverridableCount");
  id v8 = +[MAAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MAAutoAssetControlStatistics,  "allocStringForBytes:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableSpace]( self,  "garbageCollectionReclaimedLockedOverridableSpace"));
  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveCount]( self,  "garbageCollectionReclaimedLockedNeverRemoveCount");
  id v3 = +[MAAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MAAutoAssetControlStatistics,  "allocStringForBytes:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveSpace]( self,  "garbageCollectionReclaimedLockedNeverRemoveSpace"));
  -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedCount](self, "garbageCollectionReclaimedStagedCount");
  id v4 = +[MAAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MAAutoAssetControlStatistics,  "allocStringForBytes:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedSpace]( self,  "garbageCollectionReclaimedStagedSpace"));
  -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedCount]( self,  "garbageCollectionReclaimedMetadataBlockedCount");
  id v7 = +[MAAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MAAutoAssetControlStatistics,  "allocStringForBytes:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedSpace]( self,  "garbageCollectionReclaimedMetadataBlockedSpace"));
  objc_msgSend( v131,  "stringWithFormat:",  &cfstr_CategoryStatis,  v129,  v127,  v125,  v123,  v122,  v120,  v118,  v116,  v114,  v113,  v111,  v109,  v107,  v105,  v104,  v102,  v100,  v98,  v97,  v95,  v93,  v91,  v89,  v88,  v86,  v84,  v82,  v80,  v79,  v77,  v71,  v69,  v68,  v66,  v64,  v62,  v61,  v59,  v57,  v56,  v55,  v54,  v53,  v52,  v50,  v48,
    v47,
    v45,
    v43,
    v41,
    v40,
    v38,
    v36,
    v34,
    v33,
    v31,
    v29,
    v27,
    v26,
    v24);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)summary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v108 = [v3 total];

  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v107 = [v4 total];

  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v106 = [v5 total];

  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v105 = [v6 total];

  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v104 = [v7 total];

  int64_t v99 = -[MAAutoAssetControlStatistics totalAutoAssetJobsStarted](self, "totalAutoAssetJobsStarted");
  int64_t v98 = -[MAAutoAssetControlStatistics totalStagerDetermineJobsStarted](self, "totalStagerDetermineJobsStarted");
  int64_t v97 = -[MAAutoAssetControlStatistics totalStagerDownloadJobsStarted](self, "totalStagerDownloadJobsStarted");
  int64_t v96 = -[MAAutoAssetControlStatistics totalAutoJobsFinished](self, "totalAutoJobsFinished");
  int64_t v95 = -[MAAutoAssetControlStatistics totalStagerDetermineJobsFinished](self, "totalStagerDetermineJobsFinished");
  int64_t v94 = -[MAAutoAssetControlStatistics totalStagerDownloadJobsFinished](self, "totalStagerDownloadJobsFinished");
  int64_t v103 = -[MAAutoAssetControlStatistics totalResumedInFlightJobs](self, "totalResumedInFlightJobs");
  int64_t v102 = -[MAAutoAssetControlStatistics totalSchedulerTriggeredJobs](self, "totalSchedulerTriggeredJobs");
  int64_t v101 = -[MAAutoAssetControlStatistics totalFailuresToStartJobs](self, "totalFailuresToStartJobs");
  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v93 = [v8 patchedAssets];
  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v92 = [v9 fullAssets];

  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v91 = [v10 patchedBytes];
  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v90 = [v11 fullBytes];

  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v89 = [v12 patchedAssets];
  v13 = -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  uint64_t v88 = [v13 fullAssets];

  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v87 = [v14 patchedBytes];
  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v86 = [v15 fullBytes];

  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 patchedAssets];
  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v85 = [v18 fullAssets];

  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v84 = [v19 patchedBytes];
  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v83 = [v20 fullBytes];
  v21 = -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  uint64_t v82 = [v21 patchedAssets];
  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v81 = [v22 fullAssets];
  v23 = -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  uint64_t v24 = [v23 patchedBytes];
  v25 = -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  uint64_t v80 = [v25 fullBytes];

  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = [v26 patchedAssets];
  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  objc_super v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v78 = [v28 fullAssets];

  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = [v29 patchedBytes];
  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v76 = [v31 fullBytes];
  v32 = -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  uint64_t v75 = [v32 patchedAssets];
  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v74 = [v33 fullAssets];

  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [v34 patchedBytes];
  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v73 = [v36 fullBytes];

  uint64_t v77 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"|jobFinished schedNWFail:%lld,schedOther:%lld,clientNWFail:%lld,clientOther:%lld",  -[MAAutoAssetControlStatistics finishedJobSchedulerNetworkFailure]( self,  "finishedJobSchedulerNetworkFailure"),  -[MAAutoAssetControlStatistics finishedJobSchedulerNotNetworkRelated]( self,  "finishedJobSchedulerNotNetworkRelated"),  -[MAAutoAssetControlStatistics finishedJobClientNetworkFailure]( self,  "finishedJobClientNetworkFailure"),  -[MAAutoAssetControlStatistics finishedJobClientNotNetworkRelated]( self,  "finishedJobClientNotNetworkRelated"));
  unint64_t v37 = 0x189FF8000uLL;
  if (-[MAAutoAssetControlStatistics garbageCollectionPerformed](self, "garbageCollectionPerformed"))
  {
    id v71 = objc_alloc(NSString);
    BOOL v38 = -[MAAutoAssetControlStatistics garbageCollectionReclaimSpace](self, "garbageCollectionReclaimSpace");
    v39 = @"garbageDetermined";
    if (v38) {
      v39 = @"garbageReclaimed";
    }
    uint64_t v68 = v39;
    int64_t v67 = -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetCount]( self,  "garbageCollectionReclaimedV2AssetCount");
    id v66 = +[MAAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MAAutoAssetControlStatistics,  "allocStringForBytes:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetSpace]( self,  "garbageCollectionReclaimedV2AssetSpace"));
    int64_t v65 = -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedCount]( self,  "garbageCollectionReclaimedUnlockedCount");
    id v64 = +[MAAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MAAutoAssetControlStatistics,  "allocStringForBytes:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedSpace]( self,  "garbageCollectionReclaimedUnlockedSpace"));
    int64_t v63 = -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableCount]( self,  "garbageCollectionReclaimedLockedOverridableCount");
    uint64_t v70 = v24;
    id v62 = +[MAAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MAAutoAssetControlStatistics,  "allocStringForBytes:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableSpace]( self,  "garbageCollectionReclaimedLockedOverridableSpace"));
    int64_t v61 = -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveCount]( self,  "garbageCollectionReclaimedLockedNeverRemoveCount");
    id v40 = +[MAAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MAAutoAssetControlStatistics,  "allocStringForBytes:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveSpace]( self,  "garbageCollectionReclaimedLockedNeverRemoveSpace"));
    uint64_t v41 = v27;
    uint64_t v42 = v17;
    int64_t v43 = -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedCount]( self,  "garbageCollectionReclaimedStagedCount");
    id v44 = +[MAAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MAAutoAssetControlStatistics,  "allocStringForBytes:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedSpace]( self,  "garbageCollectionReclaimedStagedSpace"));
    int64_t v45 = -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedCount]( self,  "garbageCollectionReclaimedMetadataBlockedCount");
    uint64_t v69 = v35;
    id v46 = +[MAAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MAAutoAssetControlStatistics,  "allocStringForBytes:",  -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedSpace]( self,  "garbageCollectionReclaimedMetadataBlockedSpace"));
    uint64_t v47 = v30;
    id v48 = +[MAAutoAssetControlStatistics allocStringForBytes:]( &OBJC_CLASS___MAAutoAssetControlStatistics,  "allocStringForBytes:",  -[MAAutoAssetControlStatistics garbageCollectionTotalReclaimedSpace]( self,  "garbageCollectionTotalReclaimedSpace"));
    int64_t v60 = v43;
    uint64_t v17 = v42;
    uint64_t v27 = v41;
    v72 = (__CFString *)[v71 initWithFormat:@"|%@ v2Assets:%ld(%@),unlocked:%ld(%@),lockedOverridable:%ld(%@),lockedNeverRemove:%ld(%@),staged:%ld(%@),metadataBlocked:%ld(%@),totalSpace:%@", v68, v67, v66, v65, v64, v63, v62, v61, v40, v60, v44, v45, v46, v48];

    uint64_t v30 = v47;
    uint64_t v35 = v69;

    unint64_t v37 = 0x189FF8000LL;
    uint64_t v24 = v70;
  }

  else
  {
    v72 = &stru_189FFC530;
  }

  uint64_t v79 = v78 + v27;
  int64_t v49 = v98 + v99;
  uint64_t v100 = (void *)NSString;
  int64_t v50 = v49 + v97;
  unint64_t v51 = v37;
  uint64_t v52 = (void *)[*(id *)(v37 + 3440) allocStringForBytes:v90 + v91];
  uint64_t v53 = (void *)[*(id *)(v51 + 3440) allocStringForBytes:v86 + v87];
  uint64_t v54 = (void *)[*(id *)(v51 + 3440) allocStringForBytes:v83 + v84];
  uint64_t v55 = (void *)[*(id *)(v51 + 3440) allocStringForBytes:v80 + v24];
  uint64_t v56 = (void *)[*(id *)(v51 + 3440) allocStringForBytes:v76 + v30];
  uint64_t v57 = (void *)[*(id *)(v51 + 3440) allocStringForBytes:v73 + v35];
  [v100 stringWithFormat:@"[totalClient requests:%lld,success:%lld,failure:%lld,queued:%lld,dequeued:%lld|totalJobs started:%lld,finished:%lld|totalInFlight:%lld|totalScheduler:%lld|totalFailuresToStart:%lld|previouslyDownloaded assets:%lld(%@)|totalDownloaded assets:%lld(%@)|totalStaged assets:%lld(%@)|totalUnstaged assets:%lld(%@)|totalPromoted assets:%lld(%@)|totalRemoved assets:%lld(%@)%@%@]", v108, v107, v106, v105, v104, v50, v95 + v96 + v94, v103, v102, v101, v92 + v93, v52, v88 + v89, v53, v85 + v17, v54, v81 + v82, v55, v79, v56, v74 + v75, v57, v77, v72];
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  return v58;
}

- (MAAutoAssetControlStatisticsByCommand)totalClientRequests
{
  return self->_totalClientRequests;
}

- (void)setTotalClientRequests:(id)a3
{
}

- (MAAutoAssetControlStatisticsByCommand)totalClientRepliesSuccess
{
  return self->_totalClientRepliesSuccess;
}

- (void)setTotalClientRepliesSuccess:(id)a3
{
}

- (MAAutoAssetControlStatisticsByCommand)totalClientRepliesFailure
{
  return self->_totalClientRepliesFailure;
}

- (void)setTotalClientRepliesFailure:(id)a3
{
}

- (MAAutoAssetControlStatisticsByCommand)totalQueuedClientRequests
{
  return self->_totalQueuedClientRequests;
}

- (void)setTotalQueuedClientRequests:(id)a3
{
}

- (MAAutoAssetControlStatisticsByCommand)totalDequeuedClientRequests
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

- (MAAutoAssetControlStatisticsBySize)previouslyDownloaded
{
  return self->_previouslyDownloaded;
}

- (void)setPreviouslyDownloaded:(id)a3
{
}

- (MAAutoAssetControlStatisticsBySize)totalDownloaded
{
  return self->_totalDownloaded;
}

- (void)setTotalDownloaded:(id)a3
{
}

- (MAAutoAssetControlStatisticsBySize)totalStaged
{
  return self->_totalStaged;
}

- (void)setTotalStaged:(id)a3
{
}

- (MAAutoAssetControlStatisticsBySize)totalUnstaged
{
  return self->_totalUnstaged;
}

- (void)setTotalUnstaged:(id)a3
{
}

- (MAAutoAssetControlStatisticsBySize)totalPromoted
{
  return self->_totalPromoted;
}

- (void)setTotalPromoted:(id)a3
{
}

- (MAAutoAssetControlStatisticsBySize)totalRemoved
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