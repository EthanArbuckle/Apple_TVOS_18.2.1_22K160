@interface MADTaskCoordinator
- (BOOL)scheduleNextAssetProcessingTask;
- (BOOL)scheduleNextClusterProcessingTask;
- (BOOL)scheduleNextDownloadAssetProcessingTask;
- (MADTaskCoordinator)initWithPhotoLibraries:(id)a3 taskProviderTypes:(id)a4 options:(id)a5 cancelBlock:(id)a6 progressReporter:(id)a7;
- (int)createTaskProvidersWithPhotoLibraries:(id)a3 taskProviderTypes:(id)a4;
- (int)run;
- (unint64_t)taskIDForProviderType:(int64_t)a3;
- (void)dealloc;
- (void)evaluateScheduling;
- (void)executeAssetProcessingTask:(id)a3 fromTaskProvider:(id)a4;
- (void)executeClusterProcessingTask:(id)a3 fromTaskProvider:(id)a4;
- (void)executeDownloadAssetProcessingTask:(id)a3 fromTaskProvider:(id)a4;
@end

@implementation MADTaskCoordinator

- (void)dealloc
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v3 = self->_photoLibraries;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        MediaAnalysisDaemonReleaseSharedDataStores(*(void **)(*((void *)&v9 + 1) + 8LL * (void)v7));
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MADTaskCoordinator;
  -[MADTaskCoordinator dealloc](&v8, "dealloc");
}

- (unint64_t)taskIDForProviderType:(int64_t)a3
{
  int v4 = a3;
  if ((int)MediaAnalysisLogLevel(self, a2) >= 5)
  {
    uint64_t v5 = VCPLogInstance();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v7))
    {
      v8[0] = 67109120;
      v8[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Unknown task provider type: %d", (uint8_t *)v8, 8u);
    }
  }

  return 0LL;
}

