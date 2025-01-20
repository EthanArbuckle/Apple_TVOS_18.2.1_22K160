@interface VCPPhotosMaintenanceProcessingTask
+ (id)taskWithPhotoLibraries:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5 andCancelBlock:(id)a6;
+ (void)updateProgressForPhotoLibrary:(id)a3 cancelBlock:(id)a4;
- (BOOL)_shouldPerformBackup:(id)a3;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (VCPPhotosMaintenanceProcessingTask)init;
- (VCPPhotosMaintenanceProcessingTask)initWithPhotoLibraries:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5 andCancelBlock:(id)a6;
- (float)resourceRequirement;
- (id)_computeSyncPayloadForAsset:(id)a3 fromDatabase:(id)a4;
- (id)_legacyBackupFilepathForTask:(unint64_t)a3 withPhotoLibrary:(id)a4;
- (id)cancelBlock;
- (int)_backupFullAnalysisForPhotoLibrary:(id)a3;
- (int)_collectAndReportAnalysisProgress;
- (int)_createBackupAtFilepath:(id)a3 forPhotoLibrary:(id)a4;
- (int)_performComputeSyncBackfillForPhotoLibrary:(id)a3;
- (int)_performVideoEmbeddingVersionBackfillForPhotoLibrary:(id)a3;
- (int)_pruneProcessingStatusForPhotoLibrary:(id)a3;
- (int)performForceClusterIfNeededWithPhotoLibrary:(id)a3;
- (int)run;
- (void)_persistBackfillForAssets:(id)a3 photoLibrary:(id)a4 database:(id)a5;
- (void)_persistVideoEmbeddingBackfillForAssets:(id)a3 photoLibrary:(id)a4;
- (void)_removeLegacyBackupForTask:(unint64_t)a3 withPhotoLibrary:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPPhotosMaintenanceProcessingTask

- (VCPPhotosMaintenanceProcessingTask)init
{
  return 0LL;
}

- (VCPPhotosMaintenanceProcessingTask)initWithPhotoLibraries:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5 andCancelBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = (Block_layout *)a5;
  v14 = (Block_layout *)a6;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___VCPPhotosMaintenanceProcessingTask;
  v15 = -[VCPPhotosMaintenanceProcessingTask init](&v26, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_photoLibraries, a3);
    id v17 = objc_retainBlock(v12);
    id progressHandler = v16->_progressHandler;
    v16->_id progressHandler = v17;

    if (v13) {
      v19 = v13;
    }
    else {
      v19 = &stru_1001BD738;
    }
    v20 = objc_retainBlock(v19);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v20;

    if (v14) {
      v22 = v14;
    }
    else {
      v22 = &stru_1001BD758;
    }
    v23 = objc_retainBlock(v22);
    id cancelBlock = v16->_cancelBlock;
    v16->_id cancelBlock = v23;
  }

  return v16;
}

+ (id)taskWithPhotoLibraries:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5 andCancelBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibraries:v10 andProgressHandler:v11 andCompletionHandler:v12 andCancelBlock:v13];

  return v14;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0) {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VCPPhotosMaintenanceProcessingTask;
  -[VCPPhotosMaintenanceProcessingTask dealloc](&v4, "dealloc");
}

- (float)resourceRequirement
{
  return 1.0;
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_cancel);
  return v4 & 1;
}

- (BOOL)_shouldPerformBackup:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vcp_mediaAnalysisDatabaseFilepath"));
  id v6 = [v4 fileExistsAtPath:v5];
  if ((v6 & 1) != 0)
  {
    v8 = MADLastAnalysisBackupTimestampKeyForTask(1LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v3));
      id v12 = [v11 valueForKey:v10];
      if (!v12)
      {
        uint64_t v40 = MediaAnalysisLogLevel(0LL, v13);
        if ((int)v40 < 6)
        {
          BOOL v31 = 1;
LABEL_66:

          goto LABEL_67;
        }

        uint64_t v42 = VCPLogInstance(v40, v41);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        os_log_type_t v43 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v14, v43))
        {
          LOWORD(v87) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  v43,  "  No last backup time; performing backup",
            (uint8_t *)&v87,
            2u);
        }

        BOOL v31 = 1;
