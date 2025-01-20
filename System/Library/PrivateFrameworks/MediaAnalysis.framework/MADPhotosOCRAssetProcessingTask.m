@interface MADPhotosOCRAssetProcessingTask
+ (id)taskWithAnalysisDatabase:(id)a3;
- (MADPhotosOCRAssetProcessingTask)initWithAnalysisDatabase:(id)a3;
- (double)downloadInactiveTimeInterval;
- (id)acceptableResourcesForAsset:(id)a3 withResources:(id)a4;
- (id)assetLocalIdentifiers;
- (id)localResourceForAsset:(id)a3 withAcceptableResources:(id)a4;
- (id)remoteResourceForAsset:(id)a3 withAcceptableResources:(id)a4;
- (int)_prepare;
- (int)_process;
- (int)_publish;
- (int)removeDownloadRequestIDForAsset:(id)a3;
- (int)status;
- (unint64_t)count;
- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4;
- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7;
- (void)cancelRemainingDownloadsWithStatus:(int)a3;
- (void)dealloc;
- (void)download;
- (void)prepare;
- (void)process;
- (void)processAssetEntry:(id)a3 resource:(id)a4 resourceURL:(id)a5;
- (void)publish;
@end

@implementation MADPhotosOCRAssetProcessingTask

- (MADPhotosOCRAssetProcessingTask)initWithAnalysisDatabase:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MADPhotosOCRAssetProcessingTask;
  v6 = -[MADProcessingTask init](&v20, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    assetEntries = v6->_assetEntries;
    v6->_assetEntries = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_analysisDatabase, a3);
    v6->_shouldSkipPhotosPersist = 0;
    dispatch_group_t v9 = dispatch_group_create();
    downloadGroup = v6->_downloadGroup;
    v6->_downloadGroup = (OS_dispatch_group *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.mediaanalysisd.ocr.download", 0LL);
    downloadStateQueue = v6->_downloadStateQueue;
    v6->_downloadStateQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    downloadRequestIDs = v6->_downloadRequestIDs;
    v6->_downloadRequestIDs = (NSMutableDictionary *)v13;

    dispatch_group_t v15 = dispatch_group_create();
    computeGroup = v6->_computeGroup;
    v6->_computeGroup = (OS_dispatch_group *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.mediaanalysisd.ocr.compute", 0LL);
    computeQueue = v6->_computeQueue;
    v6->_computeQueue = (OS_dispatch_queue *)v17;
  }

  return v6;
}

+ (id)taskWithAnalysisDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithAnalysisDatabase:v4];

  return v5;
}

- (void)dealloc
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v3 = self->_assetEntries;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadURL]);
        BOOL v9 = v8 == 0LL;

        if (!v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadURL]);
          +[PHAssetResourceManager vcp_flushResourceURL:]( &OBJC_CLASS___PHAssetResourceManager,  "vcp_flushResourceURL:",  v10);
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v4);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MADPhotosOCRAssetProcessingTask;
  -[MADPhotosOCRAssetProcessingTask dealloc](&v11, "dealloc");
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_assetEntries, "count");
}

- (id)assetLocalIdentifiers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = self->_assetEntries;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)v7);
        BOOL v9 = objc_autoreleasePoolPush();
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asset", (void)v13));
        objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
        [v3 addObject:v11];

        objc_autoreleasePoolPop(v9);
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v5);
  }

  return v3;
}

- (int)status
{
  return self->_status;
}

- (void)addPhotosAsset:(id)a3 priority:(unint64_t)a4 previousStatus:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7
{
  id v12 = a3;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___MADPhotosOCRAssetProcessingTask;
  unint64_t v31 = a5;
  unint64_t v32 = a6;
  id v33 = a7;
  -[MADPhotosAssetProcessingTask addPhotosAsset:priority:previousStatus:attempts:lastAttemptDate:]( &v38,  "addPhotosAsset:priority:previousStatus:attempts:lastAttemptDate:",  v12,  a4,  a5,  a6);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  uint64_t v30 = 7LL;
  __int128 v13 = self->_assetEntries;
  id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v34,  v41,  16LL);
  if (v14)
  {
    uint64_t v15 = *(void *)v35;
    while (2)
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v13);
        }
        dispatch_queue_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * (void)i), "asset", v30 * 8));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localIdentifier]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
        unsigned int v20 = [v18 isEqualToString:v19];

        if (v20)
        {
          uint64_t v24 = MediaAnalysisLogLevel(v21, v22);
          if ((int)v24 >= 4)
          {
            uint64_t v26 = VCPLogInstance(v24, v25);
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            os_log_type_t v28 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v27, v28))
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
              *(_DWORD *)buf = 138412290;
              v40 = v29;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  v28,  "[OCR][%@] Batch already contains asset; ignoring",
                buf,
                0xCu);
            }
          }

          goto LABEL_14;
        }
      }

      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v34,  v41,  16LL);
      if (v14) {
        continue;
      }
      break;
    }
  }

  Class v23 = (&self->super.super.super.super.super.isa)[v30];
  __int128 v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[MADOCRAssetEntry entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:]( &OBJC_CLASS___MADOCRAssetEntry,  "entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:",  v12,  v31,  v32,  v33));
  -[objc_class addObject:](v23, "addObject:", v13);
