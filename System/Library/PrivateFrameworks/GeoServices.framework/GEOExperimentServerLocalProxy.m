@interface GEOExperimentServerLocalProxy
+ (void)_deleteExperimentInfoFromDisk;
- (BOOL)_removeOldExperimentsInfoIfNecessary:(BOOL)a3;
- (GEOABAssignmentResponse)experimentsInfo;
- (GEOExperimentServerLocalProxy)initWithDelegate:(id)a3;
- (GEOExperimentServerProxyDelegate)delegate;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (void)_debug_fetchAllAvailableExperiments:(id)a3;
- (void)_debug_setActiveExperimentBranchDictionaryRepresentation:(id)a3;
- (void)_debug_setBucketIdDictionaryRepresentation:(id)a3;
- (void)_debug_setQuerySubstring:(id)a3 forExperimentType:(int64_t)a4 dispatcherRequestType:(int)a5;
- (void)_loadExperimentsConfiguration:(id)a3;
- (void)_notifyExperimentsInfoChanged:(id)a3 current:(id)a4;
- (void)_setExperimentsInfo:(id)a3;
- (void)_setupRefreshTask;
- (void)_submitNonRepeatingRetryTask:(double)a3;
- (void)_updateIfNecessary;
- (void)_writeExperimentInfoToDisk:(id)a3;
- (void)abAssignUUIDWithSyncCompletionHandler:(id)a3;
- (void)cancelRefreshTask;
- (void)dealloc;
- (void)forceUpdate;
- (void)forceUpdate:(id)a3;
- (void)refreshDatasetABStatus:(id)a3;
- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5;
- (void)setDelegate:(id)a3;
- (void)submitBackgroundTasksNeededDuringDaemonStart;
@end

@implementation GEOExperimentServerLocalProxy

- (void)cancelRefreshTask
{
  if (sub_100017C50(0LL))
  {
    id v2 = [sub_100017D6C() sharedScheduler];
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    uint64_t v4 = GEOExperimentServerLocalProxyBackgroundTaskIdentifier;
    id v15 = 0LL;
    [v3 cancelTaskRequestWithIdentifier:GEOExperimentServerLocalProxyBackgroundTaskIdentifier error:&v15];
    id v5 = v15;

    if (v5)
    {
      uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Experiments");
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v4;
        __int16 v18 = 2112;
        id v19 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Trouble cancelling %@ with error %@",  buf,  0x16u);
      }
    }

    id v8 = [sub_100017D6C() sharedScheduler];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = GEOExperimentServerLocalProxyBackgroundTaskRetryIdentifier;
    id v14 = 0LL;
    [v9 cancelTaskRequestWithIdentifier:GEOExperimentServerLocalProxyBackgroundTaskRetryIdentifier error:&v14];
    id v11 = v14;

    if (v11)
    {
      uint64_t v12 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Experiments");
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v10;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Trouble cancelling %@ with error %@",  buf,  0x16u);
      }
    }
  }

- (GEOExperimentServerLocalProxy)initWithDelegate:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___GEOExperimentServerLocalProxy;
  id v5 = -[GEOExperimentServerLocalProxy init](&v19, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_experimentsInfoLock._os_unfair_lock_opaque = 0;
    v6->_currentRequestLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = geo_isolater_create("com.apple.geo.GEOExperimentServerLocalProxy");
    taskIsolater = v6->_taskIsolater;
    v6->_taskIsolater = (geo_isolater *)v7;

    uint64_t v9 = GEOExperimentConfigurationPath();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v10));

    if ([v11 length])
    {
      uint64_t v12 = -[GEOABAssignmentResponse initWithData:]( objc_alloc(&OBJC_CLASS___GEOABAssignmentResponse),  "initWithData:",  v11);
      experimentsInfo = v6->_experimentsInfo;
      v6->_experimentsInfo = v12;
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    GEORegisterPListStateCaptureLegacy(&v6->_stateCaptureHandle, v6, 0LL, v15, @"ExperimentConfigs");

    repeatingTask = v6->_repeatingTask;
    v6->_repeatingTask = 0LL;

    uint64_t v17 = v6;
  }

  return v6;
}

