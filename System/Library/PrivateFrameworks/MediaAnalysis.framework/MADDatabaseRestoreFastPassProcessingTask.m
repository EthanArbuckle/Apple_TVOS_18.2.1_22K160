@interface MADDatabaseRestoreFastPassProcessingTask
+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (BOOL)run:(id *)a3;
- (MADDatabaseRestoreFastPassProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
@end

@implementation MADDatabaseRestoreFastPassProcessingTask

- (MADDatabaseRestoreFastPassProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  v9 = (Block_layout *)a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006741C;
  v17[3] = &unk_1001BADE0;
  id v10 = a5;
  id v18 = v10;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MADDatabaseRestoreFastPassProcessingTask;
  v11 = -[MADDatabaseRestoreFastPassProcessingTask initWithCompletionHandler:](&v16, "initWithCompletionHandler:", v17);
  if (v11)
  {
    if (v9) {
      v12 = v9;
    }
    else {
      v12 = &stru_1001BBE48;
    }
    v13 = objc_retainBlock(v12);
    id progressHandler = v11->_progressHandler;
    v11->_id progressHandler = v13;

    -[MADDatabaseRestoreFastPassProcessingTask setCancelBlock:](v11, "setCancelBlock:", v8);
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

- (BOOL)run:(id *)a3
{
  uint64_t v4 = MediaAnalysisLogLevel(self, a2);
  if ((int)v4 >= 5)
  {
    uint64_t v6 = VCPLogInstance(v4, v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_log_type_t v8 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412290;
      v105 = @"[Restore-FP]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "%@ Running MADDatabaseRestoreFastPassProcessingTask ... ",  buf,  0xCu);
    }
  }

  uint64_t v9 = VCPSignPostLog(v4);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  os_signpost_id_t spid = os_signpost_id_generate(v10);

  uint64_t v12 = VCPSignPostLog(v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "MADDatabaseRestoreFastPassProcessingTask",  (const char *)&unk_100199097,  buf,  2u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary systemPhotoLibraryURL](&OBJC_CLASS___PHPhotoLibrary, "systemPhotoLibraryURL"));
  v92 = (void *)objc_claimAutoreleasedReturnValue([v15 photoLibraryWithURL:v16]);

  if (!v92)
  {
    NSErrorUserInfoKey v117 = NSLocalizedDescriptionKey;
    v29 = (void *)objc_claimAutoreleasedReturnValue([0 photoLibraryURL]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 path]);
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to open Photo Library (%@)",  @"[Restore-FP]",  v30));
    v118 = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v118,  &v117,  1LL));
    id obj = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v32));

    uint64_t v35 = MediaAnalysisLogLevel(v33, v34);
    if ((int)v35 >= 3)
    {
      uint64_t v37 = VCPLogInstance(v35, v36);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      os_log_type_t v39 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v38, v39))
      {
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue([obj description]);
        *(_DWORD *)buf = 138412290;
        v105 = v40;
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "%@", buf, 0xCu);
      }
    }

    if (!a3) {
      goto LABEL_30;
    }
LABEL_29:
    objc_storeStrong(a3, obj);