LABEL_14:
}

- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4
{
  id v6 = a4;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100072D20;
  block[3] = &unk_1001BBF50;
  block[4] = self;
  id v10 = v6;
  int v11 = a3;
  id v8 = v6;
  dispatch_sync(downloadStateQueue, block);
}

- (int)removeDownloadRequestIDForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 0;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100072E88;
  block[3] = &unk_1001BBF78;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(downloadStateQueue, block);
  LODWORD(downloadStateQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)downloadStateQueue;
}

- (double)downloadInactiveTimeInterval
{
  uint64_t v6 = 0LL;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100073074;
  v5[3] = &unk_1001BA030;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(downloadStateQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)cancelRemainingDownloadsWithStatus:(int)a3
{
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100073164;
  v5[3] = &unk_1001BBFA0;
  v5[4] = self;
  int v6 = a3;
  dispatch_sync(downloadStateQueue, v5);
  dispatch_group_wait((dispatch_group_t)self->_downloadGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)download
{
  v124 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  -[VCPTimeMeasurement start](v124, "start");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  objc_msgSend( v3,  "addBreadcrumb:",  @"[OCR] Downloading %d assets",  -[NSMutableArray count](self->_assetEntries, "count"));

  uint64_t v5 = VCPSignPostLog(v4);
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v9 = VCPSignPostLog(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  os_signpost_id_t spid = v7;
  unint64_t v123 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "MADPhotosOCRAssetProcessingTask_Download",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 6)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    dispatch_queue_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      unsigned int v19 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v20 = qos_class_self();
      uint64_t v21 = VCPMAQoSDescription(v20);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v143 = v19;
      *(_WORD *)&v143[4] = 2112;
      *(void *)&v143[6] = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[OCR][Download] Downloading %d assets (QoS: %@)", buf, 0x12u);
    }
  }

  __int128 v138 = 0u;
  __int128 v139 = 0u;
  __int128 v136 = 0u;
  __int128 v137 = 0u;
  obj = self->_assetEntries;
  id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v136,  v141,  16LL);
  id v25 = v23;
  if (v23)
  {
    uint64_t v26 = *(void *)v137;
    os_log_type_t v27 = VCPLogToOSLogType[6];
    os_log_type_t type = VCPLogToOSLogType[4];
    do
    {
      os_log_type_t v28 = 0LL;
      do
      {
        if (*(void *)v137 != v26) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v136 + 1) + 8LL * (void)v28);
        uint64_t v30 = MediaAnalysisLogLevel(v23, v24);
        if ((int)v30 >= 6)
        {
          uint64_t v32 = VCPLogInstance(v30, v31);
          id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, v27))
          {
            __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v29 asset]);
            __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 localIdentifier]);
            *(_DWORD *)buf = 138412290;
            *(void *)v143 = v35;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  v27,  "[OCR][Download][%@] Finding download resource",  buf,  0xCu);
          }
        }

        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v29 asset]);
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v36));

        [v29 setAcceptableResources:v37];
        objc_super v38 = (void *)objc_claimAutoreleasedReturnValue([v29 asset]);
        uint64_t v39 = objc_claimAutoreleasedReturnValue( -[MADPhotosOCRAssetProcessingTask acceptableResourcesForAsset:withResources:]( self,  "acceptableResourcesForAsset:withResources:",  v38,  v37));

        v40 = (void *)v39;
        v41 = (void *)objc_claimAutoreleasedReturnValue([v29 asset]);
        v42 = (void *)objc_claimAutoreleasedReturnValue( -[MADPhotosOCRAssetProcessingTask remoteResourceForAsset:withAcceptableResources:]( self,  "remoteResourceForAsset:withAcceptableResources:",  v41,  v40));
        [v29 setDownloadResource:v42];

        v43 = (void *)objc_claimAutoreleasedReturnValue([v29 downloadResource]);
        BOOL v44 = v43 == 0LL;

        if (v44)
        {
          uint64_t v47 = MediaAnalysisLogLevel(v45, v46);
          if ((int)v47 >= 4)
          {
            uint64_t v49 = VCPLogInstance(v47, v48);
            v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
            if (os_log_type_enabled(v50, type))
            {
              v51 = (void *)objc_claimAutoreleasedReturnValue([v29 asset]);
              v52 = (void *)objc_claimAutoreleasedReturnValue([v51 localIdentifier]);
              *(_DWORD *)buf = 138412290;
              *(void *)v143 = v52;
              _os_log_impl( (void *)&_mh_execute_header,  v50,  type,  "[OCR][Download][%@] Failed to find download resource",  buf,  0xCu);
            }
          }

          [v29 setStatus:4294943494];
        }

        os_log_type_t v28 = (char *)v28 + 1;
      }

      while (v25 != v28);
      id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v136,  v141,  16LL);
      id v25 = v23;
    }

    while (v23);
  }

  __int128 v134 = 0u;
  __int128 v135 = 0u;
  __int128 v132 = 0u;
  __int128 v133 = 0u;
  v128 = self->_assetEntries;
  id v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v128,  "countByEnumeratingWithState:objects:count:",  &v132,  v140,  16LL);
  if (!v53)
  {
    int obja = 0;
    goto LABEL_52;
  }

  int obja = 0;
  uint64_t v54 = *(void *)v133;
  os_log_type_t typea = VCPLogToOSLogType[5];
  os_log_type_t v125 = VCPLogToOSLogType[4];
  do
  {
    for (i = 0LL; i != v53; i = (char *)i + 1)
    {
      if (*(void *)v133 != v54) {
        objc_enumerationMutation(v128);
      }
      v56 = *(void **)(*((void *)&v132 + 1) + 8LL * (void)i);
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v57 pet];

      v58 = (void *)objc_claimAutoreleasedReturnValue([v56 acceptableResources]);
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "mad_computeSyncResource"));

      if (v59)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue([v56 asset]);
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
        objc_msgSend( v56,  "setIsAnalysisCompleteFromComputeSync:",  objc_msgSend( v59,  "mad_isAnalysisCompleteFromComputeSyncForAsset:taskID:allowDownload:cancel:",  v60,  10,  1,  v61));

        id v62 = [v56 isAnalysisCompleteFromComputeSync];
        if ((_DWORD)v62)
        {
          uint64_t v64 = MediaAnalysisLogLevel(v62, v63);
          if ((int)v64 >= 5)
          {
            uint64_t v66 = VCPLogInstance(v64, v65);
            v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
            if (os_log_type_enabled(v67, typea))
            {
              v68 = (void *)objc_claimAutoreleasedReturnValue([v56 asset]);
              v69 = (void *)objc_claimAutoreleasedReturnValue([v68 localIdentifier]);
              *(_DWORD *)buf = 138412290;
              *(void *)v143 = v69;
              _os_log_impl( (void *)&_mh_execute_header,  v67,  typea,  "[OCR][Download][%@] Analysis complete with compute sync, skipping media resource download",  buf,  0xCu);
            }
          }

          goto LABEL_48;
        }

        uint64_t v70 = MediaAnalysisLogLevel(v62, v63);
        if ((int)v70 >= 5)
        {
          uint64_t v72 = VCPLogInstance(v70, v71);
          v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
          if (os_log_type_enabled(v73, typea))
          {
            v74 = (void *)objc_claimAutoreleasedReturnValue([v56 asset]);
            v75 = (void *)objc_claimAutoreleasedReturnValue([v74 localIdentifier]);
            *(_DWORD *)buf = 138412290;
            *(void *)v143 = v75;
            _os_log_impl( (void *)&_mh_execute_header,  v73,  typea,  "[OCR][Download][%@] Analysis remains incomplete with compute sync, falling back to media resource download",  buf,  0xCu);
          }
        }
      }

      v76 = (void *)objc_claimAutoreleasedReturnValue([v56 downloadResource]);
      BOOL v77 = v76 == 0LL;

      if (!v77)
      {
        dispatch_group_enter((dispatch_group_t)self->_downloadGroup);
        v78 = (void *)objc_claimAutoreleasedReturnValue([v56 downloadResource]);
        v131[0] = _NSConcreteStackBlock;
        v131[1] = 3221225472LL;
        v131[2] = sub_100074014;
        v131[3] = &unk_1001BBFC8;
        v131[4] = self;
        v131[5] = v56;
        uint64_t v79 = +[PHAssetResourceManager vcp_requestFileURLForAssetResource:taskID:completionHandler:]( &OBJC_CLASS___PHAssetResourceManager,  "vcp_requestFileURLForAssetResource:taskID:completionHandler:",  v78,  10LL,  v131);

        if ((_DWORD)v79)
        {
          v82 = (void *)objc_claimAutoreleasedReturnValue([v56 asset]);
          -[MADPhotosOCRAssetProcessingTask addDownloadRequestID:forAsset:]( self,  "addDownloadRequestID:forAsset:",  v79,  v82);

          ++obja;
        }

        else
        {
          uint64_t v83 = MediaAnalysisLogLevel(v80, v81);
          if ((int)v83 >= 4)
          {
            uint64_t v85 = VCPLogInstance(v83, v84);
            v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
            if (os_log_type_enabled(v86, v125))
            {
              v87 = (void *)objc_claimAutoreleasedReturnValue([v56 asset]);
              v88 = (void *)objc_claimAutoreleasedReturnValue([v87 localIdentifier]);
              *(_DWORD *)buf = 138412290;
              *(void *)v143 = v88;
              _os_log_impl( (void *)&_mh_execute_header,  v86,  v125,  "[OCR][Download][%@] Failed to initialize resource download",  buf,  0xCu);
            }
          }

          [v56 setStatus:4294943494];
          dispatch_group_leave((dispatch_group_t)self->_downloadGroup);
        }
      }

