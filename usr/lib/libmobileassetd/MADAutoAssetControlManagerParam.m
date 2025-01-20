@interface MADAutoAssetControlManagerParam
+ (BOOL)supportsSecureCoding;
- (BOOL)potentialNetworkFailure;
- (BOOL)schedulerInvolved;
- (MAAutoAssetProgress)downloadProgress;
- (MAAutoAssetSelector)autoAssetSelector;
- (MAAutoAssetSelector)originalSelector;
- (MAAutoAssetStatus)autoAssetStatus;
- (MADAutoAssetClientRequest)clientRequest;
- (MADAutoAssetControlManagerParam)initWithClientID:(id)a3;
- (MADAutoAssetControlManagerParam)initWithClientRequest:(id)a3 reportingProgressThroughProxy:(id)a4 withReplyCompletion:(id)a5;
- (MADAutoAssetControlManagerParam)initWithCoder:(id)a3;
- (MADAutoAssetControlManagerParam)initWithDownloadsInFlight:(id)a3;
- (MADAutoAssetControlManagerParam)initWithParamType:(int64_t)a3 withSafeSummary:(id)a4 withScheduledJobs:(id)a5 withClientID:(id)a6 withClientRequestMessage:(id)a7 withClientProgressProxy:(id)a8 withClientReplyCompletion:(id)a9 withResponseMessage:(id)a10 withResponseError:(id)a11 withDownloadsInFlight:(id)a12 withAutoAssetJobID:(id)a13 withAutoAssetCatalog:(id)a14 withLockForUseError:(id)a15 withFinishedError:(id)a16 withDownloadProgress:(id)a17 withJobCurrentStatus:(id)a18 withAutoAssetSelector:(id)a19 withAutoAssetUUID:(id)a20 withSetOfAutoAssetSelectors:(id)a21 withPushNotifications:(id)a22 withSetDescriptor:(id)a23 withAutoAssetDescriptors:(id)a24 withSetPolicy:(id)a25 withAssetTargetOSVersion:(id)a26 withAssetTargetBuildVersion:(id)a27 withAssetTargetTrainName:(id)a28 withAssetTargetRestoreVersion:(id)a29 withStagedToDownloaded:(id)a30 withStagedLookupResults:(id)a31 withDownloadingDescriptor:(id)a32 withBaseForPatchDescriptor:(id)a33 withBaseForStagingDescriptors:(id)a34 withSchedulerInvolved:(BOOL)a35 withPotentialNetworkFailure:(BOOL)a36 withClientDomainName:(id)a37 withAssetSetIdentifier:(id)a38 withSetConfiguration:(id)a39 withSetAtomicInstance:(id)a40 withSetJobInformation:(id)a41 withTriggeredSets:(id)a42;
- (MADAutoAssetControlManagerParam)initWithPromoted:(id)a3 withSetLookupResults:(id)a4;
- (MADAutoAssetControlManagerParam)initWithSafeSummary:(id)a3;
- (MADAutoAssetControlManagerParam)initWithScheduledJobs:(id)a3;
- (MADAutoAssetDescriptor)baseForPatchDescriptor;
- (MADAutoAssetDescriptor)downloadingDescriptor;
- (MADAutoAssetJob)fromAutoAssetJob;
- (MADAutoAssetJobInformation)jobInformation;
- (MADAutoSetConfiguration)setConfiguration;
- (MADAutoSetDescriptor)setDescriptor;
- (MADAutoSetJobInformation)setJobInformation;
- (MANAutoAssetSetPolicy)setPolicy;
- (NSArray)autoAssetDescriptors;
- (NSArray)baseForStagingDescriptors;
- (NSArray)clientRequestArray;
- (NSArray)downloadsInFlight;
- (NSArray)pushNotifications;
- (NSArray)scheduledJobs;
- (NSArray)setOfAutoAssetSelectors;
- (NSArray)stagedSetLookupResults;
- (NSArray)stagedToDownloaded;
- (NSArray)triggeredSets;
- (NSDictionary)autoAssetCatalog;
- (NSError)finishedError;
- (NSError)lockForUseError;
- (NSError)responseError;
- (NSString)assetSetIdentifier;
- (NSString)assetTargetBuildVersion;
- (NSString)assetTargetOSVersion;
- (NSString)assetTargetRestoreVersion;
- (NSString)assetTargetTrainName;
- (NSString)autoAssetJobID;
- (NSString)autoAssetUUID;
- (NSString)clientDomainName;
- (NSString)clientID;
- (NSString)paramSafeSummary;
- (NSString)setAtomicInstance;
- (SUCoreConnectClientProxy)clientProgressProxy;
- (SUCoreConnectMessage)clientRequestMessage;
- (SUCoreConnectMessage)responseMessage;
- (id)_summary;
- (id)clientReplyCompletion;
- (id)initForAssetSelector:(id)a3;
- (id)initForAutoAssetDescriptors:(id)a3;
- (id)initForConfigFinishedJobID:(id)a3 withError:(id)a4;
- (id)initForCurrentJobID:(id)a3 withProgress:(id)a4;
- (id)initForFinishedJobID:(id)a3 withCatalog:(id)a4 withError:(id)a5;
- (id)initForFinishedJobID:(id)a3 withError:(id)a4;
- (id)initForFinishedJobSelector:(id)a3 withAutoAssetUUID:(id)a4 withSchedulerInvolved:(BOOL)a5 withPotentialNetworkFailure:(BOOL)a6;
- (id)initForFinishedSetJob:(id)a3 forAssetSetIdentifier:(id)a4 withSetAtomicInstance:(id)a5 withAutoAssetUUID:(id)a6 withSetJobInformation:(id)a7 withSchedulerInvolved:(BOOL)a8 withPotentialNetworkFailure:(BOOL)a9;
- (id)initForJobFoundSelector:(id)a3 withAutoAssetUUID:(id)a4;
- (id)initForJobIssueProgress:(id)a3 forAutoAssetSelector:(id)a4 withAutoAssetUUID:(id)a5 withJobCurrentStatus:(id)a6 withLockForUseError:(id)a7;
- (id)initForJobIssueReply:(id)a3 forAutoAssetSelector:(id)a4 withAutoAssetUUID:(id)a5 withResponseMessage:(id)a6 withResponseError:(id)a7;
- (id)initForReceivedPushNotifications:(id)a3;
- (id)initForSecureOperationsFinished:(id)a3 forSetDescriptor:(id)a4 forAutoAssetDescriptors:(id)a5;
- (id)initForSecureOperationsFinished:(id)a3 forSetDescriptor:(id)a4 forAutoAssetDescriptors:(id)a5 withError:(id)a6;
- (id)initForSetConfiguration:(id)a3;
- (id)initForSetConfiguration:(id)a3 withSetDescriptor:(id)a4;
- (id)initForSetJobClientDomain:(id)a3 forAssetSetIdentifier:(id)a4;
- (id)initForSetJobFound:(id)a3 forAssetSetIdentifier:(id)a4 withSetAtomicInstance:(id)a5 withAutoAssetUUID:(id)a6 withSetJobInformation:(id)a7;
- (id)initForSetJobIssueProgress:(id)a3 forDomainName:(id)a4 forAssetSetIdentifier:(id)a5 withSetAtomicInstance:(id)a6 withAutoAssetUUID:(id)a7 withSetJobInformation:(id)a8 withLockForUseError:(id)a9;
- (id)initForSetJobIssueReply:(id)a3 forDomainName:(id)a4 forAssetSetIdentifier:(id)a5 withAutoAssetUUID:(id)a6 withSetJobInformation:(id)a7 withResponseError:(id)a8;
- (id)initForStagerJobInformation:(id)a3;
- (id)initForStagerJobLookupResults:(id)a3 withBaseForStagingDescriptors:(id)a4 withDetermineError:(id)a5;
- (id)initForStagerJobStart:(id)a3 withStagerSetConfiguration:(id)a4 usingCachedAutoAssetCatalog:(id)a5 usingBaseForPatching:(id)a6 withAssetTargetOSVersion:(id)a7 withAssetTargetBuildVersion:(id)a8;
- (id)initForStagerSetJobStart:(id)a3 withAssetTargetOSVersion:(id)a4 withAssetTargetBuildVersion:(id)a5 withAssetTargetTrainName:(id)a6 withAssetTargetRestoreVersion:(id)a7;
- (id)initForTimerFired;
- (id)initForTriggeredNoActivity;
- (id)initForTriggeredSelectors:(id)a3;
- (id)initForTriggeredSets:(id)a3;
- (int64_t)paramType;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetTargetBuildVersion:(id)a3;
- (void)setAssetTargetOSVersion:(id)a3;
- (void)setAssetTargetRestoreVersion:(id)a3;
- (void)setAssetTargetTrainName:(id)a3;
- (void)setAutoAssetJobID:(id)a3;
- (void)setAutoAssetUUID:(id)a3;
- (void)setBaseForPatchDescriptor:(id)a3;
- (void)setBaseForStagingDescriptors:(id)a3;
- (void)setClientReplyCompletion:(id)a3;
- (void)setClientRequest:(id)a3;
- (void)setClientRequestArray:(id)a3;
- (void)setDownloadingDescriptor:(id)a3;
- (void)setFromAutoAssetJob:(id)a3;
- (void)setJobInformation:(id)a3;
- (void)setOriginalSelector:(id)a3;
- (void)setParamSafeSummary:(id)a3;
- (void)setResponseError:(id)a3;
- (void)setScheduledJobs:(id)a3;
- (void)setSetPolicy:(id)a3;
- (void)setStagedSetLookupResults:(id)a3;
- (void)setStagedToDownloaded:(id)a3;
- (void)updateSafeSummary;
@end