LABEL_30:
    BOOL v53 = 0;
    goto LABEL_31;
  }

  if (([v92 isReadyForAnalysisCPLInitialDownloadCompleted] & 1) == 0)
  {
    NSErrorUserInfoKey v115 = NSLocalizedDescriptionKey;
    v41 = (void *)objc_claimAutoreleasedReturnValue([v92 photoLibraryURL]);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 path]);
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Photo Library not ready for analysis (%@)",  @"[Restore-FP]",  v42));
    v116 = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v116,  &v115,  1LL));
    id obj = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v44));

    uint64_t v47 = MediaAnalysisLogLevel(v45, v46);
    if ((int)v47 >= 3)
    {
      uint64_t v49 = VCPLogInstance(v47, v48);
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      os_log_type_t v51 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v50, v51))
      {
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue([obj description]);
        *(_DWORD *)buf = 138412290;
        v105 = v52;
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "%@", buf, 0xCu);
      }
    }

    if (!a3) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADDatabaseRestoreFastPassProcessingTask cancelBlock](self, "cancelBlock"));
  id obj = (id)objc_claimAutoreleasedReturnValue( +[MADPhotosLibraryRestoreTask taskWithPhotoLibrary:progressHandler:completionHandler:cancelBlock:]( &OBJC_CLASS___MADPhotosLibraryRestoreTask,  "taskWithPhotoLibrary:progressHandler:completionHandler:cancelBlock:",  v92,  0LL,  0LL,  v17));

  if ([obj run])
  {
    id v18 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to restore database.",  @"[Restore-FP]"));
    uint64_t v20 = MediaAnalysisLogLevel(v18, v19);
    if ((int)v20 >= 3)
    {
      uint64_t v22 = VCPLogInstance(v20, v21);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      os_log_type_t v24 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 138412290;
        v105 = v18;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@", buf, 0xCu);
      }
    }

    if (a3)
    {
      NSErrorUserInfoKey v113 = NSLocalizedDescriptionKey;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v18));
      v114 = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v114,  &v113,  1LL));
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v26));
      id v28 = *a3;
      *a3 = v27;
    }

    goto LABEL_30;
  }

  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[MADDatabaseRestoreFastPassBackgroundSystemTask featureCodes]( &OBJC_CLASS___MADDatabaseRestoreFastPassBackgroundSystemTask,  "featureCodes"));
  id v56 = [v55 countByEnumeratingWithState:&v99 objects:v112 count:16];
  if (!v56) {
    goto LABEL_48;
  }
  uint64_t v57 = *(void *)v100;
  os_log_type_t v58 = VCPLogToOSLogType[3];
  os_log_type_t v59 = VCPLogToOSLogType[5];
  do
  {
    for (i = 0LL; i != v56; i = (char *)i + 1)
    {
      if (*(void *)v100 != v57) {
        objc_enumerationMutation(v55);
      }
      v61 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)i);
      id v62 = [v61 unsignedIntegerValue];
      id v98 = 0LL;
      unsigned __int8 v63 = +[BGSystemTaskCheckpoints reportFeatureCheckpoint:forFeature:error:]( &OBJC_CLASS___BGSystemTaskCheckpoints,  "reportFeatureCheckpoint:forFeature:error:",  50LL,  v62,  &v98);
      id v64 = v98;
      v66 = v64;
      if ((v63 & 1) != 0)
      {
        uint64_t v67 = MediaAnalysisLogLevel(v64, v65);
        uint64_t v69 = VCPLogInstance(v67, v68);
        v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
        if (!os_log_type_enabled(v70, v59)) {
          goto LABEL_45;
        }
        *(_DWORD *)buf = 138412802;
        v105 = @"[Restore-FP]";
        __int16 v106 = 2048;
        uint64_t v107 = 50LL;
        __int16 v108 = 2112;
        v109 = v61;
        v71 = v70;
        os_log_type_t v72 = v59;
        v73 = "%@ MADDatabaseRestoreFastPassProcessingTask Reported checkpoint %lu for %@";
        uint32_t v74 = 32;
        goto LABEL_44;
      }

      uint64_t v75 = MediaAnalysisLogLevel(v64, v65);
      uint64_t v77 = VCPLogInstance(v75, v76);
      v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v70, v58))
      {
        *(_DWORD *)buf = 138413058;
        v105 = @"[Restore-FP]";
        __int16 v106 = 2048;
        uint64_t v107 = 50LL;
        __int16 v108 = 2112;
        v109 = v61;
        __int16 v110 = 2112;
        v111 = v66;
        v71 = v70;
        os_log_type_t v72 = v58;
        v73 = "%@ MADDatabaseRestoreFastPassProcessingTask Failed to report checkpoint %lu for %@ - %@";
        uint32_t v74 = 42;
LABEL_44:
        _os_log_impl((void *)&_mh_execute_header, v71, v72, v73, buf, v74);
      }

- (void).cxx_destruct
{
}

@end