- (int)createTaskProvidersWithPhotoLibraries:(id)a3 taskProviderTypes:(id)a4
{
  id v6 = a3;
  id v57 = a4;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
  if (!v7) {
    goto LABEL_38;
  }
  id v9 = v7;
  uint64_t v10 = *(void *)v72;
  os_log_type_t v11 = VCPLogToOSLogType[5];
  os_log_type_t type = VCPLogToOSLogType[4];
  *(void *)&__int128 v8 = 138412546LL;
  __int128 v53 = v8;
  uint64_t v55 = *(void *)v72;
  os_log_type_t v54 = v11;
  do
  {
    __int128 v12 = 0LL;
    id v56 = v9;
    do
    {
      if (*(void *)v72 != v10) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)v12);
      v14 = objc_autoreleasePoolPush();
      id v15 = [v13 isReadyForAnalysis];
      if ((v15 & 1) != 0)
      {
        __int128 v69 = 0u;
        __int128 v70 = 0u;
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        id v17 = v57;
        id v18 = [v17 countByEnumeratingWithState:&v67 objects:v81 count:16];
        if (!v18) {
          goto LABEL_35;
        }
        id v19 = v18;
        v59 = v12;
        v60 = v14;
        uint64_t v20 = *(void *)v68;
        while (1)
        {
          for (i = 0LL; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v68 != v20) {
              objc_enumerationMutation(v17);
            }
            signed int v22 = objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * (void)i), "intValue", v53);
            unint64_t v23 = -[MADTaskCoordinator taskIDForProviderType:](self, "taskIDForProviderType:", v22);
            if (objc_msgSend(v13, "vcp_requiresProcessingForTask:", v23))
            {
              id v24 = v17;
              v66[0] = _NSConcreteStackBlock;
              v66[1] = 3221225472LL;
              v66[2] = sub_1001211E0;
              v66[3] = &unk_1001BDFC8;
              v66[5] = v13;
              v66[6] = v23;
              v66[4] = self;
              v25 = objc_retainBlock(v66);
              v27 = (void (**)(void, void))v25;
              switch(v23)
              {
                case 1uLL:
                  if (v22 == 5)
                  {
                    v44 = -[MADPhotosFullTaskProvider initWithPhotoLibrary:cancelBlock:progressReporter:mediaType:mediaSubtype:imageOnlyAnalysis:]( objc_alloc(&OBJC_CLASS___MADPhotosFullTaskProvider),  "initWithPhotoLibrary:cancelBlock:progressReporter:mediaType:mediaSubtype:imageOnlyAnalysis:",  v13,  self->_cancelBlock,  self->_progressReporter,  1LL,  8LL,  0LL);
                    ((void (**)(void, MADPhotosFullTaskProvider *))v27)[2](v27, v44);

                    v31 = objc_alloc(&OBJC_CLASS___MADPhotosFullTaskProvider);
                    id cancelBlock = self->_cancelBlock;
                    progressReporter = self->_progressReporter;
                    v34 = v13;
                    uint64_t v35 = 2LL;
                    uint64_t v36 = 0LL;
                  }

                  else
                  {
                    if (v22 != 4) {
                      goto LABEL_28;
                    }
                    v31 = objc_alloc(&OBJC_CLASS___MADPhotosFullTaskProvider);
                    id cancelBlock = self->_cancelBlock;
                    progressReporter = self->_progressReporter;
                    v34 = v13;
                    uint64_t v35 = 1LL;
                    uint64_t v36 = 1LL;
                  }

                  v30 = -[MADPhotosFullTaskProvider initWithPhotoLibrary:cancelBlock:progressReporter:mediaType:mediaSubtype:imageOnlyAnalysis:]( v31,  "initWithPhotoLibrary:cancelBlock:progressReporter:mediaType:mediaSubtype:imageOnlyAnalysis:",  v34,  cancelBlock,  progressReporter,  v35,  0LL,  v36);
                  break;
                case 0xAuLL:
                  v30 = -[MADPhotosTaskProvider initWithPhotoLibrary:cancelBlock:]( objc_alloc(&OBJC_CLASS___MADPhotosOCRTaskProvider),  "initWithPhotoLibrary:cancelBlock:",  v13,  self->_cancelBlock);
                  break;
                case 3uLL:
                  v28 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_options,  "objectForKeyedSubscript:",  @"SkipSyncGallery"));
                  id v29 = [v28 BOOLValue];

                  v30 = -[MADPhotosFaceTaskProvider initWithPhotoLibrary:skipSyncGallery:cancelBlock:]( objc_alloc(&OBJC_CLASS___MADPhotosFaceTaskProvider),  "initWithPhotoLibrary:skipSyncGallery:cancelBlock:",  v13,  v29,  self->_cancelBlock);
                  break;
                default:
                  uint64_t v37 = MediaAnalysisLogLevel(v25, v26);
                  if ((int)v37 >= 4)
                  {
                    uint64_t v39 = VCPLogInstance(v37, v38);
                    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
                    if (os_log_type_enabled(v40, type))
                    {
                      v41 = (void *)objc_opt_class(self);
                      id v63 = v41;
                      v62 = (void *)objc_claimAutoreleasedReturnValue([v13 photoLibraryURL]);
                      uint64_t v42 = objc_claimAutoreleasedReturnValue([v62 path]);
                      *(_DWORD *)buf = 138412802;
                      v76 = v41;
                      __int16 v77 = 2048;
                      unint64_t v78 = v23;
                      __int16 v79 = 2112;
                      uint64_t v80 = v42;
                      v43 = (void *)v42;
                      _os_log_impl( (void *)&_mh_execute_header,  v40,  type,  "[%@] Unsupported task type %lu for Library %@; skipping",
                        buf,
                        0x20u);
                    }

- (MADTaskCoordinator)initWithPhotoLibraries:(id)a3 taskProviderTypes:(id)a4 options:(id)a5 cancelBlock:(id)a6 progressReporter:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v57.receiver = self;
  v57.super_class = (Class)&OBJC_CLASS___MADTaskCoordinator;
  id v18 = -[MADTaskCoordinator init](&v57, "init");
  id v19 = v18;
  if (!v18) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v18->_photoLibraries, a3);
  objc_storeStrong((id *)&v19->_options, a5);
  id v20 = objc_retainBlock(v16);
  id cancelBlock = v19->_cancelBlock;
  v19->_id cancelBlock = v20;

  objc_storeStrong((id *)&v19->_progressReporter, a7);
  uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  taskProviders = v19->_taskProviders;
  v19->_taskProviders = (NSMutableArray *)v22;

  uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  taskTypes = v19->_taskTypes;
  v19->_taskTypes = (NSMutableSet *)v24;

  id v26 = (id)-[MADTaskCoordinator createTaskProvidersWithPhotoLibraries:taskProviderTypes:]( v19,  "createTaskProvidersWithPhotoLibraries:taskProviderTypes:",  v13,  v14);
  if (!(_DWORD)v26)
  {
    dispatch_queue_t v36 = dispatch_queue_create("MADTaskCoordinator.schedulingQueue", 0LL);
    schedulingQueue = v19->_schedulingQueue;
    v19->_schedulingQueue = (OS_dispatch_queue *)v36;

    dispatch_group_t v38 = dispatch_group_create();
    schedulingGroup = v19->_schedulingGroup;
    v19->_schedulingGroup = (OS_dispatch_group *)v38;

    dispatch_group_t v40 = dispatch_group_create();
    taskGroup = v19->_taskGroup;
    v19->_taskGroup = (OS_dispatch_group *)v40;

    dispatch_semaphore_t v42 = dispatch_semaphore_create(0LL);
    completionSemaphore = v19->_completionSemaphore;
    v19->_completionSemaphore = (OS_dispatch_semaphore *)v42;

    dispatch_semaphore_t v44 = dispatch_semaphore_create(1LL);
    assetTaskPrepareSemaphore = v19->_assetTaskPrepareSemaphore;
    v19->_assetTaskPrepareSemaphore = (OS_dispatch_semaphore *)v44;

    dispatch_semaphore_t v46 = dispatch_semaphore_create(1LL);
    assetTaskProcessSemaphore = v19->_assetTaskProcessSemaphore;
    v19->_assetTaskProcessSemaphore = (OS_dispatch_semaphore *)v46;

    dispatch_semaphore_t v48 = dispatch_semaphore_create(1LL);
    assetTaskPublishSemaphore = v19->_assetTaskPublishSemaphore;
    v19->_assetTaskPublishSemaphore = (OS_dispatch_semaphore *)v48;

    dispatch_semaphore_t v50 = dispatch_semaphore_create(1LL);
    downloadTaskSemaphore = v19->_downloadTaskSemaphore;
    v19->_downloadTaskSemaphore = (OS_dispatch_semaphore *)v50;

    dispatch_semaphore_t v52 = dispatch_semaphore_create(1LL);
    downloadCompleteSemaphore = v19->_downloadCompleteSemaphore;
    v19->_downloadCompleteSemaphore = (OS_dispatch_semaphore *)v52;

    dispatch_semaphore_t v54 = dispatch_semaphore_create(1LL);
    clusterTaskSemaphore = v19->_clusterTaskSemaphore;
    v19->_clusterTaskSemaphore = (OS_dispatch_semaphore *)v54;

LABEL_9:
    uint64_t v35 = v19;
    goto LABEL_10;
  }

  uint64_t v28 = MediaAnalysisLogLevel(v26, v27);
  if ((int)v28 >= 3)
  {
    uint64_t v30 = VCPLogInstance(v28, v29);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    os_log_type_t v32 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (void *)objc_opt_class(v19);
      *(_DWORD *)buf = 138412290;
      v59 = v33;
      id v34 = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "[%@] Failed to create task providers.", buf, 0xCu);
    }
  }

  uint64_t v35 = 0LL;