- (void)dealloc
{
  v6 = self->_taskIsolater;
  _geo_isolate_lock_data();
  GEOUnregisterStateCaptureLegacy(&self->_stateCaptureHandle);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](&OBJC_CLASS___GEOResourceManifestManager, "modernManager"));
  [v3 removeTileGroupObserver:self];

  if (self->_currentRequest)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[_GEOExperimentServiceRequester sharedInstance]( &OBJC_CLASS____GEOExperimentServiceRequester,  "sharedInstance"));
    [v4 cancelRequest:self->_currentRequest];
  }

  _geo_isolate_unlock(&v6);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GEOExperimentServerLocalProxy;
  -[GEOExperimentServerLocalProxy dealloc](&v5, "dealloc");
}

- (void)refreshDatasetABStatus:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4 && [v4 hasDatasetId])
  {
    p_experimentsInfoLock = &self->_experimentsInfoLock;
    os_unfair_lock_lock_with_options(&self->_experimentsInfoLock, 0x10000LL);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOABAssignmentResponse mapsAbClientMetadata](self->_experimentsInfo, "mapsAbClientMetadata"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 clientDatasetMetadata]);

    if (v8)
    {
      unsigned int v9 = [v8 datasetId];
      if (v9 != [v5 datasetId])
      {
        uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Experiments");
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67240448;
          unsigned int v42 = [v8 datasetId];
          __int16 v43 = 1026;
          unsigned int v44 = [v5 datasetId];
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Data set changed (%{public}u -> %{public}u)",  buf,  0xEu);
        }

        if (!self->_experimentsInfo)
        {
          uint64_t v12 = objc_alloc_init(&OBJC_CLASS___GEOABAssignmentResponse);
          experimentsInfo = self->_experimentsInfo;
          self->_experimentsInfo = v12;

          id v14 = objc_alloc_init(&OBJC_CLASS___GEOABSecondPartyPlaceRequestClientMetaData);
          -[GEOABAssignmentResponse setMapsAbClientMetadata:](self->_experimentsInfo, "setMapsAbClientMetadata:", v14);

          id v15 = objc_alloc_init(&OBJC_CLASS___GEOABSecondPartyPlaceRequestClientMetaData);
          -[GEOABAssignmentResponse setParsecClientMetadata:](self->_experimentsInfo, "setParsecClientMetadata:", v15);

          id v16 = objc_alloc_init(&OBJC_CLASS___GEOABSecondPartyPlaceRequestClientMetaData);
          -[GEOABAssignmentResponse setSiriClientMetadata:](self->_experimentsInfo, "setSiriClientMetadata:", v16);

          id v17 = objc_alloc_init(&OBJC_CLASS___GEOABSecondPartyPlaceRequestClientMetaData);
          -[GEOABAssignmentResponse setRapClientMetadata:](self->_experimentsInfo, "setRapClientMetadata:", v17);

          id v18 = objc_alloc_init(&OBJC_CLASS___GEOPDABClientDatasetMetadata);
          objc_super v19 = (void *)objc_claimAutoreleasedReturnValue( -[GEOABAssignmentResponse mapsAbClientMetadata]( self->_experimentsInfo,  "mapsAbClientMetadata"));
          [v19 setClientDatasetMetadata:v18];

          id v20 = objc_alloc_init(&OBJC_CLASS___GEOPDABClientDatasetMetadata);
          v21 = (void *)objc_claimAutoreleasedReturnValue( -[GEOABAssignmentResponse parsecClientMetadata]( self->_experimentsInfo,  "parsecClientMetadata"));
          [v21 setClientDatasetMetadata:v20];

          id v22 = objc_alloc_init(&OBJC_CLASS___GEOPDABClientDatasetMetadata);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[GEOABAssignmentResponse siriClientMetadata](self->_experimentsInfo, "siriClientMetadata"));
          [v23 setClientDatasetMetadata:v22];

          id v24 = objc_alloc_init(&OBJC_CLASS___GEOPDABClientDatasetMetadata);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[GEOABAssignmentResponse rapClientMetadata](self->_experimentsInfo, "rapClientMetadata"));
          [v25 setClientDatasetMetadata:v24];
        }

        id v26 = [v5 datasetId];
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[GEOABAssignmentResponse mapsAbClientMetadata](self->_experimentsInfo, "mapsAbClientMetadata"));
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 clientDatasetMetadata]);
        [v28 setDatasetId:v26];

        id v29 = [v5 datasetId];
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[GEOABAssignmentResponse parsecClientMetadata](self->_experimentsInfo, "parsecClientMetadata"));
        v31 = (void *)objc_claimAutoreleasedReturnValue([v30 clientDatasetMetadata]);
        [v31 setDatasetId:v29];

        id v32 = [v5 datasetId];
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[GEOABAssignmentResponse siriClientMetadata](self->_experimentsInfo, "siriClientMetadata"));
        v34 = (void *)objc_claimAutoreleasedReturnValue([v33 clientDatasetMetadata]);
        [v34 setDatasetId:v32];

        id v35 = [v5 datasetId];
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[GEOABAssignmentResponse rapClientMetadata](self->_experimentsInfo, "rapClientMetadata"));
        v37 = (void *)objc_claimAutoreleasedReturnValue([v36 clientDatasetMetadata]);
        [v37 setDatasetId:v35];

        -[GEOExperimentServerLocalProxy _writeExperimentInfoToDisk:]( self,  "_writeExperimentInfoToDisk:",  self->_experimentsInfo);
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestManager modernManager]( &OBJC_CLASS___GEOResourceManifestManager,  "modernManager"));
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472LL;
        v40[2] = sub_100007CA0;
        v40[3] = &unk_100059168;
        v40[4] = self;
        [v38 updateManifest:v40];

        v39 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlaceDataLocalProxy shared](&OBJC_CLASS___GEOPlaceDataLocalProxy, "shared"));
        [v39 clearCache];
      }
    }

    os_unfair_lock_unlock(p_experimentsInfoLock);
  }
}

