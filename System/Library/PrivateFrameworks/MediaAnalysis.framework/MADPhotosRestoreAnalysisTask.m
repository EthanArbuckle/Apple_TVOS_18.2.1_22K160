@interface MADPhotosRestoreAnalysisTask
+ (id)taskName;
+ (id)taskWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 progressHandler:(id)a5 completionHandler:(id)a6 andCancelBlock:(id)a7;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (MADPhotosRestoreAnalysisTask)initWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 progressHandler:(id)a5 completionHandler:(id)a6 andCancelBlock:(id)a7;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)_performRestore;
- (int)_persistAssetProtoBatch:(id)a3 successCount:(unint64_t *)a4;
- (int)_restoreFromBackupFilepath:(id)a3;
- (int)run;
- (void)cancel;
- (void)setCancelBlock:(id)a3;
@end

@implementation MADPhotosRestoreAnalysisTask

- (MADPhotosRestoreAnalysisTask)initWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 progressHandler:(id)a5 completionHandler:(id)a6 andCancelBlock:(id)a7
{
  id v13 = a3;
  v14 = (Block_layout *)a5;
  v15 = (Block_layout *)a6;
  v16 = (Block_layout *)a7;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MADPhotosRestoreAnalysisTask;
  v17 = -[MADPhotosRestoreAnalysisTask init](&v29, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_photoLibrary, a3);
    v18->_taskID = a4;
    if (v14) {
      v19 = v14;
    }
    else {
      v19 = &stru_1001BD568;
    }
    v20 = objc_retainBlock(v19);
    id progressHandler = v18->_progressHandler;
    v18->_id progressHandler = v20;

    if (v15) {
      v22 = v15;
    }
    else {
      v22 = &stru_1001BD588;
    }
    v23 = objc_retainBlock(v22);
    id completionHandler = v18->_completionHandler;
    v18->_id completionHandler = v23;

    if (v16) {
      v25 = v16;
    }
    else {
      v25 = &stru_1001BD5A8;
    }
    v26 = objc_retainBlock(v25);
    id cancelBlock = v18->_cancelBlock;
    v18->_id cancelBlock = v26;
  }

  return v18;
}

+ (id)taskWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 progressHandler:(id)a5 completionHandler:(id)a6 andCancelBlock:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [objc_alloc((Class)a1) initWithPhotoLibrary:v12 forTaskID:a4 progressHandler:v13 completionHandler:v14 andCancelBlock:v15];

  return v16;
}

+ (id)taskName
{
  return @"MADPhotosRestoreAnalysisTask";
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

- (int)_persistAssetProtoBatch:(id)a3 successCount:(unint64_t *)a4
{
  id v6 = a3;
  v42 = a4;
  *a4 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unint64_t v8 = 0LL;
  os_log_type_t v9 = VCPLogToOSLogType[4];
  while (v8 < (unint64_t)[v6 count])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetCloudIdentifier]);

    id v13 = -[PHCloudIdentifier initWithStringValue:]( objc_alloc(&OBJC_CLASS___PHCloudIdentifier),  "initWithStringValue:",  v11);
    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v8]);
      [v7 setObject:v14 forKeyedSubscript:v13];
LABEL_5:

      goto LABEL_6;
    }

    uint64_t v15 = MediaAnalysisLogLevel(0LL, v12);
    if ((int)v15 >= 4)
    {
      uint64_t v17 = VCPLogInstance(v15, v16);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled((os_log_t)v14, v9))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  v9,  "  No cloud identifier (%@ stored in proto); skipping entry",
          (uint8_t *)&buf,
          0xCu);
      }

      goto LABEL_5;
    }