LABEL_10:

  return v35;
}

- (void)executeAssetProcessingTask:(id)a3 fromTaskProvider:(id)a4
{
  id v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001217DC;
  v11[3] = &unk_1001B9D10;
  id v12 = a4;
  id v13 = v6;
  id v14 = self;
  id v7 = v6;
  id v8 = v12;
  id v9 = objc_retainBlock(v11);
  [v7 setCancelBlock:self->_cancelBlock];
  dispatch_group_enter((dispatch_group_t)self->_taskGroup);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADQoSManager sharedManager](&OBJC_CLASS___VCPMADQoSManager, "sharedManager"));
  objc_msgSend(v10, "runAsyncBlock:withTaskID:", v9, objc_msgSend(v8, "taskID"));
}

- (BOOL)scheduleNextAssetProcessingTask
{
  id v3 = -[NSMutableArray count](self->_taskProviders, "count");
  if (v3)
  {
    uint64_t v5 = 0LL;
    os_log_type_t v6 = VCPLogToOSLogType[5];
    *(void *)&__int128 v4 = 138412546LL;
    __int128 v25 = v4;
    while (1)
    {
      id v7 = objc_autoreleasePoolPush();
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_taskProviders,  "objectAtIndexedSubscript:",  self->_assetTaskProviderIdx));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nextAssetProcessingTask]);
      uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
      if (v9) {
        break;
      }
      if ((int)v11 >= 5)
      {
        uint64_t v13 = VCPLogInstance(v11, v12);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, v6))
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([0 uuid]);
          unint64_t assetTaskProviderIdx = self->_assetTaskProviderIdx;
          *(_DWORD *)buf = v25;
          uint64_t v27 = v15;
          __int16 v28 = 1024;
          int v29 = assetTaskProviderIdx;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  v6,  "[MADTaskCoordinator] No next asset task (%@) from provider %d",  buf,  0x12u);
        }
      }

      unint64_t v17 = self->_assetTaskProviderIdx + 1;
      self->_unint64_t assetTaskProviderIdx = v17 % (unint64_t)-[NSMutableArray count](self->_taskProviders, "count", v25);
      self->_assetTaskCounter = 0LL;

      objc_autoreleasePoolPop(v7);
      if (++v5 >= (unint64_t)-[NSMutableArray count](self->_taskProviders, "count"))
      {
        LOBYTE(v3) = 0;
        return (char)v3;
      }
    }

    if ((int)v11 >= 5)
    {
      uint64_t v18 = VCPLogInstance(v11, v12);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, v6))
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
        unint64_t v21 = self->_assetTaskProviderIdx;
        *(_DWORD *)buf = v25;
        uint64_t v27 = v20;
        __int16 v28 = 1024;
        int v29 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  v6,  "[MADTaskCoordinator] Scheduling next asset task (%@) from provider %d",  buf,  0x12u);
      }
    }

    -[MADTaskCoordinator executeAssetProcessingTask:fromTaskProvider:]( self,  "executeAssetProcessingTask:fromTaskProvider:",  v9,  v8,  v25);
    unint64_t v22 = self->_assetTaskCounter + 1;
    self->_assetTaskCounter = v22;
    if (v22 >= (unint64_t)[v8 iterations])
    {
      unint64_t v23 = self->_assetTaskProviderIdx + 1;
      self->_unint64_t assetTaskProviderIdx = v23 % (unint64_t)-[NSMutableArray count](self->_taskProviders, "count");
      self->_assetTaskCounter = 0LL;
    }

    objc_autoreleasePoolPop(v7);
    LOBYTE(v3) = 1;
  }

  return (char)v3;
}

