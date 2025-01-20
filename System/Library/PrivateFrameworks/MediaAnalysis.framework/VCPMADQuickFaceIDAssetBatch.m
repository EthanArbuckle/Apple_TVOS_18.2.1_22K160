@interface VCPMADQuickFaceIDAssetBatch
+ (BOOL)_allowConcurrentFaceProcessing;
+ (id)batchWithAnalysisDatabase:(id)a3 quickFaceIDManager:(id)a4 cancelBlock:(id)a5;
+ (unint64_t)_concurrentQueueCount;
- (VCPMADQuickFaceIDAssetBatch)initWithAnalysisDatabase:(id)a3 quickFaceIDManager:(id)a4 cancelBlock:(id)a5;
- (int)prepare;
- (int)process;
- (int)publish;
- (unint64_t)count;
- (void)_processAssetEntry:(id)a3;
- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6;
@end

@implementation VCPMADQuickFaceIDAssetBatch

+ (BOOL)_allowConcurrentFaceProcessing
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&qword_1001E6470);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_1001E6470))
  {
    byte_1001E6468 = DeviceHasANE();
    __cxa_guard_release(&qword_1001E6470);
  }

  return byte_1001E6468;
}

+ (unint64_t)_concurrentQueueCount
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&qword_1001E6480);
  p_opt_class_meths = &OBJC_PROTOCOL___MADEmbeddingStoreClientProtocol.opt_class_meths;
  if ((v2 & 1) == 0)
  {
    int v5 = __cxa_guard_acquire(&qword_1001E6480);
    p_opt_class_meths = &OBJC_PROTOCOL___MADEmbeddingStoreClientProtocol.opt_class_meths;
    if (v5)
    {
      byte_1001E6478 = 1;
      __cxa_guard_release(&qword_1001E6480);
      p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___MADEmbeddingStoreClientProtocol + 48);
    }
  }

  if (*((_BYTE *)p_opt_class_meths + 1144)) {
    return 4LL;
  }
  else {
    return 0LL;
  }
}

- (VCPMADQuickFaceIDAssetBatch)initWithAnalysisDatabase:(id)a3 quickFaceIDManager:(id)a4 cancelBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___VCPMADQuickFaceIDAssetBatch;
  v12 = -[VCPMADQuickFaceIDAssetBatch init](&v33, "init");
  if (!v12) {
    goto LABEL_7;
  }
  uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  assetEntries = v12->_assetEntries;
  v12->_assetEntries = (NSMutableArray *)v13;

  objc_storeStrong((id *)&v12->_analysisDatabase, a3);
  objc_storeStrong((id *)&v12->_quickFaceIDManager, a4);
  id v15 = objc_retainBlock(v11);
  id cancelBlock = v12->_cancelBlock;
  v12->_id cancelBlock = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADProcessingJobManager sharedManager](&OBJC_CLASS___VCPMADProcessingJobManager, "sharedManager"));
  v12->_id processQueuesAllowed = 1LL;
  if ([(id)objc_opt_class(v12) _allowConcurrentFaceProcessing])
  {
    id processQueuesAllowed = [(id)objc_opt_class(v12) _concurrentQueueCount];
    v12->_id processQueuesAllowed = (unint64_t)processQueuesAllowed;
  }

  else
  {
    id processQueuesAllowed = (id)v12->_processQueuesAllowed;
  }

  [v17 registerQueueGroupWithName:@"QuickFaceID" andNumberOfQueues:processQueuesAllowed];
  dispatch_group_t v19 = dispatch_group_create();
  processGroup = v12->_processGroup;
  v12->_processGroup = (OS_dispatch_group *)v19;

  uint64_t v21 = objc_claimAutoreleasedReturnValue([v17 getJobScheduler]);
  id scheduler = v12->_scheduler;
  v12->_id scheduler = (id)v21;

  if (v12->_scheduler)
  {

LABEL_7:
    v25 = v12;
    goto LABEL_13;
  }

  uint64_t v26 = MediaAnalysisLogLevel(v23, v24);
  if ((int)v26 >= 3)
  {
    uint64_t v28 = VCPLogInstance(v26, v27);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    os_log_type_t v30 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v29, v30))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "Failed to get job scheduler to dispatch analysis jobs onto global queues across batches",  v32,  2u);
    }
  }

  v25 = 0LL;
LABEL_13:

  return v25;
}

+ (id)batchWithAnalysisDatabase:(id)a3 quickFaceIDManager:(id)a4 cancelBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)a1) initWithAnalysisDatabase:v8 quickFaceIDManager:v9 cancelBlock:v10];

  return v11;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_assetEntries, "count");
}

- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6
{
  id v8 = a3;
  id v28 = a6;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v9 = self->_assetEntries;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v29,  v35,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v30;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v29 + 1) + 8 * (void)i) asset]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localIdentifier]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
        unsigned int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          uint64_t v20 = MediaAnalysisLogLevel(v17, v18);
          if ((int)v20 >= 4)
          {
            uint64_t v22 = VCPLogInstance(v20, v21);
            uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            os_log_type_t v24 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v23, v24))
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
              *(_DWORD *)buf = 138412290;
              v34 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "[QuickFaceID][%@] Batch already contains asset; ignoring",
                buf,
                0xCu);
            }
          }

          goto LABEL_14;
        }
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v29,  v35,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  assetEntries = self->_assetEntries;
  id v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[VCPMADQuickFaceIDAssetEntry entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:]( &OBJC_CLASS___VCPMADQuickFaceIDAssetEntry,  "entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:",  v8,  a4,  a5,  v28));
  -[NSMutableArray addObject:](assetEntries, "addObject:", v9);
LABEL_14:
}

- (int)prepare
{
  uint64_t v4 = VCPSignPostLog(self);
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  os_signpost_id_t spid = os_signpost_id_generate(v5);

  uint64_t v7 = VCPSignPostLog(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPMADQuickFaceIDAssetBatch_Prepare",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    oslog = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(oslog, v15))
    {
      unsigned int v16 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v17 = qos_class_self();
      uint64_t v18 = VCPMAQoSDescription(v17);
      unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 67109378;
      unsigned int v46 = v16;
      __int16 v47 = 2112;
      v48 = v2;
      _os_log_impl((void *)&_mh_execute_header, oslog, v15, "[QuickFaceID] Preparing %d assets (QoS: %@)", buf, 0x12u);
    }
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  osloga = self->_assetEntries;
  id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( osloga,  "countByEnumeratingWithState:objects:count:",  &v40,  v44,  16LL);
  if (v19)
  {
    uint64_t v20 = *(void *)v41;
    while (2)
    {
      uint64_t v21 = 0LL;
      uint64_t v22 = v2;
      do
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(osloga);
        }
        uint64_t v23 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)v21);
        analysisDatabase = self->_analysisDatabase;
        v25 = (char *)[v23 previousAttempts];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v23 asset]);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        id v28 = (id)-[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:]( analysisDatabase,  "setAttempts:asset:taskID:status:lastAttemptDate:",  v25 + 1,  v26,  8LL,  1LL,  v27);

        if ((_DWORD)v28 == -108)
        {
          unsigned __int8 v2 = v28;
        }

        else
        {
          BOOL v29 = (_DWORD)v28 == -36 || (_DWORD)v28 == -23;
          unsigned __int8 v2 = v28;
          if (!v29) {
            unsigned __int8 v2 = v22;
          }
        }

        if ((_DWORD)v28 == -108 || ((_DWORD)v28 != -36 ? (BOOL v30 = (_DWORD)v28 == -23) : (BOOL v30 = 1), v30))
        {
          __int128 v31 = (os_log_s *)osloga;
          goto LABEL_29;
        }

        uint64_t v21 = (char *)v21 + 1;
        uint64_t v22 = v2;
      }

      while (v19 != v21);
      id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( osloga,  "countByEnumeratingWithState:objects:count:",  &v40,  v44,  16LL);
      if (v19) {
        continue;
      }
      break;
    }
  }

  __int128 v32 = (void *)-[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
  int v33 = (int)v32;
  if ((_DWORD)v32 != -108 && (_DWORD)v32 != -36 && (_DWORD)v32 != -23) {
    __int128 v32 = v2;
  }
  if (v33 != -108 && v33 != -36 && v33 != -23)
  {
    uint64_t v34 = VCPSignPostLog(v32);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (spid - 1 >= 0xFFFFFFFFFFFFFFFELL)
    {
      LODWORD(v2) = 0;
      __int128 v31 = v35;
    }

    else
    {
      __int128 v31 = v35;
      if (os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_END,  spid,  "VCPMADQuickFaceIDAssetBatch_Prepare",  (const char *)&unk_100199097,  buf,  2u);
      }

      LODWORD(v2) = 0;
    }

- (void)_processAssetEntry:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisLogLevel(v4, v5);
  if ((int)v6 >= 6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_log_type_t v10 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localIdentifier]);
      *(_DWORD *)buf = 138412290;
      __int128 v43 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[QuickFaceID][%@] Processing asset", buf, 0xCu);
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v13 pet];

  uint64_t v15 = VCPSignPostLog(v14);
  unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  uint64_t v19 = VCPSignPostLog(v18);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_BEGIN,  v17,  "VCPMADQuickFaceIDAssetBatch_ProcessAsset",  (const char *)&unk_100199097,  buf,  2u);
  }

  quickFaceIDManager = self->_quickFaceIDManager;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
  id v40 = 0LL;
  id v41 = 0LL;
  id v24 = -[VCPPhotosQuickFaceIdentificationManager processAsset:onDemandDetection:detectedFaces:detectedPersons:]( quickFaceIDManager,  "processAsset:onDemandDetection:detectedFaces:detectedPersons:",  v23,  1LL,  &v41,  &v40);
  id v25 = v41;
  id v26 = v40;
  [v4 setStatus:v24];

  uint64_t v28 = VCPSignPostLog(v27);
  BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  BOOL v30 = v29;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_INTERVAL_END,  v17,  "VCPMADQuickFaceIDAssetBatch_ProcessAsset",  (const char *)&unk_100199097,  buf,  2u);
  }

  id v31 = [v4 status];
  if ((_DWORD)v31)
  {
    uint64_t v33 = MediaAnalysisLogLevel(v31, v32);
    if ((int)v33 >= 3)
    {
      uint64_t v35 = VCPLogInstance(v33, v34);
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      os_log_type_t v37 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v36, v37))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
        v39 = (void *)objc_claimAutoreleasedReturnValue([v38 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        __int128 v43 = v39;
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "[QuickFaceID][%@] Failed to process asset", buf, 0xCu);
      }
    }
  }

  else
  {
    [v4 setDetectedFaces:v25];
    [v4 setDetectedPersons:v26];
  }
}

