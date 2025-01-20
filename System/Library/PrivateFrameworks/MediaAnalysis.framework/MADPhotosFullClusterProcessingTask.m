@interface MADPhotosFullClusterProcessingTask
+ (id)taskWithPhotoLibrary:(id)a3;
- (BOOL)fullModeClusterOnly;
- (BOOL)requiresProgressQuery;
- (MADPhotosFullClusterProcessingTask)initWithPhotoLibrary:(id)a3;
- (unint64_t)queryMediaAnalysisImagePriority1ProgressPercentage;
- (void)cacheMediaAnalysisImagePriority1Progress;
- (void)process;
- (void)setFullModeClusterOnly:(BOOL)a3;
- (void)setRequiresProgressQuery:(BOOL)a3;
@end

@implementation MADPhotosFullClusterProcessingTask

- (MADPhotosFullClusterProcessingTask)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MADPhotosFullClusterProcessingTask;
  v6 = -[MADProcessingTask init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v7->_photoLibrary));
    database = v7->_database;
    v7->_database = (VCPDatabaseWriter *)v8;
  }

  return v7;
}

+ (id)taskWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithPhotoLibrary:v4];

  return v5;
}

- (unint64_t)queryMediaAnalysisImagePriority1ProgressPercentage
{
  uint64_t v21 = 0LL;
  unint64_t v22 = 0LL;
  photoLibrary = self->_photoLibrary;
  id v20 = 0LL;
  unsigned __int8 v4 = -[PHPhotoLibrary mad_calculateProgressPercentage:totalAssetCount:progressPercentageWithFailure:taskID:phTaskID:priority:failedAssetCount:error:]( photoLibrary,  "mad_calculateProgressPercentage:totalAssetCount:progressPercentageWithFailure:taskID:phTaskID: priority:failedAssetCount:error:",  &v22,  &v21,  0LL,  1LL,  17LL,  1LL,  0LL,  &v20);
  id v5 = v20;
  v7 = v5;
  if ((v4 & 1) != 0)
  {
    uint64_t v8 = MediaAnalysisLogLevel(v5, v6);
    if ((int)v8 >= 5)
    {
      uint64_t v10 = VCPLogInstance(v8, v9);
      objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[FullCluster] Full analysis image priority 1 progress: %u",  buf,  8u);
      }
    }

    -[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  v22,  VCPKeyValueMediaAnalysisImagePriority1ProgressPercentage);
    -[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  v21,  VCPKeyValueMediaAnalysisImagePriority1TotalAssetCount);
    -[VCPDatabaseWriter commit](self->_database, "commit");
    unint64_t v13 = v22;
  }

  else
  {
    uint64_t v14 = MediaAnalysisLogLevel(v5, v6);
    if ((int)v14 >= 3)
    {
      uint64_t v16 = VCPLogInstance(v14, v15);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      os_log_type_t v18 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[FullCluster] Failed to query full analysis image priority 1 progress: %@",  buf,  0xCu);
      }
    }

    unint64_t v13 = 0LL;
  }

  return v13;
}

- (void)cacheMediaAnalysisImagePriority1Progress
{
  uint64_t v3 = mach_absolute_time();
  uint64_t v4 = VCPSignPostLog(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v8 = VCPSignPostLog(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "MADPhotosFullClusterProcessingTask_QueryProgress",  (const char *)&unk_100199097,  buf,  2u);
  }

  unint64_t v11 = -[MADPhotosFullClusterProcessingTask queryMediaAnalysisImagePriority1ProgressPercentage]( self,  "queryMediaAnalysisImagePriority1ProgressPercentage");
  uint64_t v12 = VCPSignPostLog(v11);
  unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = v13;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_END,  v6,  "MADPhotosFullClusterProcessingTask_QueryProgress",  (const char *)&unk_100199097,  v25,  2u);
  }

  if (v3)
  {
    uint64_t v15 = mach_absolute_time();
    VCPPerformance_LogMeasurement("MADPhotosFullClusterProcessingTask_QueryProgress", v15 - v3);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v16 timeIntervalSinceReferenceDate];
  uint64_t v18 = (uint64_t)v17;

  uint64_t v19 = VCPKeyValueMediaAnalysisImagePriority1MCEnableTimestamp;
  int64_t v20 = -[VCPDatabaseWriter valueForKey:]( self->_database,  "valueForKey:",  VCPKeyValueMediaAnalysisImagePriority1MCEnableTimestamp);
  uint64_t v21 = VCPKeyValueMediaAnalysisImagePriority1CompleteTimestamp;
  int64_t v22 = -[VCPDatabaseWriter valueForKey:]( self->_database,  "valueForKey:",  VCPKeyValueMediaAnalysisImagePriority1CompleteTimestamp);
  if (v11 >= VCPAnalysisComplete90Percentage)
  {
    if (v22)
    {
      if (v20) {
        goto LABEL_21;
      }
    }

    else
    {
      -[VCPDatabaseWriter setValue:forKey:](self->_database, "setValue:forKey:", v18, v21);
      if (v20) {
        goto LABEL_21;
      }
    }

    -[VCPDatabaseWriter setValue:forKey:](self->_database, "setValue:forKey:", v18, v19);
    goto LABEL_21;
  }

  if (v11 < 0x4B)
  {
    -[VCPDatabaseWriter removeKey:](self->_database, "removeKey:", v21);
    database = self->_database;
    uint64_t v24 = v19;
  }

  else
  {
    if (!v20) {
      -[VCPDatabaseWriter setValue:forKey:](self->_database, "setValue:forKey:", v18, v19);
    }
    database = self->_database;
    uint64_t v24 = v21;
  }

  -[VCPDatabaseWriter removeKey:](database, "removeKey:", v24);
