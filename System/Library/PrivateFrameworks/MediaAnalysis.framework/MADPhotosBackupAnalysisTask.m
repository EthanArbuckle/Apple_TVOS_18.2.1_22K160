@interface MADPhotosBackupAnalysisTask
+ (id)taskName;
+ (id)taskWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 encryptionManager:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7 andCancelBlock:(id)a8;
- (BOOL)_shouldPerformBackup;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (MADPhotosBackupAnalysisTask)initWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 encryptionManager:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7 andCancelBlock:(id)a8;
- (float)resourceRequirement;
- (id)_analysisSpecificFetchPropertySets;
- (id)cancelBlock;
- (int)_performBackup;
- (int)_performBackupAtFilepath:(id)a3;
- (int)run;
- (void)cancel;
- (void)setCancelBlock:(id)a3;
@end

@implementation MADPhotosBackupAnalysisTask

- (MADPhotosBackupAnalysisTask)initWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 encryptionManager:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7 andCancelBlock:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  v17 = (Block_layout *)a6;
  v18 = (Block_layout *)a7;
  v19 = (Block_layout *)a8;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___MADPhotosBackupAnalysisTask;
  v20 = -[MADPhotosBackupAnalysisTask init](&v32, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_photoLibrary, a3);
    v21->_taskID = a4;
    objc_storeStrong((id *)&v21->_encryptionManager, a5);
    if (v17) {
      v22 = v17;
    }
    else {
      v22 = &stru_1001BC8F8;
    }
    v23 = objc_retainBlock(v22);
    id progressHandler = v21->_progressHandler;
    v21->_id progressHandler = v23;

    if (v18) {
      v25 = v18;
    }
    else {
      v25 = &stru_1001BC918;
    }
    v26 = objc_retainBlock(v25);
    id completionHandler = v21->_completionHandler;
    v21->_id completionHandler = v26;

    if (v19) {
      v28 = v19;
    }
    else {
      v28 = &stru_1001BC938;
    }
    v29 = objc_retainBlock(v28);
    id cancelBlock = v21->_cancelBlock;
    v21->_id cancelBlock = v29;
  }

  return v21;
}

+ (id)taskWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 encryptionManager:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7 andCancelBlock:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [objc_alloc((Class)a1) initWithPhotoLibrary:v14 forTaskID:a4 encryptionManager:v15 progressHandler:v16 completionHandler:v17 andCancelBlock:v18];

  return v19;
}

+ (id)taskName
{
  return @"MADPhotosBackupAnalysisTask";
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_cancel);
  return v4 & 1;
}

- (id)_analysisSpecificFetchPropertySets
{
  if (self->_taskID == 2)
  {
    v4[0] = PHAssetPropertySetAesthetic;
    v4[1] = PHAssetPropertySetCuration;
    v4[2] = PHAssetPropertySetMediaAnalysis;
    v4[3] = PHAssetPropertySetSceneprint;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 4LL));
  }

  else
  {
    v2 = 0LL;
  }

  return v2;
}

- (int)_performBackupAtFilepath:(id)a3
{
  id v110 = a3;
  unsigned __int8 v4 = objc_autoreleasePoolPush();
  NSFileAttributeKey v116 = NSFileProtectionKey;
  NSFileProtectionType v117 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v117,  &v116,  1LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  context = v4;
  LOBYTE(v4) = [v5 createFileAtPath:v110 contents:0 attributes:v106];

  if ((v4 & 1) != 0)
  {
    v104 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSOutputStream outputStreamToFileAtPath:append:]( &OBJC_CLASS___NSOutputStream,  "outputStreamToFileAtPath:append:",  v110,  0LL));
    -[os_log_s open](v104, "open");
    v101 = (void *)objc_claimAutoreleasedReturnValue( +[VCPBackupFileHeader headerForTask:]( &OBJC_CLASS___VCPBackupFileHeader,  "headerForTask:",  self->_taskID));
    id v8 = [v101 writeToStream:v104];
    int v107 = (int)v8;
    if ((_DWORD)v8)
    {
      uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
      if ((int)v10 >= 3)
      {
        uint64_t v12 = VCPLogInstance(v10, v11);
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        os_log_type_t v14 = VCPLogToOSLogType[3];
        v98 = v13;
        if (os_log_type_enabled(v13, v14))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "  Failed to write backup file header", buf, 2u);
        }

        goto LABEL_73;
      }

      goto LABEL_74;
    }

    v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[VCPDataCompressor compressor](&OBJC_CLASS___VCPDataCompressor, "compressor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  self->_photoLibrary,  self->_taskID));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"creationDate",  1LL));
    v115 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v115, 1LL));
    [v100 setSortDescriptors:v21];

    v22 = (void *)objc_claimAutoreleasedReturnValue( -[MADPhotosBackupAnalysisTask _analysisSpecificFetchPropertySets]( self,  "_analysisSpecificFetchPropertySets"));
    [v100 addFetchPropertySets:v22];

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithOptions:](&OBJC_CLASS___PHAsset, "fetchAssetsWithOptions:", v100));
    unint64_t v24 = 0LL;
    *(_DWORD *)&v97[8] = 0;
    uint64_t v105 = 0LL;
    int v107 = 0;
    os_log_type_t type = VCPLogToOSLogType[7];
    *(void *)v97 = VCPLogToOSLogType[3];
    os_log_type_t v99 = VCPLogToOSLogType[4];
    while (1)
    {
      id v25 = [v23 count];
      if (v24 >= (unint64_t)v25)
      {
        uint64_t v82 = MediaAnalysisLogLevel(v25, v26);
        if ((int)v82 >= 6)
        {
          uint64_t v84 = VCPLogInstance(v82, v83);
          v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
          os_log_type_t v86 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v85, v86))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v112 = *(void *)&v97[4];
            __int16 v113 = 2048;
            uint64_t v114 = v105;
            _os_log_impl((void *)&_mh_execute_header, v85, v86, "  Backed up %zu/%zu analysis records", buf, 0x16u);
          }
        }

        -[os_log_s close](v104, "close");
