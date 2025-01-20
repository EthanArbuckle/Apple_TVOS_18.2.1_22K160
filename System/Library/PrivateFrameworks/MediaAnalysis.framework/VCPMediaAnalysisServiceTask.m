@interface VCPMediaAnalysisServiceTask
+ (id)taskForPhotoLibrary:(id)a3 withAssetLocalIdentifiers:(id)a4 realTime:(BOOL)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (BOOL)autoCancellable;
- (BOOL)realTime;
- (VCPMediaAnalysisServiceTask)initWithPhotoLibrary:(id)a3 withAssetLocalIdentifiers:(id)a4 realTime:(BOOL)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (double)progressWeight:(id)a3;
- (double)totalProgressWeight:(id)a3;
- (float)resourceRequirement;
- (int)analyzeAsset:(id)a3 analyses:(id)a4 cancel:(id)a5;
- (int)run;
- (void)cancel;
@end

@implementation VCPMediaAnalysisServiceTask

- (VCPMediaAnalysisServiceTask)initWithPhotoLibrary:(id)a3 withAssetLocalIdentifiers:(id)a4 realTime:(BOOL)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v16 = (Block_layout *)a7;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___VCPMediaAnalysisServiceTask;
  v17 = -[VCPMediaAnalysisServiceTask init](&v26, "init");
  v18 = v17;
  if (v17)
  {
    v17->_realTime = a5;
    objc_storeStrong((id *)&v17->_photoLibrary, a3);
    objc_storeStrong((id *)&v18->_localIdentifiers, a4);
    v18->_cancel = 0;
    id v19 = objc_retainBlock(v15);
    id progressHandler = v18->_progressHandler;
    v18->_id progressHandler = v19;

    if (v16) {
      v21 = v16;
    }
    else {
      v21 = &stru_1001BBEB0;
    }
    v22 = objc_retainBlock(v21);
    id completionHandler = v18->_completionHandler;
    v18->_id completionHandler = v22;

    v18->_noResultStrip = 0;
    v24 = v18;
  }

  return v18;
}

+ (id)taskForPhotoLibrary:(id)a3 withAssetLocalIdentifiers:(id)a4 realTime:(BOOL)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v12 withAssetLocalIdentifiers:v13 realTime:v9 progressHandler:v14 completionHandler:v15];

  return v16;
}

- (float)resourceRequirement
{
  return 1.0;
}

- (void)cancel
{
  self->_cancel = 1;
}

- (double)progressWeight:(id)a3
{
  id v3 = a3;
  if ([v3 mediaType] == (id)2)
  {
    [v3 duration];
    double v5 = v4;
  }

  else
  {
    double v5 = 0.0;
    if ([v3 mediaType] == (id)1)
    {
      else {
        double v5 = 1.0;
      }
    }
  }

  return v5;
}

- (double)totalProgressWeight:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        -[VCPMediaAnalysisServiceTask progressWeight:]( self,  "progressWeight:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i),  (void)v11);
        double v7 = v7 + v9;
      }

      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  else
  {
    double v7 = 0.0;
  }

  if (v7 < 1.0) {
    double v7 = 1.0;
  }

  return v7;
}

