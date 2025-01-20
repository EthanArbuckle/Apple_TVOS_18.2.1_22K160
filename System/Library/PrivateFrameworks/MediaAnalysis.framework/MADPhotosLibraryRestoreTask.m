@interface MADPhotosLibraryRestoreTask
+ (id)allowedRestoreTasks;
+ (id)taskName;
+ (id)taskWithPhotoLibrary:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 cancelBlock:(id)a6;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (MADPhotosLibraryRestoreTask)initWithPhotoLibrary:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 cancelBlock:(id)a6;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)performRestoreForTask:(unint64_t)a3;
- (int)run;
- (void)cancel;
- (void)setCancelBlock:(id)a3;
@end

@implementation MADPhotosLibraryRestoreTask

- (MADPhotosLibraryRestoreTask)initWithPhotoLibrary:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 cancelBlock:(id)a6
{
  id v11 = a3;
  v12 = (Block_layout *)a4;
  v13 = (Block_layout *)a5;
  v14 = (Block_layout *)a6;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MADPhotosLibraryRestoreTask;
  v15 = -[MADPhotosLibraryRestoreTask init](&v27, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_photoLibrary, a3);
    if (v12) {
      v17 = v12;
    }
    else {
      v17 = &stru_1001BB450;
    }
    v18 = objc_retainBlock(v17);
    id progressHandler = v16->_progressHandler;
    v16->_id progressHandler = v18;

    if (v13) {
      v20 = v13;
    }
    else {
      v20 = &stru_1001BB470;
    }
    v21 = objc_retainBlock(v20);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v21;

    if (v14) {
      v23 = v14;
    }
    else {
      v23 = &stru_1001BB490;
    }
    v24 = objc_retainBlock(v23);
    id cancelBlock = v16->_cancelBlock;
    v16->_id cancelBlock = v24;
  }

  return v16;
}

+ (id)taskWithPhotoLibrary:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 cancelBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)a1) initWithPhotoLibrary:v10 progressHandler:v11 completionHandler:v12 cancelBlock:v13];

  return v14;
}

+ (id)taskName
{
  return @"MADPhotosLibraryRestoreTask";
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

+ (id)allowedRestoreTasks
{
  return &off_1001C9000;
}

- (int)performRestoreForTask:(unint64_t)a3
{
  uint64_t v5 = VCPTaskIDDescription(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary mad_restoreStatusFilepath](self->_photoLibrary, "mad_restoreStatusFilepath"));
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v9, 0LL));
    id v11 = MADLastAnalysisRestoreTimestampKeyForTask(a3);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v13)
    {
      id v14 = MADAnalysisRestoreAttemptsKeyForTask(a3);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (v16)
      {
        if ([v7 fileExistsAtPath:v9])
        {
          id v107 = 0LL;
          v103 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v10,  &v107));
          id v17 = v107;
          if (v17)
          {
            v19 = v17;
            uint64_t v20 = MediaAnalysisLogLevel(v17, v18);
            if ((int)v20 >= 3)
            {
              uint64_t v22 = VCPLogInstance(v20, v21);
              v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
              os_log_type_t v24 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v23, v24))
              {
                *(_DWORD *)buf = 138412546;
                v109 = v6;
                __int16 v110 = 2112;
                v111 = v19;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "[Restore][%@] Failed to read restore status file (%@); skipping restore",
                  buf,
                  0x16u);
              }
            }

- (int)run
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 5)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = [(id)objc_opt_class(self) taskName];
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary photoLibraryURL](self->_photoLibrary, "photoLibraryURL"));
      *(_DWORD *)buf = 138412546;
      id v40 = v9;
      __int16 v41 = 2112;
      uint64_t v42 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Attempting restore for library %@", buf, 0x16u);
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary mad_restoreDirectory](self->_photoLibrary, "mad_restoreDirectory"));
  if (([v11 fileExistsAtPath:v12] & 1) == 0)
  {
    NSFileAttributeKey v37 = NSFilePosixPermissions;
    os_log_type_t v38 = &off_1001C7B80;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
    id v35 = 0LL;
    unsigned __int8 v14 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:v13 error:&v35];
    id v15 = v35;

    if ((v14 & 1) == 0)
    {
      uint64_t v25 = MediaAnalysisLogLevel(v16, v17);
      if ((int)v25 >= 3)
      {
        uint64_t v27 = VCPLogInstance(v25, v26);
        os_log_type_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        os_log_type_t v29 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v28, v29))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  v29,  "Failed to create restore directory (%@); restore failed",
            buf,
            0xCu);
        }
      }

      goto LABEL_22;
    }
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v18 = objc_msgSend((id)objc_opt_class(self), "allowedRestoreTasks", 0);
  id v15 = (id)objc_claimAutoreleasedReturnValue(v18);
  id v19 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v32;
    while (2)
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v15);
        }
        uint64_t v22 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        v23 = objc_autoreleasePoolPush();
        LODWORD(v22) = -[MADPhotosLibraryRestoreTask performRestoreForTask:]( self,  "performRestoreForTask:",  [v22 unsignedIntegerValue]);
        objc_autoreleasePoolPop(v23);
        if ((_DWORD)v22 == -128)
        {
          int v24 = -128;
          goto LABEL_23;
        }
      }

      id v19 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v19) {
        continue;
      }
      break;
    }
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