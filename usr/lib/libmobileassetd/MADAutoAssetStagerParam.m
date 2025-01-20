@interface MADAutoAssetStagerParam
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetSelector)assetSelector;
- (MADAutoAssetClientRequest)stagingClientRequest;
- (MADAutoAssetDescriptor)downloadedDescriptor;
- (MADAutoAssetJobInformation)jobInformation;
- (MADAutoAssetStagerParam)initWithAlreadyDownloadedDescriptors:(id)a3 withSetConfigurations:(id)a4 withSetTargets:(id)a5 withScheduledJobs:(id)a6;
- (MADAutoAssetStagerParam)initWithAssetSelector:(id)a3;
- (MADAutoAssetStagerParam)initWithAssetType:(id)a3;
- (MADAutoAssetStagerParam)initWithAutoAssetCatalog:(id)a3 withBaseForStagingDescriptors:(id)a4 withOperationError:(id)a5;
- (MADAutoAssetStagerParam)initWithCoder:(id)a3;
- (MADAutoAssetStagerParam)initWithJobInformation:(id)a3 withDownloadedDescriptor:(id)a4 withOperationError:(id)a5;
- (MADAutoAssetStagerParam)initWithParamType:(int64_t)a3 withSafeSummary:(id)a4 withStagingClientRequest:(id)a5 withBaseForStagingDescriptors:(id)a6 withJobInformation:(id)a7 withAutoAssetCatalog:(id)a8 withOperationError:(id)a9 withAssetType:(id)a10 withAssetSelector:(id)a11 withSetIdentifierConfiguration:(id)a12 withTimerUUID:(id)a13 withAlreadyDownloaded:(id)a14 withSetConfigurations:(id)a15 withSetTargets:(id)a16 withScheduledJobs:(id)a17 withDownloadedDescriptor:(id)a18;
- (MADAutoAssetStagerParam)initWithSafeSummary:(id)a3;
- (MADAutoAssetStagerParam)initWithSetConfiguration:(id)a3;
- (MADAutoAssetStagerParam)initWithStagingClientRequest:(id)a3;
- (MADAutoAssetStagerParam)initWithTimerUUID:(id)a3;
- (MADAutoSetConfiguration)setIdentifierConfiguration;
- (NSArray)alreadyDownloaded;
- (NSArray)baseForStagingDescriptors;
- (NSArray)scheduledJobs;
- (NSArray)setConfigurations;
- (NSArray)setTargets;
- (NSDictionary)autoAssetCatalog;
- (NSError)operationError;
- (NSString)assetType;
- (NSString)paramSafeSummary;
- (NSString)timerUUID;
- (id)_summary;
- (int64_t)paramType;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseForStagingDescriptors:(id)a3;
- (void)setParamSafeSummary:(id)a3;
- (void)setStagingClientRequest:(id)a3;
- (void)updateSafeSummary;
@end

@implementation MADAutoAssetStagerParam

