@interface MADPhotosFaceCropGenerationTask
- (MADPhotosFaceCropGenerationTask)init;
- (double)downloadInactiveTimeInterval;
- (int)removeDownloadRequestIDForAsset:(id)a3;
- (unint64_t)count;
- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4;
- (void)addFace:(id)a3;
- (void)cancelRemainingDownloadsWithStatus:(int)a3;
- (void)download;
- (void)prepare;
- (void)process;
@end

@implementation MADPhotosFaceCropGenerationTask

- (MADPhotosFaceCropGenerationTask)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MADPhotosFaceCropGenerationTask;
  v2 = -[MADProcessingTask init](&v14, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    faces = v2->_faces;
    v2->_faces = (NSMutableSet *)v3;

    dispatch_group_t v5 = dispatch_group_create();
    downloadGroup = v2->_downloadGroup;
    v2->_downloadGroup = (OS_dispatch_group *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mediaanalysisd.facecrop.download", v8);
    downloadStateQueue = v2->_downloadStateQueue;
    v2->_downloadStateQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    downloadRequestIDs = v2->_downloadRequestIDs;
    v2->_downloadRequestIDs = (NSMutableDictionary *)v11;
  }

  return v2;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableSet count](self->_faces, "count");
}

- (void)addFace:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableSet containsObject:](self->_faces, "containsObject:", v4);
  if ((_DWORD)v5)
  {
    uint64_t v7 = MediaAnalysisLogLevel(v5, v6);
    if ((int)v7 >= 4)
    {
      uint64_t v9 = VCPLogInstance(v7, v8);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      os_log_type_t v11 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v10, v11))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v4 localIdentifier]);
        int v13 = 138412290;
        objc_super v14 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "[FaceCrop][%@] Batch already contains face; ignoring",
          (uint8_t *)&v13,
          0xCu);
      }
    }
  }

  else
  {
    -[NSMutableSet addObject:](self->_faces, "addObject:", v4);
  }
}

- (void)prepare
{
  v68 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v3 = VCPSignPostLog(-[VCPTimeMeasurement start](v68, "start"));
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v7 = VCPSignPostLog(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  unint64_t v67 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "MADPhotosFaceCropGenerationTask_Prepare",  (const char *)&unk_100199097,  buf,  2u);
  }

  os_signpost_id_t spid = v5;

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsGroupedByFaceUUIDForFaces:]( &OBJC_CLASS___PHAsset,  "fetchAssetsGroupedByFaceUUIDForFaces:",  self->_faces));
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  v66 = self;
  os_log_type_t v11 = self->_faces;
  id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v77,  v88,  16LL);
  v71 = v10;
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v78;
    uint64_t v15 = VCPLogToOSLogType[3];
    os_log_type_t type = VCPLogToOSLogType[3];
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v78 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uuid", spid));
        v19 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v18]);

        if (v19)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);

          if (v22)
          {
            uint64_t v25 = v15;
            v26 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
            v27 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKeyedSubscript:v26]);

            if (v27)
            {
              v28 = (MADPhotosFaceCropGenerationEntry *)objc_claimAutoreleasedReturnValue([v27 faces]);
              -[MADPhotosFaceCropGenerationEntry addObject:](v28, "addObject:", v17);
            }

            else
            {
              v28 = -[MADPhotosFaceCropGenerationEntry initWithAsset:andFace:]( objc_alloc(&OBJC_CLASS___MADPhotosFaceCropGenerationEntry),  "initWithAsset:andFace:",  v19,  v17);
              if (v28)
              {
                v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
                [v72 setObject:v28 forKeyedSubscript:v33];
              }

              else
              {
                uint64_t v34 = MediaAnalysisLogLevel(0LL, v32);
                uint64_t v36 = VCPLogInstance(v34, v35);
                v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
                if (os_log_type_enabled(v33, (os_log_type_t)v25))
                {
                  v70 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
                  v37 = (void *)objc_claimAutoreleasedReturnValue([v17 localIdentifier]);
                  *(_DWORD *)buf = 138412546;
                  v83 = v70;
                  __int16 v84 = 2112;
                  v85 = v37;
                  _os_log_impl( (void *)&_mh_execute_header,  v33,  type,  "[FaceCrop] Failed to create entry asset %@ and face %@; skip",
                    buf,
                    0x16u);
                }
              }
            }

- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4
{
  id v6 = a4;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009B398;
  block[3] = &unk_1001BC718;
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
  block[2] = sub_10009B4E4;
  block[3] = &unk_1001B9DD8;
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
  v5[2] = sub_10009B6B4;
  v5[3] = &unk_1001B9D88;
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
  v5[2] = sub_10009B790;
  v5[3] = &unk_1001B9DB0;
  v5[4] = self;
  int v6 = a3;
  dispatch_sync(downloadStateQueue, v5);
  dispatch_group_wait((dispatch_group_t)self->_downloadGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)download
{
  __int16 v84 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v3 = VCPSignPostLog(-[VCPTimeMeasurement start](v84, "start"));
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v7 = VCPSignPostLog(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  unint64_t v83 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "MADPhotosFaceCropGenerationTask_Download",  (const char *)&unk_100199097,  buf,  2u);
  }

  os_signpost_id_t spid = v5;

  uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      unsigned int v17 = -[NSArray count](self->_assetEntries, "count");
      uint64_t v18 = qos_class_self();
      uint64_t v19 = VCPMAQoSDescription(v18);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v95 = v17;
      *(_WORD *)&v95[4] = 2112;
      *(void *)&v95[6] = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "[FaceCrop][Download] Downloading %d assets (QoS: %@)",  buf,  0x12u);
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  objc_msgSend( v21,  "addBreadcrumb:",  @"[FaceCropGeneration] Downloading %d assets",  -[NSArray count](self->_assetEntries, "count"));

  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  obj = self->_assetEntries;
  id v22 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v89,  v93,  16LL);
  uint64_t v23 = &selRef_requestImageProcessing_forAssetURL_withSandboxToken_identifier_requestID_andReply_;
  if (v22)
  {
    id v24 = v22;
    uint64_t v25 = 0LL;
    uint64_t v26 = *(void *)v90;
    os_log_type_t type = VCPLogToOSLogType[4];
    v85 = self;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v90 != v26) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)i);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
        [v29 pet];

        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 resource]);
        if (v30)
        {
          uint64_t v31 = *((int *)v23 + 771);
          dispatch_group_enter(*(dispatch_group_t *)((char *)&self->super.super.super.super.isa + v31));
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v28 resource]);
          v88[0] = _NSConcreteStackBlock;
          v88[1] = 3221225472LL;
          v88[2] = sub_10009C00C;
          v88[3] = &unk_1001BC740;
          v88[4] = self;
          v88[5] = v28;
          uint64_t v33 = +[PHAssetResourceManager vcp_requestFileURLForAssetResource:taskID:completionHandler:]( &OBJC_CLASS___PHAssetResourceManager,  "vcp_requestFileURLForAssetResource:taskID:completionHandler:",  v32,  3LL,  v88);

          if ((_DWORD)v33)
          {
            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v28 asset]);
            -[MADPhotosFaceCropGenerationTask addDownloadRequestID:forAsset:]( self,  "addDownloadRequestID:forAsset:",  v33,  v36);

            uint64_t v25 = (v25 + 1);
          }

          else
          {
            uint64_t v37 = MediaAnalysisLogLevel(v34, v35);
            if ((int)v37 >= 4)
            {
              uint64_t v39 = VCPLogInstance(v37, v38);
              v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(v40, type))
              {
                v41 = (void *)objc_claimAutoreleasedReturnValue([v28 asset]);
                uint64_t v42 = v25;
                id v43 = v23;
                uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v41 localIdentifier]);
                *(_DWORD *)buf = 138412290;
                *(void *)v95 = v44;
                _os_log_impl( (void *)&_mh_execute_header,  v40,  type,  "[FaceCrop][Download][%@] Failed to initialize resource download",  buf,  0xCu);

                uint64_t v23 = v43;
                uint64_t v25 = v42;
                self = v85;
              }
            }

            [v28 setStatus:4294943494];
            dispatch_group_leave(*(dispatch_group_t *)((char *)&self->super.super.super.super.isa + v31));
          }
        }
      }

      id v24 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v89,  v93,  16LL);
    }

    while (v24);
  }

  else
  {
    LODWORD(v25) = 0;
  }

  uint64_t v47 = MediaAnalysisLogLevel(v45, v46);
  if ((int)v47 >= 6)
  {
    uint64_t v49 = VCPLogInstance(v47, v48);
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    os_log_type_t v51 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v50, v51))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v95 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  v51,  "[FaceCrop][Download] Waiting for %d downloads to complete",  buf,  8u);
    }
  }

  uint64_t v52 = *((int *)v23 + 771);
  while (1)
  {
    uint64_t v53 = *(dispatch_group_s **)((char *)&self->super.super.super.super.isa + v52);
    dispatch_time_t v54 = dispatch_time(0LL, 500000000LL);
    id v55 = (id)dispatch_group_wait(v53, v54);
    if (!v55) {
      break;
    }
    uint64_t v56 = objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
    if (v56)
    {
      v57 = (void *)v56;
      v58 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
      int v59 = v58[2]();

      if (v59)
      {
        uint64_t v72 = MediaAnalysisLogLevel(v60, v61);
        if ((int)v72 >= 5)
        {
          uint64_t v74 = VCPLogInstance(v72, v73);
          __int128 v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
          os_log_type_t v76 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v75, v76))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v75,  v76,  "[FaceCrop][Download] Processing cancelled; cancelling downloads",
              buf,
              2u);
          }
        }

        v70 = self;
        uint64_t v71 = 4294967168LL;
        goto LABEL_44;
      }
    }

    id v62 = -[MADPhotosFaceCropGenerationTask downloadInactiveTimeInterval](self, "downloadInactiveTimeInterval");
    if (v64 > 60.0)
    {
      uint64_t v65 = MediaAnalysisLogLevel(v62, v63);
      if ((int)v65 >= 5)
      {
        uint64_t v67 = VCPLogInstance(v65, v66);
        v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
        os_log_type_t v69 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v68, v69))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v68,  v69,  "[FaceCrop][Download] Download inactivity timeout; cancelling downloads",
            buf,
            2u);
        }
      }

      v70 = self;
      uint64_t v71 = 4294943494LL;