@implementation MADAutoAssetControlManagerParam

- (MADAutoAssetControlManagerParam)initWithClientRequest:(id)a3 reportingProgressThroughProxy:(id)a4 withReplyCompletion:(id)a5
{
  LOWORD(v6) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  3LL,  0LL,  0LL,  0LL,  a3,  a4,  a5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v6,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)_summary
{
  v3 = @"SUMMARY";
  switch(self->_paramType)
  {
    case 0LL:
      return v3;
    case 1LL:
      v4 = objc_alloc(&OBJC_CLASS___NSString);
      v126 = -[NSArray count](self->_scheduledJobs, "count");
      v5 = @"SCHEDULED_JOBS|scheduledJobs:%ld";
      goto LABEL_214;
    case 2LL:
      v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"CLIENT_ID|clientID[%@]",  self->_clientID,  v127,  v128,  v129,  v130,  v131);
      goto LABEL_215;
    case 3LL:
      v8 = objc_alloc(&OBJC_CLASS___NSString);
      clientRequest = self->_clientRequest;
      if (clientRequest)
      {
        clientRequestMessage = self->_clientRequestMessage;
        if (clientRequestMessage)
        {
          int v11 = 1;
          v12 = +[MADAutoAssetControlManager newSummaryForRequestMessage:includingSelector:]( &OBJC_CLASS___MADAutoAssetControlManager,  "newSummaryForRequestMessage:includingSelector:",  clientRequestMessage,  1LL);
          int v13 = 0;
        }

        else
        {
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetClientRequest summary](clientRequest, "summary"));
          int v11 = 0;
          int v13 = 1;
        }
      }

      else
      {
        int v11 = 0;
        int v13 = 0;
        v12 = @"N";
      }

      v120 = @"Y";
      if (self->_setJobInformation) {
        v121 = @"Y";
      }
      else {
        v121 = @"N";
      }
      if (self->_clientProgressProxy) {
        v122 = @"Y";
      }
      else {
        v122 = @"N";
      }
      if (!self->_clientReplyCompletion) {
        v120 = @"N";
      }
      v3 = -[NSString initWithFormat:]( v8,  "initWithFormat:",  @"CLIENT_REQUEST[%@]|setJobInfo:%@|progress:%@|reply:%@",  v12,  v121,  v122,  v120);
      if (v11) {

      }
      if (!v13) {
        return v3;
      }
      goto LABEL_212;
    case 4LL:
      v4 = objc_alloc(&OBJC_CLASS___NSString);
      downloadsInFlight = self->_downloadsInFlight;
      if (downloadsInFlight) {
        downloadsInFlight = -[NSArray count](downloadsInFlight, "count");
      }
      v126 = (const __CFString *)downloadsInFlight;
      v5 = @"DOWNLOADS_IN_FLIGHT|downloadsInFlight:%lld";
      goto LABEL_214;
    case 5LL:
      v4 = objc_alloc(&OBJC_CLASS___NSString);
      autoAssetJobID = self->_autoAssetJobID;
      if (self->_finishedError)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetClientRequest responseErrorSummary:]( &OBJC_CLASS___MADAutoAssetClientRequest,  "responseErrorSummary:"));
        v17 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"DOWNLOAD|jobID[%@]|finished[%@]",  autoAssetJobID,  v16,  v128);
        goto LABEL_162;
      }

      v126 = (const __CFString *)self->_autoAssetJobID;
      v127 = @"SUCCESS";
      v5 = @"DOWNLOAD|jobID[%@]|finished[%@]";
      goto LABEL_214;
    case 6LL:
      v4 = objc_alloc(&OBJC_CLASS___NSString);
      v18 = self->_autoAssetJobID;
      NSUInteger v19 = -[NSDictionary count](self->_autoAssetCatalog, "count");
      NSUInteger v20 = v19;
      if (self->_finishedError)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetClientRequest responseErrorSummary:]( &OBJC_CLASS___MADAutoAssetClientRequest,  "responseErrorSummary:"));
        v17 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"CATALOG|jobID[%@]|count:%lu|finished[%@]",  v18,  v20,  v16);
        goto LABEL_162;
      }

      v127 = (const __CFString *)v19;
      v128 = @"SUCCESS";
      v126 = (const __CFString *)v18;
      v5 = @"CATALOG|jobID[%@]|count:%lu|finished[%@]";
      goto LABEL_214;
    case 7LL:
      v4 = objc_alloc(&OBJC_CLASS___NSString);
      v21 = self->_autoAssetJobID;
      if (self->_finishedError)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetClientRequest responseErrorSummary:]( &OBJC_CLASS___MADAutoAssetClientRequest,  "responseErrorSummary:"));
        v17 = -[NSString initWithFormat:](v4, "initWithFormat:", @"CONFIG|jobID[%@]|finished[%@]", v21, v16, v128);
        goto LABEL_162;
      }

      v126 = (const __CFString *)self->_autoAssetJobID;
      v127 = @"SUCCESS";
      v5 = @"CONFIG|jobID[%@]|finished[%@]";
      goto LABEL_214;
    case 8LL:
      v22 = objc_alloc(&OBJC_CLASS___NSString);
      v23 = self->_autoAssetJobID;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MAAutoAssetProgress summary](self->_downloadProgress, "summary"));
      v17 = -[NSString initWithFormat:]( v22,  "initWithFormat:",  @"PROGRESS|jobID[%@]|progress[%@]",  v23,  v16,  v128);
      goto LABEL_162;
    case 9LL:
      v24 = objc_alloc(&OBJC_CLASS___NSString);
      autoAssetUUID = self->_autoAssetUUID;
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MAAutoAssetSelector summary](self->_autoAssetSelector, "summary"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor summary](self->_downloadingDescriptor, "summary"));
      baseForPatchDescriptor = self->_baseForPatchDescriptor;
      if (baseForPatchDescriptor)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetDescriptor summary](baseForPatchDescriptor, "summary"));
        v3 = -[NSString initWithFormat:]( v24,  "initWithFormat:",  @"PERSISTED|UUID[%@]|selector[%@]|downloading[%@]|baseForPatch[%@]",  autoAssetUUID,  v12,  v26,  v28);
      }

      else
      {
        v33 = -[NSString initWithFormat:]( v24,  "initWithFormat:",  @"PERSISTED|UUID[%@]|selector[%@]|downloading[%@]|baseForPatch[%@]",  autoAssetUUID,  v12,  v26,  @"N",  v130,  v131);
LABEL_129:
        v3 = v33;
      }

