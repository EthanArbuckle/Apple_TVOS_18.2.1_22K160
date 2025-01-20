@interface VCPMediaTypeAnalysisTask
+ (BOOL)streamingAllowed;
+ (id)taskWithPhotoLibrary:(id)a3 mediaType:(int64_t)a4;
- (BOOL)_canDoFullAnalysis:(id)a3;
- (VCPMediaTypeAnalysisTask)init;
- (VCPMediaTypeAnalysisTask)initWithPhotoLibrary:(id)a3 mediaType:(int64_t)a4;
- (int)_processFetchedAssets:(id)a3 withProgressReport:(id)a4 andChangeManager:(id)a5;
- (int)mainInternal;
@end

@implementation VCPMediaTypeAnalysisTask

- (VCPMediaTypeAnalysisTask)init
{
  return 0LL;
}

- (VCPMediaTypeAnalysisTask)initWithPhotoLibrary:(id)a3 mediaType:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VCPMediaTypeAnalysisTask;
  result = -[VCPTask initWithPhotoLibrary:](&v6, "initWithPhotoLibrary:", a3);
  if (result) {
    result->super.super._progressHandler = (id)a4;
  }
  return result;
}

+ (id)taskWithPhotoLibrary:(id)a3 mediaType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v6 mediaType:a4];

  return v7;
}

- (BOOL)_canDoFullAnalysis:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v3));
  id v5 = objc_msgSend(v3, "vcp_fullAnalysisTypes");
  LOBYTE(v5) = v5 == objc_msgSend(v3, "vcp_fullAnalysisTypesForResources:", v4);

  return (char)v5;
}

+ (BOOL)streamingAllowed
{
  return 1;
}

- (int)_processFetchedAssets:(id)a3 withProgressReport:(id)a4 andChangeManager:(id)a5
{
  id v81 = a3;
  id v76 = a4;
  id v75 = a5;
  v82 = self;
  if (-[VCPTask isCancelled](self, "isCancelled"))
  {
    int v78 = -128;
    goto LABEL_50;
  }

  id v8 = [(id)objc_opt_class(self) streamingAllowed];
  if ((v8 & 1) == 0)
  {
    uint64_t v21 = MediaAnalysisLogLevel(v8, v9);
    uint64_t v23 = VCPLogInstance(v21, v22);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    os_log_type_t v19 = VCPLogToOSLogType[7];
    if (!os_log_type_enabled(v18, v19)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v20 = "Streaming not allowed; skipping assets that require streaming";
    goto LABEL_17;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  if (objc_msgSend(v10, "vcp_isCPLEnabled"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
    unsigned __int8 v12 = objc_msgSend(v11, "vcp_isCPLDownloadComplete");

    if ((v12 & 1) == 0)
    {
      uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
      uint64_t v17 = VCPLogInstance(v15, v16);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      os_log_type_t v19 = VCPLogToOSLogType[6];
      if (!os_log_type_enabled(v18, v19)) {
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      v20 = "Initial iCPL download is incomplete; skipping assets that require streaming";
      goto LABEL_17;
    }
  }

  else
  {
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[VCPInternetReachability sharedInstance](&OBJC_CLASS___VCPInternetReachability, "sharedInstance"));
  unsigned __int8 v25 = [v24 hasWifiOrEthernetConnection];

  if ((v25 & 1) == 0)
  {
    uint64_t v28 = MediaAnalysisLogLevel(v26, v27);
    if ((int)v28 >= 6)
    {
      uint64_t v30 = VCPLogInstance(v28, v29);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      os_log_type_t v19 = VCPLogToOSLogType[6];
      if (!os_log_type_enabled(v18, v19))
      {
LABEL_18:

        goto LABEL_19;
      }

      *(_WORD *)buf = 0;
      v20 = "Wifi/Ethernet connection unavailable; skipping assets that require streaming";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v18, v19, v20, buf, 2u);
      goto LABEL_18;
    }
  }

- (int)mainInternal
{
  uint64_t v3 = VCPSignPostLog(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v7 = VCPSignPostLog(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "VCPMediaTypeAnalysisTask",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
  if ((int)v12 >= 6)
  {
    uint64_t v14 = VCPLogInstance(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      if (self->super.super._progressHandler == (id)1) {
        uint64_t v17 = "photo";
      }
      else {
        uint64_t v17 = "movie";
      }
      *(_DWORD *)buf = 136315138;
      v135 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Processing all %s assets...", buf, 0xCu);
    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  id v19 = objc_msgSend(v18, "vcp_assetCountWithMediaType:forTaskID:", self->super.super._progressHandler, 1);

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask progressHandler](self, "progressHandler"));
    BOOL v21 = v20 == 0LL;

    if (v21)
    {
      v24 = 0LL;
    }

    else
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask progressHandler](self, "progressHandler"));
      uint64_t v23 = objc_claimAutoreleasedReturnValue( +[VCPProgressReporter reporterWithIntervalSeconds:andTotalJobCount:andBlock:]( &OBJC_CLASS___VCPProgressReporter,  "reporterWithIntervalSeconds:andTotalJobCount:andBlock:",  10LL,  v19,  v22));

      v24 = (void *)v23;
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
    v132 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosAssetChangeManager managerForPhotoLibrary:]( &OBJC_CLASS___VCPPhotosAssetChangeManager,  "managerForPhotoLibrary:",  v26));

    if (!v132)
    {
      uint64_t v70 = MediaAnalysisLogLevel(v27, v28);
      if ((int)v70 < 3)
      {
        int v25 = -18;
LABEL_83:

        return v25;
      }

      uint64_t v72 = VCPLogInstance(v70, v71);
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
      os_log_type_t v73 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v30, v73))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, v73, "Failed to retrieve VCPPhotosAssetChangeManager", buf, 2u);
      }

      int v25 = -18;