- (int)_prepare
{
  v42 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v4 = VCPSignPostLog(-[VCPTimeMeasurement start](v42, "start"));
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v8 = VCPSignPostLog(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  unint64_t v40 = v6 - 1;
  os_signpost_id_t spid = v6;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "MADPhotosOCRAssetProcessingTask_Prepare",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v13 >= 6)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v16, v17))
    {
      unsigned int v18 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v19 = qos_class_self();
      uint64_t v20 = VCPMAQoSDescription(v19);
      v2 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 67109378;
      unsigned int v49 = v18;
      __int16 v50 = 2112;
      v51 = v2;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[OCR][Prepare] Preparing %d assets (QoS: %@)", buf, 0x12u);
    }
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  uint64_t v21 = self->_assetEntries;
  id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v43,  v47,  16LL);
  if (v22)
  {
    uint64_t v23 = *(void *)v44;
LABEL_10:
    uint64_t v24 = 0LL;
    id v25 = v2;
    while (1)
    {
      if (*(void *)v44 != v23) {
        objc_enumerationMutation(v21);
      }
      uint64_t v26 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v24);
      analysisDatabase = self->_analysisDatabase;
      os_log_type_t v28 = (char *)[v26 previousAttempts];
      v29 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v31 = (id)-[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:]( analysisDatabase,  "setAttempts:asset:taskID:status:lastAttemptDate:",  v28 + 1,  v29,  10LL,  1LL,  v30);

      if ((_DWORD)v31 == -108)
      {
        v2 = v31;
      }

      else
      {
        BOOL v32 = (_DWORD)v31 == -36 || (_DWORD)v31 == -23;
        v2 = v31;
        if (!v32) {
          v2 = v25;
        }
      }

      if ((_DWORD)v31 == -108) {
        goto LABEL_39;
      }
      if ((_DWORD)v31 == -36 || (_DWORD)v31 == -23) {
        goto LABEL_39;
      }
      uint64_t v24 = (char *)v24 + 1;
      id v25 = v2;
      if (v22 == v24)
      {
        id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v43,  v47,  16LL);
        if (v22) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  uint64_t v34 = -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
  if ((_DWORD)v34 == -108 || (_DWORD)v34 == -36)
  {
    int v35 = v34;
  }

  else
  {
    int v35 = v34;
    if ((_DWORD)v34 != -23) {
      int v35 = (int)v2;
    }
  }

  if ((_DWORD)v34 != -108 && (_DWORD)v34 != -36 && (_DWORD)v34 != -23)
  {
    uint64_t v36 = VCPSignPostLog(v34);
    __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    objc_super v38 = v37;
    if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v38,  OS_SIGNPOST_INTERVAL_END,  spid,  "MADPhotosOCRAssetProcessingTask_Prepare",  (const char *)&unk_100199097,  buf,  2u);
    }

    -[VCPTimeMeasurement stop](v42, "stop");
    uint64_t v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    -[VCPTimeMeasurement elapsedTimeSeconds](v42, "elapsedTimeSeconds");
    -[NSMutableArray accumulateDoubleValue:forField:andEvent:]( v21,  "accumulateDoubleValue:forField:andEvent:",  @"TotalPrepareTimeInSeconds",  @"com.apple.mediaanalysisd.OCRAnalysisRunSession");
    LODWORD(v2) = 0;