- (void)setClientRequest:(id)a3
{
}

- (void)updateSafeSummary
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam _summary](self, "_summary"));
  -[MADAutoAssetControlManagerParam setParamSafeSummary:](self, "setParamSafeSummary:", v3);
}

- (void)setParamSafeSummary:(id)a3
{
}

- (MADAutoAssetClientRequest)clientRequest
{
  return self->_clientRequest;
}

- (NSString)paramSafeSummary
{
  return self->_paramSafeSummary;
}

- (SUCoreConnectMessage)clientRequestMessage
{
  return self->_clientRequestMessage;
}

- (void).cxx_destruct
{
}

- (MADAutoAssetControlManagerParam)initWithClientID:(id)a3
{
  LOWORD(v4) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  2LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetControlManagerParam)initWithSafeSummary:(id)a3
{
  LOWORD(v4) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetControlManagerParam)initWithScheduledJobs:(id)a3
{
  LOWORD(v4) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  1LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetControlManagerParam)initWithDownloadsInFlight:(id)a3
{
  LOWORD(v4) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  4LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForFinishedJobID:(id)a3 withError:(id)a4
{
  LOWORD(v5) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  5LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  a4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForFinishedJobID:(id)a3 withCatalog:(id)a4 withError:(id)a5
{
  LOWORD(v6) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  6LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  a4,  0LL,  a5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v6,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForConfigFinishedJobID:(id)a3 withError:(id)a4
{
  LOWORD(v5) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  7LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  a4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForCurrentJobID:(id)a3 withProgress:(id)a4
{
  LOWORD(v5) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  8LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  a4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForJobFoundSelector:(id)a3 withAutoAssetUUID:(id)a4
{
  LOWORD(v5) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  9LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  a4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForJobIssueProgress:(id)a3 forAutoAssetSelector:(id)a4 withAutoAssetUUID:(id)a5 withJobCurrentStatus:(id)a6 withLockForUseError:(id)a7
{
  LOWORD(v8) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  11LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a7,  0LL,  0LL,  a6,  a4,  a5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v8,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForJobIssueReply:(id)a3 forAutoAssetSelector:(id)a4 withAutoAssetUUID:(id)a5 withResponseMessage:(id)a6 withResponseError:(id)a7
{
  LOWORD(v8) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  10LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  a6,  a7,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4,  a5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v8,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForFinishedJobSelector:(id)a3 withAutoAssetUUID:(id)a4 withSchedulerInvolved:(BOOL)a5 withPotentialNetworkFailure:(BOOL)a6
{
  BYTE1(v7) = a6;
  LOBYTE(v7) = a5;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  12LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  a4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v7,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForTriggeredSelectors:(id)a3
{
  LOWORD(v4) = 1;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  18LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForTriggeredSets:(id)a3
{
  LOWORD(v4) = 1;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  19LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  0LL,  a3);
}

- (id)initForTriggeredNoActivity
{
  LOWORD(v3) = 1;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  20LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForReceivedPushNotifications:(id)a3
{
  LOWORD(v4) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  21LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForSecureOperationsFinished:(id)a3 forSetDescriptor:(id)a4 forAutoAssetDescriptors:(id)a5
{
  LOWORD(v6) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  22LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4,  a5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v6,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForSecureOperationsFinished:(id)a3 forSetDescriptor:(id)a4 forAutoAssetDescriptors:(id)a5 withError:(id)a6
{
  LOWORD(v7) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  22LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a6,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4,  a5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v7,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForAutoAssetDescriptors:(id)a3
{
  LOWORD(v4) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  23LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForStagerSetJobStart:(id)a3 withAssetTargetOSVersion:(id)a4 withAssetTargetBuildVersion:(id)a5 withAssetTargetTrainName:(id)a6 withAssetTargetRestoreVersion:(id)a7
{
  LOWORD(v8) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  24LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4,  a5,  a6,  a7,  0LL,  0LL,  0LL,  0LL,  0LL,  v8,  0LL,  0LL,  a3,  0LL,  0LL,  0LL);
}

- (id)initForStagerJobStart:(id)a3 withStagerSetConfiguration:(id)a4 usingCachedAutoAssetCatalog:(id)a5 usingBaseForPatching:(id)a6 withAssetTargetOSVersion:(id)a7 withAssetTargetBuildVersion:(id)a8
{
  LOWORD(v9) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  25LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a5,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a7,  a8,  0LL,  0LL,  0LL,  0LL,  0LL,  a6,  0LL,  v9,  0LL,  0LL,  a4,  0LL,  0LL,  0LL);
}

- (id)initForStagerJobInformation:(id)a3
{
  LOWORD(v4) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  26LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForStagerJobLookupResults:(id)a3 withBaseForStagingDescriptors:(id)a4 withDetermineError:(id)a5
{
  LOWORD(v6) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  27LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  a5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4,  v6,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForAssetSelector:(id)a3
{
  LOWORD(v4) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  29LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForSetConfiguration:(id)a3
{
  LOWORD(v4) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  30LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  a3,  0LL,  0LL,  0LL);
}

- (id)initForSetConfiguration:(id)a3 withSetDescriptor:(id)a4
{
  LOWORD(v5) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  30LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  a3,  0LL,  0LL,  0LL);
}

- (id)initForTimerFired
{
  LOWORD(v3) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  31LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetControlManagerParam)initWithPromoted:(id)a3 withSetLookupResults:(id)a4
{
  LOWORD(v5) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  28LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  a4,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForSetJobFound:(id)a3 forAssetSetIdentifier:(id)a4 withSetAtomicInstance:(id)a5 withAutoAssetUUID:(id)a6 withSetJobInformation:(id)a7
{
  LOWORD(v8) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  13LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a6,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v8,  a3,  a4,  0LL,  a5,  a7,  0LL);
}

- (id)initForSetJobIssueReply:(id)a3 forDomainName:(id)a4 forAssetSetIdentifier:(id)a5 withAutoAssetUUID:(id)a6 withSetJobInformation:(id)a7 withResponseError:(id)a8
{
  LOWORD(v9) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  14LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  a8,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a6,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v9,  a4,  a5,  0LL,  0LL,  a7,  0LL);
}

- (id)initForSetJobIssueProgress:(id)a3 forDomainName:(id)a4 forAssetSetIdentifier:(id)a5 withSetAtomicInstance:(id)a6 withAutoAssetUUID:(id)a7 withSetJobInformation:(id)a8 withLockForUseError:(id)a9
{
  LOWORD(v10) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  15LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a9,  0LL,  0LL,  0LL,  0LL,  a7,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v10,  a4,  a5,  0LL,  a6,  a8,  0LL);
}

- (id)initForFinishedSetJob:(id)a3 forAssetSetIdentifier:(id)a4 withSetAtomicInstance:(id)a5 withAutoAssetUUID:(id)a6 withSetJobInformation:(id)a7 withSchedulerInvolved:(BOOL)a8 withPotentialNetworkFailure:(BOOL)a9
{
  BYTE1(v10) = a9;
  LOBYTE(v10) = a8;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  17LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a6,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v10,  a3,  a4,  0LL,  a5,  a7,  0LL);
}

- (id)initForSetJobClientDomain:(id)a3 forAssetSetIdentifier:(id)a4
{
  LOWORD(v5) = 0;
  return -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:]( self,  "initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressP roxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID :withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAut oAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAuto AssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName: withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBa seForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClie ntDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:",  16LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v5,  a3,  a4,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetControlManagerParam)initWithParamType:(int64_t)a3 withSafeSummary:(id)a4 withScheduledJobs:(id)a5 withClientID:(id)a6 withClientRequestMessage:(id)a7 withClientProgressProxy:(id)a8 withClientReplyCompletion:(id)a9 withResponseMessage:(id)a10 withResponseError:(id)a11 withDownloadsInFlight:(id)a12 withAutoAssetJobID:(id)a13 withAutoAssetCatalog:(id)a14 withLockForUseError:(id)a15 withFinishedError:(id)a16 withDownloadProgress:(id)a17 withJobCurrentStatus:(id)a18 withAutoAssetSelector:(id)a19 withAutoAssetUUID:(id)a20 withSetOfAutoAssetSelectors:(id)a21 withPushNotifications:(id)a22 withSetDescriptor:(id)a23 withAutoAssetDescriptors:(id)a24 withSetPolicy:(id)a25 withAssetTargetOSVersion:(id)a26 withAssetTargetBuildVersion:(id)a27 withAssetTargetTrainName:(id)a28 withAssetTargetRestoreVersion:(id)a29 withStagedToDownloaded:(id)a30 withStagedLookupResults:(id)a31 withDownloadingDescriptor:(id)a32 withBaseForPatchDescriptor:(id)a33 withBaseForStagingDescriptors:(id)a34 withSchedulerInvolved:(BOOL)a35 withPotentialNetworkFailure:(BOOL)a36 withClientDomainName:(id)a37 withAssetSetIdentifier:(id)a38 withSetConfiguration:(id)a39 withSetAtomicInstance:(id)a40 withSetJobInformation:(id)a41 withTriggeredSets:(id)a42
{
  id v76 = a4;
  id v96 = a5;
  id v107 = a6;
  id v73 = a7;
  id v106 = a7;
  id v74 = a8;
  id v105 = a8;
  id v46 = a9;
  id v104 = a10;
  id v103 = a11;
  id v102 = a12;
  id v101 = a13;
  id v100 = a14;
  id v99 = a15;
  id v98 = a16;
  id v97 = a17;
  id v47 = a18;
  id v95 = a19;
  id v94 = a20;
  id v93 = a21;
  id v92 = a22;
  id v91 = a23;
  id v48 = a24;
  id v90 = a25;
  id v89 = a26;
  id v88 = a27;
  id v87 = a28;
  id v86 = a29;
  id v49 = a30;
  id v50 = a31;
  id v51 = a32;
  id v85 = a33;
  id v84 = a34;
  id v83 = a37;
  id v82 = a38;
  id v81 = a39;
  id v80 = a40;
  id v79 = a41;
  v52 = v107;
  id v78 = a42;
  v109.receiver = self;
  v109.super_class = (Class)&OBJC_CLASS___MADAutoAssetControlManagerParam;
  v53 = -[MADAutoAssetControlManagerParam init](&v109, "init");
  if (v53)
  {
    id v72 = v51;
    if (v47)
    {
      uint64_t v54 = objc_opt_class(&OBJC_CLASS___MANAutoAssetStatus);
      if ((objc_opt_isKindOfClass(v47, v54) & 1) == 0)
      {
        id v55 = v50;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue([v56 oslog]);

        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          -[MADAutoAssetControlManagerParam initWithParamType:withSafeSummary:withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:].cold.1( a3,  v57);
        }

        v52 = v107;
        id v50 = v55;
      }
    }

    id v108 = v49;
    id v58 = v48;
    v53->_paramType = a3;
    objc_storeStrong((id *)&v53->_scheduledJobs, a5);
    objc_storeStrong((id *)&v53->_clientID, a6);
    clientRequest = v53->_clientRequest;
    v53->_clientRequest = 0LL;

    clientRequestArray = v53->_clientRequestArray;
    v53->_clientRequestArray = 0LL;

    objc_storeStrong((id *)&v53->_clientRequestMessage, v73);
    objc_storeStrong((id *)&v53->_clientProgressProxy, v74);
    id v61 = objc_retainBlock(v46);
    id clientReplyCompletion = v53->_clientReplyCompletion;
    v53->_id clientReplyCompletion = v61;

    objc_storeStrong((id *)&v53->_responseMessage, a10);
    objc_storeStrong((id *)&v53->_responseError, a11);
    objc_storeStrong((id *)&v53->_downloadsInFlight, a12);
    objc_storeStrong((id *)&v53->_autoAssetJobID, a13);
    objc_storeStrong((id *)&v53->_autoAssetCatalog, a14);
    objc_storeStrong((id *)&v53->_lockForUseError, a15);
    objc_storeStrong((id *)&v53->_finishedError, a16);
    jobInformation = v53->_jobInformation;
    v53->_jobInformation = 0LL;

    objc_storeStrong((id *)&v53->_setJobInformation, a41);
    objc_storeStrong((id *)&v53->_downloadProgress, a17);
    objc_storeStrong((id *)&v53->_autoAssetStatus, a18);
    objc_storeStrong((id *)&v53->_autoAssetSelector, a19);
    objc_storeStrong((id *)&v53->_autoAssetUUID, a20);
    fromAutoAssetJob = v53->_fromAutoAssetJob;
    v53->_fromAutoAssetJob = 0LL;

    originalSelector = v53->_originalSelector;
    v53->_originalSelector = 0LL;

    objc_storeStrong((id *)&v53->_setOfAutoAssetSelectors, a21);
    objc_storeStrong((id *)&v53->_pushNotifications, a22);
    objc_storeStrong((id *)&v53->_setPolicy, a25);
    objc_storeStrong((id *)&v53->_assetTargetOSVersion, a26);
    objc_storeStrong((id *)&v53->_assetTargetBuildVersion, a27);
    objc_storeStrong((id *)&v53->_assetTargetTrainName, a28);
    objc_storeStrong((id *)&v53->_assetTargetRestoreVersion, a29);
    objc_storeStrong((id *)&v53->_stagedToDownloaded, a30);
    objc_storeStrong((id *)&v53->_stagedSetLookupResults, a31);
    objc_storeStrong((id *)&v53->_downloadingDescriptor, a32);
    objc_storeStrong((id *)&v53->_baseForPatchDescriptor, a33);
    objc_storeStrong((id *)&v53->_baseForStagingDescriptors, a34);
    v53->_schedulerInvolved = a35;
    v53->_potentialNetworkFailure = a36;
    objc_storeStrong((id *)&v53->_clientDomainName, a37);
    objc_storeStrong((id *)&v53->_assetSetIdentifier, a38);
    objc_storeStrong((id *)&v53->_setConfiguration, a39);
    objc_storeStrong((id *)&v53->_setAtomicInstance, a40);
    objc_storeStrong((id *)&v53->_setJobInformation, a41);
    objc_storeStrong((id *)&v53->_triggeredSets, a42);
    objc_storeStrong((id *)&v53->_setDescriptor, a23);
    objc_storeStrong((id *)&v53->_autoAssetDescriptors, a24);
    if (v76)
    {
      NSUInteger v66 = objc_alloc(&OBJC_CLASS___NSString);
      v67 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam _summary](v53, "_summary"));
      v68 = -[NSString initWithFormat:](v66, "initWithFormat:", @"%@+++%@", v76, v67);
      paramSafeSummary = v53->_paramSafeSummary;
      v53->_paramSafeSummary = v68;
    }

    else
    {
      uint64_t v70 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam _summary](v53, "_summary"));
      v67 = v53->_paramSafeSummary;
      v53->_paramSafeSummary = (NSString *)v70;
    }

    id v48 = v58;
    id v49 = v108;
    id v51 = v72;
  }

  return v53;
}

- (MADAutoAssetControlManagerParam)initWithCoder:(id)a3
{
  id v4 = a3;
  v156.receiver = self;
  v156.super_class = (Class)&OBJC_CLASS___MADAutoAssetControlManagerParam;
  uint64_t v5 = -[MADAutoAssetControlManagerParam init](&v156, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"paramSafeSummary"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    paramSafeSummary = v5->_paramSafeSummary;
    v5->_paramSafeSummary = (NSString *)v7;

    v5->_paramType = (int64_t)[v4 decodeInt64ForKey:@"paramType"];
    uint64_t v9 = objc_alloc(&OBJC_CLASS___NSSet);
    v167[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v167[1] = objc_opt_class(&OBJC_CLASS___MADAutoAssetScheduledJob);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v167, 2LL));
    int v11 = -[NSSet initWithArray:](v9, "initWithArray:", v10);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"scheduledJobs"]);
    scheduledJobs = v5->_scheduledJobs;
    v5->_scheduledJobs = (NSArray *)v12;

    id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientID"];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v15;

    id v17 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoAssetClientRequest) forKey:@"clientRequest"];
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    clientRequest = v5->_clientRequest;
    v5->_clientRequest = (MADAutoAssetClientRequest *)v18;

    NSUInteger v20 = objc_alloc(&OBJC_CLASS___NSSet);
    v166[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v166[1] = objc_opt_class(&OBJC_CLASS___MADAutoAssetClientRequest);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v166, 2LL));
    v22 = -[NSSet initWithArray:](v20, "initWithArray:", v21);
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v22 forKey:@"clientRequestArray"]);
    clientRequestArray = v5->_clientRequestArray;
    v5->_clientRequestArray = (NSArray *)v23;

    id v25 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreConnectMessage) forKey:@"clientRequestMessage"];
    uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
    clientRequestMessage = v5->_clientRequestMessage;
    v5->_clientRequestMessage = (SUCoreConnectMessage *)v26;

    id v28 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreConnectClientProxy) forKey:@"clientProgressProxy"];
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    clientProgressProxy = v5->_clientProgressProxy;
    v5->_clientProgressProxy = (SUCoreConnectClientProxy *)v29;

    id v31 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreConnectMessage) forKey:@"responseMessage"];
    uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
    responseMessage = v5->_responseMessage;
    v5->_responseMessage = (SUCoreConnectMessage *)v32;

    id v34 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"responseError"];
    uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
    responseError = v5->_responseError;
    v5->_responseError = (NSError *)v35;

    v37 = objc_alloc(&OBJC_CLASS___NSSet);
    v165[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v165[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v165, 2LL));
    uint64_t v39 = -[NSSet initWithArray:](v37, "initWithArray:", v38);
    uint64_t v40 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v39 forKey:@"downloadsInFlight"]);
    downloadsInFlight = v5->_downloadsInFlight;
    v5->_downloadsInFlight = (NSArray *)v40;

    id v42 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"autoAssetJobID"];
    uint64_t v43 = objc_claimAutoreleasedReturnValue(v42);
    autoAssetJobID = v5->_autoAssetJobID;
    v5->_autoAssetJobID = (NSString *)v43;

    v45 = objc_alloc(&OBJC_CLASS___NSSet);
    v164[0] = objc_opt_class(&OBJC_CLASS___NSData);
    v164[1] = objc_opt_class(&OBJC_CLASS___NSDate);
    v164[2] = objc_opt_class(&OBJC_CLASS___NSString);
    v164[3] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v164[4] = objc_opt_class(&OBJC_CLASS___NSArray);
    v164[5] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v164[6] = objc_opt_class(&OBJC_CLASS___NSSet);
    v164[7] = objc_opt_class(&OBJC_CLASS___NSNull);
    v164[8] = objc_opt_class(&OBJC_CLASS___NSMutableData);
    v164[9] = objc_opt_class(&OBJC_CLASS___NSMutableString);
    v164[10] = objc_opt_class(&OBJC_CLASS___NSMutableArray);
    v164[11] = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    v164[12] = objc_opt_class(&OBJC_CLASS___NSMutableSet);
    id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v164, 13LL));
    id v47 = -[NSSet initWithArray:](v45, "initWithArray:", v46);
    uint64_t v48 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v47 forKey:@"autoAssetCatalog"]);
    autoAssetCatalog = v5->_autoAssetCatalog;
    v5->_autoAssetCatalog = (NSDictionary *)v48;

    id v50 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"lockForUseError"];
    uint64_t v51 = objc_claimAutoreleasedReturnValue(v50);
    lockForUseError = v5->_lockForUseError;
    v5->_lockForUseError = (NSError *)v51;

    id v53 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"finishedError"];
    uint64_t v54 = objc_claimAutoreleasedReturnValue(v53);
    finishedError = v5->_finishedError;
    v5->_finishedError = (NSError *)v54;

    id v56 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoAssetJobInformation) forKey:@"jobInformation"];
    uint64_t v57 = objc_claimAutoreleasedReturnValue(v56);
    jobInformation = v5->_jobInformation;
    v5->_jobInformation = (MADAutoAssetJobInformation *)v57;

    id v59 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoSetJobInformation) forKey:@"setJobInformation"];
    uint64_t v60 = objc_claimAutoreleasedReturnValue(v59);
    setJobInformation = v5->_setJobInformation;
    v5->_setJobInformation = (MADAutoSetJobInformation *)v60;

    id v62 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetProgress) forKey:@"downloadProgress"];
    uint64_t v63 = objc_claimAutoreleasedReturnValue(v62);
    downloadProgress = v5->_downloadProgress;
    v5->_downloadProgress = (MAAutoAssetProgress *)v63;

    id v65 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetStatus) forKey:@"autoAssetStatus"];
    uint64_t v66 = objc_claimAutoreleasedReturnValue(v65);
    autoAssetStatus = v5->_autoAssetStatus;
    v5->_autoAssetStatus = (MAAutoAssetStatus *)v66;

    id v68 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"autoAssetSelector"];
    uint64_t v69 = objc_claimAutoreleasedReturnValue(v68);
    autoAssetSelector = v5->_autoAssetSelector;
    v5->_autoAssetSelector = (MAAutoAssetSelector *)v69;

    id v71 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"autoAssetJobUUID"];
    uint64_t v72 = objc_claimAutoreleasedReturnValue(v71);
    autoAssetUUID = v5->_autoAssetUUID;
    v5->_autoAssetUUID = (NSString *)v72;

    id v74 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoAssetJob) forKey:@"fromAutoAssetJob"];
    uint64_t v75 = objc_claimAutoreleasedReturnValue(v74);
    fromAutoAssetJob = v5->_fromAutoAssetJob;
    v5->_fromAutoAssetJob = (MADAutoAssetJob *)v75;

    id v77 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"originalSelector"];
    uint64_t v78 = objc_claimAutoreleasedReturnValue(v77);
    originalSelector = v5->_originalSelector;
    v5->_originalSelector = (MAAutoAssetSelector *)v78;

    id v80 = objc_alloc(&OBJC_CLASS___NSSet);
    v163[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v163[1] = objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector);
    v163[2] = objc_opt_class(&OBJC_CLASS___NSString);
    id v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v163, 3LL));
    id v82 = -[NSSet initWithArray:](v80, "initWithArray:", v81);
    uint64_t v83 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v82 forKey:@"setOfAutoAssetSelectors"]);
    setOfAutoAssetSelectors = v5->_setOfAutoAssetSelectors;
    v5->_setOfAutoAssetSelectors = (NSArray *)v83;

    id v85 = objc_alloc(&OBJC_CLASS___NSSet);
    v162[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v162[1] = objc_opt_class(&OBJC_CLASS___MAAutoAssetPushNotification);
    id v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v162, 2LL));
    id v87 = -[NSSet initWithArray:](v85, "initWithArray:", v86);
    uint64_t v88 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v87 forKey:@"pushNotifications"]);
    pushNotifications = v5->_pushNotifications;
    v5->_pushNotifications = (NSArray *)v88;

    id v90 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetPolicy) forKey:@"setPolicy"];
    uint64_t v91 = objc_claimAutoreleasedReturnValue(v90);
    setPolicy = v5->_setPolicy;
    v5->_setPolicy = (MANAutoAssetSetPolicy *)v91;

    id v93 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetTargetOSVersion"];
    uint64_t v94 = objc_claimAutoreleasedReturnValue(v93);
    assetTargetOSVersion = v5->_assetTargetOSVersion;
    v5->_assetTargetOSVersion = (NSString *)v94;

    id v96 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetTargetBuildVersion"];
    uint64_t v97 = objc_claimAutoreleasedReturnValue(v96);
    assetTargetBuildVersion = v5->_assetTargetBuildVersion;
    v5->_assetTargetBuildVersion = (NSString *)v97;

    id v99 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetTargetTrainName"];
    uint64_t v100 = objc_claimAutoreleasedReturnValue(v99);
    assetTargetTrainName = v5->_assetTargetTrainName;
    v5->_assetTargetTrainName = (NSString *)v100;

    id v102 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetTargetRestoreVersion"];
    uint64_t v103 = objc_claimAutoreleasedReturnValue(v102);
    assetTargetRestoreVersion = v5->_assetTargetRestoreVersion;
    v5->_assetTargetRestoreVersion = (NSString *)v103;

    id v105 = objc_alloc(&OBJC_CLASS___NSSet);
    v161[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v161[1] = objc_opt_class(&OBJC_CLASS___MADAutoAssetDescriptor);
    id v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v161, 2LL));
    id v107 = -[NSSet initWithArray:](v105, "initWithArray:", v106);
    uint64_t v108 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v107 forKey:@"stagedToDownloaded"]);
    stagedToDownloaded = v5->_stagedToDownloaded;
    v5->_stagedToDownloaded = (NSArray *)v108;

    v110 = objc_alloc(&OBJC_CLASS___NSSet);
    v160[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v160[1] = objc_opt_class(&OBJC_CLASS___MADAutoSetLookupResult);
    v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v160, 2LL));
    v112 = -[NSSet initWithArray:](v110, "initWithArray:", v111);
    uint64_t v113 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v112 forKey:@"stagedSetLookupResults"]);
    stagedSetLookupResults = v5->_stagedSetLookupResults;
    v5->_stagedSetLookupResults = (NSArray *)v113;

    id v115 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoAssetDescriptor) forKey:@"downloadingDescriptor"];
    uint64_t v116 = objc_claimAutoreleasedReturnValue(v115);
    downloadingDescriptor = v5->_downloadingDescriptor;
    v5->_downloadingDescriptor = (MADAutoAssetDescriptor *)v116;

    id v118 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoAssetDescriptor) forKey:@"baseForPatchDescriptor"];
    uint64_t v119 = objc_claimAutoreleasedReturnValue(v118);
    baseForPatchDescriptor = v5->_baseForPatchDescriptor;
    v5->_baseForPatchDescriptor = (MADAutoAssetDescriptor *)v119;

    v121 = objc_alloc(&OBJC_CLASS___NSSet);
    v159[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v159[1] = objc_opt_class(&OBJC_CLASS___MADAutoAssetDescriptor);
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v159, 2LL));
    v123 = -[NSSet initWithArray:](v121, "initWithArray:", v122);
    uint64_t v124 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v123 forKey:@"baseForStagingDescriptors"]);
    baseForStagingDescriptors = v5->_baseForStagingDescriptors;
    v5->_baseForStagingDescriptors = (NSArray *)v124;

    v5->_schedulerInvolved = [v4 decodeBoolForKey:@"schedulerInvolved"];
    v5->_potentialNetworkFailure = [v4 decodeBoolForKey:@"potentialNetworkFailure"];
    id v126 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientDomainName"];
    uint64_t v127 = objc_claimAutoreleasedReturnValue(v126);
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v127;

    id v129 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetSetIdentifier"];
    uint64_t v130 = objc_claimAutoreleasedReturnValue(v129);
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v130;

    id v132 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoSetConfiguration) forKey:@"setConfiguration"];
    uint64_t v133 = objc_claimAutoreleasedReturnValue(v132);
    setConfiguration = v5->_setConfiguration;
    v5->_setConfiguration = (MADAutoSetConfiguration *)v133;

    id v135 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"setAtomicInstance"];
    uint64_t v136 = objc_claimAutoreleasedReturnValue(v135);
    setAtomicInstance = v5->_setAtomicInstance;
    v5->_setAtomicInstance = (NSString *)v136;

    id v138 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoSetJobInformation) forKey:@"setJobInformation"];
    uint64_t v139 = objc_claimAutoreleasedReturnValue(v138);
    __int128 v140 = v5->_setJobInformation;
    v5->_setJobInformation = (MADAutoSetJobInformation *)v139;

    __int128 v141 = objc_alloc(&OBJC_CLASS___NSSet);
    v158[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v158[1] = objc_opt_class(&OBJC_CLASS___MADAutoSetSchedulerTriggered);
    v158[2] = objc_opt_class(&OBJC_CLASS___NSString);
    v158[3] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetPolicy);
    __int128 v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v158, 4LL));
    v143 = -[NSSet initWithArray:](v141, "initWithArray:", v142);
    uint64_t v144 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v143 forKey:@"triggeredSets"]);
    triggeredSets = v5->_triggeredSets;
    v5->_triggeredSets = (NSArray *)v144;

    id v146 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoSetDescriptor) forKey:@"setDescriptor"];
    uint64_t v147 = objc_claimAutoreleasedReturnValue(v146);
    setDescriptor = v5->_setDescriptor;
    v5->_setDescriptor = (MADAutoSetDescriptor *)v147;

    v149 = objc_alloc(&OBJC_CLASS___NSSet);
    v157[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v157[1] = objc_opt_class(&OBJC_CLASS___MADAutoAssetDescriptor);
    v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v157, 2LL));
    v151 = -[NSSet initWithArray:](v149, "initWithArray:", v150);
    uint64_t v152 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v151 forKey:@"autoAssetDescriptors"]);
    autoAssetDescriptors = v5->_autoAssetDescriptors;
    v5->_autoAssetDescriptors = (NSArray *)v152;

    id clientReplyCompletion = v5->_clientReplyCompletion;
    v5->_id clientReplyCompletion = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam paramSafeSummary](self, "paramSafeSummary"));
  [v4 encodeObject:v5 forKey:@"paramSafeSummary"];

  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MADAutoAssetControlManagerParam paramType](self, "paramType"),  @"paramType");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam scheduledJobs](self, "scheduledJobs"));
  [v4 encodeObject:v6 forKey:@"scheduledJobs"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam clientID](self, "clientID"));
  [v4 encodeObject:v7 forKey:@"clientID"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam clientRequest](self, "clientRequest"));
  [v4 encodeObject:v8 forKey:@"clientRequest"];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam clientRequestArray](self, "clientRequestArray"));
  [v4 encodeObject:v9 forKey:@"clientRequestArray"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam clientRequestMessage](self, "clientRequestMessage"));
  [v4 encodeObject:v10 forKey:@"clientRequestMessage"];

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam clientProgressProxy](self, "clientProgressProxy"));
  [v4 encodeObject:v11 forKey:@"clientProgressProxy"];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam responseMessage](self, "responseMessage"));
  [v4 encodeObject:v12 forKey:@"responseMessage"];

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam responseError](self, "responseError"));
  [v4 encodeObject:v13 forKey:@"responseError"];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam downloadsInFlight](self, "downloadsInFlight"));
  [v4 encodeObject:v14 forKey:@"downloadsInFlight"];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam autoAssetJobID](self, "autoAssetJobID"));
  [v4 encodeObject:v15 forKey:@"autoAssetJobID"];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam autoAssetCatalog](self, "autoAssetCatalog"));
  [v4 encodeObject:v16 forKey:@"autoAssetCatalog"];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam lockForUseError](self, "lockForUseError"));
  [v4 encodeObject:v17 forKey:@"lockForUseError"];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam finishedError](self, "finishedError"));
  [v4 encodeObject:v18 forKey:@"finishedError"];

  NSUInteger v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam jobInformation](self, "jobInformation"));
  [v4 encodeObject:v19 forKey:@"jobInformation"];

  NSUInteger v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam setJobInformation](self, "setJobInformation"));
  [v4 encodeObject:v20 forKey:@"setJobInformation"];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam downloadProgress](self, "downloadProgress"));
  [v4 encodeObject:v21 forKey:@"downloadProgress"];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam autoAssetStatus](self, "autoAssetStatus"));
  [v4 encodeObject:v22 forKey:@"autoAssetStatus"];

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam autoAssetSelector](self, "autoAssetSelector"));
  [v4 encodeObject:v23 forKey:@"autoAssetSelector"];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam autoAssetUUID](self, "autoAssetUUID"));
  [v4 encodeObject:v24 forKey:@"autoAssetJobUUID"];

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam fromAutoAssetJob](self, "fromAutoAssetJob"));
  [v4 encodeObject:v25 forKey:@"fromAutoAssetJob"];

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam originalSelector](self, "originalSelector"));
  [v4 encodeObject:v26 forKey:@"originalSelector"];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam setOfAutoAssetSelectors](self, "setOfAutoAssetSelectors"));
  [v4 encodeObject:v27 forKey:@"setOfAutoAssetSelectors"];

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam pushNotifications](self, "pushNotifications"));
  [v4 encodeObject:v28 forKey:@"pushNotifications"];

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam setPolicy](self, "setPolicy"));
  [v4 encodeObject:v29 forKey:@"setPolicy"];

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam assetTargetOSVersion](self, "assetTargetOSVersion"));
  [v4 encodeObject:v30 forKey:@"assetTargetOSVersion"];

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam assetTargetBuildVersion](self, "assetTargetBuildVersion"));
  [v4 encodeObject:v31 forKey:@"assetTargetBuildVersion"];

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam assetTargetTrainName](self, "assetTargetTrainName"));
  [v4 encodeObject:v32 forKey:@"assetTargetTrainName"];

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam assetTargetRestoreVersion](self, "assetTargetRestoreVersion"));
  [v4 encodeObject:v33 forKey:@"assetTargetRestoreVersion"];

  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam stagedToDownloaded](self, "stagedToDownloaded"));
  [v4 encodeObject:v34 forKey:@"stagedToDownloaded"];

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam stagedSetLookupResults](self, "stagedSetLookupResults"));
  [v4 encodeObject:v35 forKey:@"stagedSetLookupResults"];

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam downloadingDescriptor](self, "downloadingDescriptor"));
  [v4 encodeObject:v36 forKey:@"downloadingDescriptor"];

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam baseForPatchDescriptor](self, "baseForPatchDescriptor"));
  [v4 encodeObject:v37 forKey:@"baseForPatchDescriptor"];

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam baseForStagingDescriptors](self, "baseForStagingDescriptors"));
  [v4 encodeObject:v38 forKey:@"baseForStagingDescriptors"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetControlManagerParam schedulerInvolved](self, "schedulerInvolved"),  @"schedulerInvolved");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetControlManagerParam potentialNetworkFailure](self, "potentialNetworkFailure"),  @"potentialNetworkFailure");
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam clientDomainName](self, "clientDomainName"));
  [v4 encodeObject:v39 forKey:@"clientDomainName"];

  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam assetSetIdentifier](self, "assetSetIdentifier"));
  [v4 encodeObject:v40 forKey:@"assetSetIdentifier"];

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam setConfiguration](self, "setConfiguration"));
  [v4 encodeObject:v41 forKey:@"setConfiguration"];

  id v42 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam setAtomicInstance](self, "setAtomicInstance"));
  [v4 encodeObject:v42 forKey:@"setAtomicInstance"];

  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam setJobInformation](self, "setJobInformation"));
  [v4 encodeObject:v43 forKey:@"setJobInformation"];

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam triggeredSets](self, "triggeredSets"));
  [v4 encodeObject:v44 forKey:@"triggeredSets"];

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam setDescriptor](self, "setDescriptor"));
  [v4 encodeObject:v45 forKey:@"setDescriptor"];

  id v46 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetControlManagerParam autoAssetDescriptors](self, "autoAssetDescriptors"));
  [v4 encodeObject:v46 forKey:@"autoAssetDescriptors"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)paramType
{
  return self->_paramType;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSArray)scheduledJobs
{
  return self->_scheduledJobs;
}

