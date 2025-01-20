@interface VCPMADOCRAssetBatch
+ (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (VCPMADOCRAssetBatch)initWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (double)downloadInactiveTimeInterval;
- (id)acceptableResourcesForAsset:(id)a3 withResources:(id)a4;
- (id)localResourceForAsset:(id)a3 withAcceptableResources:(id)a4;
- (id)remoteResourceForAsset:(id)a3 withAcceptableResources:(id)a4;
- (int)prepare;
- (int)process;
- (int)publish;
- (int)removeDownloadRequestIDForAsset:(id)a3;
- (unint64_t)count;
- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4;
- (void)addPhotosAsset:(id)a3 withPreviousStatus:(unint64_t)a4 attempts:(unint64_t)a5 andAttemptDate:(id)a6;
- (void)cancelRemainingDownloadsWithStatus:(int)a3;
- (void)processAssetEntry:(id)a3 resource:(id)a4 resourceURL:(id)a5;
@end

@implementation VCPMADOCRAssetBatch

- (VCPMADOCRAssetBatch)initWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___VCPMADOCRAssetBatch;
  v11 = -[VCPMADOCRAssetBatch init](&v27, "init");
  if (v11)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    assetEntries = v11->_assetEntries;
    v11->_assetEntries = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v11->_analysisDatabase, a3);
    v11->_allowDownload = a4;
    id v14 = objc_retainBlock(v10);
    id cancelBlock = v11->_cancelBlock;
    v11->_id cancelBlock = v14;

    dispatch_group_t v16 = dispatch_group_create();
    downloadGroup = v11->_downloadGroup;
    v11->_downloadGroup = (OS_dispatch_group *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.mediaanalysisd.ocr.download", 0LL);
    downloadStateQueue = v11->_downloadStateQueue;
    v11->_downloadStateQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    downloadRequestIDs = v11->_downloadRequestIDs;
    v11->_downloadRequestIDs = (NSMutableDictionary *)v20;

    dispatch_group_t v22 = dispatch_group_create();
    computeGroup = v11->_computeGroup;
    v11->_computeGroup = (OS_dispatch_group *)v22;

    dispatch_queue_t v24 = dispatch_queue_create("com.apple.mediaanalysisd.ocr.compute", 0LL);
    computeQueue = v11->_computeQueue;
    v11->_computeQueue = (OS_dispatch_queue *)v24;
  }

  return v11;
}

+ (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [objc_alloc((Class)a1) initWithAnalysisDatabase:v8 allowDownload:v6 cancelBlock:v9];

  return v10;
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
        v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v29 + 1) + 8 * (void)i) asset]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localIdentifier]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
        unsigned int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          uint64_t v20 = MediaAnalysisLogLevel(v17, v18);
          if ((int)v20 >= 4)
          {
            uint64_t v22 = VCPLogInstance(v20, v21);
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            os_log_type_t v24 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v23, v24))
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
              *(_DWORD *)buf = 138412290;
              v34 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "[OCR][%@] Batch already contains asset; ignoring",
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
  id v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[VCPMADOCRAssetEntry entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:]( &OBJC_CLASS___VCPMADOCRAssetEntry,  "entryWithAsset:previousStatus:previousAttempts:andLastAttemptDate:",  v8,  a4,  a5,  v28));
  -[NSMutableArray addObject:](assetEntries, "addObject:", v9);
LABEL_14:
}