LABEL_65:

        goto LABEL_66;
      }

      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)v12));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v16 = [v11 analysisRecordsModifiedSinceDate:v14];
      id v17 = [v11 valueForKey:@"HasDeletedAssetsSinceLastBackup"];
      id v18 = [v15 timeIntervalSinceDate:v14];
      if (v20 < 1209600.0)
      {
        id v21 = [v15 timeIntervalSinceDate:v14];
        if (v23 < 0.0)
        {
          uint64_t v24 = MediaAnalysisLogLevel(v21, v22);
          if ((int)v24 >= 4)
          {
            uint64_t v26 = VCPLogInstance(v24, v25);
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            os_log_type_t v28 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v27, v28))
            {
              int v87 = 138412290;
              *(void *)v88 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  v28,  "  Invalid backup date (%@); adjusting date and skipping backup",
                (uint8_t *)&v87,
                0xCu);
            }
          }

          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          [v29 timeIntervalSinceReferenceDate];
          [v11 setValue:(uint64_t)v30 forKey:v10];

          [v11 commit];
          goto LABEL_11;
        }

        id v50 = [v15 timeIntervalSinceDate:v14];
        if (v52 >= 604800.0)
        {
          if ((unint64_t)v16 >= 0xC8)
          {
            uint64_t v68 = MediaAnalysisLogLevel(v50, v51);
            if ((int)v68 >= 6)
            {
              uint64_t v70 = VCPLogInstance(v68, v69);
              v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
              os_log_type_t v71 = VCPLogToOSLogType[6];
              if (os_log_type_enabled(v47, v71))
              {
                int v87 = 67109378;
                *(_DWORD *)v88 = (_DWORD)v16;
                *(_WORD *)&v88[4] = 2112;
                *(void *)&v88[6] = v14;
                v49 = "  Significant changes (%d) since last backup (%@); performing early backup";
                v72 = v47;
                os_log_type_t v73 = v71;
                uint32_t v74 = 18;
LABEL_51:
                _os_log_impl((void *)&_mh_execute_header, v72, v73, v49, (uint8_t *)&v87, v74);
                goto LABEL_52;
              }

              goto LABEL_52;
            }

- (int)_createBackupAtFilepath:(id)a3 forPhotoLibrary:(id)a4
{
  id v137 = a3;
  id v134 = a4;
  v5 = objc_autoreleasePoolPush();
  NSFileAttributeKey v145 = NSFileProtectionKey;
  NSFileProtectionType v146 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v135 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v146,  &v145,  1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  context = v5;
  LOBYTE(v5) = [v6 createFileAtPath:v137 contents:0 attributes:v135];

  if ((v5 & 1) != 0)
  {
    v131 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSOutputStream outputStreamToFileAtPath:append:]( &OBJC_CLASS___NSOutputStream,  "outputStreamToFileAtPath:append:",  v137,  0LL));
    -[os_log_s open](v131, "open");
    v130 = (void *)objc_claimAutoreleasedReturnValue(+[VCPBackupFileHeader headerForTask:](&OBJC_CLASS___VCPBackupFileHeader, "headerForTask:", 1LL));
    id v9 = [v130 writeToStream:v131];
    int v11 = (int)v9;
    if ((_DWORD)v9)
    {
      uint64_t v12 = MediaAnalysisLogLevel(v9, v10);
      if ((int)v12 >= 3)
      {
        uint64_t v14 = VCPLogInstance(v12, v13);
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        os_log_type_t v16 = VCPLogToOSLogType[3];
        v136 = v15;
        if (os_log_type_enabled(v15, v16))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "  Failed to write backup file header", buf, 2u);
        }

        goto LABEL_99;
      }

      goto LABEL_100;
    }

    v136 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v134));
    v125 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v134,  1LL));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"creationDate",  1LL));
    v144 = v22;
    double v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v144, 1LL));
    [v125 setSortDescriptors:v23];

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithOptions:](&OBJC_CLASS___PHAsset, "fetchAssetsWithOptions:", v125));
    unint64_t v25 = 0LL;
    v121 = 0LL;
    uint64_t v128 = 0LL;
    int v11 = 0;
    os_log_type_t type = VCPLogToOSLogType[4];
    int v127 = MediaAnalysisChangedVersion7;
    os_log_type_t v123 = VCPLogToOSLogType[3];
    os_log_type_t v126 = VCPLogToOSLogType[7];
    while (1)
    {
      id v26 = [v24 count];
      if (v25 >= (unint64_t)v26)
      {
        uint64_t v102 = MediaAnalysisLogLevel(v26, v27);
        if ((int)v102 >= 5)
        {
          uint64_t v104 = VCPLogInstance(v102, v103);
          v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
          os_log_type_t v106 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v105, v106))
          {
            *(_DWORD *)buf = 134218240;
            v141 = v121;
            __int16 v142 = 2048;
            *(void *)v143 = v128;
            _os_log_impl( (void *)&_mh_execute_header,  v105,  v106,  "  Backed up %zu/%zu full analysis records",  buf,  0x16u);
          }
        }

        -[os_log_s close](v131, "close");
LABEL_98:

LABEL_99:
LABEL_100:

LABEL_101:
        goto LABEL_102;
      }

      os_log_type_t v28 = objc_autoreleasePoolPush();
      v29 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:v25]);
      int v11 = -128;
      int v30 = 6;
LABEL_88:

      objc_autoreleasePoolPop(v28);
      if (v30 && v30 != 13) {
        goto LABEL_98;
      }
      ++v25;
    }

    BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v31 pet];