LABEL_72:

LABEL_73:
LABEL_74:

LABEL_75:
        goto LABEL_76;
      }

      v27 = objc_autoreleasePoolPush();
      v28 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:v24]);
      if ((((int)v24 + 1) & 0x7FLL) == 0)
      {
        if (-[MADPhotosBackupAnalysisTask isCancelled](self, "isCancelled"))
        {
          int v107 = -128;
          int v29 = 6;
          goto LABEL_62;
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
        [v30 pet];
      }

      id v31 = objc_msgSend(v28, "vcp_needsProcessingForTask:", self->_taskID);
      if (!(_DWORD)v31)
      {
        uint64_t v38 = MediaAnalysisLogLevel(v31, v32);
        if ((int)v38 >= 7)
        {
          uint64_t v40 = VCPLogInstance(v38, v39);
          v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, type))
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue([v28 localIdentifier]);
            *(_DWORD *)buf = 138412290;
            uint64_t v112 = (uint64_t)v42;
            _os_log_impl((void *)&_mh_execute_header, v41, type, "  [%@] Performing backup", buf, 0xCu);
          }
        }

        id v43 = [MADAssetProtoClassForTask(self->_taskID) protoFromPhotosAsset:v28];
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        v36 = v44;
        ++v105;
        if (v44)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s data](v44, "data"));
          if (v47)
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[VCPBackupEntryHeader header](&OBJC_CLASS___VCPBackupEntryHeader, "header"));
            id v49 = [v47 length];
            if ((unint64_t)v49 > 0x200000)
            {
              uint64_t v51 = MediaAnalysisLogLevel(v49, v50);
              if ((int)v51 >= 4)
              {
                uint64_t v53 = VCPLogInstance(v51, v52);
                v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
                if (os_log_type_enabled(v54, v99))
                {
                  v55 = (void *)objc_claimAutoreleasedReturnValue([v28 localIdentifier]);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v112 = (uint64_t)v55;
                  _os_log_impl( (void *)&_mh_execute_header,  v54,  v99,  "  [%@] Serialized analysis exceeds per-entry limit; skipping",
                    buf,
                    0xCu);
                }
              }

              goto LABEL_41;
            }

            objc_msgSend(v48, "setDataLength:", objc_msgSend(v47, "length"));
            id v64 = [v48 writeToStream:v104];
            int v66 = (int)v64;
            if ((_DWORD)v64)
            {
              uint64_t v67 = MediaAnalysisLogLevel(v64, v65);
              if ((int)v67 >= 3)
              {
                uint64_t v69 = VCPLogInstance(v67, v68);
                v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
                if (os_log_type_enabled(v70, (os_log_type_t)v97[0]))
                {
                  uint64_t v71 = objc_claimAutoreleasedReturnValue([v28 localIdentifier]);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v112 = v71;
                  v108 = (void *)v71;
                  _os_log_impl( (void *)&_mh_execute_header,  v70,  (os_log_type_t)v97[0],  "  [%@] Failed to write backup entry header",  buf,  0xCu);
                }
              }

              int v29 = 6;
              int v107 = v66;
            }

            else
            {
              id v72 = v47;
              id v73 = -[os_log_s vcp_writeBuffer:ofLength:]( v104,  "vcp_writeBuffer:ofLength:",  [v72 bytes],  objc_msgSend(v72, "length"));
              int v75 = (int)v73;
              if ((_DWORD)v73)
              {
                uint64_t v76 = MediaAnalysisLogLevel(v73, v74);
                if ((int)v76 >= 3)
                {
                  uint64_t v78 = VCPLogInstance(v76, v77);
                  v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
                  if (os_log_type_enabled(v79, (os_log_type_t)v97[0]))
                  {
                    uint64_t v80 = objc_claimAutoreleasedReturnValue([v28 localIdentifier]);
                    *(_DWORD *)buf = 138412290;
                    uint64_t v112 = v80;
                    v109 = (void *)v80;
                    _os_log_impl( (void *)&_mh_execute_header,  v79,  (os_log_type_t)v97[0],  "  [%@] Failed to write backup entry data",  buf,  0xCu);
                  }
                }

                int v29 = 6;
                int v107 = v75;
              }

              else
              {
                int v29 = 0;
              }

              uint64_t v81 = *(void *)&v97[4];
              if (!v75) {
                uint64_t v81 = *(void *)&v97[4] + 1LL;
              }
              *(void *)&v97[4] = v81;
            }