- (int)analyzeAsset:(id)a3 analyses:(id)a4 cancel:(id)a5
{
  id v8 = a3;
  id v97 = a4;
  id v98 = a5;
  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  self->_photoLibrary));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v8));
  unint64_t v12 = (unint64_t)objc_msgSend(v8, "vcp_fullAnalysisTypesForResources:", v11) & 0xFFFFFFFFFFEFFFFFLL;
  if (!v12)
  {
    id v15 = 0LL;
    int v26 = 0;
    goto LABEL_47;
  }

  unsigned int v13 = [v8 isVideo];
  __int128 v14 = (id *)&OBJC_CLASS___VCPMovieAnalyzer_ptr;
  if (!v13) {
    __int128 v14 = (id *)&OBJC_CLASS___VCPPhotoAnalyzer_ptr;
  }
  unsigned int v93 = [*v14 canAnalyzeUndegraded:v8 withResources:v11];
  id v103 = 0LL;
  [v9 analysisForAsset:v10 analysis:&v103];
  id v15 = v103;
  if (!v15
    || !objc_msgSend(v8, "vcp_isAnalysisValid:", v15)
    || objc_msgSend(v15, "vcp_degraded") && v93 == objc_msgSend(v15, "vcp_degraded"))
  {

    id v15 = 0LL;
    goto LABEL_19;
  }

  unint64_t v16 = (unint64_t)objc_msgSend(v15, "vcp_types");
  if ((v12 & ~v16) != 0
    || (unint64_t v16 = (unint64_t)objc_msgSend(v15, "vcp_version"), (_DWORD)v16 != MediaAnalysisVersion))
  {
LABEL_19:
    uint64_t v27 = VCPSignPostLog(v16);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    os_signpost_id_t v29 = os_signpost_id_generate(v28);

    uint64_t v31 = VCPSignPostLog(v30);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    v33 = v32;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v33,  OS_SIGNPOST_INTERVAL_BEGIN,  v29,  "VCPMediaAnalysisServiceTask_UnpackComputeSync",  (const char *)&unk_100199097,  buf,  2u);
    }

    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mad_computeSyncResource"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "mad_existingAnalysisFromComputeSyncForAsset:allowDownload:cancel:", v8, 0, v98));
    uint64_t v34 = VCPSignPostLog(v96);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    v36 = v35;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v36,  OS_SIGNPOST_INTERVAL_END,  v29,  "VCPMediaAnalysisServiceTask_UnpackComputeSync",  (const char *)&unk_100199097,  buf,  2u);
    }

    if (v96)
    {
      id v95 = v96;

      uint64_t v39 = MediaAnalysisLogLevel(v37, v38);
      if ((int)v39 >= 5)
      {
        uint64_t v41 = VCPLogInstance(v39, v40);
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        os_log_type_t v43 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v42, v43))
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
          uint64_t v45 = MediaAnalysisTypeShortDescription(objc_msgSend(v95, "vcp_types"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          *(_DWORD *)buf = 138412546;
          v105 = v44;
          __int16 v106 = 2112;
          v107 = v46;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  v43,  "  [%@] Reusing analysis results from compute sync (existing: %@)",  buf,  0x16u);
        }
      }
    }

    else
    {
      id v95 = v15;
    }

    id v47 = [v9 getBlacklistCountForLocalIdentifier:v10];
    if ((int)v47 >= MediaAnalysisBlacklistThreshold)
    {
      uint64_t v52 = MediaAnalysisLogLevel(v47, v48);
      if ((int)v52 >= 4)
      {
        uint64_t v54 = VCPLogInstance(v52, v53);
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        os_log_type_t v56 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v55, v56))
        {
          *(_DWORD *)buf = 138412290;
          v105 = v10;
          _os_log_impl((void *)&_mh_execute_header, v55, v56, "  [%@] Asset blacklisted; skipping", buf, 0xCu);
        }
      }
    }

    else
    {
      unsigned int v49 = [v9 addAssetToBlacklist:v10];
      int v26 = v49;
      if (v49 == -108 || v49 == -36 || v49 == -23) {
        goto LABEL_45;
      }
      unsigned int v50 = [v9 commit];
      if (v50 == -108 || v50 == -36)
      {
        int v51 = v50;
      }

      else
      {
        int v51 = v50;
        if (v50 != -23) {
          int v51 = v26;
        }
      }

      if (v50 == -108 || v50 == -36 || v50 == -23)
      {
        int v26 = v51;
        goto LABEL_45;
      }

      id v58 = [v8 mediaType];
      unsigned int v59 = v93;
      if (v58 != (id)2) {
        unsigned int v59 = 0;
      }
      if (v59 == 1)
      {
        id v60 = [[VCPMovieAnalyzer alloc] initWithPHAsset:v8 withExistingAnalysis:v95 forAnalysisTypes:v12];
        v102[0] = _NSConcreteStackBlock;
        v102[1] = 3221225472LL;
        v102[2] = sub_100071A4C;
        v102[3] = &unk_1001BBED8;
        v61 = v102;
        v102[4] = v98;
        uint64_t v62 = objc_claimAutoreleasedReturnValue([v60 analyzeAsset:v102 streamed:0]);

        id v63 = [v60 status];
      }

      else
      {
        id v60 = [[VCPPhotoAnalyzer alloc] initWithPHAsset:v8 withExistingAnalysis:v95 forAnalysisTypes:v12];
        v101[0] = _NSConcreteStackBlock;
        v101[1] = 3221225472LL;
        v101[2] = sub_100071A9C;
        v101[3] = &unk_1001BBED8;
        v61 = v101;
        v101[4] = v98;
        uint64_t v62 = objc_claimAutoreleasedReturnValue([v60 analyzeAsset:v101 withOptions:0]);

        id v63 = [v60 status];
      }

      id v64 = v63;
      id v95 = (id)v62;

      if (v64 == (id)4)
      {
        uint64_t v68 = MediaAnalysisLogLevel(v65, v66);
        if ((int)v68 >= 5)
        {
          uint64_t v70 = VCPLogInstance(v68, v69);
          v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
          os_log_type_t v72 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v71, v72))
          {
            *(_DWORD *)buf = 138412290;
            v105 = v10;
            _os_log_impl((void *)&_mh_execute_header, v71, v72, "  [%@] Analysis cancelled", buf, 0xCu);
          }
        }

        unsigned int v73 = [v9 decrementBlacklistCountForLocalIdentifier:v10];
        if (v73 == -108 || v73 == -36)
        {
          int v26 = v73;
        }

        else
        {
          int v26 = v73;
          if (v73 != -23) {
            int v26 = v51;
          }
        }

        if (v73 == -108 || v73 == -36 || v73 == -23) {
          goto LABEL_45;
        }
        unsigned int v83 = [v9 commit];
        if (v83 == -108 || v83 == -36)
        {
          int v84 = v83;
        }

        else
        {
          int v84 = v83;
          if (v83 != -23) {
            int v84 = v26;
          }
        }

        if (v83 != -108 && v83 != -36 && v83 != -23)
        {
          int v26 = -128;
          goto LABEL_45;
        }