- (int)process
{
  uint64_t v3 = VCPSignPostLog(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v7 = VCPSignPostLog(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "VCPMADQuickFaceIDAssetBatch_Process",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      unsigned int v17 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v18 = qos_class_self();
      uint64_t v19 = VCPMAQoSDescription(v18);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 67109378;
      LODWORD(v61[0]) = v17;
      WORD2(v61[0]) = 2112;
      *(void *)((char *)v61 + 6) = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[QuickFaceID] Processing %d assets (QoS: %@)", buf, 0x12u);
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v21 pet];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v23 = 0LL;
  os_log_type_t v24 = VCPLogToOSLogType[5];
  *(void *)&__int128 v25 = 138412290LL;
  __int128 v57 = v25;
  while (v23 < (unint64_t)-[NSMutableArray count](self->_assetEntries, "count", v57))
  {
    id v26 = objc_autoreleasePoolPush();
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_assetEntries, "objectAtIndexedSubscript:", v23));
    id cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
    if (cancelBlock && (uint64_t v29 = cancelBlock[2](), (_DWORD)v29))
    {
      uint64_t v31 = MediaAnalysisLogLevel(v29, v30);
      if ((int)v31 >= 5)
      {
        uint64_t v33 = VCPLogInstance(v31, v32);
        uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, v24))
        {
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v27 asset]);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v35 localIdentifier]);
          *(_DWORD *)buf = v57;
          v61[0] = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  v24,  "[QuickFaceID][%@] Processing canceled; skipping asset",
            buf,
            0xCu);
        }
      }

      [v27 setStatus:4294967168];
    }

    else
    {
      os_log_type_t v37 = (void *)objc_claimAutoreleasedReturnValue([v27 asset]);
      unsigned int v38 = objc_msgSend(v37, "vcp_isPano");

      if (v38)
      {
        [v22 addObject:v27];
      }

      else
      {
        processGroup = self->_processGroup;
        id scheduler = (void (**)(id, const __CFString *, OS_dispatch_group *, void *))self->_scheduler;
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472LL;
        v58[2] = sub_10004DD14;
        v58[3] = &unk_1001B9E70;
        v58[4] = self;
        id v59 = v27;
        scheduler[2](scheduler, @"QuickFaceID", processGroup, v58);
      }
    }

    objc_autoreleasePoolPop(v26);
    ++v23;
  }

  dispatch_group_wait((dispatch_group_t)self->_processGroup, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v41 = 0LL;
  while (v41 < (unint64_t)[v22 count])
  {
    __int128 v42 = objc_autoreleasePoolPush();
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:v41]);
    v44 = (uint64_t (**)(void))self->_cancelBlock;
    if (v44 && (uint64_t v45 = v44[2](), (_DWORD)v45))
    {
      uint64_t v47 = MediaAnalysisLogLevel(v45, v46);
      if ((int)v47 >= 5)
      {
        uint64_t v49 = VCPLogInstance(v47, v48);
        v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, v24))
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue([v43 asset]);
          v52 = (void *)objc_claimAutoreleasedReturnValue([v51 localIdentifier]);
          *(_DWORD *)buf = v57;
          v61[0] = v52;
          _os_log_impl( (void *)&_mh_execute_header,  v50,  v24,  "[QuickFaceID][%@] Processing canceled; skipping asset",
            buf,
            0xCu);
        }
      }

      [v43 setStatus:4294967168];
      char v53 = 0;
    }

    else
    {
      -[VCPMADQuickFaceIDAssetBatch _processAssetEntry:](self, "_processAssetEntry:", v43);
      char v53 = 1;
    }

    objc_autoreleasePoolPop(v42);
    ++v41;
    if ((v53 & 1) == 0) {
      goto LABEL_35;
    }
  }

  v54 = (uint64_t (**)(void))self->_cancelBlock;
  if (v54 && (v54[2]() & 1) != 0)
  {
LABEL_35:
    int v55 = -128;
    goto LABEL_37;
  }

  int v55 = 0;