LABEL_18:
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v29 localIdentifier]);
    id v139 = 0LL;
    unsigned int v33 = -[os_log_s analysisForAsset:analysis:](v136, "analysisForAsset:analysis:", v32, &v139);
    id v34 = v139;
    uint64_t v36 = v34;
    if (v33)
    {
      uint64_t v37 = MediaAnalysisLogLevel(v34, v35);
      if ((int)v37 >= 4)
      {
        uint64_t v39 = VCPLogInstance(v37, v38);
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        if (!os_log_type_enabled((os_log_t)v40, type))
        {
LABEL_24:
          int v30 = 13;
LABEL_86:

          goto LABEL_87;
        }

        *(_DWORD *)buf = 138412290;
        v141 = v32;
        uint64_t v41 = (os_log_s *)v40;
        os_log_type_t v42 = type;
        os_log_type_t v43 = "  [%@] Failed to query analysis";
        goto LABEL_22;
      }

      goto LABEL_33;
    }

    if (!v34)
    {
      uint64_t v51 = MediaAnalysisLogLevel(0LL, v35);
      if ((int)v51 >= 7)
      {
        uint64_t v53 = VCPLogInstance(v51, v52);
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v53);
        if (!os_log_type_enabled((os_log_t)v40, v126)) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 138412290;
        v141 = v32;
        uint64_t v41 = (os_log_s *)v40;
        os_log_type_t v42 = v126;
        os_log_type_t v43 = "  [%@] No analysis available; skipping";
LABEL_22:
        uint32_t v44 = 12;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v41, v42, v43, buf, v44);
        goto LABEL_24;
      }

- (int)_backupFullAnalysisForPhotoLibrary:(id)a3
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
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 photoLibraryURL]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 absoluteString]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "Checking full analysis backup for PHPhotoLibrary (%@) ... ",  (uint8_t *)&buf,  0xCu);
    }
  }

  if (-[VCPPhotosMaintenanceProcessingTask _shouldPerformBackup:](self, "_shouldPerformBackup:", v4))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vcp_mediaAnalysisBackupDirectory"));
    if ([v13 fileExistsAtPath:v14])
    {
      v15 = 0LL;
    }

    else
    {
      NSFileAttributeKey v127 = NSFilePosixPermissions;
      uint64_t v128 = &off_1001C8150;
      os_log_type_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v128,  &v127,  1LL));
      id v117 = 0LL;
      unsigned __int8 v17 = [v13 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:v16 error:&v117];
      id v18 = v117;

      if ((v17 & 1) == 0)
      {
        uint64_t v28 = MediaAnalysisLogLevel(v19, v20);
        if ((int)v28 < 3)
        {
LABEL_71:

          goto LABEL_72;
        }

        uint64_t v30 = VCPLogInstance(v28, v29);
        os_log_type_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        os_log_type_t v31 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v21, v31))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  v31,  "  Failed to create backup directory (%@); backup failed",
            (uint8_t *)&buf,
            0xCu);
        }

+ (void)updateProgressForPhotoLibrary:(id)a3 cancelBlock:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (uint64_t (**)(void))a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v5));
  if ([v5 isSystemPhotoLibrary])
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v8 = [&off_1001C9258 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (!v8) {
      goto LABEL_20;
    }
    uint64_t v9 = *(void *)v27;
    os_log_type_t type = VCPLogToOSLogType[5];
    while (1)
    {
      os_log_type_t v10 = 0LL;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(&off_1001C9258);
        }
        int v11 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_autoreleasePoolPush();
        if (!v6 || (uint64_t v13 = v6[2](v6), !(_DWORD)v13))
        {
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472LL;
          v23[2] = sub_1000FF094;
          v23[3] = &unk_1001BBED8;
          unsigned int v24 = v6;
          uint64_t v20 = objc_retainBlock(v23);
          +[MADProgressManager updateProgressForTask:photoLibrary:reuseCachedValue:cancelOrExtendTimeoutBlock:]( MADProgressManager,  "updateProgressForTask:photoLibrary:reuseCachedValue:cancelOrExtendTimeoutBlock:",  (int)[v11 intValue],  v5,  1,  v20);

          int v19 = 1;
          id v18 = v24;
LABEL_14:

          goto LABEL_15;
        }

        uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
        if ((int)v15 >= 5)
        {
          uint64_t v17 = VCPLogInstance(v15, v16);
          id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled((os_log_t)v18, type))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, type, "Progress update canceled", buf, 2u);
          }

          int v19 = 0;
          goto LABEL_14;
        }

        int v19 = 0;
LABEL_15:
        objc_autoreleasePoolPop(v12);
        if (!v19) {
          goto LABEL_20;
        }
        os_log_type_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v21 = [&off_1001C9258 countByEnumeratingWithState:&v26 objects:v30 count:16];
      id v8 = v21;
      if (!v21)
      {
LABEL_20:
        [v7 removeProgressEntriesBeyondLimits];
        [v7 commit];
        break;
      }
    }
  }
}

