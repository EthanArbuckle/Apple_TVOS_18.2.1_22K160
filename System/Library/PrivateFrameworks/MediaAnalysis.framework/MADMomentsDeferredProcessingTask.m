@interface MADMomentsDeferredProcessingTask
+ (id)_allProcessingTypes;
+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (BOOL)run:(id *)a3;
- (MADMomentsDeferredProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (id)_earliestRequestDateFromAssetEntries:(id)a3;
- (void)_cleanupRequestedAssets:(id)a3 fromDatabase:(id)a4 withProcessingType:(unint64_t)a5 photoLibrary:(id)a6 unprocessedAssets:(id *)a7 earliestAssetModificationDate:(id *)a8;
@end

@implementation MADMomentsDeferredProcessingTask

- (MADMomentsDeferredProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  v9 = (Block_layout *)a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100046F4C;
  v17[3] = &unk_1001BADE0;
  id v10 = a5;
  id v18 = v10;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MADMomentsDeferredProcessingTask;
  v11 = -[MADMomentsDeferredProcessingTask initWithCompletionHandler:](&v16, "initWithCompletionHandler:", v17);
  if (v11)
  {
    if (v9) {
      v12 = v9;
    }
    else {
      v12 = &stru_1001BAE00;
    }
    v13 = objc_retainBlock(v12);
    id progressHandler = v11->_progressHandler;
    v11->_id progressHandler = v13;

    -[MADMomentsDeferredProcessingTask setCancelBlock:](v11, "setCancelBlock:", v8);
  }

  return v11;
}

+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)a1) initWithCancelBlock:v8 progressHandler:v9 andCompletionHandler:v10];

  return v11;
}

+ (id)_allProcessingTypes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  MADDeferredProcessingTypeScene));
  v6[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  MADDeferredProcessingTypeQuickFaceIdentification));
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));

  return v4;
}

- (id)_earliestRequestDateFromAssetEntries:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = a3;
  v4 = 0LL;
  id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v7), "requestDate", (void)v12));
        [v8 timeIntervalSinceReferenceDate];
        if (v9 != 0.0 && (!v4 || [v4 compare:v8] == (id)1))
        {
          id v10 = v8;

          v4 = v10;
        }

        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

  return v4;
}