- (void)abAssignUUIDWithSyncCompletionHandler:(id)a3
{
  if (a3)
  {
    v3 = (void (**)(id, id, void *, void))a3;
    id v4 = sub_100007E38();
    id v7 = (id)objc_claimAutoreleasedReturnValue(v4);
    objc_super v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  GEOConfigGetDouble( GeoServicesConfig_ExperimentsBucketGUIDTimestamp[0],  GeoServicesConfig_ExperimentsBucketGUIDTimestamp[1]));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v3[2](v3, v7, v6, 0LL);
  }

- (void)_setupRefreshTask
{
  if (sub_100017C50(0LL))
  {
    os_unfair_lock_lock_with_options(&self->_experimentsInfoLock, 0x10000LL);
    experimentsInfo = self->_experimentsInfo;
    if (!experimentsInfo
      || (-[GEOABAssignmentResponse hasRefreshIntervalSeconds]( experimentsInfo,  "hasRefreshIntervalSeconds") & 1) == 0)
    {
      os_unfair_lock_unlock(&self->_experimentsInfoLock);
      -[GEOExperimentServerLocalProxy cancelRefreshTask](self, "cancelRefreshTask");
      return;
    }

    v56 = self->_taskIsolater;
    _geo_isolate_lock_data();
    double Current = CFAbsoluteTimeGetCurrent();
    id v5 = -[GEOABAssignmentResponse refreshIntervalSeconds](self->_experimentsInfo, "refreshIntervalSeconds");
    -[GEOABAssignmentResponse timestamp](self->_experimentsInfo, "timestamp");
    double v7 = v6;
    os_unfair_lock_unlock(&self->_experimentsInfoLock);
    double Double = GEOConfigGetDouble( GeoServicesConfig_ExperimentMaxRefreshInterval[0],  GeoServicesConfig_ExperimentMaxRefreshInterval[1]);
    double v9 = GEOConfigGetDouble( GeoServicesConfig_ExperimentMinRefreshInterval[0],  GeoServicesConfig_ExperimentMinRefreshInterval[1]);
    if (Double <= v9) {
      uint64_t v10 = GeoServicesConfig_ExperimentMinRefreshInterval;
    }
    else {
      uint64_t v10 = GeoServicesConfig_ExperimentMaxRefreshInterval;
    }
    uint64_t v11 = *v10;
    uint64_t v12 = (char *)&GeoServicesConfig_ExperimentMaxRefreshInterval[1];
    if (Double <= v9) {
      uint64_t v12 = (char *)&GeoServicesConfig_ExperimentMinRefreshInterval[1];
    }
    double v13 = (double)(unint64_t)v5;
    if (GEOConfigGetDouble(v11, *(void *)v12) < (double)(unint64_t)v5)
    {
      uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Experiments");
      id v15 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        double v16 = GEOConfigGetDouble( GeoServicesConfig_ExperimentMaxRefreshInterval[0],  GeoServicesConfig_ExperimentMaxRefreshInterval[1]);
        double v17 = GEOConfigGetDouble( GeoServicesConfig_ExperimentMinRefreshInterval[0],  GeoServicesConfig_ExperimentMinRefreshInterval[1]);
        if (v16 <= v17) {
          id v18 = GeoServicesConfig_ExperimentMinRefreshInterval;
        }
        else {
          id v18 = GeoServicesConfig_ExperimentMaxRefreshInterval;
        }
        uint64_t v19 = *v18;
        id v20 = (char *)&GeoServicesConfig_ExperimentMaxRefreshInterval[1];
        if (v16 <= v17) {
          id v20 = (char *)&GeoServicesConfig_ExperimentMinRefreshInterval[1];
        }
        double v21 = GEOConfigGetDouble(v19, *(void *)v20);
        *(_DWORD *)buf = 134218240;
        double v58 = (double)(unint64_t)v5;
        __int16 v59 = 2048;
        double v60 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Experiment response has refresh interval of %f. Capping at %f.",  buf,  0x16u);
      }

      double v22 = GEOConfigGetDouble( GeoServicesConfig_ExperimentMaxRefreshInterval[0],  GeoServicesConfig_ExperimentMaxRefreshInterval[1]);
      double v23 = GEOConfigGetDouble( GeoServicesConfig_ExperimentMinRefreshInterval[0],  GeoServicesConfig_ExperimentMinRefreshInterval[1]);
      if (v22 <= v23) {
        id v24 = GeoServicesConfig_ExperimentMinRefreshInterval;
      }
      else {
        id v24 = GeoServicesConfig_ExperimentMaxRefreshInterval;
      }
      uint64_t v25 = *v24;
      id v26 = (char *)&GeoServicesConfig_ExperimentMaxRefreshInterval[1];
      if (v22 <= v23) {
        id v26 = (char *)&GeoServicesConfig_ExperimentMinRefreshInterval[1];
      }
      double v13 = GEOConfigGetDouble(v25, *(void *)v26);
    }

    if (v7 + v13 - Current < GEOConfigGetDouble( GeoServicesConfig_ExperimentRunImmediatelyInterval[0],  GeoServicesConfig_ExperimentRunImmediatelyInterval[1]))
    {
      uint64_t v27 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Experiments");
      v28 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        double v29 = GEOConfigGetDouble( GeoServicesConfig_ExperimentRunImmediatelyInterval[0],  GeoServicesConfig_ExperimentRunImmediatelyInterval[1]);
        *(_DWORD *)buf = 134217984;
        double v58 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "Experiment should have refreshed already or will refresh in the next %f seconds, going to run it now",  buf,  0xCu);
      }

      -[GEOExperimentServerLocalProxy forceUpdate](self, "forceUpdate");
      goto LABEL_48;
    }

    repeatingTask = self->_repeatingTask;
    if (repeatingTask)
    {
      -[BGRepeatingSystemTaskRequest interval](repeatingTask, "interval");
      uint64_t v31 = DefaultLoggingSubsystem;
      if (v32 != v13)
      {
        uint64_t v33 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Experiments");
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          double v58 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "Updating experiment refresh interval to %f",  buf,  0xCu);
        }

        id v35 = [sub_100017D6C() sharedScheduler];
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v37 = self->_repeatingTask;
        id v55 = 0LL;
        unsigned __int8 v38 = [v36 updateTaskRequest:v37 error:&v55];
        v39 = (__CFString *)v55;

        if ((v38 & 1) != 0) {
          goto LABEL_47;
        }
        uint64_t v40 = GEOFindOrCreateLog(v31, "Experiments");
        v41 = (BGRepeatingSystemTaskRequest *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(double *)&unsigned int v42 = COERCE_DOUBLE(@"Unknown");
          if (v39) {
            unsigned int v42 = v39;
          }
          *(_DWORD *)buf = 138412290;
          double v58 = *(double *)&v42;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "Failed to update task with error: %@",  buf,  0xCu);
        }