- (int)_collectAndReportAnalysisProgress
{
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  obj = self->_photoLibraries;
  int v3 = 0;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v96,  v104,  16LL);
  if (v4)
  {
    uint64_t v91 = *(void *)v97;
    os_log_type_t type = VCPLogToOSLogType[6];
    os_log_type_t v88 = VCPLogToOSLogType[4];
    os_log_type_t v85 = VCPLogToOSLogType[3];
    os_log_type_t v84 = VCPLogToOSLogType[5];
    os_log_type_t v81 = VCPLogToOSLogType[7];
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v97 != v91) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v96 + 1) + 8LL * (void)i);
        uint64_t v7 = objc_autoreleasePoolPush();
        BOOL v8 = -[VCPPhotosMaintenanceProcessingTask isCancelled](self, "isCancelled");
        if (v8)
        {
          int v10 = 1;
        }

        else
        {
          uint64_t v11 = MediaAnalysisLogLevel(v8, v9);
          if ((int)v11 >= 6)
          {
            uint64_t v13 = VCPLogInstance(v11, v12);
            uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
            if (os_log_type_enabled(v14, type))
            {
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 photoLibraryURL]);
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
              *(_DWORD *)__int128 buf = 138412290;
              *(void *)&uint8_t buf[4] = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  type,  "Reporting analysis progress for PHPhotoLibrary (%@) ... ",  buf,  0xCu);
            }
          }

          BOOL v17 = +[VCPDatabaseManager existsDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "existsDatabaseForPhotoLibrary:",  v6);
          if (v17)
          {
            int v19 = (void *)objc_opt_class(self);
            v95[0] = _NSConcreteStackBlock;
            v95[1] = 3221225472LL;
            v95[2] = sub_1000FFB24;
            v95[3] = &unk_1001B9E98;
            v95[4] = self;
            [v19 updateProgressForPhotoLibrary:v6 cancelBlock:v95];
            if ([v6 isSystemPhotoLibrary])
            {
              v94[0] = _NSConcreteStackBlock;
              v94[1] = 3221225472LL;
              v94[2] = sub_1000FFB7C;
              v94[3] = &unk_1001B9E98;
              v94[4] = self;
              uint64_t v20 = VCPCoreAnalyticsReportEventBackgroundDailyReport(v94, v6);
              int v3 = v20;
              if ((_DWORD)v20)
              {
                uint64_t v22 = MediaAnalysisLogLevel(v20, v21);
                if ((int)v22 >= 3)
                {
                  uint64_t v24 = VCPLogInstance(v22, v23);
                  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
                  if (os_log_type_enabled(v25, v85))
                  {
                    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v6 photoLibraryURL]);
                    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
                    *(_DWORD *)__int128 buf = 67109378;
                    *(_DWORD *)&uint8_t buf[4] = v3;
                    *(_WORD *)&buf[8] = 2112;
                    *(void *)&buf[10] = v27;
                    _os_log_impl( (void *)&_mh_execute_header,  v25,  v85,  "Error(%d) during daily reporting for lib %@",  buf,  0x12u);
                  }
                }
              }
            }

            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDataCollectionTask taskWithPhotoLibrary:]( &OBJC_CLASS___VCPDataCollectionTask,  "taskWithPhotoLibrary:",  v6));
            v93[0] = _NSConcreteStackBlock;
            v93[1] = 3221225472LL;
            v93[2] = sub_1000FFBD4;
            v93[3] = &unk_1001B9E98;
            v93[4] = self;
            [v28 setCancel:v93];
            [v28 start];
            id v29 = [v28 error];
            if ((_DWORD)v29 == -128)
            {
              uint64_t v31 = MediaAnalysisLogLevel(v29, v30);
              if ((int)v31 >= 6)
              {
                uint64_t v33 = VCPLogInstance(v31, v32);
                uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
                if (os_log_type_enabled(v34, type))
                {
                  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v6 photoLibraryURL]);
                  unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 path]);
                  *(_DWORD *)__int128 buf = 138412290;
                  *(void *)&uint8_t buf[4] = v36;
                  _os_log_impl((void *)&_mh_execute_header, v34, type, "Cancelled progress report for %@", buf, 0xCu);
                }
              }

              int v3 = -128;
              int v10 = 2;
            }

            else
            {
              id v41 = [v28 error];
              if ((_DWORD)v41)
              {
                uint64_t v43 = MediaAnalysisLogLevel(v41, v42);
                if ((int)v43 >= 5)
                {
                  uint64_t v45 = VCPLogInstance(v43, v44);
                  uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
                  if (os_log_type_enabled(v46, v84))
                  {
                    unsigned int v47 = [v28 error];
                    os_log_type_t v48 = (void *)objc_claimAutoreleasedReturnValue([v6 photoLibraryURL]);
                    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v48 path]);
                    *(_DWORD *)__int128 buf = 67109378;
                    *(_DWORD *)&uint8_t buf[4] = v47;
                    *(_WORD *)&buf[8] = 2112;
                    *(void *)&buf[10] = v49;
                    _os_log_impl( (void *)&_mh_execute_header,  v46,  v84,  "Error(%d) during progress report for %@",  buf,  0x12u);
                  }
                }

                int v3 = -18;
              }

              if (objc_msgSend(v6, "mad_useVUGallery")
                && (objc_msgSend(v6, "vcp_isSyndicationLibrary") & 1) == 0)
              {
                uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vcp_visionCacheStorageDirectoryURL"));
                uint64_t v100 = 0LL;
                v101 = &v100;
                uint64_t v102 = 0x2050000000LL;
                uint64_t v50 = (void *)qword_1001E6680;
                uint64_t v103 = qword_1001E6680;
                if (!qword_1001E6680)
                {
                  *(void *)__int128 buf = _NSConcreteStackBlock;
                  *(void *)&buf[8] = 3221225472LL;
                  *(void *)&uint8_t buf[16] = sub_100102508;
                  id v106 = &unk_1001B9F10;
                  id v107 = &v100;
                  sub_100102508((uint64_t)buf);
                  uint64_t v50 = (void *)v101[3];
                }

                uint64_t v51 = v50;
                _Block_object_dispose(&v100, 8);
                id v52 = objc_alloc(v51);
                uint64_t v100 = 0LL;
                v101 = &v100;
                uint64_t v102 = 0x2050000000LL;
                uint64_t v53 = (void *)qword_1001E6690;
                uint64_t v103 = qword_1001E6690;
                if (!qword_1001E6690)
                {
                  *(void *)__int128 buf = _NSConcreteStackBlock;
                  *(void *)&buf[8] = 3221225472LL;
                  *(void *)&uint8_t buf[16] = sub_100102608;
                  id v106 = &unk_1001B9F10;
                  id v107 = &v100;
                  sub_100102608((uint64_t)buf);
                  uint64_t v53 = (void *)v101[3];
                }

                id v54 = v53;
                _Block_object_dispose(&v100, 8);
                uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v54 photos]);
                id v92 = 0LL;
                id v87 = [v52 initWithClient:v55 version:1 url:v86 error:&v92];
                id v83 = v92;

                if (v87)
                {
                  uint64_t v58 = MediaAnalysisLogLevel(v56, v57);
                  if ((int)v58 >= 7)
                  {
                    uint64_t v60 = VCPLogInstance(v58, v59);
                    uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
                    if (os_log_type_enabled(v61, v81))
                    {
                      id v62 = (void *)objc_claimAutoreleasedReturnValue([v6 photoLibraryURL]);
                      *(_DWORD *)__int128 buf = 138412290;
                      *(void *)&uint8_t buf[4] = v62;
                      _os_log_impl( (void *)&_mh_execute_header,  v61,  v81,  "  Reporting VUGallery metrics for library %@",  buf,  0xCu);
                    }
                  }

                  uint64_t v82 = mach_absolute_time();
                  uint64_t v63 = VCPSignPostLog(v82);
                  uint64_t v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
                  os_signpost_id_t v65 = os_signpost_id_generate(v64);

                  uint64_t v67 = VCPSignPostLog(v66);
                  uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
                  uint64_t v69 = v68;
                  if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
                  {
                    *(_WORD *)__int128 buf = 0;
                    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v69,  OS_SIGNPOST_INTERVAL_BEGIN,  v65,  "MADReportVUGalleryMetric",  (const char *)&unk_100199097,  buf,  2u);
                  }

                  os_log_type_t v70 = (void *)objc_claimAutoreleasedReturnValue([v87 gallery]);
                  [v70 reportMetrics];

                  uint64_t v72 = VCPSignPostLog(v71);
                  unsigned __int8 v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
                  id v74 = v73;
                  if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
                  {
                    *(_WORD *)__int128 buf = 0;
                    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v74,  OS_SIGNPOST_INTERVAL_END,  v65,  "MADReportVUGalleryMetric",  (const char *)&unk_100199097,  buf,  2u);
                  }

                  if (v82)
                  {
                    uint64_t v75 = mach_absolute_time();
                    VCPPerformance_LogMeasurement("MADReportVUGalleryMetric", v75 - v82);
                  }
                }

                else
                {
                  uint64_t v76 = MediaAnalysisLogLevel(v56, v57);
                  if ((int)v76 >= 3)
                  {
                    uint64_t v78 = VCPLogInstance(v76, v77);
                    uint64_t v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
                    if (os_log_type_enabled(v79, v85))
                    {
                      *(_DWORD *)__int128 buf = 138412290;
                      *(void *)&uint8_t buf[4] = v83;
                      _os_log_impl( (void *)&_mh_execute_header,  v79,  v85,  "Failed to create MADGDVisualUnderstandingService instance - %@",  buf,  0xCu);
                    }
                  }
                }
              }

              MediaAnalysisDaemonReleaseSharedDataStores(v6);
              int v10 = 0;
            }
          }

          else
          {
            uint64_t v37 = MediaAnalysisLogLevel(v17, v18);
            if ((int)v37 >= 4)
            {
              uint64_t v39 = VCPLogInstance(v37, v38);
              double v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(v40, v88))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v40,  v88,  "MAD database does not exist, skip progress reporting and data collection",  buf,  2u);
              }
            }

            int v10 = 3;
          }
        }

        objc_autoreleasePoolPop(v7);
        if (v10 != 3 && v10)
        {

          if (v10 != 2) {
            return -128;
          }
          return v3;
        }
      }

      id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v96,  v104,  16LL);
      if (v4) {
        continue;
      }
      break;
    }
  }

  return v3;
}

