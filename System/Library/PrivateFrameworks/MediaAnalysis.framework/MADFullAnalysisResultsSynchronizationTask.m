@interface MADFullAnalysisResultsSynchronizationTask
+ (id)taskWithPhotoLibrary:(id)a3;
- (MADFullAnalysisResultsSynchronizationTask)initWithPhotoLibrary:(id)a3;
- (int)mainInternal;
- (int)synchronizePhotosDatabaseForProcessedAssets;
- (int)synchronizePhotosDatabaseForProcessedAssetsWithImageOnly:(BOOL)a3;
- (unint64_t)versionResetOptionsForTaskID:(unint64_t)a3;
- (void)resetAnalysisVersionForMediaProcessingTaskID:(unint64_t)a3 assetIdentifiers:(id)a4;
@end

@implementation MADFullAnalysisResultsSynchronizationTask

- (MADFullAnalysisResultsSynchronizationTask)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MADFullAnalysisResultsSynchronizationTask;
  v5 = -[VCPTask initWithPhotoLibrary:](&v16, "initWithPhotoLibrary:", v4);
  v6 = v5;
  if (v5)
  {
    LODWORD(v5->super._progressHandler) = 0;
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v4));
    photoLibrary = v6->super._photoLibrary;
    v6->super._photoLibrary = (PHPhotoLibrary *)v7;

    dispatch_group_t v9 = dispatch_group_create();
    v10 = *(void **)&v6->_status;
    *(void *)&v6->_status = v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.mediaanalysisd.FullAnalysisSyncTask", v12);
    analysisDatabase = v6->_analysisDatabase;
    v6->_analysisDatabase = (VCPDatabaseWriter *)v13;
  }

  return v6;
}

+ (id)taskWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v4];

  return v5;
}

- (unint64_t)versionResetOptionsForTaskID:(unint64_t)a3
{
  if (a3 == 17) {
    return 4097LL;
  }
  int v3 = a3;
  if (a3 == 1) {
    return 10241LL;
  }
  if ((int)MediaAnalysisLogLevel(self, a2) >= 3)
  {
    uint64_t v5 = VCPLogInstance();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v6, v7))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "Unexpected taskID (%d), using PHMediaProcessingResetOption_Version option only",  (uint8_t *)v8,  8u);
    }
  }

  return 1LL;
}

- (void)resetAnalysisVersionForMediaProcessingTaskID:(unint64_t)a3 assetIdentifiers:(id)a4
{
  id v6 = a4;
  uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v8 >= 7)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    dispatch_queue_attr_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (id)objc_opt_class(self);
      *(_DWORD *)buf = 138412546;
      id v45 = v13;
      __int16 v46 = 2048;
      id v47 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%@] Resetting analysis version for %lu assets", buf, 0x16u);
    }
  }

  if (!LODWORD(self->super._progressHandler))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask cancel](self, "cancel"));
    if (v14
      && (v15 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[VCPTask cancel](self, "cancel")),
          int v16 = v15[2](),
          v15,
          v14,
          v16))
    {
      LODWORD(self->super._progressHandler) = -128;
    }

    else
    {
      uint64_t v42 = mach_absolute_time();
      uint64_t v17 = VCPSignPostLog(v42);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      os_signpost_id_t v19 = os_signpost_id_generate(v18);

      uint64_t v21 = VCPSignPostLog(v20);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      v23 = v22;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "MADFullAnalysisResultsSynchronizationTask_ResetAnalysisVersion",  (const char *)&unk_100199097,  buf,  2u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v24 pet];

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
      [v25 addBreadcrumb:@"[%@] Resetting MediaAnalysis version for %lu assets in Photos DB", objc_opt_class(self), objc_msgSend(v6, "count")];

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
      id v43 = 0LL;
      unsigned __int8 v27 = objc_msgSend( v26,  "resetStateForMediaProcessingTaskID:assetIdentifiers:resetOptions:error:",  a3,  v6,  -[MADFullAnalysisResultsSynchronizationTask versionResetOptionsForTaskID:]( self,  "versionResetOptionsForTaskID:",  a3),  &v43);
      id v28 = v43;

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
      [v29 addBreadcrumb:@"[%@] Finished resetting MediaAnalysis version for %lu assets in Photos DB", objc_opt_class(self), objc_msgSend(v6, "count")];

      if ((v27 & 1) == 0)
      {
        LODWORD(self->super._progressHandler) = -18;
        uint64_t v30 = MediaAnalysisLogLevel(v30, v31);
        if ((int)v30 >= 3)
        {
          uint64_t v33 = VCPLogInstance(v30, v32);
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          os_log_type_t v35 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v34, v35))
          {
            v36 = (void *)objc_opt_class(self);
            *(_DWORD *)buf = 138412802;
            id v45 = v36;
            __int16 v46 = 2048;
            id v47 = (id)a3;
            __int16 v48 = 2112;
            id v49 = v28;
            id v37 = v36;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "[%@] Failed to reset analysis version for assets with PHMediaProcessingTaskID %lu, error: %@",  buf,  0x20u);
          }
        }
      }

      uint64_t v38 = VCPSignPostLog(v30);
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      v40 = v39;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v40,  OS_SIGNPOST_INTERVAL_END,  v19,  "MADFullAnalysisResultsSynchronizationTask_ResetAnalysisVersion",  (const char *)&unk_100199097,  buf,  2u);
      }

      if (v42)
      {
        uint64_t v41 = mach_absolute_time();
        VCPPerformance_LogMeasurement("MADFullAnalysisResultsSynchronizationTask_ResetAnalysisVersion", v41 - v42);
      }
    }
  }
}