- (void)_submitNonRepeatingRetryTask:(double)a3
{
  if (sub_100017C50(0LL))
  {
    id v4 = [objc_alloc((Class)sub_100017E74()) initWithIdentifier:GEOExperimentServerLocalProxyBackgroundTaskRetryIdentifier];
    [v4 setTrySchedulingBefore:a3];
    id v5 = [sub_100017D6C() sharedScheduler];
    double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v12 = 0LL;
    unsigned __int8 v7 = [v6 submitTaskRequest:v4 error:&v12];
    id v8 = (__CFString *)v12;

    if ((v7 & 1) == 0)
    {
      uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Experiments");
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = @"Unknown";
        if (v8) {
          uint64_t v11 = v8;
        }
        *(_DWORD *)buf = 138412290;
        id v14 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to submit nonrepeating task with error: %@",  buf,  0xCu);
      }
    }
  }

- (GEOABAssignmentResponse)experimentsInfo
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options(&self->_experimentsInfoLock, 0x10000LL);
  id v4 = self->_experimentsInfo;
  os_unfair_lock_unlock(p_experimentsInfoLock);
  return v4;
}

- (void)_debug_setQuerySubstring:(id)a3 forExperimentType:(int64_t)a4 dispatcherRequestType:(int)a5
{
  if (a4)
  {
    _GEOSetQueryForExperimentType( GeoServicesConfig_Experiment[0],  GeoServicesConfig_Experiment[1],  a4,  *(void *)&a5,  a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOExperimentServerLocalProxy experimentsInfo](self, "experimentsInfo"));
    [WeakRetained serverProxy:self didChangeExperimentsInfo:v7];

    notify_post("com.apple.GeoServices.experimentsChanged");
  }

- (BOOL)_removeOldExperimentsInfoIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = GEOURLString(26LL, a2);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  os_unfair_lock_lock_with_options(&self->_experimentsInfoLock, 0x10000LL);
  experimentsInfo = self->_experimentsInfo;
  if (!experimentsInfo)
  {
    os_unfair_lock_unlock(&self->_experimentsInfoLock);
    LOBYTE(v10) = 0;
    goto LABEL_26;
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[GEOABAssignmentResponse sourceURL](experimentsInfo, "sourceURL"));
  if (v6 | v8) {
    unsigned int v9 = [(id)v6 isEqualToString:v8] ^ 1;
  }
  else {
    unsigned int v9 = 0;
  }
  if (-[GEOABAssignmentResponse hasBranchExpirationTtlHours]( self->_experimentsInfo,  "hasBranchExpirationTtlHours"))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    -[GEOABAssignmentResponse timestamp](self->_experimentsInfo, "timestamp");
    double v13 = v12
        + (double)(unint64_t)(3600LL
                                   * (void)-[GEOABAssignmentResponse branchExpirationTtlHours]( self->_experimentsInfo,  "branchExpirationTtlHours"));
    if (v13 < Current)
    {
      uint64_t v14 = DefaultLoggingSubsystem;
      uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Experiments");
      double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349312;
        double v36 = v13;
        __int16 v37 = 2050;
        double v38 = Current;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Experiments expired. Deleting existing experiments config. Expiration time %{public}f current time %{public}f",  buf,  0x16u);
      }

      uint64_t v33 = v8;

      double v17 = self->_experimentsInfo;
      goto LABEL_13;
    }
  }

  double v17 = self->_experimentsInfo;
  if (v9)
  {
    uint64_t v33 = v8;
    uint64_t v14 = DefaultLoggingSubsystem;
LABEL_13:
    BOOL v18 = v3;
    uint64_t v19 = GEOFindOrCreateLog(v14, "Experiments");
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Deleting cached experiments config", buf, 2u);
    }

    double v21 = self->_experimentsInfo;
    self->_experimentsInfo = 0LL;

    double v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v23 = GEOExperimentConfigurationPath();
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    id v34 = 0LL;
    unsigned __int8 v25 = [v22 removeItemAtPath:v24 error:&v34];
    id v26 = v34;

    BOOL v3 = v18;
    uint64_t v8 = v33;
    if ((v25 & 1) == 0)
    {
      uint64_t v27 = GEOFindOrCreateLog(v14, "Experiments");
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        double v36 = *(double *)&v26;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Failed to remove stale environments configuration: %{public}@",  buf,  0xCu);
      }
    }

    BOOL v10 = 1;
    goto LABEL_21;
  }

  BOOL v10 = 0;