- (void)setScheduledJobs:(id)a3
{
}

- (NSArray)clientRequestArray
{
  return self->_clientRequestArray;
}

- (void)setClientRequestArray:(id)a3
{
}

- (SUCoreConnectClientProxy)clientProgressProxy
{
  return self->_clientProgressProxy;
}

- (SUCoreConnectMessage)responseMessage
{
  return self->_responseMessage;
}

- (NSError)responseError
{
  return self->_responseError;
}

- (void)setResponseError:(id)a3
{
}

- (NSArray)downloadsInFlight
{
  return self->_downloadsInFlight;
}

- (NSString)autoAssetJobID
{
  return self->_autoAssetJobID;
}

- (void)setAutoAssetJobID:(id)a3
{
}

- (NSDictionary)autoAssetCatalog
{
  return self->_autoAssetCatalog;
}

- (NSError)lockForUseError
{
  return self->_lockForUseError;
}

- (NSError)finishedError
{
  return self->_finishedError;
}

- (MADAutoAssetJobInformation)jobInformation
{
  return self->_jobInformation;
}

- (void)setJobInformation:(id)a3
{
}

- (MAAutoAssetProgress)downloadProgress
{
  return self->_downloadProgress;
}

- (MAAutoAssetStatus)autoAssetStatus
{
  return self->_autoAssetStatus;
}