- (MADAutoAssetStagerParam)initWithStagingClientRequest:(id)a3
{
  return -[MADAutoAssetStagerParam initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:withAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTimerUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:]( self,  "initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:w ithAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTim erUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:",  1LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)_summary
{
  v5 = @"SUMMARY";
  switch(-[MADAutoAssetStagerParam paramType](self, "paramType"))
  {
    case 0LL:
      return v5;
    case 1LL:
      v6 = objc_alloc(&OBJC_CLASS___NSString);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam stagingClientRequest](self, "stagingClientRequest"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
      v9 = -[NSString initWithFormat:]( v6,  "initWithFormat:",  @"STAGING_CLIENT_REQUEST|stagingClientRequest:%@",  v8);
      goto LABEL_11;
    case 2LL:
      v10 = objc_alloc(&OBJC_CLASS___NSString);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam jobInformation](self, "jobInformation"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam downloadedDescriptor](self, "downloadedDescriptor"));
      if (v13)
      {
        p_ivars = (__objc2_ivar_list **)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam downloadedDescriptor](self, "downloadedDescriptor"));
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue([p_ivars summary]);
      }

      else
      {
        v3 = @"N";
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam operationError](self, "operationError"));
      if (v29)
      {
        v30 = objc_alloc(&OBJC_CLASS___NSString);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam operationError](self, "operationError"));
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetClientRequest responseErrorSummary:]( &OBJC_CLASS___MADAutoAssetClientRequest,  "responseErrorSummary:",  v31));
        v33 = -[NSString initWithFormat:](v30, "initWithFormat:", @"operationError:%@", v32);
        v5 = -[NSString initWithFormat:]( v10,  "initWithFormat:",  @"STAGING_JOB_INFORMATION|jobInformation:%@|downloadedDescriptor:%@[%@]",  v12,  v3,  v33);
      }

      else
      {
        v5 = -[NSString initWithFormat:]( v10,  "initWithFormat:",  @"STAGING_JOB_INFORMATION|jobInformation:%@|downloadedDescriptor:%@[%@]",  v12,  v3,  @"SUCCESS");
      }

      if (v13) {
        goto LABEL_24;
      }
      goto LABEL_25;
    case 3LL:
      p_ivars = &MobileAssetKeyManager__metaData.ivars;
      v14 = objc_alloc(&OBJC_CLASS___NSString);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam autoAssetCatalog](self, "autoAssetCatalog"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 safeSummary]);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam operationError](self, "operationError"));
      if (v13)
      {
        v15 = objc_alloc(&OBJC_CLASS___NSString);
        p_ivars = (__objc2_ivar_list **)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam operationError](self, "operationError"));
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetClientRequest responseErrorSummary:]( &OBJC_CLASS___MADAutoAssetClientRequest,  "responseErrorSummary:",  p_ivars));
        v16 = -[NSString initWithFormat:](v15, "initWithFormat:", @"operationError:%@", v3);
      }

      else
      {
        v16 = @"SUCCESS";
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam baseForStagingDescriptors](self, "baseForStagingDescriptors"));
      v5 = -[NSString initWithFormat:]( v14,  "initWithFormat:",  @"STAGING_AUTO_ASSET_CATALOG|autoAssetCatalog:%@[%@]|baseForPatching:%ld",  v12,  v16,  [v34 count]);

      if (!v13) {
        goto LABEL_25;
      }

LABEL_24:
LABEL_25:

      goto LABEL_26;
    case 4LL:
      v17 = objc_alloc(&OBJC_CLASS___NSString);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam assetType](self, "assetType"));
      v18 = -[NSString initWithFormat:](v17, "initWithFormat:", @"STAGING_ASSET_TYPE|assetType:%@", v7);
      goto LABEL_13;
    case 5LL:
      v19 = objc_alloc(&OBJC_CLASS___NSString);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam assetSelector](self, "assetSelector"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
      v9 = -[NSString initWithFormat:](v19, "initWithFormat:", @"STAGING_ASSET_SELECTOR|assetSelector:%@", v8);
      goto LABEL_11;
    case 6LL:
      v20 = objc_alloc(&OBJC_CLASS___NSString);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam setIdentifierConfiguration](self, "setIdentifierConfiguration"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
      v9 = -[NSString initWithFormat:](v20, "initWithFormat:", @"SET_CONFIGURATION|setConfiguration:%@", v8);
LABEL_11:
      v5 = v9;

      goto LABEL_14;
    case 7LL:
      v21 = objc_alloc(&OBJC_CLASS___NSString);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam timerUUID](self, "timerUUID"));
      v18 = -[NSString initWithFormat:](v21, "initWithFormat:", @"TIMER_UUID|timerUUID:%@", v7);
LABEL_13:
      v5 = v18;