LABEL_21:
  double v29 = self->_experimentsInfo;
  os_unfair_lock_unlock(&self->_experimentsInfoLock);
  if (v10)
  {
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[GEOExperimentServerLocalProxy experimentsInfo](self, "experimentsInfo"));
      [WeakRetained serverProxy:self didChangeExperimentsInfo:v31];
    }

    notify_post("com.apple.GeoServices.experimentsChanged");
    -[GEOExperimentServerLocalProxy _notifyExperimentsInfoChanged:current:]( self,  "_notifyExperimentsInfoChanged:current:",  v17,  v29);
  }

LABEL_26:
  return v10;
}

- (void)_notifyExperimentsInfoChanged:(id)a3 current:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
  id v8 = sub_100008BC0(v7);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  [v13 setObject:v9 forKeyedSubscript:NSKeyValueChangeOldKey];
  id v10 = sub_100008BC0(v6);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  [v13 setObject:v11 forKeyedSubscript:NSKeyValueChangeNewKey];
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v12 postNotificationName:@"GEOExperimentInfoChangedInternalNotification" object:self userInfo:v13];
}

- (void)_updateIfNecessary
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options(&self->_experimentsInfoLock, 0x10000LL);
  experimentsInfo = self->_experimentsInfo;
  if (experimentsInfo
    && (-[GEOABAssignmentResponse hasRefreshIntervalSeconds](experimentsInfo, "hasRefreshIntervalSeconds") & 1) != 0)
  {
    uint64_t v6 = GEOURLString(26LL, v5);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v6);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[GEOABAssignmentResponse sourceURL](self->_experimentsInfo, "sourceURL"));
    if (v9 | v7)
    {
      unsigned __int8 v8 = [(id)v9 isEqualToString:v7];
      os_unfair_lock_unlock(p_experimentsInfoLock);
      if ((v8 & 1) == 0) {
        -[GEOExperimentServerLocalProxy forceUpdate](self, "forceUpdate");
      }
    }

    else
    {
      os_unfair_lock_unlock(p_experimentsInfoLock);
    }
  }

  else
  {
    os_unfair_lock_unlock(p_experimentsInfoLock);
    -[GEOExperimentServerLocalProxy forceUpdate](self, "forceUpdate");
  }