LABEL_44:
      id v55 = -[MADPhotosFaceCropGenerationTask cancelRemainingDownloadsWithStatus:]( v70,  "cancelRemainingDownloadsWithStatus:",  v71);
      break;
    }
  }

  uint64_t v77 = VCPSignPostLog(v55);
  __int128 v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
  __int128 v79 = v78;
  if (v83 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v79,  OS_SIGNPOST_INTERVAL_END,  spid,  "MADPhotosFaceCropGenerationTask_Download",  (const char *)&unk_100199097,  buf,  2u);
  }

  __int128 v80 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  objc_msgSend( v80,  "addBreadcrumb:",  @"[FaceCropGeneration] Finished downloading %d assets",  -[NSArray count](self->_assetEntries, "count"));

  -[VCPTimeMeasurement stop](v84, "stop");
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  -[VCPTimeMeasurement elapsedTimeSeconds](v84, "elapsedTimeSeconds");
  objc_msgSend( v81,  "accumulateDoubleValue:forField:andEvent:",  @"TotalDownloadTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
}

- (void)process
{
  uint64_t v66 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v3 = VCPSignPostLog(-[VCPTimeMeasurement start](v66, "start"));
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v7 = VCPSignPostLog(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  unint64_t v62 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "MADPhotosFaceCropGenerationTask_Process",  (const char *)&unk_100199097,  buf,  2u);
  }

  os_signpost_id_t v61 = v5;

  uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->_faces, "anyObject"));
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 photoLibrary]);

  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosFaceProcessingContext,  "contextWithPhotoLibrary:",  v11));
  double v64 = (void *)v11;
  uint64_t v72 = -[VCPFaceCropManager initWithPhotoLibrary:andContext:]( objc_alloc(&OBJC_CLASS___VCPFaceCropManager),  "initWithPhotoLibrary:andContext:",  v11,  v63);
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  uint64_t v12 = self->_assetEntries;
  id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v76,  v84,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v77;
    os_log_type_t type = VCPLogToOSLogType[3];
    os_log_type_t v69 = v12;
    v70 = self;
    uint64_t v68 = *(void *)v77;
    while (2)
    {
      os_log_type_t v16 = 0LL;
      id v73 = v14;
      do
      {
        if (*(void *)v77 != v15) {
          objc_enumerationMutation(v12);
        }
        unsigned int v17 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)v16);
        uint64_t v18 = objc_autoreleasePoolPush();
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
        [v19 pet];

        uint64_t v20 = objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
        if (v20)
        {
          uint64_t v21 = (void *)v20;
          id v22 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
          char v23 = v22[2]();

          if ((v23 & 1) != 0)
          {
            objc_autoreleasePoolPop(v18);
            goto LABEL_34;
          }
        }

        uint64_t v24 = objc_claimAutoreleasedReturnValue([v17 resource]);
        if (v24)
        {
          uint64_t v25 = (void *)v24;
          unsigned int v26 = [v17 status];

          if (!v26)
          {
            uint64_t v28 = VCPSignPostLog(v27);
            uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            os_signpost_id_t v30 = os_signpost_id_generate(v29);

            uint64_t v32 = VCPSignPostLog(v31);
            uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            uint64_t v34 = v33;
            unint64_t v35 = v30 - 1;
            if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v34,  OS_SIGNPOST_INTERVAL_BEGIN,  v30,  "VCPFaceProcessingGenerateFaceCrop",  (const char *)&unk_100199097,  buf,  2u);
            }

            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v17 downloadURL]);
            os_signpost_id_t spid = v30;
            if (v36)
            {
              uint64_t v37 = objc_claimAutoreleasedReturnValue([v17 downloadURL]);
            }

            else
            {
              uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v17 resource]);
              uint64_t v37 = objc_claimAutoreleasedReturnValue([v38 privateFileURL]);
            }

            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v17 faces]);
            v40 = (void *)objc_claimAutoreleasedReturnValue([v39 allObjects]);
            v41 = (void *)objc_claimAutoreleasedReturnValue([v17 asset]);
            uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v17 resource]);
            uint64_t v74 = (void *)v37;
            id v75 = 0LL;
            unsigned __int8 v43 = -[VCPFaceCropManager generateAndPersistFaceCropsForFaces:withAsset:resource:resourceURL:error:]( v72,  "generateAndPersistFaceCropsForFaces:withAsset:resource:resourceURL:error:",  v40,  v41,  v42,  v37,  &v75);
            id v44 = v75;

            self = v70;
            id v14 = v73;
            if ((v43 & 1) == 0)
            {
              uint64_t v45 = MediaAnalysisLogLevel(v45, v46);
              if ((int)v45 >= 3)
              {
                uint64_t v48 = VCPLogInstance(v45, v47);
                uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
                if (os_log_type_enabled(v49, type))
                {
                  v50 = (void *)objc_claimAutoreleasedReturnValue([v17 asset]);
                  os_log_type_t v51 = (void *)objc_claimAutoreleasedReturnValue([v50 localIdentifier]);
                  *(_DWORD *)buf = 138412546;
                  v81 = v51;
                  __int16 v82 = 2112;
                  id v83 = v44;
                  _os_log_impl( (void *)&_mh_execute_header,  v49,  type,  "[FaceCrop][%@] Failed to generate - %@",  buf,  0x16u);

                  id v14 = v73;
                }
              }
            }

            uint64_t v52 = VCPSignPostLog(v45);
            uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
            dispatch_time_t v54 = v53;
            if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v54,  OS_SIGNPOST_INTERVAL_END,  spid,  "VCPFaceProcessingGenerateFaceCrop",  (const char *)&unk_100199097,  buf,  2u);
            }

            id v55 = (void *)objc_claimAutoreleasedReturnValue([v17 downloadURL]);
            uint64_t v15 = v68;
            uint64_t v12 = v69;
            if (v55)
            {
              uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v17 downloadURL]);
              +[PHAssetResourceManager vcp_flushResourceURL:]( &OBJC_CLASS___PHAssetResourceManager,  "vcp_flushResourceURL:",  v56);

              id v14 = v73;
              [v17 setDownloadURL:0];
            }
          }
        }

        objc_autoreleasePoolPop(v18);
        os_log_type_t v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v76,  v84,  16LL);
      if (v14) {
        continue;
      }
      break;
    }
  }

- (void).cxx_destruct
{
}

@end