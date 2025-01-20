@interface VCPMADPhotosLibraryProcessingTask
- (BOOL)run:(id *)a3;
- (VCPMADPhotosLibraryProcessingTask)initWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (id)assetPriorities;
- (int)_checkHardFailuresForPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4;
- (int)_processDownloadEligibleAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5;
- (int)_processFailedAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5;
- (int)_processPhotoLibrary:(id)a3 withProgress:(id)a4;
- (int)completeSceneProcessingWithProgress:(id)a3;
- (int)processAllAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5;
@end

@implementation VCPMADPhotosLibraryProcessingTask

- (VCPMADPhotosLibraryProcessingTask)initWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000C8768;
  v21[3] = &unk_1001BADE0;
  id v14 = a6;
  id v22 = v14;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___VCPMADPhotosLibraryProcessingTask;
  v15 = -[VCPMADPhotosProcessingTask initWithCompletionHandler:](&v20, "initWithCompletionHandler:", v21);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)(v15 + 28), a3);
    id v17 = objc_retainBlock(v13);
    v18 = *(void **)(v16 + 36);
    *(void *)(v16 + 36) = v17;

    [v16 setCancelBlock:v12];
  }

  return (VCPMADPhotosLibraryProcessingTask *)v16;
}

- (int)completeSceneProcessingWithProgress:(id)a3
{
  id v4 = a3;
  v5 = objc_autoreleasePoolPush();
  [v4 setTotalUnitCount:100];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000C8928;
  v12[3] = &unk_1001BC2F0;
  v12[4] = self;
  id v6 = v4;
  id v13 = v6;
  v7 = objc_retainBlock(v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000C8B20;
  v11[3] = &unk_1001B9E98;
  v11[4] = self;
  v8 = objc_retainBlock(v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADSceneLibraryProcessingTask taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:]( &OBJC_CLASS___VCPMADSceneLibraryProcessingTask,  "taskWithPhotoLibraries:cancelBlock:progressHandler:andCompletionHandler:",  *(void *)(&self->super._publishError + 1),  v8,  v7,  &stru_1001BD038));
  LODWORD(self) = [v9 run];

  objc_autoreleasePoolPop(v5);
  return (int)self;
}

- (int)_checkHardFailuresForPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4
{
  id v58 = a3;
  id v60 = a4;
  uint64_t v7 = MediaAnalysisLogLevel(v60, v6);
  if ((int)v7 >= 5)
  {
    uint64_t v9 = VCPLogInstance(v7, v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    os_log_type_t v11 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = [(id)objc_opt_class(self) name];
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412290;
      v63 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "[%@] Checking processing status from previous runs",  buf,  0xCu);
    }
  }

  id v61 = 0LL;
  objc_msgSend( v60,  "fetchLocalIdentifiers:withTaskID:andProcessingStatus:",  &v61,  objc_msgSend((id)objc_opt_class(self), "taskID"),  1);
  id v59 = v61;
  id v14 = (char *)[v59 count];
  v16 = v14;
  if (v14)
  {
    id v17 = &ADClientSetValueForScalarKey_ptr;
    id v18 = +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v58,  [(id)objc_opt_class(self) taskID]);
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v59,  log));
    unint64_t v20 = 0LL;
    os_log_type_t type = VCPLogToOSLogType[6];
    *(void *)&__int128 v21 = 138412546LL;
    __int128 v55 = v21;
    while (1)
    {
      id v22 = objc_msgSend(v19, "count", v55);
      v24 = objc_autoreleasePoolPush();
      v25 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:v20]);
      if (-[VCPMADPhotosProcessingTask shouldProcessAsset:](self, "shouldProcessAsset:", v25))
      {
        char v26 = 1;
        v27 = v17;
      }

      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue([v25 localIdentifier]);
        v29 = (_UNKNOWN **)objc_msgSend( v60,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  v28,  objc_msgSend((id)objc_opt_class(self), "taskID"));

        if ((_DWORD)v29 == -108 || (_DWORD)v29 == -36)
        {
          v27 = v29;
        }

        else
        {
          v27 = v29;
          if ((_DWORD)v29 != -23) {
            v27 = v17;
          }
        }

        char v26 = 0;
        if ((_DWORD)v29 != -108 && (_DWORD)v29 != -36 && (_DWORD)v29 != -23)
        {
          uint64_t v32 = MediaAnalysisLogLevel(v30, v31);
          if ((int)v32 >= 6)
          {
            uint64_t v34 = VCPLogInstance(v32, v33);
            v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, type))
            {
              id v36 = [(id)objc_opt_class(self) name];
              v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue([v25 localIdentifier]);
              *(_DWORD *)buf = v55;
              v63 = v37;
              __int16 v64 = 2112;
              v65 = v38;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  type,  "[%@][%@] Asset is processed; clearing failure status",
                buf,
                0x16u);
            }
          }

          --v16;
          char v26 = 1;
        }
      }

      objc_autoreleasePoolPop(v24);
      ++v20;
      id v17 = v27;
      if ((v26 & 1) == 0) {
        goto LABEL_37;
      }
    }

    uint64_t v39 = MediaAnalysisLogLevel(v22, v23);
    if ((int)v39 >= 6)
    {
      uint64_t v41 = VCPLogInstance(v39, v40);
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, type))
      {
        id v43 = [(id)objc_opt_class(self) name];
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        *(_DWORD *)buf = v55;
        v63 = v44;
        __int16 v64 = 2048;
        v65 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  type,  "[%@] %lu assets processing status changed to Hard Failure",  buf,  0x16u);
      }
    }

    unsigned int v45 = objc_msgSend( v60,  "hardFailAllRunningProcessingStatusForTaskID:",  objc_msgSend((id)objc_opt_class(self), "taskID"));
    if (v45 == -108 || v45 == -36)
    {
      LODWORD(v27) = v45;
    }

    else
    {
      LODWORD(v27) = v45;
      if (v45 != -23) {
        LODWORD(v27) = (_DWORD)v17;
      }
    }

    if (v45 == -108
      || v45 == -36
      || v45 == -23
      || (unsigned int v46 = [v60 commit], LODWORD(v27) = v46, v46 == -108)
      || v46 == -36
      || v46 == -23)
    {
LABEL_37:

      goto LABEL_46;
    }
  }

  uint64_t v47 = MediaAnalysisLogLevel(v14, v15);
  if ((int)v47 < 7)
  {
    LODWORD(v27) = 0;
  }

  else
  {
    uint64_t v49 = VCPLogInstance(v47, v48);
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    os_log_type_t v51 = VCPLogToOSLogType[7];
    os_log_t log = v50;
    if (os_log_type_enabled(v50, v51))
    {
      id v52 = [(id)objc_opt_class(self) name];
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      *(_DWORD *)buf = 138412290;
      v63 = v53;
      _os_log_impl((void *)&_mh_execute_header, log, v51, "[%@] Processing status is up-to-date", buf, 0xCu);
    }

    LODWORD(v27) = 0;
LABEL_46:
  }

  return (int)v27;
}