- (void)_writeExperimentInfoToDisk:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 data]);
    uint64_t v6 = GEOExperimentConfigurationPath();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v21 = 0LL;
    unsigned __int8 v8 = [v5 writeToFile:v7 options:268435457 error:&v21];
    id v9 = v21;

    if ((v8 & 1) == 0)
    {
      uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Experiments");
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v9;
        double v12 = "Failed to write experiment configuration to disk: %{public}@";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
        goto LABEL_10;
      }

      goto LABEL_10;
    }

    goto LABEL_11;
  }

  uint64_t v13 = GEOExperimentConfigurationPath();
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  unsigned int v15 = [v4 fileExistsAtPath:v14 isDirectory:0];

  if (v15)
  {
    uint64_t v16 = GEOExperimentConfigurationPath();
    double v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v20 = 0LL;
    unsigned __int8 v18 = [v4 removeItemAtPath:v17 error:&v20];
    id v9 = v20;

    if ((v18 & 1) == 0)
    {
      uint64_t v19 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Experiments");
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v9;
        double v12 = "Failed to remove experiment configuration from disk: %{public}@";
        goto LABEL_9;
      }

- (void)forceUpdate
{
}

- (void)forceUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DefaultLoggingSubsystem;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Experiments");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Updating experiment configuration", buf, 2u);
  }

  *(void *)buf = 0LL;
  id v24 = buf;
  uint64_t v25 = 0x2810000000LL;
  id v26 = &unk_100054C22;
  uint64_t v27 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10000937C;
  v20[3] = &unk_1000591B8;
  double v22 = buf;
  id v8 = v4;
  id v21 = v8;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000093F4;
  v18[3] = &unk_1000591E0;
  id v9 = objc_retainBlock(v20);
  id v19 = v9;
  [v8 setExpirationHandler:v18];
  uint64_t v10 = GEOGetURL(26LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    -[GEOExperimentServerLocalProxy _removeOldExperimentsInfoIfNecessary:]( self,  "_removeOldExperimentsInfoIfNecessary:",  0LL);
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100009430;
    v14[3] = &unk_100059208;
    unsigned int v15 = v9;
    objc_copyWeak(&v16, &location);
    v14[4] = self;
    -[GEOExperimentServerLocalProxy _loadExperimentsConfiguration:](self, "_loadExperimentsConfiguration:", v14);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }

  else
  {
    uint64_t v12 = GEOFindOrCreateLog(v5, "Experiments");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(location) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "No experiments URL populated. Not updating (will update if/when tile group changes).",  (uint8_t *)&location,  2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)submitBackgroundTasksNeededDuringDaemonStart
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100009948;
  v3[3] = &unk_100059230;
  v3[4] = self;
  objc_copyWeak(&v4, &location);
  geo_dispatch_async_qos(21LL, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_loadExperimentsConfiguration:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options(&self->_currentRequestLock, 0x10000LL);
  uint64_t v5 = self->_currentRequest;
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___GEOABAssignmentRequest);
  id v7 = objc_alloc(&OBJC_CLASS___GEOPDClientMetadata);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](&OBJC_CLASS___GEOMapService, "sharedService"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 defaultTraits]);
  id v10 = [v7 initWithTraits:v9];
  -[GEOABAssignmentRequest setClientMetadata:](v6, "setClientMetadata:", v10);

  id v11 = sub_100007E38();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[GEOABAssignmentRequest setGuid:](v6, "setGuid:", v12);

  objc_storeStrong((id *)&self->_currentRequest, v6);
  os_unfair_lock_unlock(&self->_currentRequestLock);
  if (v5)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[_GEOExperimentServiceRequester sharedInstance]( &OBJC_CLASS____GEOExperimentServiceRequester,  "sharedInstance"));
    [v13 cancelRequest:v5];
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[_GEOExperimentServiceRequester sharedInstance]( &OBJC_CLASS____GEOExperimentServiceRequester,  "sharedInstance"));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](&OBJC_CLASS___GEOMapService, "sharedService"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 defaultTraits]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100009BC8;
  v19[3] = &unk_100059258;
  v19[4] = self;
  id v20 = v6;
  id v21 = v4;
  id v17 = v4;
  unsigned __int8 v18 = v6;
  [v14 startWithRequest:v18 traits:v16 completionHandler:v19];
}