- (void)executeDownloadAssetProcessingTask:(id)a3 fromTaskProvider:(id)a4
{
  id v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100122044;
  v11[3] = &unk_1001B9D10;
  id v12 = a4;
  id v13 = v6;
  id v14 = self;
  id v7 = v6;
  id v8 = v12;
  id v9 = objc_retainBlock(v11);
  [v7 setCancelBlock:self->_cancelBlock];
  dispatch_group_enter((dispatch_group_t)self->_taskGroup);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADQoSManager sharedManager](&OBJC_CLASS___VCPMADQoSManager, "sharedManager"));
  objc_msgSend(v10, "runAsyncBlock:withTaskID:", v9, objc_msgSend(v8, "taskID"));
}

- (BOOL)scheduleNextDownloadAssetProcessingTask
{
  id v3 = -[NSMutableArray count](self->_taskProviders, "count");
  if (v3)
  {
    uint64_t v4 = 0LL;
    while (1)
    {
      uint64_t v5 = objc_autoreleasePoolPush();
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_taskProviders,  "objectAtIndexedSubscript:",  self->_downloadTaskProviderIdx));
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 nextDownloadAssetProcessingTask]);
      if (v7) {
        break;
      }
      unint64_t v9 = self->_downloadTaskProviderIdx + 1;
      self->_unint64_t downloadTaskProviderIdx = v9 % (unint64_t)-[NSMutableArray count](self->_taskProviders, "count");
      self->_downloadTaskCounter = 0LL;

      objc_autoreleasePoolPop(v5);
      if (++v4 >= (unint64_t)-[NSMutableArray count](self->_taskProviders, "count"))
      {
        LOBYTE(v3) = 0;
        return (char)v3;
      }
    }

    uint64_t v10 = (void *)v7;
    uint64_t v11 = MediaAnalysisLogLevel(v7, v8);
    if ((int)v11 >= 5)
    {
      uint64_t v13 = VCPLogInstance(v11, v12);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      os_log_type_t v15 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v14, v15))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
        unint64_t downloadTaskProviderIdx = self->_downloadTaskProviderIdx;
        int v21 = 138412546;
        unint64_t v22 = v16;
        __int16 v23 = 1024;
        int v24 = downloadTaskProviderIdx;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[MADTaskCoordinator] Scheduling next download task (%@) from provider %d",  (uint8_t *)&v21,  0x12u);
      }
    }

    -[MADTaskCoordinator executeDownloadAssetProcessingTask:fromTaskProvider:]( self,  "executeDownloadAssetProcessingTask:fromTaskProvider:",  v10,  v6);
    unint64_t v18 = self->_downloadTaskCounter + 1;
    self->_downloadTaskCounter = v18;
    if (v18 >= (unint64_t)[v6 iterations])
    {
      unint64_t v19 = self->_downloadTaskProviderIdx + 1;
      self->_unint64_t downloadTaskProviderIdx = v19 % (unint64_t)-[NSMutableArray count](self->_taskProviders, "count");
      self->_downloadTaskCounter = 0LL;
    }

    objc_autoreleasePoolPop(v5);
    LOBYTE(v3) = 1;
  }

  return (char)v3;
}