LABEL_39:

    int v35 = (int)v2;
  }

  return v35;
}

- (void)prepare
{
  self->_status = -[MADPhotosOCRAssetProcessingTask _prepare](self, "_prepare");
}

- (id)acceptableResourcesForAsset:(id)a3 withResources:(id)a4
{
  id v5 = a3;
  id v38 = a4;
  if ([v5 hasAdjustments])
  {
    unsigned int v6 = 0;
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 photoLibrary]);
    unsigned int v6 = objc_msgSend(v7, "vcp_isSyndicationLibrary") ^ 1;
  }

  id v39 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v8 = v38;
  uint64_t v9 = 0LL;
  id v10 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        if ([v13 type] == (id)1)
        {
          id v14 = v13;

          uint64_t v9 = v14;
        }

        if (objc_msgSend(v13, "vcp_isPhoto"))
        {
          if ([v13 type] != (id)13 && objc_msgSend(v13, "type") != (id)8)
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "vcp_uniformTypeIdentifier"));
            unsigned __int8 v16 = +[VCPImageManager canDecodeAcceleratedUniformTypeIdentifier:]( &OBJC_CLASS___VCPImageManager,  "canDecodeAcceleratedUniformTypeIdentifier:",  v15);

            if ((v16 & 1) != 0)
            {
              unsigned int v17 = [v13 type] == (id)1 ? v6 : 1;
              if (v17 == 1
                && ([v13 analysisType] == (id)2 || objc_msgSend(v13, "analysisType") == (id)1))
              {
                [v39 addObject:v13];
              }
            }
          }
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }

    while (v10);
  }

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_descendingSizeComparator]( &OBJC_CLASS___PHAssetResource,  "vcp_descendingSizeComparator"));
  [v39 sortUsingComparator:v18];

  if (v9) {
    unsigned int v19 = v6;
  }
  else {
    unsigned int v19 = 0;
  }
  if (v19 == 1)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "vcp_uniformTypeIdentifier"));
    unsigned int v21 = [v20 conformsToType:UTTypePNG];

    if (v21) {
      [v39 addObject:v9];
    }
  }

  if (![v39 count])
  {
    uint64_t v23 = MediaAnalysisLogLevel(0LL, v22);
    if ((int)v23 >= 5)
    {
      uint64_t v25 = VCPLogInstance(v23, v24);
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      os_log_type_t v27 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v26, v27))
      {
        os_log_type_t v28 = (void *)objc_claimAutoreleasedReturnValue([v5 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        __int128 v45 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "[OCR][%@] No viable resources; allowing thumbnail",
          buf,
          0xCu);
      }
    }

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_thumbnailResource"));
    if (v30)
    {
      [v39 addObject:v30];
    }

    else
    {
      uint64_t v31 = MediaAnalysisLogLevel(0LL, v29);
      if ((int)v31 >= 4)
      {
        uint64_t v33 = VCPLogInstance(v31, v32);
        uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        os_log_type_t v35 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v5 localIdentifier]);
          *(_DWORD *)buf = 138412290;
          __int128 v45 = v36;
          _os_log_impl((void *)&_mh_execute_header, v34, v35, "[OCR][%@] Asset has no thumbnail resource", buf, 0xCu);
        }
      }
    }
  }

  return v39;
}