- (id)assetPriorities
{
  return &off_1001C9198;
}

- (int)processAllAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5
{
  id v79 = a3;
  id v75 = a4;
  id v76 = a5;
  uint64_t v9 = MediaAnalysisLogLevel(v76, v8);
  if ((int)v9 >= 5)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = [(id)objc_opt_class(self) name];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138412290;
      v82 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%@] Evaluating all assets in Photo Library", buf, 0xCu);
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VCPMADPhotosLibraryProcessingTask assetPriorities](self, "assetPriorities"));
  uint64_t v17 = 1LL;
  os_log_type_t type = VCPLogToOSLogType[5];
  os_log_type_t v77 = VCPLogToOSLogType[3];
  os_log_type_t v73 = VCPLogToOSLogType[6];
  while (v17 - 1 < (unint64_t)[v16 count])
  {
    id v18 = objc_autoreleasePoolPush();
    id v19 = [v16 count];
    if ((unint64_t)v19 >= 2)
    {
      uint64_t v21 = MediaAnalysisLogLevel(v19, v20);
      if ((int)v21 >= 5)
      {
        uint64_t v23 = VCPLogInstance(v21, v22);
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, type))
        {
          id v25 = [(id)objc_opt_class(self) name];
          char v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          *(_DWORD *)buf = 138412546;
          v82 = v26;
          __int16 v83 = 2048;
          uint64_t v84 = v17;
          _os_log_impl((void *)&_mh_execute_header, v24, type, "[%@] Evaluating P%lu assets", buf, 0x16u);
        }
      }
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:v17 - 1]);
    id v28 = [v27 unsignedIntegerValue];

    v29 = (void *)objc_claimAutoreleasedReturnValue( +[PHMediaProcessingAlgorithmVersionProvider mad_sharedVersionProviderWithPhotoLibrary:]( &OBJC_CLASS___PHMediaProcessingAlgorithmVersionProvider,  "mad_sharedVersionProviderWithPhotoLibrary:",  v79));
    +[PHAsset mad_sceneConfidenceThresholdForTask:]( PHAsset,  "mad_sceneConfidenceThresholdForTask:",  [(id)objc_opt_class(self) taskID]);
    int v31 = v30;
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    id v33 = [(id)objc_opt_class(self) name];
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    [v32 addBreadcrumb:@"[%@] Fetching Priority%lu assets", v34, v17];

    uint64_t v36 = VCPSignPostLog(v35);
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    os_signpost_id_t v38 = os_signpost_id_generate(v37);

    uint64_t v40 = VCPSignPostLog(v39);
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    v42 = v41;
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v42,  OS_SIGNPOST_INTERVAL_BEGIN,  v38,  "VCPMADPhotosLibraryProcessingTask_FetchAssets",  (const char *)&unk_100199097,  buf,  2u);
    }

    id v43 = [(id)objc_opt_class(self) taskID];
    uint64_t v44 = PHMediaProcessingTaskIDForVCPTaskID(v43);
    id v80 = 0LL;
    LODWORD(v45) = v31;
    unsigned int v46 = (void *)objc_claimAutoreleasedReturnValue( [v79 fetchAssetsForMediaProcessingTaskID:v44 priority:v28 algorithmVersion:v29 sceneConfidenceThreshold:&v80 error:v45]);
    id v47 = v80;
    uint64_t v48 = VCPSignPostLog(v47);
    uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    v50 = v49;
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v50,  OS_SIGNPOST_INTERVAL_END,  v38,  "VCPMADPhotosLibraryProcessingTask_FetchAssets",  (const char *)&unk_100199097,  buf,  2u);
    }

    if (v47)
    {
      uint64_t v53 = MediaAnalysisLogLevel(v51, v52);
      if ((int)v53 >= 3)
      {
        uint64_t v55 = VCPLogInstance(v53, v54);
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, v77))
        {
          id v57 = [(id)objc_opt_class(self) name];
          id v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
          *(_DWORD *)buf = 138412546;
          v82 = v58;
          __int16 v83 = 2112;
          uint64_t v84 = (uint64_t)v47;
          _os_log_impl((void *)&_mh_execute_header, v56, v77, "[%@] Failed to fetch assets: %@", buf, 0x16u);
        }
      }

      int v78 = -18;
      BOOL v59 = 1;
    }

    else
    {
      uint64_t v60 = MediaAnalysisLogLevel(v51, v52);
      if ((int)v60 >= 6)
      {
        uint64_t v62 = VCPLogInstance(v60, v61);
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v63, v73))
        {
          id v64 = [(id)objc_opt_class(self) name];
          v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
          unsigned int v66 = [v46 count];
          *(_DWORD *)buf = 138412546;
          v82 = v65;
          __int16 v83 = 1024;
          LODWORD(v84) = v66;
          _os_log_impl((void *)&_mh_execute_header, v63, v73, "[%@] Fetched %d assets", buf, 0x12u);
        }
      }

      v67 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
      id v68 = [(id)objc_opt_class(self) name];
      v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
      [v67 addBreadcrumb:@"[%@] Fetched %d Priority%lu assets", v69, objc_msgSend(v46, "count"), v17];

      unsigned int v70 = -[VCPMADPhotosProcessingTask processAssetsInFetchResult:withAnalysisDatabase:allowDownload:progress:]( self,  "processAssetsInFetchResult:withAnalysisDatabase:allowDownload:progress:",  v46,  v75,  0LL,  v76);
      BOOL v59 = v70 != 0;
      int v71 = v78;
      if (v70) {
        int v71 = v70;
      }
      int v78 = v71;
    }

    objc_autoreleasePoolPop(v18);
    ++v17;
    if (v59) {
      goto LABEL_34;
    }
  }

  int v78 = -[VCPMADPhotosProcessingTask waitForPublishing](self, "waitForPublishing");