- (void)_cleanupRequestedAssets:(id)a3 fromDatabase:(id)a4 withProcessingType:(unint64_t)a5 photoLibrary:(id)a6 unprocessedAssets:(id *)a7 earliestAssetModificationDate:(id *)a8
{
  id v62 = a3;
  id v69 = a4;
  id v68 = a6;
  uint64_t v11 = VCPSignPostLog(v68);
  __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  uint64_t v15 = VCPSignPostLog(v14);
  objc_super v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  os_signpost_id_t spid = v13;
  unint64_t v59 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "MADMoments_CleanupProcessedAssets",  (const char *)&unk_100199097,  buf,  2u);
  }

  id v63 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v68,  a5));
  uint64_t v18 = VCPSignPostLog(v61);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  os_signpost_id_t v20 = os_signpost_id_generate(v19);

  uint64_t v22 = VCPSignPostLog(v21);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  v24 = v23;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_INTERVAL_BEGIN,  v20,  "MADMoments_FetchPHAssets",  (const char *)&unk_100199097,  buf,  2u);
  }

  v66 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v62,  v61));
  uint64_t v25 = VCPSignPostLog(v66);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  v27 = v26;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v27,  OS_SIGNPOST_INTERVAL_END,  v20,  "MADMoments_FetchPHAssets",  (const char *)&unk_100199097,  buf,  2u);
  }

  v64 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", v62);
  unint64_t v28 = 0LL;
  id v29 = 0LL;
  uint64_t v30 = MADDeferredProcessingTypeScene;
  uint64_t v31 = MADDeferredProcessingTypeQuickFaceIdentification;
  while (1)
  {
    id v67 = v29;
    v32 = objc_autoreleasePoolPush();
    v33 = (void *)objc_claimAutoreleasedReturnValue([v66 objectAtIndexedSubscript:v28]);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 localIdentifier]);
    -[NSMutableSet removeObject:](v64, "removeObject:", v34);

    if (a8)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue([v33 adjustmentTimestamp]);
      if (v35) {
        uint64_t v36 = objc_claimAutoreleasedReturnValue([v33 adjustmentTimestamp]);
      }
      else {
        uint64_t v36 = objc_claimAutoreleasedReturnValue([v33 creationDate]);
      }
      v37 = (void *)v36;

      if (v37)
      {
        v38 = v67;
        if (!v67 || (v38 = v67, [v67 compare:v37] == (id)1))
        {
          id v39 = v37;

          id v67 = v39;
        }
      }
    }

    if (v30 == a5 && !objc_msgSend(v33, "vcp_needSceneProcessing")
      || v31 == a5 && objc_msgSend(v33, "vcp_quickFaceClassificationDone"))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v33 localIdentifier]);
      [v69 removeMomentsScheduledAssetWithLocalIdentifier:v40 andTaskID:a5];
    }

    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v33 localIdentifier]);
      [v63 addObject:v40];
    }

    id v29 = v67;
    objc_autoreleasePoolPop(v32);
    ++v28;
  }

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  v41 = v64;
  id v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v70,  v78,  16LL);
  if (v42)
  {
    uint64_t v43 = *(void *)v71;
    os_log_type_t v44 = VCPLogToOSLogType[4];
    do
    {
      for (i = 0LL; i != v42; i = (char *)i + 1)
      {
        if (*(void *)v71 != v43) {
          objc_enumerationMutation(v41);
        }
        uint64_t v46 = *(void *)(*((void *)&v70 + 1) + 8LL * (void)i);
        v47 = objc_autoreleasePoolPush();
        uint64_t v49 = MediaAnalysisLogLevel(v47, v48);
        if ((int)v49 >= 4)
        {
          uint64_t v51 = VCPLogInstance(v49, v50);
          v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, v44))
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue([v68 photoLibraryURL]);
            *(_DWORD *)buf = 138412546;
            uint64_t v75 = v46;
            __int16 v76 = 2112;
            v77 = v53;
            _os_log_impl( (void *)&_mh_execute_header,  v52,  v44,  "[Moments] Invalid local identifier %@ in Photo Library %@",  buf,  0x16u);
          }
        }

        [v69 removeMomentsScheduledAssetWithLocalIdentifier:v46 andTaskID:a5];
        objc_autoreleasePoolPop(v47);
      }

      id v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v70,  v78,  16LL);
    }

    while (v42);
  }

  id v54 = [v69 commit];
  if (a7)
  {
    id v54 = v63;
    *a7 = v54;
  }

  if (a8)
  {
    id v54 = v67;
    *a8 = v54;
  }

  uint64_t v55 = VCPSignPostLog(v54);
  v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
  v57 = v56;
  if (v59 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v57,  OS_SIGNPOST_INTERVAL_END,  spid,  "MADMoments_CleanupProcessedAssets",  (const char *)&unk_100199097,  buf,  2u);
  }
}