- (id)localResourceForAsset:(id)a3 withAcceptableResources:(id)a4
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = a4;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if (objc_msgSend(v8, "isLocallyAvailable", (void)v10))
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (id)remoteResourceForAsset:(id)a3 withAcceptableResources:(id)a4
{
  id v5 = a3;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        __int128 v10 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if (objc_msgSend(v10, "analysisType", (void)v21) == (id)1)
        {
          id v19 = v10;

          goto LABEL_15;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v13 >= 5)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v16, v17))
    {
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v5 localIdentifier]);
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[OCR][Download][%@] No medium image derivative available; allowing other high-res resources",
        buf,
        0xCu);
    }
  }

  id v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject", (void)v21));
LABEL_15:

  return v19;
}

- (void)processAssetEntry:(id)a3 resource:(id)a4 resourceURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      os_log_type_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localIdentifier]);
      *(_DWORD *)buf = 138412290;
      v186 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[OCR][Process][%@] Processing asset", buf, 0xCu);
    }
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v19 pet];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
  if (!v20
    || (__int128 v21 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock")),
        int v22 = v21[2](),
        v21,
        v20,
        !v22))
  {
    id v32 = [v8 isAnalysisCompleteFromComputeSync];
    if ((_DWORD)v32)
    {
      uint64_t v34 = MediaAnalysisLogLevel(v32, v33);
      uint64_t v36 = VCPLogInstance(v34, v35);
      __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      os_log_type_t v38 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v37, v38))
      {
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v186 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  v38,  "[OCR][Process][%@] Analysis already complete from compute sync ingestion; skipping",
          buf,
          0xCu);
      }

- (int)_process
{
  uint64_t v93 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v2 = VCPSignPostLog(-[VCPTimeMeasurement start](v93, "start"));
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v6 = VCPSignPostLog(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  unint64_t v91 = v4 - 1;
  os_signpost_id_t spid = v4;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v4,  "MADPhotosOCRAssetProcessingTask_Process",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
  if ((int)v11 >= 6)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      unsigned int v16 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v17 = qos_class_self();
      uint64_t v18 = VCPMAQoSDescription(v17);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 67109378;
      LODWORD(v103[0]) = v16;
      WORD2(v103[0]) = 2112;
      *(void *)((char *)v103 + 6) = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "[OCR][Process] Processing %d assets (QoS: %@)", buf, 0x12u);
    }
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v20 pet];

  unint64_t v21 = 0LL;
  char v95 = -[NSMutableArray count](self->_assetEntries, "count") != 0LL;
  os_log_type_t v22 = VCPLogToOSLogType[6];
  os_log_type_t type = VCPLogToOSLogType[4];
  id v94 = (id)VCPPhotosOCRProcessingFromGatingVersion;
  BOOL v90 = @"NumberOfAssetsGated";
  while (1)
  {
    id v23 = -[NSMutableArray count](self->_assetEntries, "count", v90);
    uint64_t v25 = objc_autoreleasePoolPush();
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_assetEntries, "objectAtIndexedSubscript:", v21));
    uint64_t v28 = MediaAnalysisLogLevel(v26, v27);
    if ((int)v28 >= 6)
    {
      uint64_t v30 = VCPLogInstance(v28, v29);
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, v22))
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v103[0] = v33;
        _os_log_impl((void *)&_mh_execute_header, v31, v22, "[OCR][Process][%@] Staging asset", buf, 0xCu);
      }
    }

    id v34 = [v26 status];
    if ((_DWORD)v34)
    {
      uint64_t v36 = MediaAnalysisLogLevel(v34, v35);
      uint64_t v38 = VCPLogInstance(v36, v37);
      id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, type))
      {
        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v103[0] = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  type,  "[OCR][Process][%@] Asset has failure status; skipping",
          buf,
          0xCu);
      }

      goto LABEL_29;
    }

    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
    os_signpost_id_t v43 = (void *)objc_claimAutoreleasedReturnValue([v42 adjustmentVersion]);
    BOOL v44 = v43 == 0LL;

    if (!v44)
    {
      uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 downloadResource]);
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v26 downloadURL]);
      if (v48)
      {
        unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
        [v49 accumulateInt64Value:1 forField:@"NumbeOfResourceDownloads" andEvent:@"com.apple.mediaanalysisd.OCRAnalysisRunSession"];

        goto LABEL_21;
      }

      id v64 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v64));

      uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
      v67 = (void *)objc_claimAutoreleasedReturnValue( -[MADPhotosOCRAssetProcessingTask acceptableResourcesForAsset:withResources:]( self,  "acceptableResourcesForAsset:withResources:",  v66,  v65));

      uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
      id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[MADPhotosOCRAssetProcessingTask localResourceForAsset:withAcceptableResources:]( self,  "localResourceForAsset:withAcceptableResources:",  v68,  v67));

      if (v39)
      {
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s privateFileURL](v39, "privateFileURL"));

        if (v48)
        {
          uint64_t v47 = v39;
LABEL_21:
          __int16 v50 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v50 characterRecognitionProperties]);
          id v52 = [v51 algorithmVersion];

          BOOL v53 = [v26 version] == (_DWORD)v94 && v52 == v94;
          computeGroup = self->_computeGroup;
          computeQueue = (dispatch_queue_s *)self->_computeQueue;
          char v56 = v53;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100076A10;
          block[3] = &unk_1001BBFF0;
          block[4] = self;
          id v99 = v26;
          id v39 = v47;
          uint64_t v100 = v39;
          id v101 = v48;
          id v57 = v48;
          dispatch_group_async((dispatch_group_t)computeGroup, computeQueue, block);

          v95 &= v56;