LABEL_34:

  return v78;
}

- (int)_processDownloadEligibleAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5
{
  id v64 = a3;
  id v8 = a4;
  id v65 = a5;
  uint64_t v10 = MediaAnalysisLogLevel(v65, v9);
  uint64_t v12 = (uint64_t)buf;
  if ((int)v10 >= 5)
  {
    uint64_t v13 = VCPLogInstance(v10, v11);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = [(id)objc_opt_class(self) name];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 138412290;
      v74 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%@] Evaluating download eligible assets", buf, 0xCu);
    }
  }

  objc_msgSend( v65,  "setTotalUnitCount:",  (int)objc_msgSend( v8,  "queryAssetCountForTaskID:withStatus:andAttempts:",  objc_msgSend((id)objc_opt_class(self), "taskID"),  2,  1));
  os_log_type_t type = VCPLogToOSLogType[7];
  do
  {
    id v18 = objc_autoreleasePoolPush();
    if ((-[VCPMADPhotosLibraryProcessingTask isCanceled](self, "isCanceled") & 1) != 0)
    {
      uint64_t v12 = 4294967168LL;
      int v19 = 1;
    }

    else
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v20 pet];

      id v71 = 0LL;
      id v21 = objc_msgSend( v8,  "fetchLocalIdentifiers:withProcessingStatus:andTaskID:andAttempts:andFetchLimit:",  &v71,  2,  objc_msgSend((id)objc_opt_class(self), "taskID"),  1,  100);
      id v22 = v71;
      uint64_t v23 = v22;
      if ((_DWORD)v21 == -108 || (_DWORD)v21 == -36)
      {
        uint64_t v24 = (uint64_t)v21;
      }

      else
      {
        uint64_t v24 = (uint64_t)v21;
        if ((_DWORD)v21 != -23) {
          uint64_t v24 = v12;
        }
      }

      int v19 = 1;
      if ((_DWORD)v21 != -108 && (_DWORD)v21 != -36 && (_DWORD)v21 != -23)
      {
        if ([v22 count])
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
          id v26 = [(id)objc_opt_class(self) name];
          v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
          [v25 addBreadcrumb:@"[%@] Fetching %d download eligible assets", v27, objc_msgSend(v23, "count")];

          id v28 = +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v64,  [(id)objc_opt_class(self) taskID]);
          unsigned int v66 = (void *)objc_claimAutoreleasedReturnValue(v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"creationDate",  0LL));
          os_log_type_t v77 = v29;
          int v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v77,  1LL));
          [v66 setSortDescriptors:v30];

          int v31 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v23,  v66));
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
          id v33 = [(id)objc_opt_class(self) name];
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          [v32 addBreadcrumb:@"[%@] Fetched %d download eligible assets", v34, objc_msgSend(v23, "count")];

          uint64_t v35 = -[VCPMADPhotosProcessingTask processAssetsInFetchResult:withAnalysisDatabase:allowDownload:progress:]( self,  "processAssetsInFetchResult:withAnalysisDatabase:allowDownload:progress:",  v31,  v8,  1LL,  0LL);
          if ((_DWORD)v35
            || ((uint64_t v36 = -[VCPMADPhotosProcessingTask waitForPublishing](self, "waitForPublishing"), v35 = v36,
                                                                                                   (_DWORD)v36)
              ? (unsigned int v37 = v36)
              : (unsigned int v37 = v24),
                (_DWORD)v36))
          {
            int v19 = 1;
          }

          else
          {
            unsigned int v63 = v37;
            objc_msgSend( v65,  "setCompletedUnitCount:",  (char *)objc_msgSend(v31, "count") + (void)objc_msgSend(v65, "completedUnitCount"));
            os_signpost_id_t v38 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", v23);
            for (unint64_t i = 0; i < (unint64_t)[v31 count]; ++i)
            {
              uint64_t v40 = objc_autoreleasePoolPush();
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndexedSubscript:i]);
              v42 = (void *)objc_claimAutoreleasedReturnValue([v41 localIdentifier]);
              -[NSMutableSet removeObject:](v38, "removeObject:", v42);

              objc_autoreleasePoolPop(v40);
            }

            id v43 = -[NSMutableSet count](v38, "count");
            if (v43)
            {
              uint64_t v45 = MediaAnalysisLogLevel(v43, v44);
              if ((int)v45 >= 7)
              {
                uint64_t v47 = VCPLogInstance(v45, v46);
                uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
                if (os_log_type_enabled(v48, type))
                {
                  id v49 = [(id)objc_opt_class(self) name];
                  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
                  id v51 = -[NSMutableSet count](v38, "count");
                  *(_DWORD *)buf = 138412546;
                  v74 = v50;
                  __int16 v75 = 2048;
                  id v76 = v51;
                  _os_log_impl( (void *)&_mh_execute_header,  v48,  type,  "[%@] Dropping processing status for %lu unknown localIdentifiers",  buf,  0x16u);
                }
              }

              __int128 v69 = 0u;
              __int128 v70 = 0u;
              __int128 v67 = 0u;
              __int128 v68 = 0u;
              obj = v38;
              id v52 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v67,  v72,  16LL);
              if (v52)
              {
                uint64_t v61 = *(void *)v68;
                while (2)
                {
                  uint64_t v53 = 0LL;
                  unsigned int v54 = v63;
                  do
                  {
                    if (*(void *)v68 != v61) {
                      objc_enumerationMutation(obj);
                    }
                    unsigned int v55 = objc_msgSend( v8,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  *(void *)(*((void *)&v67 + 1) + 8 * (void)v53),  objc_msgSend((id)objc_opt_class(self), "taskID"));
                    if (v55 == -108)
                    {
                      unsigned int v63 = -108;
                    }

                    else
                    {
                      BOOL v56 = v55 == -36 || v55 == -23;
                      unsigned int v63 = v55;
                      if (!v56) {
                        unsigned int v63 = v54;
                      }
                    }

                    if (v55 == -108 || (v55 != -36 ? (BOOL v57 = v55 == -23) : (BOOL v57 = 1), v57))
                    {
                      int v19 = 1;
                      goto LABEL_59;
                    }

                    uint64_t v53 = (char *)v53 + 1;
                    unsigned int v54 = v63;
                  }

                  while (v52 != v53);
                  id v52 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v67,  v72,  16LL);
                  int v19 = 0;
                  if (v52) {
                    continue;
                  }
                  break;
                }
              }

              else
              {
                int v19 = 0;
              }