LABEL_14:

      break;
    case 8LL:
      v22 = objc_alloc(&OBJC_CLASS___NSString);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam alreadyDownloaded](self, "alreadyDownloaded"));
      id v23 = [v11 count];
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam setConfigurations](self, "setConfigurations"));
      id v25 = [v24 count];
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam setTargets](self, "setTargets"));
      id v27 = [v26 count];
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam scheduledJobs](self, "scheduledJobs"));
      v5 = -[NSString initWithFormat:]( v22,  "initWithFormat:",  @"STAGING_ALREADY_DOWNLOADED|alreadyDownloaded:%ld|setConfigurations:%ld|setTargets:%ld|scheduledJobs:%ld",  v23,  v25,  v27,  [v28 count]);

LABEL_26:
      break;
    default:
      v5 = @"UNKNOWN_TYPE";
      break;
  }

  return v5;
}

- (int64_t)paramType
{
  return self->_paramType;
}

- (MADAutoAssetClientRequest)stagingClientRequest
{
  return self->_stagingClientRequest;
}

- (NSString)paramSafeSummary
{
  return self->_paramSafeSummary;
}

- (void).cxx_destruct
{
}

- (MADAutoAssetStagerParam)initWithSafeSummary:(id)a3
{
  return -[MADAutoAssetStagerParam initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:withAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTimerUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:]( self,  "initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:w ithAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTim erUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:",  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetStagerParam)initWithJobInformation:(id)a3 withDownloadedDescriptor:(id)a4 withOperationError:(id)a5
{
  return -[MADAutoAssetStagerParam initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:withAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTimerUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:]( self,  "initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:w ithAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTim erUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:",  2LL,  0LL,  0LL,  0LL,  a3,  0LL,  a5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4);
}

- (MADAutoAssetStagerParam)initWithAutoAssetCatalog:(id)a3 withBaseForStagingDescriptors:(id)a4 withOperationError:(id)a5
{
  return -[MADAutoAssetStagerParam initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:withAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTimerUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:]( self,  "initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:w ithAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTim erUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:",  3LL,  0LL,  0LL,  a4,  0LL,  a3,  a5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetStagerParam)initWithAssetType:(id)a3
{
  return -[MADAutoAssetStagerParam initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:withAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTimerUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:]( self,  "initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:w ithAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTim erUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:",  4LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetStagerParam)initWithAssetSelector:(id)a3
{
  return -[MADAutoAssetStagerParam initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:withAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTimerUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:]( self,  "initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:w ithAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTim erUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:",  5LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetStagerParam)initWithSetConfiguration:(id)a3
{
  return -[MADAutoAssetStagerParam initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:withAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTimerUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:]( self,  "initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:w ithAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTim erUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:",  6LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetStagerParam)initWithTimerUUID:(id)a3
{
  return -[MADAutoAssetStagerParam initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:withAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTimerUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:]( self,  "initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:w ithAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTim erUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:",  7LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetStagerParam)initWithAlreadyDownloadedDescriptors:(id)a3 withSetConfigurations:(id)a4 withSetTargets:(id)a5 withScheduledJobs:(id)a6
{
  return -[MADAutoAssetStagerParam initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:withAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTimerUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:]( self,  "initWithParamType:withSafeSummary:withStagingClientRequest:withBaseForStagingDescriptors:withJobInformation:w ithAutoAssetCatalog:withOperationError:withAssetType:withAssetSelector:withSetIdentifierConfiguration:withTim erUUID:withAlreadyDownloaded:withSetConfigurations:withSetTargets:withScheduledJobs:withDownloadedDescriptor:",  8LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  a4,  a5,  a6,  0LL);
}

- (MADAutoAssetStagerParam)initWithParamType:(int64_t)a3 withSafeSummary:(id)a4 withStagingClientRequest:(id)a5 withBaseForStagingDescriptors:(id)a6 withJobInformation:(id)a7 withAutoAssetCatalog:(id)a8 withOperationError:(id)a9 withAssetType:(id)a10 withAssetSelector:(id)a11 withSetIdentifierConfiguration:(id)a12 withTimerUUID:(id)a13 withAlreadyDownloaded:(id)a14 withSetConfigurations:(id)a15 withSetTargets:(id)a16 withScheduledJobs:(id)a17 withDownloadedDescriptor:(id)a18
{
  id v52 = a4;
  id v37 = a5;
  id v51 = a5;
  id v50 = a6;
  id v38 = a7;
  id v49 = a7;
  id v39 = a8;
  id v48 = a8;
  id v47 = a9;
  id v46 = a10;
  id v45 = a11;
  id v44 = a12;
  id v43 = a13;
  id v42 = a14;
  id v41 = a15;
  id v22 = a16;
  id v23 = a17;
  id v24 = a18;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___MADAutoAssetStagerParam;
  id v25 = -[MADAutoAssetStagerParam init](&v53, "init");
  v26 = v25;
  if (v25)
  {
    v25->_paramType = a3;
    objc_storeStrong((id *)&v25->_stagingClientRequest, v37);
    objc_storeStrong((id *)&v26->_baseForStagingDescriptors, a6);
    objc_storeStrong((id *)&v26->_jobInformation, v38);
    objc_storeStrong((id *)&v26->_autoAssetCatalog, v39);
    objc_storeStrong((id *)&v26->_operationError, a9);
    objc_storeStrong((id *)&v26->_assetType, a10);
    objc_storeStrong((id *)&v26->_assetSelector, a11);
    objc_storeStrong((id *)&v26->_setIdentifierConfiguration, a12);
    objc_storeStrong((id *)&v26->_alreadyDownloaded, a14);
    objc_storeStrong((id *)&v26->_setConfigurations, a15);
    objc_storeStrong((id *)&v26->_timerUUID, a13);
    objc_storeStrong((id *)&v26->_setTargets, a16);
    objc_storeStrong((id *)&v26->_scheduledJobs, a17);
    objc_storeStrong((id *)&v26->_downloadedDescriptor, a18);
    if (v52)
    {
      id v27 = v24;
      id v28 = v23;
      v29 = objc_alloc(&OBJC_CLASS___NSString);
      v30 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam _summary](v26, "_summary"));
      v31 = v29;
      id v23 = v28;
      id v24 = v27;
      v32 = -[NSString initWithFormat:](v31, "initWithFormat:", @"%@+++%@", v52, v30);
      paramSafeSummary = v26->_paramSafeSummary;
      v26->_paramSafeSummary = v32;
    }

    else
    {
      uint64_t v34 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam _summary](v26, "_summary"));
      v30 = v26->_paramSafeSummary;
      v26->_paramSafeSummary = (NSString *)v34;
    }
  }

  return v26;
}

- (MADAutoAssetStagerParam)initWithCoder:(id)a3
{
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)&OBJC_CLASS___MADAutoAssetStagerParam;
  v5 = -[MADAutoAssetStagerParam init](&v64, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"paramSafeSummary"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    paramSafeSummary = v5->_paramSafeSummary;
    v5->_paramSafeSummary = (NSString *)v7;

    v5->_paramType = (int64_t)[v4 decodeInt64ForKey:@"paramType"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoAssetClientRequest) forKey:@"stagingClientRequest"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    stagingClientRequest = v5->_stagingClientRequest;
    v5->_stagingClientRequest = (MADAutoAssetClientRequest *)v10;

    v12 = objc_alloc(&OBJC_CLASS___NSSet);
    v70[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v70[1] = objc_opt_class(&OBJC_CLASS___MADAutoAssetDescriptor);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v70, 2LL));
    v14 = -[NSSet initWithArray:](v12, "initWithArray:", v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v14 forKey:@"baseForStagingDescriptors"]);
    baseForStagingDescriptors = v5->_baseForStagingDescriptors;
    v5->_baseForStagingDescriptors = (NSArray *)v15;

    id v17 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoAssetJobInformation) forKey:@"jobInformation"];
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    jobInformation = v5->_jobInformation;
    v5->_jobInformation = (MADAutoAssetJobInformation *)v18;

    v20 = objc_alloc(&OBJC_CLASS___NSSet);
    v69[0] = objc_opt_class(&OBJC_CLASS___NSData);
    v69[1] = objc_opt_class(&OBJC_CLASS___NSDate);
    v69[2] = objc_opt_class(&OBJC_CLASS___NSString);
    v69[3] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v69[4] = objc_opt_class(&OBJC_CLASS___NSArray);
    v69[5] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v69[6] = objc_opt_class(&OBJC_CLASS___NSSet);
    v69[7] = objc_opt_class(&OBJC_CLASS___NSNull);
    v69[8] = objc_opt_class(&OBJC_CLASS___NSMutableData);
    v69[9] = objc_opt_class(&OBJC_CLASS___NSMutableString);
    v69[10] = objc_opt_class(&OBJC_CLASS___NSMutableArray);
    v69[11] = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    v69[12] = objc_opt_class(&OBJC_CLASS___NSMutableSet);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 13LL));
    id v22 = -[NSSet initWithArray:](v20, "initWithArray:", v21);
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v22 forKey:@"autoAssetCatalog"]);
    autoAssetCatalog = v5->_autoAssetCatalog;
    v5->_autoAssetCatalog = (NSDictionary *)v23;

    id v25 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"operationError"];
    uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
    operationError = v5->_operationError;
    v5->_operationError = (NSError *)v26;

    id v28 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetType"];
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v29;

    id v31 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"assetSelector"];
    uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v32;

    id v34 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoSetConfiguration) forKey:@"setIdentifierConfiguration"];
    uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
    setIdentifierConfiguration = v5->_setIdentifierConfiguration;
    v5->_setIdentifierConfiguration = (MADAutoSetConfiguration *)v35;

    id v37 = objc_alloc(&OBJC_CLASS___NSSet);
    v68[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v68[1] = objc_opt_class(&OBJC_CLASS___MADAutoAssetDescriptor);
    id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v68, 2LL));
    id v39 = -[NSSet initWithArray:](v37, "initWithArray:", v38);
    uint64_t v40 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v39 forKey:@"alreadyDownloaded"]);
    alreadyDownloaded = v5->_alreadyDownloaded;
    v5->_alreadyDownloaded = (NSArray *)v40;

    id v42 = objc_alloc(&OBJC_CLASS___NSSet);
    v67[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v67[1] = objc_opt_class(&OBJC_CLASS___MADAutoSetConfiguration);
    id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v67, 2LL));
    id v44 = -[NSSet initWithArray:](v42, "initWithArray:", v43);
    uint64_t v45 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v44 forKey:@"setConfigurations"]);
    setConfigurations = v5->_setConfigurations;
    v5->_setConfigurations = (NSArray *)v45;

    id v47 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"timerUUID"];
    uint64_t v48 = objc_claimAutoreleasedReturnValue(v47);
    timerUUID = v5->_timerUUID;
    v5->_timerUUID = (NSString *)v48;

    id v50 = objc_alloc(&OBJC_CLASS___NSSet);
    v66[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v66[1] = objc_opt_class(&OBJC_CLASS___MADAutoSetTarget);
    id v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 2LL));
    id v52 = -[NSSet initWithArray:](v50, "initWithArray:", v51);
    uint64_t v53 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v52 forKey:@"setTargets"]);
    setTargets = v5->_setTargets;
    v5->_setTargets = (NSArray *)v53;

    v55 = objc_alloc(&OBJC_CLASS___NSSet);
    v65[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v65[1] = objc_opt_class(&OBJC_CLASS___MADAutoAssetScheduledJob);
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v65, 2LL));
    v57 = -[NSSet initWithArray:](v55, "initWithArray:", v56);
    uint64_t v58 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v57 forKey:@"scheduledJobs"]);
    scheduledJobs = v5->_scheduledJobs;
    v5->_scheduledJobs = (NSArray *)v58;

    id v60 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoAssetDescriptor) forKey:@"downloadedDescriptor"];
    uint64_t v61 = objc_claimAutoreleasedReturnValue(v60);
    downloadedDescriptor = v5->_downloadedDescriptor;
    v5->_downloadedDescriptor = (MADAutoAssetDescriptor *)v61;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam paramSafeSummary](self, "paramSafeSummary"));
  [v4 encodeObject:v5 forKey:@"paramSafeSummary"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[MADAutoAssetStagerParam paramType](self, "paramType"), @"paramType");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam stagingClientRequest](self, "stagingClientRequest"));
  [v4 encodeObject:v6 forKey:@"stagingClientRequest"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam baseForStagingDescriptors](self, "baseForStagingDescriptors"));
  [v4 encodeObject:v7 forKey:@"baseForStagingDescriptors"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam jobInformation](self, "jobInformation"));
  [v4 encodeObject:v8 forKey:@"jobInformation"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam autoAssetCatalog](self, "autoAssetCatalog"));
  [v4 encodeObject:v9 forKey:@"autoAssetCatalog"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam operationError](self, "operationError"));
  [v4 encodeObject:v10 forKey:@"operationError"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam assetType](self, "assetType"));
  [v4 encodeObject:v11 forKey:@"assetType"];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam assetSelector](self, "assetSelector"));
  [v4 encodeObject:v12 forKey:@"assetSelector"];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam setIdentifierConfiguration](self, "setIdentifierConfiguration"));
  [v4 encodeObject:v13 forKey:@"setIdentifierConfiguration"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam alreadyDownloaded](self, "alreadyDownloaded"));
  [v4 encodeObject:v14 forKey:@"alreadyDownloaded"];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam setConfigurations](self, "setConfigurations"));
  [v4 encodeObject:v15 forKey:@"setConfigurations"];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam timerUUID](self, "timerUUID"));
  [v4 encodeObject:v16 forKey:@"timerUUID"];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam setTargets](self, "setTargets"));
  [v4 encodeObject:v17 forKey:@"setTargets"];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam scheduledJobs](self, "scheduledJobs"));
  [v4 encodeObject:v18 forKey:@"scheduledJobs"];

  id v19 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam downloadedDescriptor](self, "downloadedDescriptor"));
  [v4 encodeObject:v19 forKey:@"downloadedDescriptor"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateSafeSummary
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetStagerParam _summary](self, "_summary"));
  -[MADAutoAssetStagerParam setParamSafeSummary:](self, "setParamSafeSummary:", v3);
}

- (void)setParamSafeSummary:(id)a3
{
}

- (void)setStagingClientRequest:(id)a3
{
}

- (NSArray)baseForStagingDescriptors
{
  return self->_baseForStagingDescriptors;
}

- (void)setBaseForStagingDescriptors:(id)a3
{
}

- (MADAutoAssetJobInformation)jobInformation
{
  return self->_jobInformation;
}

- (NSDictionary)autoAssetCatalog
{
  return self->_autoAssetCatalog;
}

- (NSError)operationError
{
  return self->_operationError;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (MADAutoSetConfiguration)setIdentifierConfiguration
{
  return self->_setIdentifierConfiguration;
}

- (NSArray)alreadyDownloaded
{
  return self->_alreadyDownloaded;
}

- (NSArray)setConfigurations
{
  return self->_setConfigurations;
}

- (NSString)timerUUID
{
  return self->_timerUUID;
}

- (NSArray)setTargets
{
  return self->_setTargets;
}

- (NSArray)scheduledJobs
{
  return self->_scheduledJobs;
}

- (MADAutoAssetDescriptor)downloadedDescriptor
{
  return self->_downloadedDescriptor;
}

@end