- (MAAutoAssetSelector)autoAssetSelector
{
  return self->_autoAssetSelector;
}

- (NSString)autoAssetUUID
{
  return self->_autoAssetUUID;
}

- (void)setAutoAssetUUID:(id)a3
{
}

- (MADAutoAssetJob)fromAutoAssetJob
{
  return self->_fromAutoAssetJob;
}

- (void)setFromAutoAssetJob:(id)a3
{
}

- (MAAutoAssetSelector)originalSelector
{
  return self->_originalSelector;
}

- (void)setOriginalSelector:(id)a3
{
}

- (NSArray)setOfAutoAssetSelectors
{
  return self->_setOfAutoAssetSelectors;
}

- (NSArray)pushNotifications
{
  return self->_pushNotifications;
}

- (MANAutoAssetSetPolicy)setPolicy
{
  return self->_setPolicy;
}

- (void)setSetPolicy:(id)a3
{
}

- (NSString)assetTargetOSVersion
{
  return self->_assetTargetOSVersion;
}

- (void)setAssetTargetOSVersion:(id)a3
{
}

- (NSString)assetTargetBuildVersion
{
  return self->_assetTargetBuildVersion;
}

- (void)setAssetTargetBuildVersion:(id)a3
{
}

- (NSString)assetTargetTrainName
{
  return self->_assetTargetTrainName;
}