- (int)_processFailedAssetsInPhotoLibrary:(id)a3 withAnalysisDatabase:(id)a4 andProgress:(id)a5
{
  id v63 = a3;
  id v9 = a4;
  id v62 = a5;
  uint64_t v11 = MediaAnalysisLogLevel(v62, v10);
  if ((int)v11 >= 5)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v14 = VCPLogToOSLogType[5];
    if (os_log_type_enabled((os_log_t)v5, v14))
    {
      id v15 = [(id)objc_opt_class(self) name];
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138412290;
      v72 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  v14,  "[%@] Evaluating failed assets for retry eligibility",  buf,  0xCu);
    }
  }

  unsigned int v61 = objc_msgSend(v63, "vcp_allowInMemoryDownload");
  objc_msgSend( v62,  "setTotalUnitCount:",  objc_msgSend(v9, "queryEligibleToRetryAssetCountWithTaskID:", objc_msgSend((id)objc_opt_class(self), "taskID")));
  os_log_type_t type = VCPLogToOSLogType[7];
  do
  {
    uint64_t v17 = objc_autoreleasePoolPush();
    if ((-[VCPMADPhotosLibraryProcessingTask isCanceled](self, "isCanceled") & 1) != 0)
    {
      uint64_t v5 = 4294967168LL;
      int v18 = 1;
    }

    else
    {
      int v19 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v19 pet];

      id v69 = 0LL;
      id v20 = objc_msgSend( v9,  "fetchLocalIdentifiersEligibleForRetry:withTaskID:andFetchLimit:",  &v69,  objc_msgSend((id)objc_opt_class(self), "taskID"),  100);
      id v21 = v69;
      id v22 = v21;
      if ((_DWORD)v20 == -108 || (_DWORD)v20 == -36)
      {
        uint64_t v23 = (uint64_t)v20;
      }

      else
      {
        uint64_t v23 = (uint64_t)v20;
        if ((_DWORD)v20 != -23) {
          uint64_t v23 = v5;
        }
      }

      int v18 = 1;
      if ((_DWORD)v20 != -108 && (_DWORD)v20 != -36 && (_DWORD)v20 != -23)
      {
        if ([v21 count])
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
          id v25 = [(id)objc_opt_class(self) name];
          id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          [v24 addBreadcrumb:@"[%@] Fetching %d retry eligible assets", v26, objc_msgSend(v22, "count")];

          id v27 = +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v63,  [(id)objc_opt_class(self) taskID]);
          id v64 = (void *)objc_claimAutoreleasedReturnValue(v27);
          id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"creationDate",  0LL));
          __int16 v75 = v28;
          v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v75,  1LL));
          [v64 setSortDescriptors:v29];

          int v30 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v22,  v64));
          int v31 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
          id v32 = [(id)objc_opt_class(self) name];
          id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          [v31 addBreadcrumb:@"[%@] Fetched %d retry eligible assets", v33, objc_msgSend(v22, "count")];

          uint64_t v34 = -[VCPMADPhotosProcessingTask processAssetsInFetchResult:withAnalysisDatabase:allowDownload:progress:]( self,  "processAssetsInFetchResult:withAnalysisDatabase:allowDownload:progress:",  v30,  v9,  v61,  0LL);
          if (!(_DWORD)v34)
          {
            uint64_t v34 = -[VCPMADPhotosProcessingTask waitForPublishing](self, "waitForPublishing");
            if (!(_DWORD)v34)
            {
              objc_msgSend( v62,  "setCompletedUnitCount:",  (char *)objc_msgSend(v30, "count") + (void)objc_msgSend(v62, "completedUnitCount"));
              [v30 count];
              uint64_t v35 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", v22);
              unint64_t v36 = 0LL;
              unsigned int v60 = v23;
              while (v36 < (unint64_t)[v30 count])
              {
                unsigned int v37 = objc_autoreleasePoolPush();
                os_signpost_id_t v38 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndexedSubscript:v36]);
                uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 localIdentifier]);
                -[NSMutableSet removeObject:](v35, "removeObject:", v39);

                objc_autoreleasePoolPop(v37);
                ++v36;
              }

              id v40 = -[NSMutableSet count](v35, "count");
              if (v40)
              {
                uint64_t v42 = MediaAnalysisLogLevel(v40, v41);
                if ((int)v42 >= 7)
                {
                  uint64_t v44 = VCPLogInstance(v42, v43);
                  uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
                  if (os_log_type_enabled(v45, type))
                  {
                    id v46 = [(id)objc_opt_class(self) name];
                    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
                    id v48 = -[NSMutableSet count](v35, "count");
                    *(_DWORD *)buf = 138412546;
                    v72 = v47;
                    __int16 v73 = 2048;
                    id v74 = v48;
                    _os_log_impl( (void *)&_mh_execute_header,  v45,  type,  "[%@] Dropping processing status for %lu unknown localIdentifiers",  buf,  0x16u);
                  }
                }

                __int128 v67 = 0u;
                __int128 v68 = 0u;
                __int128 v65 = 0u;
                __int128 v66 = 0u;
                obj = v35;
                id v49 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v65,  v70,  16LL);
                if (v49)
                {
                  uint64_t v58 = *(void *)v66;
                  while (2)
                  {
                    v50 = 0LL;
                    unsigned int v51 = v60;
                    do
                    {
                      if (*(void *)v66 != v58) {
                        objc_enumerationMutation(obj);
                      }
                      unsigned int v52 = objc_msgSend( v9,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  *(void *)(*((void *)&v65 + 1) + 8 * (void)v50),  objc_msgSend((id)objc_opt_class(self), "taskID"));
                      if (v52 == -108)
                      {
                        unsigned int v60 = -108;
                      }

                      else
                      {
                        BOOL v53 = v52 == -36 || v52 == -23;
                        unsigned int v60 = v52;
                        if (!v53) {
                          unsigned int v60 = v51;
                        }
                      }

                      if (v52 == -108 || (v52 != -36 ? (BOOL v54 = v52 == -23) : (BOOL v54 = 1), v54))
                      {
                        int v18 = 1;
                        goto LABEL_51;
                      }

                      v50 = (char *)v50 + 1;
                      unsigned int v51 = v60;
                    }

                    while (v49 != v50);
                    id v49 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v65,  v70,  16LL);
                    int v18 = 0;
                    if (v49) {
                      continue;
                    }
                    break;
                  }
                }

                else
                {
                  int v18 = 0;
                }