- (int)synchronizePhotosDatabaseForProcessedAssetsWithImageOnly:(BOOL)a3
{
  BOOL v103 = a3;
  uint64_t v4 = MediaAnalysisLogLevel(self, a2);
  if ((int)v4 >= 6)
  {
    uint64_t v6 = VCPLogInstance(v4, v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412546;
      id v115 = (id)objc_opt_class(self);
      __int16 v116 = 1024;
      LODWORD(v117) = v103;
      id v9 = v115;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "[%@] Start synchronizing photos database for processed assets, imageOnly %d",  buf,  0x12u);
    }
  }

  uint64_t v101 = mach_absolute_time();
  uint64_t v10 = VCPSignPostLog(v101);
  dispatch_queue_attr_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  os_signpost_id_t spid = os_signpost_id_generate(v11);

  uint64_t v13 = VCPSignPostLog(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "MADFullAnalysisResultsSynchronizationTask_SynchronizePhotosDatabase",  (const char *)&unk_100199097,  buf,  2u);
  }

  context = objc_autoreleasePoolPush();
  uint64_t v16 = 17LL;
  if (!v103) {
    uint64_t v16 = 1LL;
  }
  uint64_t v104 = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  v102 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[PHMediaProcessingAlgorithmVersionProvider mad_sharedVersionProviderWithPhotoLibrary:]( &OBJC_CLASS___PHMediaProcessingAlgorithmVersionProvider,  "mad_sharedVersionProviderWithPhotoLibrary:",  v17));

  +[PHAsset mad_sceneConfidenceThresholdForTask:](&OBJC_CLASS___PHAsset, "mad_sceneConfidenceThresholdForTask:", 1LL);
  int v19 = v18;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v20 pet];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask cancel](self, "cancel"));
  if (v21
    && (v22 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[VCPTask cancel](self, "cancel")),
        char v23 = v22[2](),
        v22,
        v21,
        v24 = v102,
        (v23 & 1) != 0))
  {
    LODWORD(v25) = -128;
  }

  else
  {
    uint64_t v26 = mach_absolute_time();
    uint64_t v27 = VCPSignPostLog(v26);
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    os_signpost_id_t v29 = os_signpost_id_generate(v28);

    uint64_t v31 = VCPSignPostLog(v30);
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    uint64_t v33 = v32;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v33,  OS_SIGNPOST_INTERVAL_BEGIN,  v29,  "MADFullAnalysisResultsSynchronizationTask_FetchProcessedAssets",  (const char *)&unk_100199097,  buf,  2u);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v34 addBreadcrumb:@"[%@] Fetching processed assets from Photos DB", objc_opt_class(self)];

    os_log_type_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
    id v113 = 0LL;
    LODWORD(v36) = v19;
    id v37 = (void *)objc_claimAutoreleasedReturnValue( [v35 fetchProcessedAssetsForMediaProcessingTaskID:v104 priority:0 algorithmVersion:v102 sceneConfidenceThreshold:&v113 error:v36]);
    id v99 = v113;

    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v38 addBreadcrumb:@"[%@] Fetched %lu processed assets from Photos DB", objc_opt_class(self), objc_msgSend(v37, "count")];

    uint64_t v40 = VCPSignPostLog(v39);
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    uint64_t v42 = v41;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v42,  OS_SIGNPOST_INTERVAL_END,  v29,  "MADFullAnalysisResultsSynchronizationTask_FetchProcessedAssets",  (const char *)&unk_100199097,  buf,  2u);
    }

    if (v26)
    {
      uint64_t v45 = mach_absolute_time();
      uint64_t v43 = VCPPerformance_LogMeasurement("MADFullAnalysisResultsSynchronizationTask_FetchProcessedAssets", v45 - v26);
    }

    if (v99)
    {
      uint64_t v46 = MediaAnalysisLogLevel(v43, v44);
      if ((int)v46 >= 3)
      {
        uint64_t v48 = VCPLogInstance(v46, v47);
        id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        os_log_type_t v50 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v49, v50))
        {
          v51 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138412546;
          id v115 = v51;
          __int16 v116 = 2112;
          id v117 = v99;
          id v52 = v51;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  v50,  "[%@] Failed to fetch processed assets from Photo Library, error %@",  buf,  0x16u);
        }
      }

      v105 = 0LL;
      LODWORD(v25) = -18;
    }

    else
    {
      unint64_t v53 = 0LL;
      v105 = 0LL;
      uint64_t v25 = 0LL;
      os_log_type_t type = VCPLogToOSLogType[3];
      while (v53 < (unint64_t)[v37 count])
      {
        v54 = objc_autoreleasePoolPush();
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
        [v55 pet];

        v56 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask cancel](self, "cancel"));
        if (v56
          && (v57 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[VCPTask cancel](self, "cancel")),
              char v58 = v57[2](),
              v57,
              v56,
              (v58 & 1) != 0))
        {
          uint64_t v25 = 4294967168LL;
          int v59 = 6;
        }

        else
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue([v37 objectAtIndexedSubscript:v53]);
          v61 = (void *)objc_claimAutoreleasedReturnValue([v60 mediaAnalysisProperties]);

          if (v61
            && (v62 = (void *)objc_claimAutoreleasedReturnValue([v37 objectAtIndexedSubscript:v53]),
                unsigned __int8 v63 = +[PHPhotoLibrary additionalCheckForProcessingNeededForAsset:taskID:priority:]( &OBJC_CLASS___PHPhotoLibrary,  "additionalCheckForProcessingNeededForAsset:taskID:priority:",  v62,  v104,  0LL),  v62,  (v63 & 1) != 0))
          {
            if (!v105) {
              v105 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            }
            if (v103) {
              uint64_t v64 = (int)[v61 mediaAnalysisImageVersion];
            }
            else {
              uint64_t v64 = (uint64_t)[v61 mediaAnalysisVersion];
            }
            v65 = (void *)objc_claimAutoreleasedReturnValue([v37 objectAtIndexedSubscript:v53]);
            v66 = (void *)objc_claimAutoreleasedReturnValue([v65 localIdentifier]);

            photoLibrary = self->super._photoLibrary;
            id v112 = 0LL;
            id v68 = -[PHPhotoLibrary queryAssetWithLocalIdentifier:forMediaAnalysisVersion:]( photoLibrary,  "queryAssetWithLocalIdentifier:forMediaAnalysisVersion:",  v66,  &v112);
            id v69 = v112;
            v71 = v69;
            if ((_DWORD)v68)
            {
              uint64_t v72 = MediaAnalysisLogLevel(v69, v70);
              if ((int)v72 >= 3)
              {
                uint64_t v74 = VCPLogInstance(v72, v73);
                v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
                if (os_log_type_enabled(v75, type))
                {
                  v76 = (void *)objc_opt_class(self);
                  *(_DWORD *)buf = 138412546;
                  id v115 = v76;
                  __int16 v116 = 2112;
                  id v117 = v66;
                  id v77 = v76;
                  _os_log_impl( (void *)&_mh_execute_header,  v75,  type,  "[%@][%@] Failed to query mediaanalysis version",  buf,  0x16u);
                }
              }

              int v59 = 6;
            }

            else
            {
              if ((unint64_t)-[NSMutableArray count](v105, "count") < 0x64)
              {
                int v59 = 0;
              }

              else
              {
                v78 = *(dispatch_group_s **)&self->_status;
                analysisDatabase = (dispatch_queue_s *)self->_analysisDatabase;
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472LL;
                block[2] = sub_10007DA70;
                block[3] = &unk_1001BC0D8;
                block[4] = self;
                v110 = v105;
                uint64_t v111 = v104;
                dispatch_group_async(v78, analysisDatabase, block);

                int v59 = 0;
                v105 = 0LL;
              }

              id v68 = (id)v25;
            }

            uint64_t v25 = (uint64_t)v68;
          }

          else
          {
            int v59 = 15;
          }
        }

        objc_autoreleasePoolPop(v54);
        if (v59 != 15 && v59)
        {

          objc_autoreleasePoolPop(context);
          goto LABEL_61;
        }

        ++v53;
      }

      if (-[NSMutableArray count](v105, "count"))
      {
        v80 = *(dispatch_group_s **)&self->_status;
        v81 = (dispatch_queue_s *)self->_analysisDatabase;
        v106[0] = _NSConcreteStackBlock;
        v106[1] = 3221225472LL;
        v106[2] = sub_10007DA80;
        v106[3] = &unk_1001BC0D8;
        v106[4] = self;
        v107 = v105;
        uint64_t v108 = v104;
        dispatch_group_async(v80, v81, v106);

        v105 = 0LL;
      }
    }

    v24 = v105;
  }

  objc_autoreleasePoolPop(context);