LABEL_28:

LABEL_29:
          goto LABEL_35;
        }
      }

      else
      {
      }

      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
      id v57 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "vcp_passedOCRGating"));

      id v70 = [v57 BOOLValue];
      if ((_DWORD)v70)
      {
        uint64_t v72 = MediaAnalysisLogLevel(v70, v71);
        if ((int)v72 >= 4)
        {
          uint64_t v74 = VCPLogInstance(v72, v73);
          uint64_t v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
          if (os_log_type_enabled(v75, type))
          {
            uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
            BOOL v77 = (void *)objc_claimAutoreleasedReturnValue([v76 localIdentifier]);
            *(_DWORD *)buf = 138412290;
            v103[0] = v77;
            _os_log_impl( (void *)&_mh_execute_header,  v75,  type,  "[OCR][Process][%@] No acceptable resource available",  buf,  0xCu);
          }
        }

        [v26 setStatus:4294943494];
      }

      else
      {
        [v26 setVersion:v94];
        os_signpost_id_t v78 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
        [v78 accumulateInt64Value:1 forField:v90 andEvent:@"com.apple.mediaanalysisd.OCRAnalysisRunSession"];
      }

      goto LABEL_28;
    }

    uint64_t v58 = MediaAnalysisLogLevel(v45, v46);
    if ((int)v58 >= 4)
    {
      uint64_t v60 = VCPLogInstance(v58, v59);
      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, type))
      {
        id v62 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
        unsigned __int8 v63 = (void *)objc_claimAutoreleasedReturnValue([v62 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v103[0] = v63;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  type,  "[OCR][Process][%@] Asset has no adjustment version; skipping",
          buf,
          0xCu);
      }
    }

    [v26 setStatus:4294943493];
LABEL_35:

    objc_autoreleasePoolPop(v25);
    ++v21;
  }

  self->_shouldSkipPhotosPersist = v95 & 1;
  uint64_t v79 = MediaAnalysisLogLevel(v23, v24);
  if ((int)v79 >= 6)
  {
    uint64_t v81 = VCPLogInstance(v79, v80);
    v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v82, v22))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v82, v22, "[OCR][Process] Waiting for compute to complete", buf, 2u);
    }
  }

  uint64_t v83 = dispatch_group_wait((dispatch_group_t)self->_computeGroup, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v84 = VCPSignPostLog(v83);
  uint64_t v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
  uint64_t v86 = v85;
  if (v91 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v86,  OS_SIGNPOST_INTERVAL_END,  spid,  "MADPhotosOCRAssetProcessingTask_Process",  (const char *)&unk_100199097,  buf,  2u);
  }

  -[VCPTimeMeasurement stop](v93, "stop");
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  -[VCPTimeMeasurement elapsedTimeSeconds](v93, "elapsedTimeSeconds");
  objc_msgSend( v87,  "accumulateDoubleValue:forField:andEvent:",  @"TotalAnalyzingTimeInSeconds",  @"com.apple.mediaanalysisd.OCRAnalysisRunSession");

  v88 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  -[VCPTimeMeasurement elapsedTimeSeconds](v93, "elapsedTimeSeconds");
  objc_msgSend( v88,  "accumulateDoubleValue:forField:andEvent:",  @"TotalProcessTimeInSeconds",  @"com.apple.mediaanalysisd.OCRAnalysisRunSession");

  return 0;
}

- (void)process
{
  if (!self->_status) {
    self->_status = -[MADPhotosOCRAssetProcessingTask _process](self, "_process");
  }
}