- (int)_processPhotoLibrary:(id)a3 withProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000CAAD0;
  v35[3] = &unk_1001B9E98;
  v35[4] = self;
  id v8 = objc_retainBlock(v35);
  [v7 setTotalUnitCount:10];
  +[VCPAnalysisProgressQuery reportProgressForPhotoLibrary:taskID:logMessage:cancelOrExtendTimeoutBlock:]( VCPAnalysisProgressQuery,  "reportProgressForPhotoLibrary:taskID:logMessage:cancelOrExtendTimeoutBlock:",  v6,  [(id)objc_opt_class(self) taskID],  @"Checking progress before task",  v8);
  id v9 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  -[VCPTimeMeasurement start](v9, "start");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v6));
  if (v11)
  {
    unsigned int v12 = -[VCPMADPhotosLibraryProcessingTask _checkHardFailuresForPhotoLibrary:withAnalysisDatabase:]( self,  "_checkHardFailuresForPhotoLibrary:withAnalysisDatabase:",  v6,  v11);
    if (!v12)
    {
      if ([(id)objc_opt_class(self) taskID] != (id)2
        || (uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[VCPMADPhotosLibraryProcessingTask cancelBlock](self, "cancelBlock")),
            v14 = (void *)objc_claimAutoreleasedReturnValue( +[MADPhotosLibraryRestoreTask taskWithPhotoLibrary:progressHandler:completionHandler:cancelBlock:]( MADPhotosLibraryRestoreTask,  "taskWithPhotoLibrary:progressHandler:completionHandler:cancelBlock:",  v6,  0,  0,  v13)),  unsigned int v12 = [v14 run],  v14,  v13,  !v12))
      {
        id v15 = objc_autoreleasePoolPush();
        unsigned int v16 = objc_msgSend(v6, "vcp_allowInMemoryDownload");
        uint64_t v17 = v16 ? 5LL : 9LL;
        int v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vcp_childWithPendingUnitCount:", v17));
        unsigned int v12 = -[VCPMADPhotosLibraryProcessingTask processAllAssetsInPhotoLibrary:withAnalysisDatabase:andProgress:]( self,  "processAllAssetsInPhotoLibrary:withAnalysisDatabase:andProgress:",  v6,  v11,  v18);
        if (v12
          || v16
          && (id v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vcp_childWithPendingUnitCount:", 4)),
              unsigned int v12 = -[VCPMADPhotosLibraryProcessingTask _processDownloadEligibleAssetsInPhotoLibrary:withAnalysisDatabase:andProgress:]( self,  "_processDownloadEligibleAssetsInPhotoLibrary:withAnalysisDatabase:andProgress:",  v6,  v11,  v32),  v32,  v12))
        {
          int v19 = 6;
        }

        else
        {
          int v19 = 0;
          unsigned int v12 = 0;
        }

        objc_autoreleasePoolPop(v15);
        if (v19 != 6)
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vcp_childWithPendingUnitCount:", 1));
          unsigned int v34 = -[VCPMADPhotosLibraryProcessingTask _processFailedAssetsInPhotoLibrary:withAnalysisDatabase:andProgress:]( self,  "_processFailedAssetsInPhotoLibrary:withAnalysisDatabase:andProgress:",  v6,  v11,  v33);

          if (v34) {
            unsigned int v12 = v34;
          }
        }
      }
    }
  }

  else
  {
    uint64_t v20 = MediaAnalysisLogLevel(0LL, v10);
    if ((int)v20 >= 3)
    {
      uint64_t v22 = VCPLogInstance(v20, v21);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      os_log_type_t v24 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v23, v24))
      {
        id v25 = [(id)objc_opt_class(self) name];
        id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        *(_DWORD *)buf = 138412290;
        unsigned int v37 = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "[%@] Failed to load MediaAnalysis database", buf, 0xCu);
      }
    }

    unsigned int v12 = -18;
  }

  unsigned int v27 = [v11 commit];
  int v28 = v27;
  if (v27 != -108 && v27 != -36 && v27 != -23)
  {
    [v11 flush];
    -[VCPTimeMeasurement stop](v9, "stop");
    -[VCPTimeMeasurement elapsedTimeSeconds](v9, "elapsedTimeSeconds");
    int v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Checking progress after task (%.2f seconds)",  v29));
    +[VCPAnalysisProgressQuery reportProgressForPhotoLibrary:taskID:logMessage:cancelOrExtendTimeoutBlock:]( VCPAnalysisProgressQuery,  "reportProgressForPhotoLibrary:taskID:logMessage:cancelOrExtendTimeoutBlock:",  v6,  [(id)objc_opt_class(self) taskID],  v30,  v8);

    int v28 = v12;
  }

  return v28;
}