LABEL_61:
  uint64_t v82 = dispatch_group_wait(*(dispatch_group_t *)&self->_status, 0xFFFFFFFFFFFFFFFFLL);
  if (!(_DWORD)v25) {
    LODWORD(v25) = self->super._progressHandler;
  }
  uint64_t v83 = VCPSignPostLog(v82);
  v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
  v85 = v84;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v84))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v85,  OS_SIGNPOST_INTERVAL_END,  spid,  "MADFullAnalysisResultsSynchronizationTask_SynchronizePhotosDatabase",  (const char *)&unk_100199097,  buf,  2u);
  }

  if (v101)
  {
    uint64_t v88 = mach_absolute_time();
    uint64_t v86 = VCPPerformance_LogMeasurement( "MADFullAnalysisResultsSynchronizationTask_SynchronizePhotosDatabase",  v88 - v101);
  }

  uint64_t v89 = MediaAnalysisLogLevel(v86, v87);
  if ((int)v89 >= 6)
  {
    uint64_t v91 = VCPLogInstance(v89, v90);
    v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
    os_log_type_t v93 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v92, v93))
    {
      v94 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138412290;
      id v115 = v94;
      id v95 = v94;
      _os_log_impl( (void *)&_mh_execute_header,  v92,  v93,  "[%@] Finish synchronizing photos database for processed asstes",  buf,  0xCu);
    }
  }

  return v25;
}