- (int)prepare
{
  uint64_t v4 = VCPSignPostLog(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  os_signpost_id_t spid = os_signpost_id_generate(v5);

  uint64_t v7 = VCPSignPostLog(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPMADOCRAssetEntry_Prepare",  (const char *)&unk_100199097,  buf,  2u);
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
      v2 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 67109378;
      unsigned int v46 = v16;
      __int16 v47 = 2112;
      v48 = v2;
      _os_log_impl((void *)&_mh_execute_header, oslog, v15, "[OCR] Preparing %d assets (QoS: %@)", buf, 0x12u);
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
        v23 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)v21);
        analysisDatabase = self->_analysisDatabase;
        v25 = (char *)[v23 previousAttempts];
        v26 = (void *)objc_claimAutoreleasedReturnValue([v23 asset]);
        objc_super v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        id v28 = (id)-[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:]( analysisDatabase,  "setAttempts:asset:taskID:status:lastAttemptDate:",  v25 + 1,  v26,  10LL,  1LL,  v27);

        if ((_DWORD)v28 == -108)
        {
          v2 = v28;
        }

        else
        {
          BOOL v29 = (_DWORD)v28 == -36 || (_DWORD)v28 == -23;
          v2 = v28;
          if (!v29) {
            v2 = v22;
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
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_END,  spid,  "VCPMADOCRAssetEntry_Prepare",  (const char *)&unk_100199097,  buf,  2u);
      }

      LODWORD(v2) = 0;
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
  id v9 = 0LL;
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

          id v9 = v14;
        }

        if (objc_msgSend(v13, "vcp_isPhoto"))
        {
          if ([v13 type] != (id)13 && objc_msgSend(v13, "type") != (id)8)
          {
            os_log_type_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "vcp_uniformTypeIdentifier"));
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

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_descendingSizeComparator]( &OBJC_CLASS___PHAssetResource,  "vcp_descendingSizeComparator"));
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
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      os_log_type_t v27 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v26, v27))
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v5 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v45 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "[OCR][%@] No viable resources; allowing thumbnail",
          buf,
          0xCu);
      }
    }

    BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_thumbnailResource"));
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
          v36 = (void *)objc_claimAutoreleasedReturnValue([v5 localIdentifier]);
          *(_DWORD *)buf = 138412290;
          v45 = v36;
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
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 localIdentifier]);
      *(_DWORD *)buf = 138412290;
      v26 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[OCR][%@] No medium image derivative available; allowing other high-res resources",
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
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localIdentifier]);
      *(_DWORD *)buf = 138412290;
      v170 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[OCR][%@] Processing asset", buf, 0xCu);
    }
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v19 pet];

  id cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
  if (!cancelBlock || (uint64_t v21 = cancelBlock[2](), !(_DWORD)v21))
  {
    id v30 = [v8 isAnalysisCompleteFromComputeSync];
    if ((_DWORD)v30)
    {
      uint64_t v32 = MediaAnalysisLogLevel(v30, v31);
      uint64_t v34 = VCPLogInstance(v32, v33);
      os_log_type_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      os_log_type_t v36 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v35, v36))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue([v8 asset]);
        id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v170 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  v36,  "[OCR][Process][%@] Analysis already complete from compute sync ingestion; skipping",
          buf,
          0xCu);
      }