- (id)_legacyBackupFilepathForTask:(unint64_t)a3 withPhotoLibrary:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "vcp_mediaAnalysisBackupDirectory"));
  uint64_t v7 = v5;
  if (!v5)
  {
LABEL_13:
    uint64_t v9 = 0LL;
    goto LABEL_14;
  }

  if (a3 == 1)
  {
    BOOL v8 = @"mediaanalysis.backup";
    goto LABEL_8;
  }

  if (a3 == 10)
  {
    BOOL v8 = @"ocranalysis.backup";
    goto LABEL_8;
  }

  if (a3 != 2)
  {
    uint64_t v10 = MediaAnalysisLogLevel(v5, v6);
    if ((int)v10 >= 3)
    {
      uint64_t v12 = VCPLogInstance(v10, v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      os_log_type_t v14 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v13, v14))
      {
        v16[0] = 67109120;
        v16[1] = a3;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "Unexpected taskID %d", (uint8_t *)v16, 8u);
      }
    }

    goto LABEL_13;
  }

  BOOL v8 = @"sceneanalysis.backup";
LABEL_8:
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v8]);
LABEL_14:

  return v9;
}

- (void)_removeLegacyBackupForTask:(unint64_t)a3 withPhotoLibrary:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[VCPPhotosMaintenanceProcessingTask _legacyBackupFilepathForTask:withPhotoLibrary:]( self,  "_legacyBackupFilepathForTask:withPhotoLibrary:",  a3,  a4));
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v7 = [v6 fileExistsAtPath:v5];
    if ((_DWORD)v7)
    {
      uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
      if ((int)v9 >= 5)
      {
        uint64_t v11 = VCPLogInstance(v9, v10);
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        os_log_type_t v13 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v14 = VCPTaskIDDescription(a3);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          *(_DWORD *)__int128 buf = 138412290;
          id v29 = v15;
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "Removing existing legacy backup for %@", buf, 0xCu);
        }
      }

      id v27 = 0LL;
      unsigned __int8 v16 = [v6 removeItemAtPath:v5 error:&v27];
      id v17 = v27;
      int v19 = v17;
      if ((v16 & 1) == 0)
      {
        uint64_t v20 = MediaAnalysisLogLevel(v17, v18);
        if ((int)v20 >= 4)
        {
          uint64_t v22 = VCPLogInstance(v20, v21);
          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          os_log_type_t v24 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v23, v24))
          {
            uint64_t v25 = VCPTaskIDDescription(a3);
            __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            *(_DWORD *)__int128 buf = 138412546;
            id v29 = v26;
            __int16 v30 = 2112;
            uint64_t v31 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "Failed to remove legacy backup for %@ (%@)",  buf,  0x16u);
          }
        }
      }
    }

    else
    {
      int v19 = 0LL;
    }
  }
}