- (void)_debug_fetchAllAvailableExperiments:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___GEOABAssignmentRequest);
    id v5 = objc_alloc(&OBJC_CLASS___GEOPDClientMetadata);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](&OBJC_CLASS___GEOMapService, "sharedService"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 defaultTraits]);
    id v8 = [v5 initWithTraits:v7];
    -[GEOABAssignmentRequest setClientMetadata:](v4, "setClientMetadata:", v8);

    -[GEOABAssignmentRequest setRequestType:](v4, "setRequestType:", 2LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_GEOExperimentServiceRequester sharedInstance]( &OBJC_CLASS____GEOExperimentServiceRequester,  "sharedInstance"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](&OBJC_CLASS___GEOMapService, "sharedService"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 defaultTraits]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100009DCC;
    v12[3] = &unk_100059280;
    id v13 = v3;
    [v9 startWithRequest:v4 traits:v11 completionHandler:v12];
  }
}

- (void)_debug_setActiveExperimentBranchDictionaryRepresentation:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOExperimentServerLocalProxy experimentsInfo](self, "experimentsInfo"));
  [WeakRetained serverProxy:self didChangeExperimentsInfo:v5];

  notify_post("com.apple.GeoServices.experimentsChanged");
}

- (void)_debug_setBucketIdDictionaryRepresentation:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"bucketId"]);
  if (v4)
  {
    id v16 = v4;
    id v5 = [v4 unsignedIntegerValue];
    os_unfair_lock_lock_with_options(&self->_experimentsInfoLock, 0x10000LL);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOABAssignmentResponse mapsAbClientMetadata](self->_experimentsInfo, "mapsAbClientMetadata"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 clientDatasetMetadata]);
    [v7 setBucketId:v5];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOABAssignmentResponse parsecClientMetadata](self->_experimentsInfo, "parsecClientMetadata"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 clientDatasetMetadata]);
    [v9 setBucketId:v5];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOABAssignmentResponse siriClientMetadata](self->_experimentsInfo, "siriClientMetadata"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 clientDatasetMetadata]);
    [v11 setBucketId:v5];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOABAssignmentResponse rapClientMetadata](self->_experimentsInfo, "rapClientMetadata"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 clientDatasetMetadata]);
    [v13 setBucketId:v5];

    -[GEOExperimentServerLocalProxy _writeExperimentInfoToDisk:]( self,  "_writeExperimentInfoToDisk:",  self->_experimentsInfo);
    os_unfair_lock_unlock(&self->_experimentsInfoLock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOExperimentServerLocalProxy experimentsInfo](self, "experimentsInfo"));
    [WeakRetained serverProxy:self didChangeExperimentsInfo:v15];

    notify_post("com.apple.GeoServices.experimentsChanged");
    id v4 = v16;
  }
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options(&self->_experimentsInfoLock, 0x10000LL);
  id v5 = sub_100008BC0(self->_experimentsInfo);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  os_unfair_lock_unlock(p_experimentsInfoLock);
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &__NSDictionary0__struct;
  }
  id v8 = v7;

  return v8;
}

+ (void)_deleteExperimentInfoFromDisk
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v2 = GEOExperimentConfigurationPath(v4);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v4 removeItemAtPath:v3 error:0];
}

- (void)_setExperimentsInfo:(id)a3
{
}

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_autoreleasePoolPush();
  experimentsInfo = self->_experimentsInfo;
  if (!experimentsInfo)
  {
    -[GEOExperimentServerLocalProxy _removeOldExperimentsInfoIfNecessary:]( self,  "_removeOldExperimentsInfoIfNecessary:",  1LL);
LABEL_6:
    -[GEOExperimentServerLocalProxy forceUpdate:](self, "forceUpdate:", 0LL);
    goto LABEL_7;
  }

  unsigned int v12 = -[GEOABAssignmentResponse hasRefreshIntervalSeconds](experimentsInfo, "hasRefreshIntervalSeconds");
  if (-[GEOExperimentServerLocalProxy _removeOldExperimentsInfoIfNecessary:]( self,  "_removeOldExperimentsInfoIfNecessary:",  1LL)
    || !v12)
  {
    goto LABEL_6;
  }

- (GEOExperimentServerProxyDelegate)delegate
{
  return (GEOExperimentServerProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end