- (void)addDownloadRequestID:(int)a3 forAsset:(id)a4
{
  id v6 = a4;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D6588;
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
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 0;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D66D8;
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
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000D68A4;
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
  v5[2] = sub_1000D697C;
  v5[3] = &unk_1001BBFA0;
  v5[4] = self;
  int v6 = a3;
  dispatch_sync(downloadStateQueue, v5);
  dispatch_group_wait((dispatch_group_t)self->_downloadGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (int)process
{
  uint64_t v3 = VCPSignPostLog(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t spid = os_signpost_id_generate(v4);

  uint64_t v6 = VCPSignPostLog(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPMADOCRAssetEntry_Process",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
  if ((int)v11 >= 6)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      unsigned int v16 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v17 = qos_class_self();
      uint64_t v18 = VCPMAQoSDescription(v17);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 67109378;
      LODWORD(v135[0]) = v16;
      WORD2(v135[0]) = 2112;
      *(void *)((char *)v135 + 6) = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "[OCR] Processing %d assets (QoS: %@)", buf, 0x12u);
    }
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v20 pet];

  id v21 = -[NSMutableArray count](self->_assetEntries, "count");
  if (!v21) {
    goto LABEL_78;
  }
  int v125 = 0;
  unint64_t v23 = 0LL;
  os_log_type_t type = VCPLogToOSLogType[6];
  os_log_type_t v121 = VCPLogToOSLogType[5];
  unsigned int v122 = VCPPhotosOCRProcessingFromGatingVersion;
  os_log_type_t v127 = VCPLogToOSLogType[4];
  do
  {
    uint64_t v24 = objc_autoreleasePoolPush();
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v25 pet];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_assetEntries, "objectAtIndexedSubscript:", v23));
    uint64_t v28 = MediaAnalysisLogLevel(v26, v27);
    if ((int)v28 >= 6)
    {
      uint64_t v30 = VCPLogInstance(v28, v29);
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, type))
      {
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v135[0] = v33;
        _os_log_impl((void *)&_mh_execute_header, v31, type, "[OCR][%@] Staging asset", buf, 0xCu);
      }
    }

    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
    os_log_type_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 adjustmentVersion]);
    BOOL v36 = v35 == 0LL;

    if (!v36)
    {
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v39));

      os_signpost_id_t v41 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( -[VCPMADOCRAssetBatch acceptableResourcesForAsset:withResources:]( self,  "acceptableResourcesForAsset:withResources:",  v41,  v40));

      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
      v44 = (void *)objc_claimAutoreleasedReturnValue( -[VCPMADOCRAssetBatch localResourceForAsset:withAcceptableResources:]( self,  "localResourceForAsset:withAcceptableResources:",  v43,  v42));

      if (v44)
      {
        computeGroup = self->_computeGroup;
        computeQueue = (dispatch_queue_s *)self->_computeQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000D77EC;
        block[3] = &unk_1001BBE70;
        block[4] = self;
        id v132 = v26;
        id v133 = v44;
        id v49 = v44;
        dispatch_group_async((dispatch_group_t)computeGroup, computeQueue, block);

LABEL_17:
LABEL_46:

        goto LABEL_47;
      }

      if (self->_allowDownload)
      {
        os_signpost_id_t v56 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
        id v49 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "vcp_passedOCRGating"));

        if ([v49 BOOLValue])
        {
          uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "mad_computeSyncResource"));
          if (v57)
          {
            uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
            objc_msgSend( v26,  "setIsAnalysisCompleteFromComputeSync:",  objc_msgSend( v57,  "mad_isAnalysisCompleteFromComputeSyncForAsset:taskID:allowDownload:cancel:",  v58,  10,  1,  self->_cancelBlock));

            id v59 = [v26 isAnalysisCompleteFromComputeSync];
            if ((_DWORD)v59)
            {
              uint64_t v61 = MediaAnalysisLogLevel(v59, v60);
              if ((int)v61 < 5)
              {
LABEL_56:

                goto LABEL_17;
              }

              uint64_t v63 = VCPLogInstance(v61, v62);
              log = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
              if (os_log_type_enabled(log, v121))
              {
                v64 = (void *)objc_claimAutoreleasedReturnValue([v26 asset]);
                v65 = (void *)objc_claimAutoreleasedReturnValue([v64 localIdentifier]);
                *(_DWORD *)buf = 138412290;
                v135[0] = v65;
                _os_log_impl( (void *)&_mh_execute_header,  log,  v121,  "[OCR][%@] Analysis complete with compute sync, skipping media resource download and processing",  buf,  0xCu);
              }

- (int)publish
{
  uint64_t v2 = VCPSignPostLog(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  os_signpost_id_t spid = os_signpost_id_generate(v3);

  uint64_t v5 = VCPSignPostLog(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPMADOCRAssetEntry_Publish",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
  if ((int)v10 >= 6)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      unsigned int v15 = -[NSMutableArray count](self->_assetEntries, "count");
      uint64_t v16 = qos_class_self();
      uint64_t v17 = VCPMAQoSDescription(v16);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v81 = v15;
      *(_WORD *)&v81[4] = 2112;
      *(void *)&v81[6] = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[OCR] Persisting %d assets (QoS: %@)", buf, 0x12u);
    }
  }

  if (!-[NSMutableArray count](self->_assetEntries, "count")) {
    return 0;
  }
  p_superclass = &OBJC_METACLASS___VCPRequestResetPersonsTask.superclass;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  objc_msgSend( v20,  "addBreadcrumb:",  @"[OCR] Persisting %d assets to Photos",  -[NSMutableArray count](self->_assetEntries, "count"));

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v21 pet];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  [v22 enterKnownTimeoutRisk:1];

  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_1000D8400;
  v78[3] = &unk_1001BA0C8;
  v78[4] = self;
  uint64_t v66 = objc_retainBlock(v78);
  uint64_t v23 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_assetEntries, "firstObject"));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([(id)v23 asset]);
  uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v24 photoLibrary]);

  id cancelBlock = self->_cancelBlock;
  id v77 = 0LL;
  LOBYTE(v23) = objc_msgSend( v67,  "mad_performChangesAndWait:cancelBlock:extendTimeoutBlock:error:",  v66,  cancelBlock,  &stru_1001BD3D8,  &v77);
  id v69 = v77;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  [v26 exitKnownTimeoutRisk];

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  objc_msgSend( v27,  "addBreadcrumb:",  @"[OCR] Finished persisting %d assets to Photos",  -[NSMutableArray count](self->_assetEntries, "count"));

  if ((v23 & 1) == 0)
  {
    uint64_t v56 = MediaAnalysisLogLevel(v28, v29);
    if ((int)v56 >= 3)
    {
      uint64_t v58 = VCPLogInstance(v56, v57);
      id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      os_log_type_t v60 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v59, v60))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v81 = v69;
        _os_log_impl( (void *)&_mh_execute_header,  v59,  v60,  "[OCR] Failed to persist OCR results to Photos (%@)",  buf,  0xCu);
      }
    }

    int v55 = [v69 code];
    goto LABEL_60;
  }

  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  obj = self->_assetEntries;
  id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v73,  v79,  16LL);
  if (!v30) {
    goto LABEL_62;
  }
  uint64_t v71 = *(void *)v74;
  while (2)
  {
    uint64_t v31 = 0LL;
    uint64_t v32 = p_superclass;
    do
    {
      if (*(void *)v74 != v71) {
        objc_enumerationMutation(obj);
      }
      uint64_t v33 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)v31);
      uint64_t v34 = objc_autoreleasePoolPush();
      if (![v33 status])
      {
        analysisDatabase = self->_analysisDatabase;
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v33 asset]);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v43 localIdentifier]);
        id v41 = (id)-[VCPDatabaseWriter removeProcessingStatusForLocalIdentifier:andTaskID:]( analysisDatabase,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  v44,  10LL);

        if ((_DWORD)v41 != -108)
        {
          BOOL v45 = (_DWORD)v41 == -36 || (_DWORD)v41 == -23;
          p_superclass = (__objc2_class **)v41;
          if (!v45) {
            goto LABEL_43;
          }
          goto LABEL_45;
        }

- (void).cxx_destruct
{
}

@end