- (id)_computeSyncPayloadForAsset:(id)a3 fromDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v5, "vcp_needsFullAnalysisProcessing:", 0);
  if (!(_DWORD)v7)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 localIdentifier]);
    id v60 = 0LL;
    unsigned int v16 = [v6 analysisForAsset:v15 analysis:&v60];
    id v12 = v60;

    if (v16)
    {
      uint64_t v19 = MediaAnalysisLogLevel(v17, v18);
      if ((int)v19 >= 3)
      {
        uint64_t v21 = VCPLogInstance(v19, v20);
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        os_log_type_t v23 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v22, v23))
        {
          os_log_type_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 localIdentifier]);
          *(_DWORD *)__int128 buf = 138412290;
          id v62 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "[ComputeSync|Backfill][%@] Failed to query full analysis results, unable to generate payload",  buf,  0xCu);
        }

        goto LABEL_35;
      }

- (void)_persistBackfillForAssets:(id)a3 photoLibrary:(id)a4 database:(id)a5
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
      *(_DWORD *)__int128 buf = 134217984;
      id v34 = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[ComputeSync|Backfill] Persisting %lu assets", buf, 0xCu);
    }
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100100754;
  v29[3] = &unk_1001BBE70;
  id v17 = v8;
  id v30 = v17;
  uint64_t v31 = self;
  id v18 = v10;
  id v32 = v18;
  id v28 = 0LL;
  [v9 performChangesAndWait:v29 error:&v28];
  id v19 = v28;
  uint64_t v21 = v19;
  if (v19)
  {
    uint64_t v22 = MediaAnalysisLogLevel(v19, v20);
    if ((int)v22 >= 3)
    {
      uint64_t v24 = VCPLogInstance(v22, v23);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      os_log_type_t v26 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v25, v26))
      {
        id v27 = [v17 count];
        *(_DWORD *)__int128 buf = 134218242;
        id v34 = v27;
        __int16 v35 = 2112;
        unsigned __int8 v36 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "[ComputeSync|Backfill] Failed to persist stages/payload for %lu results to Photos (%@)",  buf,  0x16u);
      }
    }
  }
}