- (void)setAssetTargetTrainName:(id)a3
{
}

- (NSString)assetTargetRestoreVersion
{
  return self->_assetTargetRestoreVersion;
}

- (void)setAssetTargetRestoreVersion:(id)a3
{
}

- (NSArray)stagedToDownloaded
{
  return self->_stagedToDownloaded;
}

- (void)setStagedToDownloaded:(id)a3
{
}

- (NSArray)stagedSetLookupResults
{
  return self->_stagedSetLookupResults;
}

- (void)setStagedSetLookupResults:(id)a3
{
}

- (MADAutoAssetDescriptor)downloadingDescriptor
{
  return self->_downloadingDescriptor;
}

- (void)setDownloadingDescriptor:(id)a3
{
}

- (MADAutoAssetDescriptor)baseForPatchDescriptor
{
  return self->_baseForPatchDescriptor;
}

- (void)setBaseForPatchDescriptor:(id)a3
{
}

- (NSArray)baseForStagingDescriptors
{
  return self->_baseForStagingDescriptors;
}

- (void)setBaseForStagingDescriptors:(id)a3
{
}

- (BOOL)schedulerInvolved
{
  return self->_schedulerInvolved;
}

- (BOOL)potentialNetworkFailure
{
  return self->_potentialNetworkFailure;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (MADAutoSetConfiguration)setConfiguration
{
  return self->_setConfiguration;
}

- (NSString)setAtomicInstance
{
  return self->_setAtomicInstance;
}

- (MADAutoSetJobInformation)setJobInformation
{
  return self->_setJobInformation;
}

- (NSArray)triggeredSets
{
  return self->_triggeredSets;
}

- (MADAutoSetDescriptor)setDescriptor
{
  return self->_setDescriptor;
}

- (NSArray)autoAssetDescriptors
{
  return self->_autoAssetDescriptors;
}

- (id)clientReplyCompletion
{
  return self->_clientReplyCompletion;
}

- (void)setClientReplyCompletion:(id)a3
{
}

- (void)initWithParamType:(uint64_t)a1 withSafeSummary:(os_log_s *)a2 withScheduledJobs:withClientID:withClientRequestMessage:withClientProgressProxy:withClientReplyCompletion:withResponseMessage:withResponseError:withDownloadsInFlight:withAutoAssetJobID:withAutoAssetCatalog:withLockForUseError:withFinishedError:withDownloadProgress:withJobCurrentStatus:withAutoAssetSelector:withAutoAssetUUID:withSetOfAutoAssetSelectors:withPushNotifications:withSetDescriptor:withAutoAssetDescriptors:withSetPolicy:withAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withStagedToDownloaded:withStagedLookupResults:withDownloadingDescriptor:withBaseForPatchDescriptor:withBaseForStagingDescriptors:withSchedulerInvolved:withPotentialNetworkFailure:withClientDomainName:withAssetSetIdentifier:withSetConfiguration:withSetAtomicInstance:withSetJobInformation:withTriggeredSets:.cold.1( uint64_t a1,  os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "{MADAutoAssetControlManagerParam-initWithParamType} WARNING: wrong class provided as jobCurrentStatus paramType:%ld",  (uint8_t *)&v2,  0xCu);
}

@end