- (BOOL)run:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( NSProgress,  "progressWithTotalUnitCount:",  100 * (void)[*(id *)(&self->super._publishError + 1) count]));
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472LL;
  v88[2] = sub_1000CB504;
  v88[3] = &unk_1001B9E70;
  v88[4] = self;
  id v80 = v4;
  id v89 = v80;
  int v78 = (void *)objc_claimAutoreleasedReturnValue( +[VCPTimer timerWithIntervalSeconds:isOneShot:andBlock:]( &OBJC_CLASS___VCPTimer,  "timerWithIntervalSeconds:isOneShot:andBlock:",  10LL,  0LL,  v88));
  uint64_t v5 = *(uint64_t *)((char *)&self->_photoLibraries + 4);
  if (v5) {
    (*(void (**)(double))(v5 + 16))(0.0);
  }
  if ([(id)objc_opt_class(self) taskID] == (id)2
    || (id v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v80,  "vcp_childWithPendingUnitCount:",  objc_msgSend(*(id *)(&self->super._publishError + 1), "count"))),  v7 = -[VCPMADPhotosLibraryProcessingTask completeSceneProcessingWithProgress:]( self,  "completeSceneProcessingWithProgress:",  v6),  v6,  !v7))
  {
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    id obj = *(id *)(&self->super._publishError + 1);
    id v16 = [obj countByEnumeratingWithState:&v84 objects:v96 count:16];
    if (!v16) {
      goto LABEL_52;
    }
    uint64_t v83 = *(void *)v85;
    os_log_type_t type = VCPLogToOSLogType[5];
    while (1)
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v85 != v83) {
          objc_enumerationMutation(obj);
        }
        int v18 = *(void **)(*((void *)&v84 + 1) + 8LL * (void)v17);
        int v19 = objc_autoreleasePoolPush();
        id v20 = [v18 isReadyForAnalysis];
        if ((v20 & 1) != 0)
        {
          id v22 = objc_msgSend(v18, "vcp_requiresProcessingForTask:", objc_msgSend((id)objc_opt_class(self), "taskID"));
          if ((v22 & 1) != 0)
          {
            id v24 = objc_msgSend(v18, "vcp_anyAssetsForTaskID:", objc_msgSend((id)objc_opt_class(self), "taskID"));
            if ((v24 & 1) != 0)
            {
              uint64_t v26 = VCPSignPostLog(v24);
              unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
              os_signpost_id_t v28 = os_signpost_id_generate(v27);

              uint64_t v30 = VCPSignPostLog(v29);
              int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
              id v32 = v31;
              if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v32,  OS_SIGNPOST_INTERVAL_BEGIN,  v28,  "VCPProcessPhotoLibrary",  (const char *)&unk_100199097,  buf,  2u);
              }

              uint64_t v35 = MediaAnalysisLogLevel(v33, v34);
              if ((int)v35 >= 5)
              {
                uint64_t v37 = VCPLogInstance(v35, v36);
                os_signpost_id_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
                if (os_log_type_enabled(v38, type))
                {
                  id v39 = [(id)objc_opt_class(self) name];
                  id v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
                  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v18 photoLibraryURL]);
                  *(_DWORD *)buf = 138412546;
                  v93 = v40;
                  __int16 v94 = 2112;
                  v95 = v41;
                  _os_log_impl((void *)&_mh_execute_header, v38, type, "[%@] Processing library %@", buf, 0x16u);
                }
              }

              uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "vcp_childWithPendingUnitCount:", 99));
              signed int v43 = -[VCPMADPhotosLibraryProcessingTask _processPhotoLibrary:withProgress:]( self,  "_processPhotoLibrary:withProgress:",  v18,  v42);

              uint64_t v45 = VCPSignPostLog(v44);
              id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
              uint64_t v47 = v46;
              if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v47,  OS_SIGNPOST_INTERVAL_END,  v28,  "VCPProcessPhotoLibrary",  (const char *)&unk_100199097,  buf,  2u);
              }

              if (!v43)
              {
                MediaAnalysisDaemonReleaseSharedDataStores(v18);
                int v53 = 0;
                goto LABEL_45;
              }

              if (!a3)
              {
                int v53 = 1;
                goto LABEL_45;
              }

              NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
              id v48 = "failed";
              if (v43 == -128) {
                id v48 = "canceled";
              }
              id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Processing %s",  v48));
              v91 = v49;
              v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v91,  &v90,  1LL));
              unsigned int v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v43,  v50));
              id v52 = *a3;
              *a3 = v51;

              int v53 = 1;
              goto LABEL_43;
            }

            uint64_t v68 = MediaAnalysisLogLevel(v24, v25);
            if ((int)v68 < 5)
            {
LABEL_44:
              int v53 = 3;
              goto LABEL_45;
            }

            uint64_t v70 = VCPLogInstance(v68, v69);
            id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
            if (os_log_type_enabled(v49, type))
            {
              id v71 = [(id)objc_opt_class(self) name];
              v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
              __int16 v73 = (void *)objc_claimAutoreleasedReturnValue([v18 photoLibraryURL]);
              id v74 = (void *)objc_claimAutoreleasedReturnValue([v73 path]);
              *(_DWORD *)buf = 138412546;
              v93 = v72;
              __int16 v94 = 2112;
              v95 = v74;
              _os_log_impl( (void *)&_mh_execute_header,  v49,  type,  "[%@] PhotoLibrary %@ is empty; skipping",
                buf,
                0x16u);
            }
          }

          else
          {
            uint64_t v61 = MediaAnalysisLogLevel(v22, v23);
            uint64_t v63 = VCPLogInstance(v61, v62);
            id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
            if (os_log_type_enabled(v49, type))
            {
              id v64 = [(id)objc_opt_class(self) name];
              __int128 v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
              __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v18 photoLibraryURL]);
              __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v66 path]);
              *(_DWORD *)buf = 138412546;
              v93 = v65;
              __int16 v94 = 2112;
              v95 = v67;
              _os_log_impl( (void *)&_mh_execute_header,  v49,  type,  "[%@] Photo Library does not require processing; skipping library (%@)",
                buf,
                0x16u);
            }
          }
        }

        else
        {
          uint64_t v54 = MediaAnalysisLogLevel(v20, v21);
          uint64_t v56 = VCPLogInstance(v54, v55);
          id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
          if (os_log_type_enabled(v49, type))
          {
            id v57 = [(id)objc_opt_class(self) name];
            uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
            BOOL v59 = (void *)objc_claimAutoreleasedReturnValue([v18 photoLibraryURL]);
            unsigned int v60 = (void *)objc_claimAutoreleasedReturnValue([v59 path]);
            *(_DWORD *)buf = 138412546;
            v93 = v58;
            __int16 v94 = 2112;
            v95 = v60;
            _os_log_impl( (void *)&_mh_execute_header,  v49,  type,  "[%@] Photo Library %@ is not ready; skipping",
              buf,
              0x16u);
          }
        }

        int v53 = 3;