- (int)_publish
{
  uint64_t v84 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v3 = VCPSignPostLog(-[VCPTimeMeasurement start](v84, "start"));
  os_signpost_id_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v7 = VCPSignPostLog(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  unint64_t v80 = v5 - 1;
  os_signpost_id_t spid = v5;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "MADPhotosOCRAssetProcessingTask_Publish",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    os_log_type_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      unsigned int v17 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v18 = qos_class_self();
      uint64_t v19 = VCPMAQoSDescription(v18);
      p_superclass = (__objc2_class **)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)os_log_type_t v97 = v17;
      *(_WORD *)&v97[4] = 2112;
      *(void *)&v97[6] = p_superclass;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[OCR][Publish] Persisting %d assets (QoS: %@)", buf, 0x12u);
    }
  }

  if (!-[NSMutableArray count](self->_assetEntries, "count"))
  {
    LODWORD(p_superclass) = 0;
    goto LABEL_87;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_assetEntries, "firstObject"));
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 asset]);
  v82 = (void *)objc_claimAutoreleasedReturnValue([v21 photoLibrary]);

  if (self->_shouldSkipPhotosPersist)
  {
    uint64_t v24 = MediaAnalysisLogLevel(v22, v23);
    if ((int)v24 >= 6)
    {
      uint64_t v26 = VCPLogInstance(v24, v25);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      os_log_type_t v28 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v27, v28))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  v28,  "[OCR][Publish] Skipped Photos persist since all assets were and still are gated",  buf,  2u);
      }
    }
  }

  else
  {
    p_superclass = &OBJC_METACLASS___VCPRequestResetPersonsTask.superclass;
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    objc_msgSend( v29,  "addBreadcrumb:",  @"[OCR] Persisting %d assets to Photos",  -[NSMutableArray count](self->_assetEntries, "count"));

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v30 pet];

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v31 enterKnownTimeoutRisk:1];

    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472LL;
    v94[2] = sub_1000775B4;
    v94[3] = &unk_1001BA0C8;
    v94[4] = self;
    id v32 = objc_retainBlock(v94);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
    id v93 = 0LL;
    unsigned __int8 v34 = objc_msgSend( v82,  "mad_performChangesAndWait:cancelBlock:extendTimeoutBlock:error:",  v32,  v33,  &stru_1001BC010,  &v93);
    id v35 = v93;

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v36 exitKnownTimeoutRisk];

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    objc_msgSend( v37,  "addBreadcrumb:",  @"[OCR] Finished persisting %d assets to Photos",  -[NSMutableArray count](self->_assetEntries, "count"));

    if ((v34 & 1) == 0)
    {
      uint64_t v40 = MediaAnalysisLogLevel(v38, v39);
      if ((int)v40 >= 3)
      {
        uint64_t v42 = VCPLogInstance(v40, v41);
        os_signpost_id_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        os_log_type_t v44 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v43, v44))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)os_log_type_t v97 = v35;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  v44,  "[OCR][Publish] Failed to persist OCR results to Photos (%@)",  buf,  0xCu);
        }
      }

      p_superclass = (__objc2_class **)[v35 code];
    }

    if ((v34 & 1) == 0) {
      goto LABEL_86;
    }
  }

  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  obj = self->_assetEntries;
  id v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v89,  v95,  16LL);
  if (!v45)
  {
    unsigned int v83 = 0;
    LODWORD(v46) = (_DWORD)p_superclass;
    goto LABEL_73;
  }

  unsigned int v83 = 0;
  uint64_t v87 = *(void *)v90;
  uint64_t v46 = p_superclass;
  do
  {
    id v86 = v45;
    for (i = 0LL; i != v86; i = (char *)i + 1)
    {
      if (*(void *)v90 != v87) {
        objc_enumerationMutation(obj);
      }
      uint64_t v48 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)i);
      if (![v48 status])
      {
        analysisDatabase = self->_analysisDatabase;
        id v57 = (void *)objc_claimAutoreleasedReturnValue([v48 asset]);
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v57 localIdentifier]);
        id v59 = (id)-[VCPDatabaseWriter removeProcessingStatusForLocalIdentifier:andTaskID:]( analysisDatabase,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  v58,  10LL);

        if ((_DWORD)v59 == -108)
        {
          p_superclass = (__objc2_class **)v59;
        }

        else
        {
          BOOL v60 = (_DWORD)v59 == -36 || (_DWORD)v59 == -23;
          p_superclass = (__objc2_class **)v59;
          if (!v60) {
            p_superclass = v46;
          }
        }

        if ((_DWORD)v59 == -108) {
          goto LABEL_85;
        }
        if ((_DWORD)v59 == -36 || (_DWORD)v59 == -23) {
          goto LABEL_85;
        }
        v67 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
        [v67 accumulateInt64Value:1 forField:@"NumberOfAssetsAnalyzed" andEvent:@"com.apple.mediaanalysisd.OCRAnalysisRunSession"];

        goto LABEL_59;
      }

      if ([v48 status] == -128)
      {
        id v49 = [v48 previousAttempts];
        __int16 v50 = self->_analysisDatabase;
        if (v49)
        {
          id v51 = [v48 previousAttempts];
          id v52 = (void *)objc_claimAutoreleasedReturnValue([v48 asset]);
          id v53 = [v48 previousStatus];
          id v54 = (void *)objc_claimAutoreleasedReturnValue([v48 lastAttemptDate]);
          id v55 = (id)-[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:]( v50,  "setAttempts:asset:taskID:status:lastAttemptDate:",  v51,  v52,  10LL,  v53,  v54);
        }

        else
        {
          id v52 = (void *)objc_claimAutoreleasedReturnValue([v48 asset]);
          id v54 = (void *)objc_claimAutoreleasedReturnValue([v52 localIdentifier]);
          id v55 = (id)-[VCPDatabaseWriter removeProcessingStatusForLocalIdentifier:andTaskID:]( v50,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  v54,  10LL);
        }

        if ((_DWORD)v55 == -108 || (_DWORD)v55 == -36)
        {
          p_superclass = (__objc2_class **)v55;
        }

        else
        {
          p_superclass = (__objc2_class **)v55;
          if ((_DWORD)v55 != -23) {
            p_superclass = v46;
          }
        }

        if ((_DWORD)v55 == -108 || (_DWORD)v55 == -36 || (_DWORD)v55 == -23) {
          goto LABEL_85;
        }
        unsigned int v83 = [v48 status];
LABEL_59:
        uint64_t v46 = p_superclass;
        continue;
      }

      v61 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
      id v62 = @"NumberOfAssetsSoftFailure";
      if ([v48 status] == -23802)
      {
        unsigned __int8 v63 = @"NumberOfAssetsNoResource";
        uint64_t v64 = 2LL;
      }

      else
      {
        if ([v48 status] != -23808)
        {
          uint64_t v64 = 3LL;
          goto LABEL_61;
        }

        unsigned int v83 = [v48 status];
        unsigned __int8 v63 = @"NumberOfAssetsDownloadThrottled";
        uint64_t v64 = 7LL;
      }

      uint64_t v65 = v63;

      id v62 = v65;