- (int)_restoreFromBackupFilepath:(id)a3
{
  id v4 = a3;
  context = objc_autoreleasePoolPush();
  v82 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSInputStream inputStreamWithFileAtPath:]( &OBJC_CLASS___NSInputStream,  "inputStreamWithFileAtPath:",  v4));
  [v5 open];
  v80 = self;
  v83 = (void *)objc_claimAutoreleasedReturnValue( +[VCPBackupFileHeader headerForTask:]( &OBJC_CLASS___VCPBackupFileHeader,  "headerForTask:",  self->_taskID));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[VCPBackupFileHeader headerFromStream:](&OBJC_CLASS___VCPBackupFileHeader, "headerFromStream:", v5));
  unint64_t v8 = v6;
  if (v6)
  {
    unsigned int v9 = [v6 identifier];
    id v10 = [v83 identifier];
    if (v9 == (_DWORD)v10)
    {
      unsigned int v12 = [v8 version];
      id v13 = [v83 version];
      if (v12 == (_DWORD)v13)
      {
        v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[VCPDataDecompressor decompressor](&OBJC_CLASS___VCPDataDecompressor, "decompressor"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        *(_DWORD *)&v75[8] = 0;
        uint64_t v79 = 0LL;
        uint64_t v15 = 0LL;
        os_log_type_t type = VCPLogToOSLogType[3];
        *(void *)v75 = VCPLogToOSLogType[4];
        while (1)
        {
          if (![v5 hasBytesAvailable])
          {
LABEL_73:
            if ([v77 count])
            {
              unsigned int v66 = -[MADPhotosRestoreAnalysisTask _persistAssetProtoBatch:successCount:]( v80,  "_persistAssetProtoBatch:successCount:",  v77,  buf);
              if (v66)
              {
                LODWORD(v15) = v66;
                goto LABEL_81;
              }

              *(void *)&v75[4] += *(void *)buf;
            }

            id v67 = [v5 close];
            uint64_t v69 = MediaAnalysisLogLevel(v67, v68);
            if ((int)v69 >= 6)
            {
              uint64_t v71 = VCPLogInstance(v69, v70);
              v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
              os_log_type_t v73 = VCPLogToOSLogType[6];
              if (os_log_type_enabled(v72, v73))
              {
                *(_DWORD *)__int128 buf = 134218240;
                *(void *)&buf[4] = *(void *)&v75[4];
                __int16 v85 = 2048;
                uint64_t v86 = v79;
                _os_log_impl((void *)&_mh_execute_header, v72, v73, "  Restored %zu/%zu analysis records", buf, 0x16u);
              }
            }

- (int)_performRestore
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PHPhotoLibrary vcp_mediaAnalysisIntermediateRestoreDirectory]( self->_photoLibrary,  "vcp_mediaAnalysisIntermediateRestoreDirectory"));
  if (v4)
  {
    if ([v3 fileExistsAtPath:v4])
    {
      id v5 = 0LL;
    }

    else
    {
      NSFileAttributeKey v75 = NSFilePosixPermissions;
      v76 = &off_1001C8048;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v76,  &v75,  1LL));
      id v72 = 0LL;
      unsigned __int8 v7 = [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v6 error:&v72];
      id v8 = v72;

      if ((v7 & 1) == 0)
      {
        uint64_t v26 = MediaAnalysisLogLevel(v9, v10);
        if ((int)v26 < 3)
        {
LABEL_46:

          goto LABEL_47;
        }

        uint64_t v28 = VCPLogInstance(v26, v27);
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        os_log_type_t v30 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v29, v30))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v74 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "  Failed to create intermediate restore directory (%@); restore failed",
            buf,
            0xCu);
        }

- (int)run
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 5)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = [(id)objc_opt_class(self) taskName];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = VCPTaskIDDescription(self->_taskID);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v23 = 138412546;
      uint64_t v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Attempting restore for %@", (uint8_t *)&v23, 0x16u);
    }
  }

  BOOL v12 = -[PHPhotoLibrary mad_isBackupRestoreEligibleForTask:]( self->_photoLibrary,  "mad_isBackupRestoreEligibleForTask:",  self->_taskID);
  if (v12) {
    return -[MADPhotosRestoreAnalysisTask _performRestore](self, "_performRestore");
  }
  uint64_t v15 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v15 >= 5)
  {
    uint64_t v17 = VCPLogInstance(v15, v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    os_log_type_t v19 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v18, v19))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary photoLibraryURL](self->_photoLibrary, "photoLibraryURL"));
      id v21 = [(id)objc_opt_class(self) taskName];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      int v23 = 138412546;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      uint64_t v26 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "  Photo library (%@) not eligible for restoring %@; skipping",
        (uint8_t *)&v23,
        0x16u);
    }
  }

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