- (void)executeClusterProcessingTask:(id)a3 fromTaskProvider:(id)a4
{
  id v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100122980;
  v11[3] = &unk_1001B9D10;
  id v12 = a4;
  id v13 = v6;
  id v14 = self;
  id v7 = v6;
  id v8 = v12;
  unint64_t v9 = objc_retainBlock(v11);
  [v7 setCancelBlock:self->_cancelBlock];
  dispatch_group_enter((dispatch_group_t)self->_taskGroup);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADQoSManager sharedManager](&OBJC_CLASS___VCPMADQoSManager, "sharedManager"));
  objc_msgSend(v10, "runAsyncBlock:withTaskID:", v9, objc_msgSend(v8, "taskID"));
}

- (BOOL)scheduleNextClusterProcessingTask
{
  id v3 = -[NSMutableArray count](self->_taskProviders, "count");
  if (v3)
  {
    uint64_t v4 = 0LL;
    while (1)
    {
      uint64_t v5 = objc_autoreleasePoolPush();
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_taskProviders,  "objectAtIndexedSubscript:",  self->_clusterTaskProviderIdx));
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 nextClusterProcessingTask]);
      if (v7) {
        break;
      }
      unint64_t v9 = self->_clusterTaskProviderIdx + 1;
      self->_unint64_t clusterTaskProviderIdx = v9 % (unint64_t)-[NSMutableArray count](self->_taskProviders, "count");
      self->_clusterTaskCounter = 0LL;

      objc_autoreleasePoolPop(v5);
      if (++v4 >= (unint64_t)-[NSMutableArray count](self->_taskProviders, "count"))
      {
        LOBYTE(v3) = 0;
        return (char)v3;
      }
    }

    uint64_t v10 = (void *)v7;
    uint64_t v11 = MediaAnalysisLogLevel(v7, v8);
    if ((int)v11 >= 5)
    {
      uint64_t v13 = VCPLogInstance(v11, v12);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      os_log_type_t v15 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v14, v15))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
        unint64_t clusterTaskProviderIdx = self->_clusterTaskProviderIdx;
        int v21 = 138412546;
        unint64_t v22 = v16;
        __int16 v23 = 1024;
        int v24 = clusterTaskProviderIdx;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[MADTaskCoordinator] Scheduling next cluster task (%@) from provider %d",  (uint8_t *)&v21,  0x12u);
      }
    }

    -[MADTaskCoordinator executeClusterProcessingTask:fromTaskProvider:]( self,  "executeClusterProcessingTask:fromTaskProvider:",  v10,  v6);
    unint64_t v18 = self->_clusterTaskCounter + 1;
    self->_clusterTaskCounter = v18;
    if (v18 >= (unint64_t)[v6 iterations])
    {
      unint64_t v19 = self->_clusterTaskProviderIdx + 1;
      self->_unint64_t clusterTaskProviderIdx = v19 % (unint64_t)-[NSMutableArray count](self->_taskProviders, "count");
      self->_clusterTaskCounter = 0LL;
    }

    objc_autoreleasePoolPop(v5);
    LOBYTE(v3) = 1;
  }

  return (char)v3;
}