- (BOOL)_shouldPerformBackup
{
  v3 = MADLastAnalysisBackupTimestampKeyForTask(self->_taskID);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  self->_photoLibrary));
    id v7 = [v6 valueForKey:v5];
    if (!v7)
    {
      uint64_t v25 = MediaAnalysisLogLevel(0LL, v8);
      if ((int)v25 < 6)
      {
        BOOL v14 = 1;
LABEL_30:

        goto LABEL_31;
      }

      uint64_t v27 = VCPLogInstance(v25, v26);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      os_log_type_t v28 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v9, v28))
      {
        LOWORD(v43) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  v28,  "  No last backup time; performing backup",
          (uint8_t *)&v43,
          2u);
      }

      BOOL v14 = 1;
LABEL_29:

      goto LABEL_30;
    }

    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)v7));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v11 = [v10 timeIntervalSinceDate:v9];
    BOOL v14 = v13 >= 1209600.0;
    if (v13 < 1209600.0)
    {
      id v29 = [v10 timeIntervalSinceDate:v9];
      if (v31 < 0.0)
      {
        uint64_t v32 = MediaAnalysisLogLevel(v29, v30);
        if ((int)v32 >= 4)
        {
          uint64_t v34 = VCPLogInstance(v32, v33);
          uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          os_log_type_t v36 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v35, v36))
          {
            int v43 = 138412290;
            v44 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  v36,  "  Invalid backup date (%@); adjusting date and skipping backup",
              (uint8_t *)&v43,
              0xCu);
          }
        }

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        [v37 timeIntervalSinceReferenceDate];
        [v6 setValue:(uint64_t)v38 forKey:v5];

        [v6 commit];
        goto LABEL_28;
      }

      uint64_t v39 = MediaAnalysisLogLevel(v29, v30);
      if ((int)v39 >= 6)
      {
        uint64_t v41 = VCPLogInstance(v39, v40);
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        os_log_type_t v19 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v18, v19))
        {
          int v43 = 138412290;
          v44 = v9;
          v20 = "  Analysis backup up-to-date (%@)";
          goto LABEL_26;
        }

- (int)_performBackup
{
  if (-[MADPhotosBackupAnalysisTask _shouldPerformBackup](self, "_shouldPerformBackup"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[PHPhotoLibrary vcp_mediaAnalysisBackupDirectory]( self->_photoLibrary,  "vcp_mediaAnalysisBackupDirectory"));
    if ([v3 fileExistsAtPath:v4])
    {
      v5 = 0LL;
    }

    else
    {
      NSFileAttributeKey v121 = NSFilePosixPermissions;
      v122 = &off_1001C7DC0;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v122,  &v121,  1LL));
      id v111 = 0LL;
      unsigned __int8 v7 = [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v6 error:&v111];
      id v8 = v111;

      if ((v7 & 1) == 0)
      {
        uint64_t v18 = MediaAnalysisLogLevel(v9, v10);
        if ((int)v18 < 3)
        {
LABEL_69:

          return 0;
        }

        uint64_t v20 = VCPLogInstance(v18, v19);
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        os_log_type_t v21 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v11, v21))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  v21,  "  Failed to create backup directory (%@); backup failed",
            (uint8_t *)&buf,
            0xCu);
        }

- (int)run
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 5)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = [(id)objc_opt_class(self) taskName];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = VCPTaskIDDescription(self->_taskID);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v13 = 138412546;
      BOOL v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Attempting backup for %@", (uint8_t *)&v13, 0x16u);
    }
  }

  int result = -[PHPhotoLibrary mad_isBackupRestoreEligibleForTask:]( self->_photoLibrary,  "mad_isBackupRestoreEligibleForTask:",  self->_taskID);
  if (result) {
    return -[MADPhotosBackupAnalysisTask _performBackup](self, "_performBackup");
  }
  return result;
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