- (int)run
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  os_signpost_id_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  self->_photoLibrary,  1LL));
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  self->_localIdentifiers));
  -[VCPMediaAnalysisServiceTask totalProgressWeight:](self, "totalProgressWeight:");
  double v5 = v4;
  id progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](0.0);
  }
  double v7 = objc_alloc_init(&OBJC_CLASS___VCPSystemMonitor);
  id v8 = v7;
  if (self->_realTime || (uint64_t v24 = -[VCPSystemMonitor enable](v7, "enable"), !(_DWORD)v24))
  {
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id obj = v30;
    id v9 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v35;
      os_log_type_t v11 = VCPLogToOSLogType[6];
      double v12 = 0.0;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(obj);
          }
          __int128 v14 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
          if ((id)-[VCPSystemMonitor recommendedState](v8, "recommendedState") != (id)2)
          {
            uint64_t v24 = 4294967168LL;
            goto LABEL_24;
          }

          id v15 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
          [v15 pet];

          uint64_t v18 = MediaAnalysisLogLevel(v16, v17);
          if ((int)v18 >= 6)
          {
            uint64_t v20 = VCPLogInstance(v18, v19);
            v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, v11))
            {
              os_log_type_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 localIdentifier]);
              *(_DWORD *)buf = 138412290;
              uint64_t v39 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, v11, "  [%@] Processing", buf, 0xCu);
            }
          }

          BOOL v23 = objc_autoreleasePoolPush();
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472LL;
          v32[2] = sub_100071ECC;
          v32[3] = &unk_1001BBF00;
          v32[4] = self;
          v33 = v8;
          uint64_t v24 = -[VCPMediaAnalysisServiceTask analyzeAsset:analyses:cancel:]( self,  "analyzeAsset:analyses:cancel:",  v14,  v3,  v32);

          objc_autoreleasePoolPop(v23);
          if ((_DWORD)v24) {
            goto LABEL_24;
          }
          -[VCPMediaAnalysisServiceTask progressWeight:](self, "progressWeight:", v14);
          double v12 = v12 + v25;
          int v26 = (void (**)(double))self->_progressHandler;
          if (v26) {
            v26[2](v12 * 100.0 / v5);
          }
        }

        id v9 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
        uint64_t v24 = 0LL;
        if (v9) {
          continue;
        }
        break;
      }
    }

    else
    {
      uint64_t v24 = 0LL;
    }

- (BOOL)autoCancellable
{
  return 0;
}

- (BOOL)realTime
{
  return self->_realTime;
}

- (void).cxx_destruct
{
}

@end