- (void)evaluateScheduling
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 5)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[MADTaskCoordinator] Evaluating Scheduling...", buf, 2u);
    }
  }

  uint64_t v8 = VCPSignPostLog(v3);
  unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  uint64_t v12 = VCPSignPostLog(v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)dispatch_group_t v38 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "MADTaskCoordinator_EvaluateScheduling",  (const char *)&unk_100199097,  v38,  2u);
  }

  id cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
  if (cancelBlock && (uint64_t v16 = cancelBlock[2](), (v16 & 1) != 0))
  {
    uint64_t v18 = MediaAnalysisLogLevel(v16, v17);
    if ((int)v18 >= 5)
    {
      uint64_t v20 = VCPLogInstance(v18, v19);
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      os_log_type_t v22 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v21, v22))
      {
        *(_WORD *)uint64_t v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "[MADTaskCoordinator] Processing canceled", v37, 2u);
      }
    }
  }

  else
  {
    if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_assetTaskPrepareSemaphore, 0LL)
      && !-[MADTaskCoordinator scheduleNextAssetProcessingTask](self, "scheduleNextAssetProcessingTask"))
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_assetTaskPrepareSemaphore);
    }

    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[VCPInternetReachability sharedInstance](&OBJC_CLASS___VCPInternetReachability, "sharedInstance"));
    if ([v23 hasWifiOrEthernetConnection])
    {
      uint64_t v24 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_downloadTaskSemaphore, 0LL);

      if (!v24
        && !-[MADTaskCoordinator scheduleNextDownloadAssetProcessingTask]( self,  "scheduleNextDownloadAssetProcessingTask"))
      {
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_downloadTaskSemaphore);
      }
    }

    else
    {
    }

    if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_clusterTaskSemaphore, 0LL)
      && !-[MADTaskCoordinator scheduleNextClusterProcessingTask](self, "scheduleNextClusterProcessingTask"))
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_clusterTaskSemaphore);
    }
  }

  dispatch_group_leave((dispatch_group_t)self->_schedulingGroup);
  uint64_t v25 = dispatch_group_wait((dispatch_group_t)self->_taskGroup, 0LL);
  if (!v25)
  {
    uint64_t v25 = dispatch_group_wait((dispatch_group_t)self->_schedulingGroup, 0LL);
    if (!v25)
    {
      uint64_t v27 = MediaAnalysisLogLevel(0LL, v26);
      if ((int)v27 >= 5)
      {
        uint64_t v29 = VCPLogInstance(v27, v28);
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        os_log_type_t v31 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v30, v31))
        {
          *(_WORD *)dispatch_queue_t v36 = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, v31, "[MADTaskCoordinator] All tasks complete", v36, 2u);
        }
      }

      uint64_t v25 = dispatch_semaphore_signal((dispatch_semaphore_t)self->_completionSemaphore);
    }
  }

  uint64_t v32 = VCPSignPostLog(v25);
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  id v34 = v33;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)uint64_t v35 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v34,  OS_SIGNPOST_INTERVAL_END,  v10,  "MADTaskCoordinator_EvaluateScheduling",  (const char *)&unk_100199097,  v35,  2u);
  }
}

- (int)run
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 5)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[MADTaskCoordinator] Running...", buf, 2u);
    }
  }

  dispatch_group_enter((dispatch_group_t)self->_schedulingGroup);
  schedulingQueue = (dispatch_queue_s *)self->_schedulingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100123134;
  block[3] = &unk_1001BC6A0;
  block[4] = self;
  dispatch_async(schedulingQueue, block);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  id cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
  if (cancelBlock && (cancelBlock[2]() & 1) != 0) {
    return -128;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end