LABEL_37:

  return v55;
}

- (int)publish
{
  uint64_t v3 = VCPSignPostLog(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t spid = os_signpost_id_generate(v4);

  uint64_t v6 = VCPSignPostLog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPMADQuickFaceIDAssetBatch_Publish",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
  uint64_t v13 = buf;
  if ((int)v11 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v11, v12);
    oslog = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v15 = VCPLogToOSLogType[6];
    os_log_type_t v16 = oslog;
    if (os_log_type_enabled(oslog, v15))
    {
      id v17 = -[NSMutableArray count](self->_assetEntries, "count");
      *(_DWORD *)buf = 134217984;
      id v79 = v17;
      os_log_type_t v16 = oslog;
      _os_log_impl((void *)&_mh_execute_header, oslog, v15, "[QuickFaceID] Persisting %lu assets", buf, 0xCu);
    }
  }

  if (-[NSMutableArray count](self->_assetEntries, "count"))
  {
    os_log_t oslogb = (os_log_t)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_assetEntries, "firstObject"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s asset](oslogb, "asset"));
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 photoLibrary]);

    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472LL;
    v74[2] = sub_10004E528;
    v74[3] = &unk_1001B9E70;
    os_log_t osloga = (os_log_t)(id)v19;
    os_log_t v75 = osloga;
    v76 = self;
    v62 = objc_retainBlock(v74);
    id cancelBlock = self->_cancelBlock;
    id v73 = 0LL;
    LOBYTE(v19) = -[os_log_s mad_performChangesAndWait:cancelBlock:extendTimeoutBlock:error:]( osloga,  "mad_performChangesAndWait:cancelBlock:extendTimeoutBlock:error:",  v62,  cancelBlock,  &stru_1001BB4B0,  &v73);
    id v21 = v73;
    v64 = v21;
    if ((v19 & 1) != 0)
    {
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      obj = self->_assetEntries;
      id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v69,  v77,  16LL);
      if (v23)
      {
        uint64_t v65 = *(void *)v70;
        while (2)
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v70 != v65) {
              objc_enumerationMutation(obj);
            }
            __int128 v25 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
            if ([v25 status])
            {
              if ([v25 status] == -128)
              {
                id v26 = [v25 previousAttempts];
                analysisDatabase = self->_analysisDatabase;
                if (v26)
                {
                  id v28 = [v25 previousAttempts];
                  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
                  id v30 = [v25 previousStatus];
                  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v25 lastAttemptDate]);
                  id v32 = (id)-[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:]( analysisDatabase,  "setAttempts:asset:taskID:status:lastAttemptDate:",  v28,  v29,  8LL,  v30,  v31);

                  if ((_DWORD)v32 == -108 || (_DWORD)v32 == -36)
                  {
                    uint64_t v33 = (uint8_t *)v32;
                  }

                  else
                  {
                    uint64_t v33 = (uint8_t *)v32;
                    if ((_DWORD)v32 != -23) {
                      uint64_t v33 = v13;
                    }
                  }

                  if ((_DWORD)v32 == -108) {
                    goto LABEL_72;
                  }
                  if ((_DWORD)v32 == -36) {
                    goto LABEL_72;
                  }
                  uint64_t v13 = v33;
                  if ((_DWORD)v32 == -23) {
                    goto LABEL_72;
                  }
                }

                else
                {
                  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
                  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 localIdentifier]);
                  id v49 = (id)-[VCPDatabaseWriter removeProcessingStatusForLocalIdentifier:andTaskID:]( analysisDatabase,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  v48,  8LL);

                  if ((_DWORD)v49 == -108 || (_DWORD)v49 == -36)
                  {
                    uint64_t v33 = (uint8_t *)v49;
                  }

                  else
                  {
                    uint64_t v33 = (uint8_t *)v49;
                    if ((_DWORD)v49 != -23) {
                      uint64_t v33 = v13;
                    }
                  }

                  if ((_DWORD)v49 == -108) {
                    goto LABEL_72;
                  }
                  if ((_DWORD)v49 == -36) {
                    goto LABEL_72;
                  }
                  uint64_t v13 = v33;
                  if ((_DWORD)v49 == -23) {
                    goto LABEL_72;
                  }
                }
              }

              else
              {
                if ([v25 status] == -23802)
                {
                  uint64_t v39 = 2LL;
                }

                else if ([v25 status] == -23808)
                {
                  uint64_t v39 = 7LL;
                }

                else
                {
                  uint64_t v39 = 3LL;
                }

                id v40 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
                unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v25 currentAttemptDate]);
                __int128 v42 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v40,  "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:",  v39,  v41,  (char *)objc_msgSend(v25, "previousAttempts") + 1));

                __int128 v43 = self->_analysisDatabase;
                v44 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
                uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v44 localIdentifier]);
                id v46 = (id)-[VCPDatabaseWriter updateProcessingStatus:andNextAttemptDate:forLocalIdentifier:andTaskID:]( v43,  "updateProcessingStatus:andNextAttemptDate:forLocalIdentifier:andTaskID:",  v39,  v42,  v45,  8LL);

                if ((_DWORD)v46 == -108 || (_DWORD)v46 == -36)
                {
                  uint64_t v33 = (uint8_t *)v46;
                }

                else
                {
                  uint64_t v33 = (uint8_t *)v46;
                  if ((_DWORD)v46 != -23) {
                    uint64_t v33 = v13;
                  }
                }

                if ((_DWORD)v46 == -108) {
                  goto LABEL_72;
                }
                if ((_DWORD)v46 == -36) {
                  goto LABEL_72;
                }
                uint64_t v13 = v33;
                if ((_DWORD)v46 == -23) {
                  goto LABEL_72;
                }
              }
            }

            else
            {
              uint64_t v34 = self->_analysisDatabase;
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v25 asset]);
              v36 = (void *)objc_claimAutoreleasedReturnValue([v35 localIdentifier]);
              id v37 = (id)-[VCPDatabaseWriter removeProcessingStatusForLocalIdentifier:andTaskID:]( v34,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  v36,  8LL);

              if ((_DWORD)v37 == -108)
              {
                uint64_t v33 = (uint8_t *)v37;
              }

              else
              {
                BOOL v38 = (_DWORD)v37 == -36 || (_DWORD)v37 == -23;
                uint64_t v33 = (uint8_t *)v37;
                if (!v38) {
                  uint64_t v33 = v13;
                }
              }

              if ((_DWORD)v37 == -108 || ((_DWORD)v37 != -36 ? (v50 = (_DWORD)v37 == -23) : (v50 = 1), uint64_t v13 = v33, v50))
              {
LABEL_72:

                goto LABEL_73;
              }
            }
          }

          id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v69,  v77,  16LL);
          if (v23) {
            continue;
          }
          break;
        }
      }

      uint64_t v57 = -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
      if ((_DWORD)v57 == -108 || (_DWORD)v57 == -36)
      {
        LODWORD(v33) = v57;
      }

      else
      {
        LODWORD(v33) = v57;
        if ((_DWORD)v57 != -23) {
          LODWORD(v33) = (_DWORD)v13;
        }
      }

      if ((_DWORD)v57 != -108 && (_DWORD)v57 != -36 && (_DWORD)v57 != -23)
      {
        uint64_t v58 = VCPSignPostLog(v57);
        id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
        v60 = v59;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v60,  OS_SIGNPOST_INTERVAL_END,  spid,  "VCPMADQuickFaceIDAssetBatch_Publish",  (const char *)&unk_100199097,  buf,  2u);
        }

        LODWORD(v33) = 0;
      }
    }

    else
    {
      uint64_t v51 = MediaAnalysisLogLevel(v21, v22);
      if ((int)v51 >= 3)
      {
        uint64_t v53 = VCPLogInstance(v51, v52);
        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        os_log_type_t v55 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v54, v55))
        {
          *(_DWORD *)buf = 138412290;
          id v79 = v64;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  v55,  "[QuickFaceID] Failed to persist person identification results to Photos (%@)",  buf,  0xCu);
        }
      }

      LODWORD(v33) = [v64 code];
    }

- (void).cxx_destruct
{
}

@end