LABEL_82:

      goto LABEL_83;
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v29,  1LL));

    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"creationDate",  0LL));
    v133 = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v133, 1LL));
    -[os_log_s setSortDescriptors:](v30, "setSortDescriptors:", v32);

    id progressHandler = self->super.super._progressHandler;
    if (progressHandler == (id)2)
    {
      uint64_t v74 = VCPSignPostLog(v33);
      id v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
      os_signpost_id_t spid = os_signpost_id_generate(v75);

      uint64_t v77 = VCPSignPostLog(v76);
      int v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
      v79 = v78;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v79,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPMediaTypeAnalysisTask_Movie",  (const char *)&unk_100199097,  buf,  2u);
      }

      if ((_os_feature_enabled_impl("MediaAnalysis", "UnifiedFullAnalysis") & 1) != 0)
      {
        uint64_t v43 = 0LL;
      }

      else
      {
        v94 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
        [v94 addBreadcrumb:@"[MediaType] Fetching short videos"];

        v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"duration <= %lu",  +[PHAsset vcp_longMovieDurationThreshold]( &OBJC_CLASS___PHAsset,  "vcp_longMovieDurationThreshold")));
        -[os_log_s setInternalPredicate:](v30, "setInternalPredicate:", v95);

        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithMediaType:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithMediaType:options:",  self->super.super._progressHandler,  v30));
        uint64_t v97 = MediaAnalysisLogLevel(v43, v96);
        if ((int)v97 >= 6)
        {
          uint64_t v99 = VCPLogInstance(v97, v98);
          v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
          os_log_type_t v101 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v100, v101))
          {
            v102 = (const char *)[v43 count];
            *(_DWORD *)buf = 134217984;
            v135 = v102;
            _os_log_impl((void *)&_mh_execute_header, v100, v101, "Processing all %lu short movie assets...", buf, 0xCu);
          }
        }

        v103 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
        objc_msgSend(v103, "addBreadcrumb:", @"[MediaType] Fetched %lu short videos", objc_msgSend(v43, "count"));

        int v25 = -[VCPMediaTypeAnalysisTask _processFetchedAssets:withProgressReport:andChangeManager:]( self,  "_processFetchedAssets:withProgressReport:andChangeManager:",  v43,  v24,  v132);
        if (v25) {
          goto LABEL_69;
        }
      }

      v104 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
      [v104 addBreadcrumb:@"[MediaType] Fetching long videos"];

      v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"duration > %lu",  +[PHAsset vcp_longMovieDurationThreshold]( &OBJC_CLASS___PHAsset,  "vcp_longMovieDurationThreshold")));
      -[os_log_s setInternalPredicate:](v30, "setInternalPredicate:", v105);

      v55 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithMediaType:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithMediaType:options:",  self->super.super._progressHandler,  v30));
      v106 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
      objc_msgSend(v106, "addBreadcrumb:", @"[MediaType] Fetched %lu long videos", objc_msgSend(v55, "count"));

      uint64_t v109 = MediaAnalysisLogLevel(v107, v108);
      if ((int)v109 >= 6)
      {
        uint64_t v111 = VCPLogInstance(v109, v110);
        v112 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
        os_log_type_t v113 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v112, v113))
        {
          v114 = (const char *)[v55 count];
          *(_DWORD *)buf = 134217984;
          v135 = v114;
          _os_log_impl((void *)&_mh_execute_header, v112, v113, "Processing all %lu long movie assets...", buf, 0xCu);
        }
      }

      uint64_t v115 = -[VCPMediaTypeAnalysisTask _processFetchedAssets:withProgressReport:andChangeManager:]( self,  "_processFetchedAssets:withProgressReport:andChangeManager:",  v55,  v24,  v132);
      int v25 = v115;
      if ((_DWORD)v115) {
        goto LABEL_68;
      }
      uint64_t v116 = VCPSignPostLog(v115);
      v117 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
      v68 = v117;
      if (spid - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v117)) {
        goto LABEL_67;
      }
      *(_WORD *)buf = 0;
      v69 = "VCPMediaTypeAnalysisTask_Movie";
    }

    else
    {
      if (progressHandler != (id)1)
      {
        uint64_t v80 = VCPSignPostLog(v33);
        id v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
        os_signpost_id_t v82 = os_signpost_id_generate(v81);

        uint64_t v84 = VCPSignPostLog(v83);
        v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
        __int16 v86 = v85;
        if (v82 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v86,  OS_SIGNPOST_INTERVAL_BEGIN,  v82,  "VCPMediaTypeAnalysisTask_Other",  (const char *)&unk_100199097,  buf,  2u);
        }

        id v87 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
        [v87 addBreadcrumb:@"[MediaType] Fetching non image/videos"];

        v55 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithMediaType:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithMediaType:options:",  self->super.super._progressHandler,  v30));
        __int16 v88 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
        objc_msgSend( v88,  "addBreadcrumb:",  @"[MediaType] Fetched %lu non image/videos",  objc_msgSend(v55, "count"));

        uint64_t v89 = -[VCPMediaTypeAnalysisTask _processFetchedAssets:withProgressReport:andChangeManager:]( self,  "_processFetchedAssets:withProgressReport:andChangeManager:",  v55,  v24,  v132);
        int v25 = v89;
        if ((_DWORD)v89) {
          goto LABEL_68;
        }
        uint64_t v90 = VCPSignPostLog(v89);
        v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
        v68 = v91;
        if (v82 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v91)) {
          goto LABEL_67;
        }
        *(_WORD *)buf = 0;
        v69 = "VCPMediaTypeAnalysisTask_Other";
        v92 = v68;
        os_signpost_id_t v93 = v82;
        goto LABEL_66;
      }

      uint64_t v35 = VCPSignPostLog(v33);
      int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      os_signpost_id_t spid = os_signpost_id_generate(v36);

      uint64_t v38 = VCPSignPostLog(v37);
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      v40 = v39;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v40,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPMediaTypeAnalysisTask_Image",  (const char *)&unk_100199097,  buf,  2u);
      }

      id v41 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
      [v41 addBreadcrumb:@"[MediaType] Fetching face done images"];

      id v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"faceAdjustmentVersion != nil"));
      -[os_log_s setInternalPredicate:](v30, "setInternalPredicate:", v42);

      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithMediaType:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithMediaType:options:",  self->super.super._progressHandler,  v30));
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
      objc_msgSend(v44, "addBreadcrumb:", @"[MediaType] Fetched %lu face done images", objc_msgSend(v43, "count"));

      uint64_t v47 = MediaAnalysisLogLevel(v45, v46);
      if ((int)v47 >= 6)
      {
        uint64_t v49 = VCPLogInstance(v47, v48);
        v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        os_log_type_t v51 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = (const char *)[v43 count];
          *(_DWORD *)buf = 134217984;
          v135 = v52;
          _os_log_impl( (void *)&_mh_execute_header,  v50,  v51,  "Processing all %lu photo assets with face detection finished...",  buf,  0xCu);
        }
      }

      int v25 = -[VCPMediaTypeAnalysisTask _processFetchedAssets:withProgressReport:andChangeManager:]( self,  "_processFetchedAssets:withProgressReport:andChangeManager:",  v43,  v24,  v132);
      if (v25) {
        goto LABEL_69;
      }
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
      [v53 addBreadcrumb:@"[MediaType] Fetching face not done images"];

      v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"faceAdjustmentVersion == nil"));
      -[os_log_s setInternalPredicate:](v30, "setInternalPredicate:", v54);

      v55 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithMediaType:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithMediaType:options:",  self->super.super._progressHandler,  v30));
      uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
      objc_msgSend( v56,  "addBreadcrumb:",  @"[MediaType] Fetched %lu face not done images",  objc_msgSend(v55, "count"));

      uint64_t v59 = MediaAnalysisLogLevel(v57, v58);
      if ((int)v59 >= 6)
      {
        uint64_t v61 = VCPLogInstance(v59, v60);
        id v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
        os_log_type_t v63 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v62, v63))
        {
          v64 = (const char *)[v55 count];
          *(_DWORD *)buf = 134217984;
          v135 = v64;
          _os_log_impl( (void *)&_mh_execute_header,  v62,  v63,  "Processing all %lu photo assets with face detection unfinished...",  buf,  0xCu);
        }
      }

      uint64_t v65 = -[VCPMediaTypeAnalysisTask _processFetchedAssets:withProgressReport:andChangeManager:]( self,  "_processFetchedAssets:withProgressReport:andChangeManager:",  v55,  v24,  v132);
      int v25 = v65;
      if ((_DWORD)v65)
      {
LABEL_68:
        uint64_t v43 = v55;
LABEL_69:

        v118 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
        v119 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v118));
        unsigned int v120 = [v119 commit];

        if (v120 == -108 || v120 == -36 || v120 == -23)
        {
          int v25 = v120;
        }

        else
        {
          id v121 = [v132 publishPendingChanges];
          if ((_DWORD)v121)
          {
            id v121 = (id)MediaAnalysisLogLevel(v121, v122);
            if ((int)v121 >= 4)
            {
              uint64_t v124 = VCPLogInstance(v121, v123);
              v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
              os_log_type_t v126 = VCPLogToOSLogType[4];
              if (os_log_type_enabled(v125, v126))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v125,  v126,  "Failed to publish PHAssetPropertySetMediaAnalysis changes",  buf,  2u);
              }
            }
          }

          uint64_t v127 = VCPSignPostLog(v121);
          v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
          v129 = v128;
          if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v128))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v129,  OS_SIGNPOST_INTERVAL_END,  v5,  "VCPMediaTypeAnalysisTask",  (const char *)&unk_100199097,  buf,  2u);
          }
        }

        goto LABEL_82;
      }

      uint64_t v66 = VCPSignPostLog(v65);
      v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      v68 = v67;
      if (spid - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v67))
      {
LABEL_67:

        int v25 = 0;
        goto LABEL_68;
      }

      *(_WORD *)buf = 0;
      v69 = "VCPMediaTypeAnalysisTask_Image";
    }

    v92 = v68;
    os_signpost_id_t v93 = spid;
LABEL_66:
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v92,  OS_SIGNPOST_INTERVAL_END,  v93,  v69,  (const char *)&unk_100199097,  buf,  2u);
    goto LABEL_67;
  }

  return 0;
}

@end