- (BOOL)run:(id *)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary vcp_defaultPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "vcp_defaultPhotoLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v3));

  v106 = v4;
  id v5 = [v4 keyExistsInKeyValueStore:@"PFSkipChecksumTimestamp"];
  char v104 = (char)v5;
  if ((_DWORD)v5)
  {
    uint64_t v7 = MediaAnalysisLogLevel(v5, v6);
    if ((int)v7 >= 4)
    {
      uint64_t v9 = VCPLogInstance(v7, v8);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      os_log_type_t v11 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v10, v11))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "[Moments] Detected previous crash after skipping checksum for PFCachingArchiveIndex, restoring checksum",  buf,  2u);
      }
    }

    PFCachingArchiveIndexSetSkipChecksumValidation(0LL);
  }

  else
  {
    uint64_t v12 = MediaAnalysisLogLevel(v5, v6);
    if ((int)v12 >= 6)
    {
      uint64_t v14 = VCPLogInstance(v12, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      os_log_type_t v16 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v15, v16))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "[Moments] Skip checksum for PFCachingArchiveIndex ... ",  buf,  2u);
      }
    }

    PFCachingArchiveIndexSetSkipChecksumValidation(1LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v17 timeIntervalSinceReferenceDate];
    [v106 setValue:(uint64_t)v18 forKey:@"PFSkipChecksumTimestamp"];

    [v106 commit];
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  v105 = (void *)objc_claimAutoreleasedReturnValue([v19 allPhotoLibraries]);

  id v20 = [(id)objc_opt_class(self) _allProcessingTypes];
  v111 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v21 = [v105 count];
  id v22 = [v111 count];
  __int128 v150 = 0u;
  __int128 v151 = 0u;
  __int128 v148 = 0u;
  __int128 v149 = 0u;
  id obj = v105;
  id v23 = [obj countByEnumeratingWithState:&v148 objects:v162 count:16];
  if (!v23) {
    goto LABEL_77;
  }
  uint64_t v130 = 0LL;
  uint64_t v117 = (void)v22 * (void)v21;
  uint64_t v110 = *(void *)v149;
  id v116 = (id)MADDeferredProcessingTypeScene;
  id v115 = (id)MADDeferredProcessingTypeQuickFaceIdentification;
  os_log_type_t v114 = VCPLogToOSLogType[3];
  os_log_type_t type = VCPLogToOSLogType[6];
  do
  {
    v113 = 0LL;
    id v109 = v23;
    do
    {
      if (*(void *)v149 != v110) {
        objc_enumerationMutation(obj);
      }
      v128 = *(void **)(*((void *)&v148 + 1) + 8LL * (void)v113);
      context = objc_autoreleasePoolPush();
      v126 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v128));
      __int128 v146 = 0u;
      __int128 v147 = 0u;
      __int128 v144 = 0u;
      __int128 v145 = 0u;
      id v119 = v111;
      id v24 = [v119 countByEnumeratingWithState:&v144 objects:v161 count:16];
      if (v24)
      {
        uint64_t v122 = *(void *)v145;
LABEL_19:
        id v121 = v24;
        uint64_t v25 = 0LL;
        while (1)
        {
          if (*(void *)v145 != v122) {
            objc_enumerationMutation(v119);
          }
          v26 = *(void **)(*((void *)&v144 + 1) + 8 * v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          [v27 timeIntervalSince1970];
          double v29 = v28;

          id v30 = [v26 unsignedIntegerValue];
          uint64_t v31 = VCPTaskIDDescription(v30);
          v127 = (void *)objc_claimAutoreleasedReturnValue(v31);
          id v143 = 0LL;
          [v126 fetchMomentsScheduledAssetEntries:&v143 forTaskID:v30];
          id v132 = v143;
          v33 = [v132 count];
          ++v130;
          if (v33) {
            break;
          }
          uint64_t v56 = MediaAnalysisLogLevel(0LL, v32);
          if ((int)v56 >= 6)
          {
            uint64_t v58 = VCPLogInstance(v56, v57);
            unint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
            if (os_log_type_enabled(v59, type))
            {
              v60 = (void *)objc_claimAutoreleasedReturnValue([v128 photoLibraryURL]);
              *(_DWORD *)buf = 138412546;
              *(void *)v157 = v127;
              *(_WORD *)&v157[8] = 2112;
              *(void *)&v157[10] = v60;
              _os_log_impl( (void *)&_mh_execute_header,  v59,  type,  "[Moments] No assets scheduled for %@ in Photo Library %@",  buf,  0x16u);
            }

- (void).cxx_destruct
{
}

@end