- (int)synchronizePhotosDatabaseForProcessedAssets
{
  uint64_t v3 = VCPPhotosDatabaseSyncTimestampKeyForTask(1LL, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = -[PHPhotoLibrary valueForKey:](self->super._photoLibrary, "valueForKey:", v4);
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)v5));
    uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
    if ((int)v8 >= 6)
    {
      uint64_t v10 = VCPLogInstance(v8, v9);
      dispatch_queue_attr_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v11, v12))
      {
        id v13 = (id)objc_opt_class(self);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
        int v22 = 138412546;
        id v23 = v13;
        __int16 v24 = 2112;
        uint64_t v25 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[%@] Last Photos database synchronization for processed assets conducted on %@",  (uint8_t *)&v22,  0x16u);
      }
    }
  }

  else
  {
    int v17 = -[MADFullAnalysisResultsSynchronizationTask synchronizePhotosDatabaseForProcessedAssetsWithImageOnly:]( self,  "synchronizePhotosDatabaseForProcessedAssetsWithImageOnly:",  1LL);
    if (v17) {
      goto LABEL_22;
    }
    int v17 = -[MADFullAnalysisResultsSynchronizationTask synchronizePhotosDatabaseForProcessedAssetsWithImageOnly:]( self,  "synchronizePhotosDatabaseForProcessedAssetsWithImageOnly:",  0LL);
    if (v17) {
      goto LABEL_22;
    }
    photoLibrary = self->super._photoLibrary;
    int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v19 timeIntervalSinceReferenceDate];
    int v17 = -[PHPhotoLibrary setValue:forKey:](photoLibrary, "setValue:forKey:", (uint64_t)v20, v4);

    if (v17) {
      goto LABEL_22;
    }
  }

  unsigned int v15 = -[PHPhotoLibrary commit](self->super._photoLibrary, "commit");
  if (v15 == -108)
  {
    int v17 = -108;
  }

  else
  {
    BOOL v16 = v15 == -36 || v15 == -23;
    int v17 = v15;
    if (!v16) {
      int v17 = 0;
    }
  }

  if (v15 != -108 && v15 != -36 && v15 != -23) {
    int v17 = 0;
  }
LABEL_22:

  return v17;
}

- (int)mainInternal
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 6)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      *(_DWORD *)double v20 = 138412290;
      *(void *)&v20[4] = objc_opt_class(self);
      id v8 = *(id *)&v20[4];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "[%@] Synchronizing MediaAnalysis database with Photos database...",  v20,  0xCu);
    }
  }

  uint64_t v9 = -[MADFullAnalysisResultsSynchronizationTask synchronizePhotosDatabaseForProcessedAssets]( self,  "synchronizePhotosDatabaseForProcessedAssets",  *(_OWORD *)v20);
  int v11 = v9;
  if (!(_DWORD)v9)
  {
    uint64_t v12 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v12 >= 6)
    {
      uint64_t v14 = VCPLogInstance(v12, v13);
      unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      os_log_type_t v16 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v15, v16))
      {
        int v17 = (void *)objc_opt_class(self);
        *(_DWORD *)double v20 = 138412290;
        *(void *)&v20[4] = v17;
        id v18 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "[%@] Finished synchronizing MediaAnalysis database with Photos database.",  v20,  0xCu);
      }
    }
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end