LABEL_61:
      [v61 accumulateInt64Value:1 forField:v62 andEvent:@"com.apple.mediaanalysisd.OCRAnalysisRunSession"];
      [v61 accumulateInt64Value:1 forField:@"NumberOfAssetsIntoBlacklist" andEvent:@"com.apple.mediaanalysisd.OCRAnalysisRunSession"];
      uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v48 asset]);
      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v48 currentAttemptDate]);
      id v70 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v68,  "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:",  v64,  v69,  (char *)objc_msgSend(v48, "previousAttempts") + 1));

      uint64_t v71 = self->_analysisDatabase;
      uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue([v48 asset]);
      uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue([v72 localIdentifier]);
      id v74 = (id)-[VCPDatabaseWriter updateProcessingStatus:andNextAttemptDate:forLocalIdentifier:andTaskID:]( v71,  "updateProcessingStatus:andNextAttemptDate:forLocalIdentifier:andTaskID:",  v64,  v70,  v73,  10LL);

      if ((_DWORD)v74 == -108 || (_DWORD)v74 == -36)
      {
        p_superclass = (__objc2_class **)v74;
      }

      else
      {
        p_superclass = (__objc2_class **)v74;
        if ((_DWORD)v74 != -23) {
          p_superclass = v46;
        }
      }

      if ((_DWORD)v74 == -108) {
        goto LABEL_85;
      }
      if ((_DWORD)v74 == -36) {
        goto LABEL_85;
      }
      uint64_t v46 = p_superclass;
      if ((_DWORD)v74 == -23) {
        goto LABEL_85;
      }
    }

    id v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v89,  v95,  16LL);
  }

  while (v45);
LABEL_73:

  uint64_t v75 = -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
  if ((_DWORD)v75 == -108 || (_DWORD)v75 == -36)
  {
    LODWORD(p_superclass) = v75;
  }

  else
  {
    LODWORD(p_superclass) = v75;
    if ((_DWORD)v75 != -23) {
      LODWORD(p_superclass) = (_DWORD)v46;
    }
  }

  if ((_DWORD)v75 != -108 && (_DWORD)v75 != -36 && (_DWORD)v75 != -23)
  {
    uint64_t v76 = VCPSignPostLog(v75);
    BOOL v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
    os_signpost_id_t v78 = v77;
    if (v80 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v78,  OS_SIGNPOST_INTERVAL_END,  spid,  "MADPhotosOCRAssetProcessingTask_Publish",  (const char *)&unk_100199097,  buf,  2u);
    }

    -[VCPTimeMeasurement stop](v84, "stop");
    obj = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    -[VCPTimeMeasurement elapsedTimeSeconds](v84, "elapsedTimeSeconds");
    -[NSMutableArray accumulateDoubleValue:forField:andEvent:]( obj,  "accumulateDoubleValue:forField:andEvent:",  @"TotalPublishTimeInSeconds",  @"com.apple.mediaanalysisd.OCRAnalysisRunSession");
    LODWORD(p_superclass) = v83;
LABEL_85:
  }

- (void)publish
{
  if (!self->_status) {
    self->_status = -[MADPhotosOCRAssetProcessingTask _publish](self, "_publish");
  }
}

- (void).cxx_destruct
{
}

@end