LABEL_43:

LABEL_45:
        objc_autoreleasePoolPop(v19);
        if (v53 != 3 && v53) {
          goto LABEL_9;
        }
        uint64_t v17 = (char *)v17 + 1;
      }

      while (v16 != v17);
      id v75 = [obj countByEnumeratingWithState:&v84 objects:v96 count:16];
      id v16 = v75;
      if (!v75)
      {
LABEL_52:

        uint64_t v76 = *(uint64_t *)((char *)&self->_photoLibraries + 4);
        if (v76) {
          (*(void (**)(double))(v76 + 16))(100.0);
        }
        [v78 destroy];
        id obj = (id)objc_claimAutoreleasedReturnValue(-[VCPMADPhotosLibraryProcessingTask completionHandler](self, "completionHandler"));
        (*((void (**)(id, void, void))obj + 2))(obj, 0LL, 0LL);
        BOOL v15 = 1;
        goto LABEL_55;
      }
    }
  }

  if (a3)
  {
    NSErrorUserInfoKey v97 = NSLocalizedDescriptionKey;
    id v8 = [(id)objc_opt_class(self) name];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = "failed";
    if (v7 == -128) {
      uint64_t v10 = "canceled";
    }
    id obj = (id)v9;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@] Pre Analysis %s",  v9,  v10));
    v98 = v11;
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v98,  &v97,  1LL));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v7,  v12));
    id v14 = *a3;
    *a3 = v13;

LABEL_9:
    BOOL v15 = 0;
LABEL_55:
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
}

@end