- (int)_performComputeSyncBackfillForPhotoLibrary:(id)a3
{
  id v72 = a3;
  uint64_t v4 = _os_feature_enabled_impl("Photos", "CloudComputeStateSync");
  if ((v4 & 1) == 0)
  {
    uint64_t v17 = MediaAnalysisLogLevel(v4, v5);
    if ((int)v17 < 5)
    {
      int v16 = 0;
      goto LABEL_49;
    }

    uint64_t v19 = VCPLogInstance(v17, v18);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    os_log_type_t v20 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v20))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  v20,  "[ComputeSync|Backfill] Feature flag Photos/CloudComputeStateSync not enabled; skipping",
        buf,
        2u);
    }

- (void)_persistVideoEmbeddingBackfillForAssets:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v8 >= 6)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)id v27 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[VideoEmbedding|Backfill] Persisting %lu assets", buf, 0xCu);
    }
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100101384;
  v24[3] = &unk_1001BA0C8;
  id v13 = v5;
  id v25 = v13;
  id v23 = 0LL;
  [v6 performChangesAndWait:v24 error:&v23];
  id v14 = v23;
  int v16 = v14;
  if (v14)
  {
    uint64_t v17 = MediaAnalysisLogLevel(v14, v15);
    if ((int)v17 >= 3)
    {
      uint64_t v19 = VCPLogInstance(v17, v18);
      os_log_type_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      os_log_type_t v21 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v20, v21))
      {
        id v22 = [v13 count];
        *(_DWORD *)__int128 buf = 67109634;
        *(_DWORD *)id v27 = 70;
        *(_WORD *)&v27[4] = 2048;
        *(void *)&v27[6] = v22;
        __int16 v28 = 2112;
        os_signpost_id_t v29 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "[VideoEmbedding|Backfill] Failed to persist video embedding version (v%d) for %lu results to Photos (%@)",  buf,  0x1Cu);
      }
    }
  }
}

- (int)_performVideoEmbeddingVersionBackfillForPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled](&OBJC_CLASS___VCPVideoCNNAnalyzer, "isMUBackboneEnabled");
  if ((v5 & 1) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v4));
    id v8 = [v7 valueForKey:@"LastVideoEmbeddingVersionBackfillTimestamp"];
    uint64_t v10 = (uint64_t)v8;
    if (v8)
    {
      uint64_t v11 = MediaAnalysisLogLevel(v8, v9);
      if ((int)v11 >= 5)
      {
        id v60 = v7;
        uint64_t v13 = VCPLogInstance(v11, v12);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        os_log_type_t v15 = VCPLogToOSLogType[5];
        os_log_t log = v14;
        if (os_log_type_enabled(v14, v15))
        {
          int v16 = (char *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)v10));
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v63 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  log,  v15,  "[VideoEmbedding|Backfill] Last backfilled on %@; skipping",
            buf,
            0xCu);
        }

        int v17 = 0;
        goto LABEL_45;
      }

- (int)performForceClusterIfNeededWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  if (!-[VCPPhotosMaintenanceProcessingTask isCancelled](self, "isCancelled"))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[MADPhotosFullClusterProcessingTask taskWithPhotoLibrary:]( &OBJC_CLASS___MADPhotosFullClusterProcessingTask,  "taskWithPhotoLibrary:",  v4));
    [v6 setRequiresProgressQuery:1];
    [v6 setFullModeClusterOnly:1];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100101D4C;
    v22[3] = &unk_1001B9E98;
    v22[4] = self;
    id v7 = [v6 setCancelBlock:v22];
    if (v6)
    {
      id v9 = [v6 process];
      uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
      if ((int)v11 >= 5)
      {
        uint64_t v13 = VCPLogInstance(v11, v12);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        os_log_type_t v15 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v14, v15))
        {
          *(_WORD *)os_log_type_t v21 = 0;
          int v16 = "[FullCluster] Full-mode clustering with progress query completed";
LABEL_10:
          _os_log_impl((void *)&_mh_execute_header, v14, v15, v16, v21, 2u);
          goto LABEL_11;
        }

        goto LABEL_11;
      }
    }

    else
    {
      uint64_t v17 = MediaAnalysisLogLevel(v7, v8);
      if ((int)v17 >= 3)
      {
        uint64_t v19 = VCPLogInstance(v17, v18);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        os_log_type_t v15 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v14, v15))
        {
          *(_WORD *)os_log_type_t v21 = 0;
          int v16 = "[FullCluster] Failed to create MADPhotosFullClusterProcessingTask";
          goto LABEL_10;
        }