LABEL_21:
  -[VCPDatabaseWriter commit](self->_database, "commit");
}

- (void)process
{
  id v3 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled](&OBJC_CLASS___VCPVideoCNNAnalyzer, "isMUBackboneEnabled");
  if ((v3 & 1) == 0)
  {
    uint64_t v13 = MediaAnalysisLogLevel(v3, v4);
    uint64_t v15 = VCPLogInstance(v13, v14);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v11 = VCPLogToOSLogType[7];
    if (!os_log_type_enabled(v10, v11)) {
      goto LABEL_60;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "[FullCluster] Embedding generation disabled, skip vector database rebuild and VU gallery update";
    goto LABEL_9;
  }

  id v5 = -[PHPhotoLibrary vcp_isSyndicationLibrary](self->_photoLibrary, "vcp_isSyndicationLibrary");
  if ((_DWORD)v5)
  {
    uint64_t v7 = MediaAnalysisLogLevel(v5, v6);
    uint64_t v9 = VCPLogInstance(v7, v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    os_log_type_t v11 = VCPLogToOSLogType[7];
    if (!os_log_type_enabled(v10, v11)) {
      goto LABEL_60;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "[FullCluster] Skip vector database rebuild and gallery update for syndication library";
    goto LABEL_9;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
  if (v16)
  {
    double v17 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
    int v18 = v17[2]();

    if (v18)
    {
      uint64_t v21 = MediaAnalysisLogLevel(v19, v20);
      uint64_t v23 = VCPLogInstance(v21, v22);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      os_log_type_t v11 = VCPLogToOSLogType[4];
      if (!os_log_type_enabled(v10, v11)) {
        goto LABEL_60;
      }
      *(_WORD *)buf = 0;
      uint64_t v12 = "[FullCluster] Task cancelled, skip VSK rebuild and VU clustering";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v12, buf, 2u);
      goto LABEL_60;
    }
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v24 pet];

  uint64_t v27 = MediaAnalysisLogLevel(v25, v26);
  if ((int)v27 >= 6)
  {
    uint64_t v29 = VCPLogInstance(v27, v28);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    os_log_type_t v31 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v30, v31))
    {
      BOOL requiresProgressQuery = self->_requiresProgressQuery;
      BOOL fullModeClusterOnly = self->_fullModeClusterOnly;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v105 = requiresProgressQuery;
      *(_WORD *)&v105[4] = 1024;
      *(_DWORD *)&v105[6] = fullModeClusterOnly;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "[FullCluster] Requesting clustering (requiresProgressQuery: %d, fullModeClusterOnly: %d)...",  buf,  0xEu);
    }
  }

  uint64_t v34 = VCPSignPostLog(v27);
  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  os_signpost_id_t v36 = os_signpost_id_generate(v35);

  uint64_t v38 = VCPSignPostLog(v37);
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  v40 = v39;
  if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v40,  OS_SIGNPOST_INTERVAL_BEGIN,  v36,  "MADPhotosFullClusterProcessingTask_Process",  (const char *)&unk_100199097,  buf,  2u);
  }

  if (self->_requiresProgressQuery) {
    -[MADPhotosFullClusterProcessingTask cacheMediaAnalysisImagePriority1Progress]( self,  "cacheMediaAnalysisImagePriority1Progress");
  }
  uint64_t v41 = -[VCPDatabaseWriter valueForKey:]( self->_database,  "valueForKey:",  VCPKeyValueMediaAnalysisImagePriority1MCEnableTimestamp);
  uint64_t v42 = -[VCPDatabaseWriter valueForKey:]( self->_database,  "valueForKey:",  VCPKeyValueMediaAnalysisImagePriority1LastFullModeClusterTimestamp);
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v43 timeIntervalSinceReferenceDate];
  double v45 = v44;

  if (v41 && MADFullModeClusterInterval <= (double)((uint64_t)v45 - v42))
  {
    uint64_t v54 = 1LL;
    goto LABEL_32;
  }

  if (!self->_fullModeClusterOnly)
  {
    uint64_t v54 = 0LL;
LABEL_32:
    uint64_t v55 = MediaAnalysisLogLevel(v46, v47);
    if ((int)v55 >= 5)
    {
      uint64_t v57 = VCPLogInstance(v55, v56);
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      os_log_type_t v59 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v58, v59))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v105 = v54;
        _os_log_impl((void *)&_mh_execute_header, v58, v59, "[FullCluster] Rebuilding VSK (force: %d)...", buf, 8u);
      }
    }

    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:]( &OBJC_CLASS___MADVectorDatabaseManager,  "sharedDatabaseWithPhotoLibrary:",  self->_photoLibrary));
    uint64_t v10 = v60;
    if (v60)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s databaseDirectoryURL](v60, "databaseDirectoryURL"));
      BOOL v63 = v62 == 0LL;

      if (v63)
      {
        uint64_t v98 = MediaAnalysisLogLevel(v64, v65);
        uint64_t v100 = VCPLogInstance(v98, v99);
        v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
        os_log_type_t v101 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v68, v101))
        {
          v102 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary photoLibraryURL](self->_photoLibrary, "photoLibraryURL"));
          *(_DWORD *)buf = 138412290;
          *(void *)v105 = v102;
          _os_log_impl( (void *)&_mh_execute_header,  v68,  v101,  "[FullCluster] Failed to obtain vector database directory for library %@",  buf,  0xCu);
        }

        goto LABEL_59;
      }

      v66 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
      id v103 = 0LL;
      unsigned int v67 = -[os_log_s rebuildWithForce:cancelBlock:extendTimeoutBlock:error:]( v10,  "rebuildWithForce:cancelBlock:extendTimeoutBlock:error:",  v54,  v66,  &stru_1001BE168,  &v103);
      v68 = (os_log_s *)v103;

      if (v67)
      {
        uint64_t v71 = MediaAnalysisLogLevel(v69, v70);
        if ((int)v71 >= 4)
        {
          uint64_t v73 = VCPLogInstance(v71, v72);
          v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
          os_log_type_t v75 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v74, v75))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v105 = v68;
            _os_log_impl( (void *)&_mh_execute_header,  v74,  v75,  "[FullCluster] (not disrupting) Failed to build vector database - %@",  buf,  0xCu);
          }
        }
      }

      uint64_t v76 = objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
      v78 = (void *)v76;
      if (!v76
        || (v79 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock")),
            int v80 = v79[2](),
            v79,
            v78,
            !v80))
      {
        uint64_t v91 = MediaAnalysisLogLevel(v76, v77);
        if ((int)v91 >= 5)
        {
          uint64_t v93 = VCPLogInstance(v91, v92);
          v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
          os_log_type_t v95 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v94, v95))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v94,  v95,  "[FullCluster] VUWGalleryUpdateTypeScene not supported on this platform",  buf,  2u);
          }
        }

        uint64_t v96 = VCPSignPostLog(v91);
        v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
        v84 = v97;
        if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v97))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v84,  OS_SIGNPOST_INTERVAL_END,  v36,  "MADPhotosFullClusterProcessingTask_Process",  (const char *)&unk_100199097,  buf,  2u);
        }

        goto LABEL_58;
      }

      uint64_t v81 = MediaAnalysisLogLevel(v76, v77);
      if ((int)v81 >= 4)
      {
        uint64_t v83 = VCPLogInstance(v81, v82);
        v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
        os_log_type_t v85 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v84, v85))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v84,  v85,  "[FullCluster] Task cancelled, skip VU clustering",  buf,  2u);
        }

- (BOOL)requiresProgressQuery
{
  return self->_requiresProgressQuery;
}

- (void)setRequiresProgressQuery:(BOOL)a3
{
  self->_BOOL requiresProgressQuery = a3;
}

- (BOOL)fullModeClusterOnly
{
  return self->_fullModeClusterOnly;
}

- (void)setFullModeClusterOnly:(BOOL)a3
{
  self->_BOOL fullModeClusterOnly = a3;
}

- (void).cxx_destruct
{
}

@end