- (int)_pruneProcessingStatusForPhotoLibrary:(id)a3
{
  id v4 = a3;
  if (!-[VCPPhotosMaintenanceProcessingTask isCancelled](self, "isCancelled"))
  {
    BOOL v6 = +[VCPDatabaseManager existsDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "existsDatabaseForPhotoLibrary:",  v4);
    if (v6)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v4));
      id v9 = [v8 removeProcessingStatusForTaskID:1 mediaType:0 mediaSubtypes:0];
      id v5 = v9;
      if ((_DWORD)v9 == -108 || (_DWORD)v9 == -36 || (_DWORD)v9 == -23) {
        goto LABEL_21;
      }
      id v10 = [v8 commit];
      if ((_DWORD)v10 == -108 || (_DWORD)v10 == -36)
      {
        id v11 = v10;
      }

      else
      {
        id v11 = v10;
        if ((_DWORD)v10 != -23) {
          id v11 = v5;
        }
      }

      if ((_DWORD)v10 == -108 || (_DWORD)v10 == -36 || (_DWORD)v10 == -23)
      {
        LODWORD(v5) = (_DWORD)v11;
        goto LABEL_21;
      }

      uint64_t v17 = MediaAnalysisLogLevel(v10, v11);
      if ((int)v17 >= 5)
      {
        uint64_t v19 = VCPLogInstance(v17, v18);
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        os_log_type_t v21 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v20, v21))
        {
          *(_WORD *)id v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "[ProcessingStatusPruning] Completed pruning", v22, 2u);
        }
      }
    }

    else
    {
      uint64_t v12 = MediaAnalysisLogLevel(v6, v7);
      if ((int)v12 < 4)
      {
        LODWORD(v5) = 0;
        goto LABEL_22;
      }

      uint64_t v14 = VCPLogInstance(v12, v13);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v14);
      os_log_type_t v15 = VCPLogToOSLogType[4];
      if (os_log_type_enabled((os_log_t)v8, v15))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  v15,  "[ProcessingStatusPruning] MAD database does not exist; skipping",
          buf,
          2u);
      }
    }

    LODWORD(v5) = 0;
LABEL_21:

    goto LABEL_22;
  }

  LODWORD(v5) = -128;
LABEL_22:

  return (int)v5;
}

- (int)run
{
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  obj = self->_photoLibraries;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v59,  v66,  16LL);
  if (v3)
  {
    uint64_t v4 = *(void *)v60;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v60 != v4) {
          objc_enumerationMutation(obj);
        }
        BOOL v6 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
        uint64_t v7 = objc_autoreleasePoolPush();
        int v8 = -[VCPPhotosMaintenanceProcessingTask _pruneProcessingStatusForPhotoLibrary:]( self,  "_pruneProcessingStatusForPhotoLibrary:",  v6);
        if (!v8) {
          MediaAnalysisDaemonReleaseSharedDataStores(v6);
        }
        objc_autoreleasePoolPop(v7);
        if (v8)
        {

          goto LABEL_45;
        }
      }

      id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v59,  v66,  16LL);
    }

    while (v3);
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  obja = self->_photoLibraries;
  int v8 = 0;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v55,  v65,  16LL);
  if (!v9) {
    goto LABEL_34;
  }
  uint64_t v10 = *(void *)v56;
  os_log_type_t type = VCPLogToOSLogType[5];
  os_log_type_t v51 = VCPLogToOSLogType[4];
  while (2)
  {
    id v11 = 0LL;
    do
    {
      if (*(void *)v56 != v10) {
        objc_enumerationMutation(obja);
      }
      uint64_t v12 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)v11);
      uint64_t v13 = objc_autoreleasePoolPush();
      unsigned __int8 v14 = -[VCPPhotosMaintenanceProcessingTask isCancelled](self, "isCancelled");
      if ((v14 & 1) != 0)
      {
        int v8 = -128;
        int v15 = 6;
        goto LABEL_27;
      }

      id v16 = [v12 isCloudPhotoLibraryEnabled];
      if (_DWORD)v16 && (id v16 = [v12 isSystemPhotoLibrary], (v16))
      {
        BOOL v18 = +[VCPDatabaseManager existsDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "existsDatabaseForPhotoLibrary:",  v12);
        if (v18)
        {
          -[VCPPhotosMaintenanceProcessingTask _performComputeSyncBackfillForPhotoLibrary:]( self,  "_performComputeSyncBackfillForPhotoLibrary:",  v12);
          MediaAnalysisDaemonReleaseSharedDataStores(v12);
          int v15 = 0;
          goto LABEL_27;
        }

        uint64_t v26 = MediaAnalysisLogLevel(v18, v19);
        if ((int)v26 >= 4)
        {
          uint64_t v28 = VCPLogInstance(v26, v27);
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v23, v51))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  v51,  "MAD database does not exist; skipping backfill",
              buf,
              2u);
          }

- (BOOL)autoCancellable
{
  return 0;
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end