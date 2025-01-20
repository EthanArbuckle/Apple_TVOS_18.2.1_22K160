@interface MADComputeServiceProcessingTask
+ (id)_taskWithPhotosAssets:(id)a3 photoLibraryURLPath:(id)a4 requestID:(id)a5 requests:(id)a6 resultDirectoryURL:(id)a7 cancelBlock:(id)a8 progressHandler:(id)a9 resultsHandler:(id)a10 completionHandler:(id)a11;
+ (id)_taskWithURLAssets:(id)a3 requestID:(id)a4 requests:(id)a5 resultDirectoryURL:(id)a6 cancelBlock:(id)a7 progressHandler:(id)a8 resultsHandler:(id)a9 completionHandler:(id)a10;
+ (id)taskWithManagedRequests:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7;
+ (id)taskWithRequestID:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7;
+ (id)taskWithRequests:(id)a3 requestID:(id)a4 assetURLs:(id)a5 resultDirectoryURL:(id)a6 cancelBlock:(id)a7 progressHandler:(id)a8 resultsHandler:(id)a9 completionHandler:(id)a10;
+ (id)taskWithRequests:(id)a3 requestID:(id)a4 localIdentifiers:(id)a5 photoLibraryURL:(id)a6 resultDirectoryURL:(id)a7 cancelBlock:(id)a8 progressHandler:(id)a9 resultsHandler:(id)a10 completionHandler:(id)a11;
+ (int)_saveResult:(id)a3 fileURL:(id)a4;
+ (int)_saveResultData:(id)a3 fileURL:(id)a4;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (MADComputeServiceProcessingTask)initWithRequests:(id)a3 requestID:(id)a4 assetURLs:(id)a5 resultDirectoryURL:(id)a6 cancelBlock:(id)a7 progressHandler:(id)a8 resultsHandler:(id)a9 completionHandler:(id)a10;
- (MADComputeServiceProcessingTask)initWithRequests:(id)a3 requestID:(id)a4 localIdentifiers:(id)a5 photoLibraryURL:(id)a6 resultDirectoryURL:(id)a7 cancelBlock:(id)a8 progressHandler:(id)a9 resultsHandler:(id)a10 completionHandler:(id)a11;
- (float)resourceRequirement;
- (id)_loadAssetsForTaskID:(unint64_t)a3;
- (id)_partialAnalysisURL;
- (id)_prepareFaceAssetProcessingTask;
- (id)_prepareFaceResultWithFaces:(id)a3;
- (id)_prepareSceneAssetProcessingTask;
- (id)_prepareSceneResultWithClassifications:(id)a3;
- (id)_prepareVideoAnalysisResults:(id)a3;
- (id)_processVideoAsset:(id)a3 partialAnalysis:(id)a4 analysisTypes:(unint64_t)a5 error:(id *)a6;
- (int)_processVideoAnalysis:(id)a3 analysisError:(id)a4 assetIdentifierType:(id)a5 assetIdentifier:(id)a6;
- (int)_resumePausedVideoAnalysis;
- (int)run;
- (unint64_t)_videoAnalysisTypes;
- (void)_processVideoAssetURLs;
- (void)_processVideoLocalIdentifiers;
- (void)_processVideoRequests;
- (void)_processVisionRequest:(id)a3;
- (void)_runVisionRequest:(id)a3 assetURL:(id)a4 localIdentifier:(id)a5;
- (void)_savePartialAnalysis:(id)a3 assetIdentifierType:(id)a4 assetIdentifier:(id)a5;
- (void)cancel;
- (void)dealloc;
@end

@implementation MADComputeServiceProcessingTask

- (MADComputeServiceProcessingTask)initWithRequests:(id)a3 requestID:(id)a4 localIdentifiers:(id)a5 photoLibraryURL:(id)a6 resultDirectoryURL:(id)a7 cancelBlock:(id)a8 progressHandler:(id)a9 resultsHandler:(id)a10 completionHandler:(id)a11
{
  id v41 = a3;
  id v38 = a4;
  id v40 = a5;
  id v37 = a6;
  id v36 = a7;
  v18 = (Block_layout *)a8;
  id v39 = a9;
  id v19 = a10;
  id v20 = a11;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___MADComputeServiceProcessingTask;
  v21 = -[MADComputeServiceProcessingTask init](&v42, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_requests, a3);
    objc_storeStrong((id *)&v22->_requestID, a4);
    objc_storeStrong((id *)&v22->_localIdentifiers, a5);
    objc_storeStrong((id *)&v22->_photoLibraryURL, a6);
    objc_storeStrong((id *)&v22->_resultDirectoryURL, a7);
    id v23 = objc_msgSend(v41, "count", v36, v37, v38);
    v22->_totalTaskCount = (double)(unint64_t)((void)[v40 count] * (void)v23);
    v22->_finishedTaskCount = 0.0;
    if (v18) {
      v24 = v18;
    }
    else {
      v24 = &stru_1001BC148;
    }
    v25 = objc_retainBlock(v24);
    id cancelBlock = v22->_cancelBlock;
    v22->_id cancelBlock = v25;

    id v27 = objc_retainBlock(v39);
    id progressHandler = v22->_progressHandler;
    v22->_id progressHandler = v27;

    id v29 = objc_retainBlock(v19);
    id resultsHandler = v22->_resultsHandler;
    v22->_id resultsHandler = v29;

    id v31 = objc_retainBlock(v20);
    id completionHandler = v22->_completionHandler;
    v22->_id completionHandler = v31;

    uint64_t v33 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    videoProcessingRequests = v22->_videoProcessingRequests;
    v22->_videoProcessingRequests = (NSMutableArray *)v33;
  }

  return v22;
}

+ (id)taskWithRequests:(id)a3 requestID:(id)a4 localIdentifiers:(id)a5 photoLibraryURL:(id)a6 resultDirectoryURL:(id)a7 cancelBlock:(id)a8 progressHandler:(id)a9 resultsHandler:(id)a10 completionHandler:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = [objc_alloc((Class)objc_opt_class(a1)) initWithRequests:v17 requestID:v18 localIdentifiers:v19 photoLibraryURL:v20 resultDirectoryURL:v21 cancelBlock:v22 progressHandler:v23 res ultsHandler:v24 completionHandler:v25];

  return v26;
}

- (MADComputeServiceProcessingTask)initWithRequests:(id)a3 requestID:(id)a4 assetURLs:(id)a5 resultDirectoryURL:(id)a6 cancelBlock:(id)a7 progressHandler:(id)a8 resultsHandler:(id)a9 completionHandler:(id)a10
{
  id v39 = a3;
  id v38 = a4;
  id v37 = a5;
  id v36 = a6;
  id v17 = (Block_layout *)a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___MADComputeServiceProcessingTask;
  id v21 = -[MADComputeServiceProcessingTask init](&v40, "init");
  id v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_requests, a3);
    objc_storeStrong((id *)&v22->_requestID, a4);
    objc_storeStrong((id *)&v22->_assetURLs, a5);
    objc_storeStrong((id *)&v22->_resultDirectoryURL, a6);
    id v23 = objc_msgSend(v39, "count", v36, v37, v38);
    v22->_totalTaskCount = (double)(-[NSArray count](v22->_assetURLs, "count") * (unint64_t)v23);
    v22->_finishedTaskCount = 0.0;
    if (v17) {
      id v24 = v17;
    }
    else {
      id v24 = &stru_1001BC168;
    }
    id v25 = objc_retainBlock(v24);
    id cancelBlock = v22->_cancelBlock;
    v22->_id cancelBlock = v25;

    id v27 = objc_retainBlock(v18);
    id progressHandler = v22->_progressHandler;
    v22->_id progressHandler = v27;

    id v29 = objc_retainBlock(v19);
    id resultsHandler = v22->_resultsHandler;
    v22->_id resultsHandler = v29;

    id v31 = objc_retainBlock(v20);
    id completionHandler = v22->_completionHandler;
    v22->_id completionHandler = v31;

    uint64_t v33 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    videoProcessingRequests = v22->_videoProcessingRequests;
    v22->_videoProcessingRequests = (NSMutableArray *)v33;
  }

  return v22;
}

+ (id)taskWithRequests:(id)a3 requestID:(id)a4 assetURLs:(id)a5 resultDirectoryURL:(id)a6 cancelBlock:(id)a7 progressHandler:(id)a8 resultsHandler:(id)a9 completionHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = [objc_alloc((Class)objc_opt_class(a1)) initWithRequests:v16 requestID:v17 assetURLs:v18 resultDirectoryURL:v19 cancelBlock:v20 progressHandler:v21 resultsHandler:v22 completionHandler:v23];

  return v24;
}

+ (int)_saveResultData:(id)a3 fileURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MACS][SaveResultData][%@]",  v6));
  id v23 = 0LL;
  unsigned __int8 v8 = [v5 writeToURL:v6 options:1 error:&v23];
  id v9 = v23;
  v11 = v9;
  if ((v8 & 1) != 0)
  {
    uint64_t v12 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v12 < 6)
    {
      int v17 = 0;
      goto LABEL_13;
    }

    uint64_t v14 = VCPLogInstance(v12, v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v7;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ Saved result to %@", buf, 0x16u);
    }

    int v17 = 0;
  }

  else
  {
    uint64_t v18 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v18 < 3)
    {
      int v17 = -20;
      goto LABEL_13;
    }

    uint64_t v20 = VCPLogInstance(v18, v19);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    os_log_type_t v21 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v15, v21))
    {
      *(_DWORD *)buf = 138412802;
      id v25 = v7;
      __int16 v26 = 2112;
      id v27 = v5;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, v21, "%@ Failed to save result %@ - %@", buf, 0x20u);
    }

    int v17 = -20;
  }

LABEL_13:
  return v17;
}

+ (int)_saveResult:(id)a3 fileURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MACS][SaveResult][%@]",  v7));
  uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
  if ((int)v10 >= 7)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v28 = v8;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%@ MACS result %@", buf, 0x16u);
    }
  }

  id v26 = 0LL;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v26));
  id v16 = v26;
  uint64_t v18 = v16;
  if (v15)
  {
    int v19 = [a1 _saveResultData:v15 fileURL:v7];
  }

  else
  {
    uint64_t v20 = MediaAnalysisLogLevel(v16, v17);
    if ((int)v20 >= 3)
    {
      uint64_t v22 = VCPLogInstance(v20, v21);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      os_log_type_t v24 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v28 = v8;
        __int16 v29 = 2112;
        id v30 = v6;
        __int16 v31 = 2112;
        v32 = v18;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@ Failed to archive result %@ - %@", buf, 0x20u);
      }
    }

    int v19 = -18;
  }

  return v19;
}

+ (id)_taskWithPhotosAssets:(id)a3 photoLibraryURLPath:(id)a4 requestID:(id)a5 requests:(id)a6 resultDirectoryURL:(id)a7 cancelBlock:(id)a8 progressHandler:(id)a9 resultsHandler:(id)a10 completionHandler:(id)a11
{
  id v31 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v32 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100081210;
  v33[3] = &unk_1001BC190;
  id v24 = v22;
  id v36 = v24;
  id v25 = v18;
  id v34 = v25;
  id v26 = v20;
  id v35 = v26;
  id v37 = a1;
  id v27 = objc_retainBlock(v33);
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v17));
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[MADComputeServiceProcessingTask taskWithRequests:requestID:localIdentifiers:photoLibraryURL:resultDirectoryURL:cancelBlock:progressHandler:resultsHandler:completionHandler:]( &OBJC_CLASS___MADComputeServiceProcessingTask,  "taskWithRequests:requestID:localIdentifiers:photoLibraryURL:resultDirectoryURL:cancelBlock:progressH andler:resultsHandler:completionHandler:",  v19,  v25,  v31,  v28,  v26,  v32,  v21,  v27,  v23));

  return v29;
}

+ (id)_taskWithURLAssets:(id)a3 requestID:(id)a4 requests:(id)a5 resultDirectoryURL:(id)a6 cancelBlock:(id)a7 progressHandler:(id)a8 resultsHandler:(id)a9 completionHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v30 = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472LL;
  id v32 = sub_1000816F4;
  uint64_t v33 = &unk_1001BC1B8;
  id v24 = v22;
  id v36 = v24;
  id v25 = v17;
  id v34 = v25;
  id v26 = v19;
  id v35 = v26;
  id v37 = a1;
  id v27 = objc_retainBlock(&v30);
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[MADComputeServiceProcessingTask taskWithRequests:requestID:assetURLs:resultDirectoryURL:cancelBlock:progressHandler:resultsHandler:completionHandler:]( &OBJC_CLASS___MADComputeServiceProcessingTask,  "taskWithRequests:requestID:assetURLs:resultDirectoryURL:cancelBlock:progressHandler:resultsHandler:c ompletionHandler:",  v18,  v25,  v16,  v26,  v20,  v21,  v27,  v23,  v30,  v31,  v32,  v33));

  return v28;
}

+ (id)taskWithManagedRequests:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v128 = a4;
  id v129 = a5;
  id v130 = a6;
  id v131 = a7;
  v132 = v11;
  if ([v11 count])
  {
    v136 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
    v140 = (void *)objc_claimAutoreleasedReturnValue([v13 requestID]);

    os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 resultDirectoryURL]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 resultDirectoryURLExtension]);
    _CFURLAttachSecurityScopeToFileURL(v15, v17);

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 resultDirectoryURL]);
    LODWORD(v17) = [v19 startAccessingSecurityScopedResource];

    if ((_DWORD)v17)
    {
      uint64_t v22 = MediaAnalysisLogLevel(v20, v21);
      if ((int)v22 >= 7)
      {
        uint64_t v24 = VCPLogInstance(v22, v23);
        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        os_log_type_t v26 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v25, v26))
        {
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
          __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 resultDirectoryURL]);
          *(_DWORD *)buf = 138412546;
          v157 = @"[MACS]";
          __int16 v158 = 2112;
          v159 = v28;
          _os_log_impl((void *)&_mh_execute_header, v25, v26, "%@ Consuming secure scoped result URL %@", buf, 0x16u);
        }
      }

      __int128 v153 = 0u;
      __int128 v154 = 0u;
      __int128 v151 = 0u;
      __int128 v152 = 0u;
      id obj = v11;
      id v29 = [obj countByEnumeratingWithState:&v151 objects:v155 count:16];
      if (!v29)
      {
        char v133 = 1;
        goto LABEL_62;
      }

      uint64_t v139 = *(void *)v152;
      os_log_type_t v137 = VCPLogToOSLogType[4];
      os_log_type_t v30 = VCPLogToOSLogType[3];
      char v133 = 1;
      os_log_type_t type = VCPLogToOSLogType[7];
      while (1)
      {
        uint64_t v31 = 0LL;
        do
        {
          if (*(void *)v152 != v139) {
            objc_enumerationMutation(obj);
          }
          id v32 = *(void **)(*((void *)&v151 + 1) + 8LL * (void)v31);
          uint64_t v33 = objc_autoreleasePoolPush();
          id v34 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MACS][%@]",  v140));
          id v35 = (void *)objc_claimAutoreleasedReturnValue([v32 requestID]);
          unsigned __int8 v36 = [v35 isEqualToString:v140];

          if ((v36 & 1) != 0)
          {
            uint64_t v39 = objc_opt_class(&OBJC_CLASS___MADRequest);
            objc_super v40 = (void *)objc_claimAutoreleasedReturnValue([v32 requestData]);
            id v150 = 0LL;
            id v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v39,  v40,  &v150));
            objc_super v42 = (os_log_s *)v150;

            if (v41)
            {
              uint64_t v45 = MediaAnalysisLogLevel(v43, v44);
              if ((int)v45 >= 3)
              {
                uint64_t v47 = VCPLogInstance(v45, v46);
                v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
                if (os_log_type_enabled(v48, v30))
                {
                  v49 = (os_log_s *)objc_opt_class(v41);
                  *(_DWORD *)buf = 138412546;
                  v157 = v34;
                  __int16 v158 = 2112;
                  v159 = v49;
                  v50 = v49;
                  _os_log_impl((void *)&_mh_execute_header, v48, v30, "%@ Loaded request %@", buf, 0x16u);
                }
              }

              -[os_log_s addObject:](v136, "addObject:", v41);
              v51 = (void *)objc_claimAutoreleasedReturnValue([v32 assetURL]);
              BOOL v52 = v51 == 0LL;

              if (!v52)
              {
                v53 = (void *)objc_claimAutoreleasedReturnValue([v32 assetURL]);
                v54 = (void *)objc_claimAutoreleasedReturnValue([v32 assetURLExtension]);
                _CFURLAttachSecurityScopeToFileURL(v53, v54);

                v55 = (void *)objc_claimAutoreleasedReturnValue([v32 assetURL]);
                LODWORD(v53) = [v55 startAccessingSecurityScopedResource];

                if ((_DWORD)v53)
                {
                  uint64_t v58 = MediaAnalysisLogLevel(v56, v57);
                  if ((int)v58 >= 7)
                  {
                    uint64_t v60 = VCPLogInstance(v58, v59);
                    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
                    if (os_log_type_enabled(v61, type))
                    {
                      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 assetURL]);
                      *(_DWORD *)buf = 138412546;
                      v157 = v34;
                      __int16 v158 = 2112;
                      v159 = v62;
                      _os_log_impl( (void *)&_mh_execute_header,  v61,  type,  "%@ Consuming secure scoped URL %@",  buf,  0x16u);
                    }
                  }

                  v63 = (void *)objc_claimAutoreleasedReturnValue([v32 assetURL]);
                  [v135 addObject:v63];
                  goto LABEL_37;
                }

                uint64_t v82 = MediaAnalysisLogLevel(v56, v57);
                if ((int)v82 >= 3)
                {
                  uint64_t v84 = VCPLogInstance(v82, v83);
                  v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
                  if (os_log_type_enabled(v71, v30))
                  {
                    v85 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 assetURL]);
                    *(_DWORD *)buf = 138412546;
                    v157 = v34;
                    __int16 v158 = 2112;
                    v159 = v85;
                    _os_log_impl( (void *)&_mh_execute_header,  v71,  v30,  "%@ Failed to open secure scoped URL %@; skip",
                      buf,
                      0x16u);
                  }

                  goto LABEL_38;
                }

+ (id)taskWithRequestID:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v28 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"requestID==%@ AND status==%lu",  v12,  0LL));
  id v29 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[MADManagedRequest fetchTaskScheduleWithPredicate:error:]( &OBJC_CLASS___MADManagedRequest,  "fetchTaskScheduleWithPredicate:error:",  v16,  &v29));
  id v18 = v29;
  uint64_t v20 = MediaAnalysisLogLevel(v18, v19);
  if ((int)v20 >= 6)
  {
    uint64_t v22 = VCPLogInstance(v20, v21);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    os_log_type_t v24 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v23, v24))
    {
      id v25 = [v17 count];
      *(_DWORD *)buf = 138412546;
      id v31 = v12;
      __int16 v32 = 2048;
      id v33 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "[%@] Fetched %lu requests", buf, 0x16u);
    }
  }

  os_log_type_t v26 = (void *)objc_claimAutoreleasedReturnValue( [a1 taskWithManagedRequests:v17 cancelBlock:v28 progressHandler:v13 resultsHandler:v14 completionHandler:v15]);

  return v26;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADComputeServiceProcessingTask] Request is canceled before started"));
    uint64_t v10 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v6));
    completionHandler[2](completionHandler, v7);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MADComputeServiceProcessingTask;
  -[MADComputeServiceProcessingTask dealloc](&v8, "dealloc");
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
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_canceled);
  return v4 & 1;
}

- (id)_loadAssetsForTaskID:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 photoLibraryWithURL:self->_photoLibraryURL]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v6,  a3));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  self->_localIdentifiers,  v7));

  return v8;
}

- (id)_prepareSceneResultWithClassifications:(id)a3
{
  id v34 = a3;
  unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v3 = v34;
  id v4 = [v3 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v38;
    os_log_type_t type = VCPLogToOSLogType[7];
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v38 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        objc_super v8 = objc_autoreleasePoolPush();
        NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue(+[PFSceneTaxonomy vcp_sharedTaxonomy](&OBJC_CLASS___PFSceneTaxonomy, "vcp_sharedTaxonomy"));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nodeForExtendedSceneClassId:", objc_msgSend(v7, "extendedSceneIdentifier")));

        if (v10 && [v10 networkId] == (id)1)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
          [v7 confidence];
          double v13 = v12;
          [v7 boundingBox];
          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MADSceneClassification entryWithLabel:confidence:boundingBox:]( &OBJC_CLASS___MADSceneClassification,  "entryWithLabel:confidence:boundingBox:",  v11,  v13,  v14,  v15,  v16,  v17));

          uint64_t v21 = MediaAnalysisLogLevel(v19, v20);
          if ((int)v21 >= 7)
          {
            uint64_t v23 = VCPLogInstance(v21, v22);
            os_log_type_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, type))
            {
              *(_DWORD *)buf = 138412290;
              objc_super v42 = v18;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  type,  "[MADComputeServiceProcessingTask] classification result %@",  buf,  0xCu);
            }
          }

          [v36 addObject:v18];
        }

        objc_autoreleasePoolPop(v8);
      }

      id v4 = [v3 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }

    while (v4);
  }

  if (v36)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[MADSceneClassificationResult resultWithClassifications:]( &OBJC_CLASS___MADSceneClassificationResult,  "resultWithClassifications:"));
  }

  else
  {
    uint64_t v28 = MediaAnalysisLogLevel(v25, v26);
    if ((int)v28 >= 3)
    {
      uint64_t v30 = VCPLogInstance(v28, v29);
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      os_log_type_t v32 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v31, v32))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "[MADComputeServiceProcessingTask] Failed to load scene classification",  buf,  2u);
      }
    }

    id v27 = 0LL;
  }

  return v27;
}

- (id)_prepareSceneAssetProcessingTask
{
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADComputeServiceProcessingTask][VCPMADSceneAssetProcessingTask]"));
  if (-[NSArray count](self->_assetURLs, "count"))
  {
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[VNSceneClassificationRequest vcp_sceneRequest]( &OBJC_CLASS___VNSceneClassificationRequest,  "vcp_sceneRequest"));
    unint64_t v52 = 0LL;
    os_log_type_t v45 = VCPLogToOSLogType[3];
    os_log_type_t type = VCPLogToOSLogType[6];
    os_log_type_t v54 = VCPLogToOSLogType[7];
    while (v52 < -[NSArray count](self->_assetURLs, "count"))
    {
      context = objc_autoreleasePoolPush();
      self->_finishedTaskCount = self->_finishedTaskCount + 1.0;
      v2 = objc_alloc(&OBJC_CLASS___VNImageRequestHandler);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_assetURLs, "objectAtIndexedSubscript:", v52));
      v49 = -[VNImageRequestHandler initWithURL:orientation:options:]( v2,  "initWithURL:orientation:options:",  v3,  1LL,  &__NSDictionary0__struct);

      uint64_t v70 = v47;
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v70, 1LL));
      id v62 = 0LL;
      LODWORD(v2) = -[VNImageRequestHandler performRequests:error:](v49, "performRequests:error:", v4, &v62);
      id v50 = v62;

      if ((_DWORD)v2)
      {
        uint64_t v7 = MediaAnalysisLogLevel(v5, v6);
        if ((int)v7 >= 6)
        {
          uint64_t v9 = VCPLogInstance(v7, v8);
          uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, type))
          {
            id v11 = (void *)objc_claimAutoreleasedReturnValue([v47 results]);
            *(_DWORD *)buf = 138412546;
            v67 = v53;
            __int16 v68 = 2112;
            uint64_t v69 = v11;
            _os_log_impl((void *)&_mh_execute_header, v10, type, "%@ Analysis finished - %@", buf, 0x16u);
          }
        }

        double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        __int128 v61 = 0u;
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        __int128 v58 = 0u;
        double v13 = (void *)objc_claimAutoreleasedReturnValue([v47 results]);
        id v14 = [v13 countByEnumeratingWithState:&v58 objects:v65 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v59;
          do
          {
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v59 != v15) {
                objc_enumerationMutation(v13);
              }
              double v17 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)i);
              id v18 = objc_autoreleasePoolPush();
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
              [v17 confidence];
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[MADSceneClassification entryWithLabel:confidence:boundingBox:]( &OBJC_CLASS___MADSceneClassification,  "entryWithLabel:confidence:boundingBox:",  v19,  v20,  CGRectNull.origin.x,  CGRectNull.origin.y,  CGRectNull.size.width,  CGRectNull.size.height));

              uint64_t v24 = MediaAnalysisLogLevel(v22, v23);
              if ((int)v24 >= 7)
              {
                uint64_t v26 = VCPLogInstance(v24, v25);
                id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
                if (os_log_type_enabled(v27, v54))
                {
                  *(_DWORD *)buf = 138412546;
                  v67 = v53;
                  __int16 v68 = 2112;
                  uint64_t v69 = v21;
                  _os_log_impl((void *)&_mh_execute_header, v27, v54, "%@ classification result %@", buf, 0x16u);
                }
              }

              [v12 addObject:v21];

              objc_autoreleasePoolPop(v18);
            }

            id v14 = [v13 countByEnumeratingWithState:&v58 objects:v65 count:16];
          }

          while (v14);
        }

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[MADSceneClassificationResult resultWithClassifications:]( &OBJC_CLASS___MADSceneClassificationResult,  "resultWithClassifications:",  v12));
        (*((void (**)(double))self->_progressHandler + 2))(self->_finishedTaskCount / self->_totalTaskCount);
        id resultsHandler = (void (**)(id, void *, void *, void))self->_resultsHandler;
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_assetURLs, "objectAtIndexedSubscript:", v52));
        resultsHandler[2](resultsHandler, v30, v28, 0LL);
      }

      else
      {
        NSErrorUserInfoKey v63 = NSLocalizedDescriptionKey;
        id v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_assetURLs, "objectAtIndexedSubscript:", v52));
        os_log_type_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Analysis failed with asset %@ - %@",  v53,  v31,  v50));
        uint64_t v64 = v32;
        id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v64,  &v63,  1LL));
        double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v33));

        uint64_t v36 = MediaAnalysisLogLevel(v34, v35);
        if ((int)v36 >= 3)
        {
          uint64_t v38 = VCPLogInstance(v36, v37);
          __int128 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, v45))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v12;
            _os_log_impl((void *)&_mh_execute_header, v39, v45, "%@", buf, 0xCu);
          }
        }

        (*((void (**)(double))self->_progressHandler + 2))(self->_finishedTaskCount / self->_totalTaskCount);
        (*((void (**)(void))self->_resultsHandler + 2))();
      }

      objc_autoreleasePoolPop(context);
      ++v52;
    }

    __int128 v40 = 0LL;
  }

  else
  {
    id v41 = objc_alloc(&OBJC_CLASS___VCPMADSceneAssetProcessingTask);
    localIdentifiers = self->_localIdentifiers;
    photoLibraryURL = self->_photoLibraryURL;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_100083E4C;
    v57[3] = &unk_1001B9E98;
    v57[4] = self;
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_100083E54;
    v55[3] = &unk_1001BC208;
    v55[4] = self;
    id v56 = v53;
    __int128 v40 = -[VCPMADSceneAssetProcessingTask initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:]( v41,  "initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:",  localIdentifiers,  photoLibraryURL,  v57,  0LL,  v55);
  }

  return v40;
}

- (id)_prepareFaceResultWithFaces:(id)a3
{
  id v31 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = v31;
  id v4 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v34;
    os_log_type_t v6 = VCPLogToOSLogType[7];
    uint64_t v7 = 1LL;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        uint64_t v10 = objc_autoreleasePoolPush();
        [v9 centerX];
        double v12 = v11;
        [v9 centerY];
        double v14 = v13;
        [v9 size];
        +[VCPFaceUtils faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:]( VCPFaceUtils,  "faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:",  v12,  v14,  v15,  (double)(uint64_t)[v9 sourceWidth],  (double)(uint64_t)objc_msgSend(v9, "sourceHeight"));
        [v9 quality];
        double v16 = (void *)objc_claimAutoreleasedReturnValue( +[MADDetectedFace entryWithFaceID:confidence:boundingBox:]( &OBJC_CLASS___MADDetectedFace,  "entryWithFaceID:confidence:boundingBox:",  (char *)i + v7));
        uint64_t v18 = MediaAnalysisLogLevel(v16, v17);
        if ((int)v18 >= 7)
        {
          uint64_t v20 = VCPLogInstance(v18, v19);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, v6))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v38 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  v6,  "[MADComputeServiceProcessingTask] face result %@",  buf,  0xCu);
          }
        }

        [v3 addObject:v16];

        objc_autoreleasePoolPop(v10);
      }

      id v4 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      uint64_t v7 = (v7 + (_DWORD)i);
    }

    while (v4);
  }

  if (v3)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[MADFaceDetectionResult resultWithDetectedFaces:]( &OBJC_CLASS___MADFaceDetectionResult,  "resultWithDetectedFaces:",  v3));
  }

  else
  {
    uint64_t v25 = MediaAnalysisLogLevel(v22, v23);
    if ((int)v25 >= 3)
    {
      uint64_t v27 = VCPLogInstance(v25, v26);
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      os_log_type_t v29 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v28, v29))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  v29,  "[MADComputeServiceProcessingTask] Failed to load face result",  buf,  2u);
      }
    }

    uint64_t v24 = 0LL;
  }

  return v24;
}

- (id)_prepareFaceAssetProcessingTask
{
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADComputeServiceProcessingTask][VCPMADQuickFaceIDAssetProcessingTask]"));
  if (-[NSArray count](self->_assetURLs, "count"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary vcp_defaultPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "vcp_defaultPhotoLibrary"));
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosFaceProcessingContext,  "contextWithPhotoLibrary:",  v2));

    uint64_t v46 = -[VCPFaceAnalyzer initWithContext:](objc_alloc(&OBJC_CLASS___VCPFaceAnalyzer), "initWithContext:", v43);
    unint64_t v50 = 0LL;
    os_log_type_t type = VCPLogToOSLogType[3];
    uint64_t v44 = MediaAnalysisFaceResultsKey;
    os_log_type_t v52 = VCPLogToOSLogType[7];
    while (v50 < -[NSArray count](self->_assetURLs, "count"))
    {
      context = objc_autoreleasePoolPush();
      self->_finishedTaskCount = self->_finishedTaskCount + 1.0;
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VCPImageManager sharedImageManager](&OBJC_CLASS___VCPImageManager, "sharedImageManager"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_assetURLs, "objectAtIndexedSubscript:", v50));
      id v61 = [v3 pixelBufferWithFormat:875704438 fromImageURL:v4 flushCache:0];

      id v60 = 0LL;
      id v5 = -[VCPFaceAnalyzer quickAnalyzeCVPixelBuffer:results:](v46, "quickAnalyzeCVPixelBuffer:results:", v61, &v60);
      id v48 = v60;
      if ((_DWORD)v5)
      {
        NSErrorUserInfoKey v62 = NSLocalizedDescriptionKey;
        os_log_type_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_assetURLs, "objectAtIndexedSubscript:", v50));
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Analysis failed (%d) asset at %@",  v51,  v5,  v6));
        NSErrorUserInfoKey v63 = v7;
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v8));

        uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
        if ((int)v12 >= 3)
        {
          uint64_t v14 = VCPLogInstance(v12, v13);
          double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, type))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v65 = v9;
            _os_log_impl((void *)&_mh_execute_header, v15, type, "%@", buf, 0xCu);
          }
        }

        (*((void (**)(double))self->_progressHandler + 2))(self->_finishedTaskCount / self->_totalTaskCount);
        (*((void (**)(void))self->_resultsHandler + 2))();
      }

      else
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        double v16 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:v44]);
        __int128 v59 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        __int128 v56 = 0u;
        id v17 = v16;
        id v18 = [v17 countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v57;
          uint64_t v20 = 1LL;
          do
          {
            for (i = 0LL; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v57 != v19) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
              uint64_t v23 = objc_autoreleasePoolPush();
              [v22 centerX];
              double v25 = v24;
              [v22 centerY];
              double v27 = v26;
              [v22 size];
              +[VCPFaceUtils faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:]( VCPFaceUtils,  "faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:",  v25,  v27,  v28,  (double)(uint64_t)[v22 sourceWidth],  (double)(uint64_t)objc_msgSend(v22, "sourceHeight"));
              [v22 quality];
              os_log_type_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[MADDetectedFace entryWithFaceID:confidence:boundingBox:]( &OBJC_CLASS___MADDetectedFace,  "entryWithFaceID:confidence:boundingBox:",  (char *)i + v20));
              uint64_t v31 = MediaAnalysisLogLevel(v29, v30);
              if ((int)v31 >= 7)
              {
                uint64_t v33 = VCPLogInstance(v31, v32);
                __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
                if (os_log_type_enabled(v34, v52))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v65 = v51;
                  __int16 v66 = 2112;
                  v67 = v29;
                  _os_log_impl((void *)&_mh_execute_header, v34, v52, "%@ face result %@", buf, 0x16u);
                }
              }

              [v9 addObject:v29];

              objc_autoreleasePoolPop(v23);
            }

            id v18 = [v17 countByEnumeratingWithState:&v56 objects:v68 count:16];
            uint64_t v20 = (v20 + (_DWORD)i);
          }

          while (v18);
        }

        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( +[MADFaceDetectionResult resultWithDetectedFaces:]( &OBJC_CLASS___MADFaceDetectionResult,  "resultWithDetectedFaces:",  v9));
        (*((void (**)(double))self->_progressHandler + 2))(self->_finishedTaskCount / self->_totalTaskCount);
        id resultsHandler = (void (**)(id, void *, void *, void))self->_resultsHandler;
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_assetURLs, "objectAtIndexedSubscript:", v50));
        resultsHandler[2](resultsHandler, v37, v35, 0LL);
      }

      sub_10000421C((const void **)&v61);
      objc_autoreleasePoolPop(context);
      ++v50;
    }

    uint64_t v38 = 0LL;
  }

  else
  {
    __int128 v39 = objc_alloc(&OBJC_CLASS___VCPMADQuickFaceIDAssetProcessingTask);
    localIdentifiers = self->_localIdentifiers;
    photoLibraryURL = self->_photoLibraryURL;
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_100084CF8;
    v55[3] = &unk_1001B9E98;
    v55[4] = self;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_100084D00;
    v53[3] = &unk_1001BC208;
    v53[4] = self;
    id v54 = v51;
    uint64_t v38 = -[VCPMADQuickFaceIDAssetProcessingTask initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:]( v39,  "initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:",  localIdentifiers,  photoLibraryURL,  v55,  0LL,  v53);
  }

  return v38;
}

- (void)_runVisionRequest:(id)a3 assetURL:(id)a4 localIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADComputeServiceProcessingTask][%@]",  objc_opt_class(v8));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = -[VNImageRequestHandler initWithURL:orientation:options:]( objc_alloc(&OBJC_CLASS___VNImageRequestHandler),  "initWithURL:orientation:options:",  v9,  1LL,  &__NSDictionary0__struct);
  id v45 = v8;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
  id v38 = 0LL;
  unsigned int v15 = -[VNImageRequestHandler performRequests:error:](v13, "performRequests:error:", v14, &v38);
  id v16 = v38;

  if (v15)
  {
    uint64_t v19 = MediaAnalysisLogLevel(v17, v18);
    if ((int)v19 >= 6)
    {
      uint64_t v21 = VCPLogInstance(v19, v20);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      os_log_type_t v23 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v22, v23))
      {
        double v24 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
        *(_DWORD *)buf = 138412546;
        objc_super v42 = v12;
        __int16 v43 = 2112;
        uint64_t v44 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "%@ Analysis finished - %@", buf, 0x16u);
      }
    }

    uint64_t v25 = objc_opt_class(&OBJC_CLASS___VNCoreMLRequest);
    if ((objc_opt_isKindOfClass(v8, v25) & 1) != 0)
    {
      double v26 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
      uint64_t v27 = objc_claimAutoreleasedReturnValue( +[MADCoreMLResult resultWithVisionResults:]( &OBJC_CLASS___MADCoreMLResult,  "resultWithVisionResults:",  v26));
    }

    else
    {
      double v26 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
      uint64_t v27 = objc_claimAutoreleasedReturnValue( +[MADVisionResult resultWithVisionResults:]( &OBJC_CLASS___MADVisionResult,  "resultWithVisionResults:",  v26));
    }

    uint64_t v30 = (void *)v27;

    (*((void (**)(double))self->_progressHandler + 2))(self->_finishedTaskCount / self->_totalTaskCount);
    (*((void (**)(void))self->_resultsHandler + 2))();
  }

  else
  {
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    double v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Analysis failed - %@",  v12,  v16));
    __int128 v40 = v28;
    os_log_type_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v29));

    uint64_t v33 = MediaAnalysisLogLevel(v31, v32);
    if ((int)v33 >= 3)
    {
      uint64_t v35 = VCPLogInstance(v33, v34);
      __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      os_log_type_t v37 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v36, v37))
      {
        *(_DWORD *)buf = 138412290;
        objc_super v42 = v30;
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "%@", buf, 0xCu);
      }
    }

    (*((void (**)(double))self->_progressHandler + 2))(self->_finishedTaskCount / self->_totalTaskCount);
    (*((void (**)(void))self->_resultsHandler + 2))();
  }
}

- (void)_processVisionRequest:(id)a3
{
  id v36 = a3;
  id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADComputeServiceProcessingTask][%@]",  objc_opt_class(v36));
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = MediaAnalysisLogLevel(v35, v5);
  if ((int)v6 >= 6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_log_type_t v10 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v40 = v35;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ Processing Vision request ...", buf, 0xCu);
    }
  }

  if (self->_localIdentifiers)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v11 photoLibraryWithURL:self->_photoLibraryURL]);

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v33 librarySpecificFetchOptions]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  self->_localIdentifiers));
    unint64_t v13 = 0LL;
    os_log_type_t type = VCPLogToOSLogType[3];
    while (v13 < (unint64_t)[v12 count])
    {
      uint64_t v14 = objc_autoreleasePoolPush();
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v13]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v15));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "vcp_thumbnailResource"));
      uint64_t v18 = v17;
      self->_finishedTaskCount = self->_finishedTaskCount + 1.0;
      if (v17)
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 privateFileURL]);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 localIdentifier]);
        -[MADComputeServiceProcessingTask _runVisionRequest:assetURL:localIdentifier:]( self,  "_runVisionRequest:assetURL:localIdentifier:",  v36,  v19,  v20);
      }

      else
      {
        NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Missing analysis media",  v35));
        id v38 = v21;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v22));

        uint64_t v25 = MediaAnalysisLogLevel(v23, v24);
        if ((int)v25 >= 3)
        {
          uint64_t v27 = VCPLogInstance(v25, v26);
          double v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, type))
          {
            *(_DWORD *)buf = 138412290;
            __int128 v40 = v19;
            _os_log_impl((void *)&_mh_execute_header, v28, type, "%@", buf, 0xCu);
          }
        }

        (*((void (**)(double))self->_progressHandler + 2))(self->_finishedTaskCount / self->_totalTaskCount);
        (*((void (**)(void))self->_resultsHandler + 2))();
      }

      objc_autoreleasePoolPop(v14);
      ++v13;
    }
  }

  if (-[NSArray count](self->_assetURLs, "count"))
  {
    for (unint64_t i = 0LL; i < -[NSArray count](self->_assetURLs, "count"); ++i)
    {
      uint64_t v30 = objc_autoreleasePoolPush();
      self->_finishedTaskCount = self->_finishedTaskCount + 1.0;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_assetURLs, "objectAtIndexedSubscript:", i));
      -[MADComputeServiceProcessingTask _runVisionRequest:assetURL:localIdentifier:]( self,  "_runVisionRequest:assetURL:localIdentifier:",  v36,  v31,  0LL);

      objc_autoreleasePoolPop(v30);
    }
  }
}

- (id)_prepareVideoAnalysisResults:(id)a3
{
  id v217 = a3;
  uint64_t v5 = MediaAnalysisLogLevel(v217, v4);
  if ((int)v5 >= 6)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@ Start parsing video analysis results", buf, 0xCu);
    }
  }

  v255[0] = _NSConcreteStackBlock;
  v255[1] = 3221225472LL;
  v255[2] = sub_100087414;
  v255[3] = &unk_1001BC230;
  v255[4] = self;
  v218 = objc_retainBlock(v255);
  id v216 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___MADExposureImageRequest);
  uint64_t v11 = ((uint64_t (*)(void *, uint64_t))v218[2])(v218, v10);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  v213 = (void *)v12;
  if (v12)
  {
    uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
    if ((int)v14 >= 6)
    {
      uint64_t v16 = VCPLogInstance(v14, v15);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      os_log_type_t v18 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@ Parsing image exposureRequest results", buf, 0xCu);
      }
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v217 objectForKeyedSubscript:MediaAnalysisExposureResultsKey]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 firstObject]);

    if (v20)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:MediaAnalysisResultQualityKey]);
      [v21 doubleValue];
      double v23 = v22;
    }

    else
    {
      double v23 = 0.0;
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[MADExposureResult resultWithExposureScore:]( &OBJC_CLASS___MADExposureResult,  "resultWithExposureScore:",  v23));
    uint64_t v26 = MediaAnalysisLogLevel(v24, v25);
    if ((int)v26 >= 7)
    {
      uint64_t v28 = VCPLogInstance(v26, v27);
      os_log_type_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      os_log_type_t v30 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v29, v30))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v217;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v24;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "%@ MADExposureResult %@ - %@", buf, 0x20u);
      }
    }

    [v216 addObject:v24];
  }

  uint64_t v31 = objc_opt_class(&OBJC_CLASS___MADSharpnessImageRequest);
  uint64_t v32 = ((uint64_t (*)(void *, uint64_t))v218[2])(v218, v31);
  uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
  v214 = (void *)v33;
  if (v33)
  {
    uint64_t v35 = MediaAnalysisLogLevel(v33, v34);
    if ((int)v35 >= 6)
    {
      uint64_t v37 = VCPLogInstance(v35, v36);
      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      os_log_type_t v39 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v38, v39))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "%@ Parsing image sharpness results", buf, 0xCu);
      }
    }

    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v217 objectForKeyedSubscript:MediaAnalysisBlurResultsKey]);
    id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 firstObject]);

    if (v41)
    {
      objc_super v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:MediaAnalysisResultAttributesKey]);
      __int16 v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:MediaAnalysisResultSharpnessAttributeKey]);
      [v43 doubleValue];
      double v45 = v44;
    }

    else
    {
      double v45 = 0.0;
    }

    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[MADSharpnessResult resultWithSharpnessScore:]( &OBJC_CLASS___MADSharpnessResult,  "resultWithSharpnessScore:",  v45));
    uint64_t v48 = MediaAnalysisLogLevel(v46, v47);
    if ((int)v48 >= 7)
    {
      uint64_t v50 = VCPLogInstance(v48, v49);
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      os_log_type_t v52 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v51, v52))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v217;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v46;
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "%@ MADSharpnessResult %@ - %@", buf, 0x20u);
      }
    }

    [v216 addObject:v46];
  }

  uint64_t v53 = objc_opt_class(&OBJC_CLASS___MADSceneClassificationVideoRequest);
  uint64_t v54 = ((uint64_t (*)(void *, uint64_t))v218[2])(v218, v53);
  uint64_t v55 = objc_claimAutoreleasedReturnValue(v54);
  v215 = (void *)v55;
  if (v55)
  {
    uint64_t v57 = MediaAnalysisLogLevel(v55, v56);
    if ((int)v57 >= 6)
    {
      uint64_t v59 = VCPLogInstance(v57, v58);
      id v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      os_log_type_t v61 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v60, v61))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[PrepareVideoAnalysisResults]";
        _os_log_impl((void *)&_mh_execute_header, v60, v61, "%@ Parsing video scene results", buf, 0xCu);
      }
    }

    v224 = (void *)objc_claimAutoreleasedReturnValue([v217 objectForKeyedSubscript:MediaAnalysisClassificationResultsKey]);
    NSErrorUserInfoKey v62 = (void *)objc_claimAutoreleasedReturnValue(+[PFSceneTaxonomy vcp_sharedTaxonomy](&OBJC_CLASS___PFSceneTaxonomy, "vcp_sharedTaxonomy"));
    v238 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    unint64_t v227 = 0LL;
    *(void *)v219 = MediaAnalysisResultAttributesKey;
    os_log_type_t type = VCPLogToOSLogType[7];
    os_log_type_t v232 = VCPLogToOSLogType[3];
    while (v227 < (unint64_t)[v224 count])
    {
      context = objc_autoreleasePoolPush();
      NSErrorUserInfoKey v63 = (void *)objc_claimAutoreleasedReturnValue([v224 objectAtIndexedSubscript:v227]);
      uint64_t v64 = v63;
      v223 = v63;
      if (v63)
      {
        objc_msgSend(v63, "vcp_timerange");
      }

      else
      {
        __int128 v262 = 0u;
        memset(buf, 0, sizeof(buf));
      }

      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:*(void *)v219]);
      __int128 v253 = 0u;
      __int128 v254 = 0u;
      __int128 v251 = 0u;
      __int128 v252 = 0u;
      id v66 = v65;
      id v67 = [v66 countByEnumeratingWithState:&v251 objects:v260 count:16];
      if (v67)
      {
        uint64_t v68 = *(void *)v252;
        do
        {
          uint64_t v69 = 0LL;
          do
          {
            if (*(void *)v252 != v68) {
              objc_enumerationMutation(v66);
            }
            uint64_t v70 = *(void **)(*((void *)&v251 + 1) + 8LL * (void)v69);
            v71 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:v70]);
            [v71 floatValue];
            float v73 = v72;

            BOOL v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "nodeForSceneClassId:", objc_msgSend(v70, "intValue")));
            uint64_t v75 = v74;
            if (v74 && [v74 networkId] == (id)1)
            {
              uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue([v75 name]);
              uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v238 objectForKeyedSubscript:v76]);
              BOOL v78 = v77 == 0LL;

              if (v78)
              {
                uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                v80 = (void *)objc_claimAutoreleasedReturnValue([v75 name]);
                [v238 setObject:v79 forKeyedSubscript:v80];
              }

              v250[0] = *(_OWORD *)buf;
              v250[1] = *(_OWORD *)&buf[16];
              v250[2] = v262;
              uint64_t v81 = objc_claimAutoreleasedReturnValue( +[MADSceneClassificationVideoEntry entryWithTimeRange:confidence:boundingBox:]( &OBJC_CLASS___MADSceneClassificationVideoEntry,  "entryWithTimeRange:confidence:boundingBox:",  v250,  v73,  CGRectNull.origin.x,  CGRectNull.origin.y,  CGRectNull.size.width,  CGRectNull.size.height));
              uint64_t v83 = (void *)v81;
              if (v81)
              {
                uint64_t v84 = MediaAnalysisLogLevel(v81, v82);
                if ((int)v84 >= 7)
                {
                  uint64_t v86 = VCPLogInstance(v84, v85);
                  uint64_t v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
                  if (os_log_type_enabled(v87, type))
                  {
                    *(_DWORD *)v256 = 138412546;
                    v257 = @"[PrepareVideoAnalysisResults]";
                    __int16 v258 = 2112;
                    v259 = v83;
                    _os_log_impl((void *)&_mh_execute_header, v87, type, "%@ Adding entry %@", v256, 0x16u);
                  }
                }

                uint64_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue([v75 name]);
                id v89 = (void *)objc_claimAutoreleasedReturnValue([v238 objectForKeyedSubscript:v88]);
                [v89 addObject:v83];

                goto LABEL_56;
              }

              uint64_t v90 = MediaAnalysisLogLevel(0LL, v82);
              if ((int)v90 >= 3)
              {
                uint64_t v92 = VCPLogInstance(v90, v91);
                uint64_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
                if (os_log_type_enabled(v88, v232))
                {
                  v93 = (void *)objc_claimAutoreleasedReturnValue([v75 name]);
                  *(_DWORD *)v256 = 138412546;
                  v257 = @"[PrepareVideoAnalysisResults]";
                  __int16 v258 = 2112;
                  v259 = v93;
                  _os_log_impl( (void *)&_mh_execute_header,  v88,  v232,  "%@ Failed to create entry for label %@; skip",
                    v256,
                    0x16u);
                }

- (unint64_t)_videoAnalysisTypes
{
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000879E4;
  v21[3] = &unk_1001BC230;
  v21[4] = self;
  v2 = objc_retainBlock(v21);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___MADExposureImageRequest);
  uint64_t v4 = ((uint64_t (*)(void *, uint64_t))v2[2])(v2, v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MADSharpnessImageRequest);
  uint64_t v7 = ((uint64_t (*)(void *, uint64_t))v2[2])(v2, v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MADSceneClassificationVideoRequest);
  uint64_t v10 = ((uint64_t (*)(void *, uint64_t))v2[2])(v2, v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___MADFaceDetectionVideoRequest);
  uint64_t v13 = ((uint64_t (*)(void *, uint64_t))v2[2])(v2, v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___MADMovieCurationRequest);
  uint64_t v16 = ((uint64_t (*)(void *, uint64_t))v2[2])(v2, v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (v8) {
    unint64_t v18 = ((unint64_t)(v5 != 0LL) << 19) | 0x200;
  }
  else {
    unint64_t v18 = (unint64_t)(v5 != 0LL) << 19;
  }
  if (v11) {
    v18 |= 0xC0uLL;
  }
  if (v14) {
    v18 |= 0xCuLL;
  }
  if (v17) {
    unint64_t v19 = v18 | 0x40000;
  }
  else {
    unint64_t v19 = v18;
  }

  return v19;
}

- (id)_partialAnalysisURL
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"partialResult-%@.data",  self->_requestID));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_resultDirectoryURL, "URLByAppendingPathComponent:", v3));

  return v4;
}

- (void)_savePartialAnalysis:(id)a3 assetIdentifierType:(id)a4 assetIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[SavePartialAnalysis][%@]",  v10));
  uint64_t v13 = (void *)v11;
  if (!v8)
  {
    uint64_t v21 = MediaAnalysisLogLevel(v11, v12);
    uint64_t v23 = VCPLogInstance(v21, v22);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    os_log_type_t v25 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v24, v25))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v76 = v13;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "%@ No partial analysis to store", buf, 0xCu);
    }

- (int)_processVideoAnalysis:(id)a3 analysisError:(id)a4 assetIdentifierType:(id)a5 assetIdentifier:(id)a6
{
  id v44 = a3;
  id v45 = a4;
  id v47 = a5;
  id v46 = a6;
  unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[ProcessVideoAnalysis][%@]",  v46));
  uint64_t v11 = MediaAnalysisLogLevel(v43, v10);
  if ((int)v11 >= 6)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v54 = v43;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "%@ Process video analysis results", buf, 0xCu);
    }
  }

  if (v45)
  {
    if ([v45 code] == (id)-128) {
      -[MADComputeServiceProcessingTask _savePartialAnalysis:assetIdentifierType:assetIdentifier:]( self,  "_savePartialAnalysis:assetIdentifierType:assetIdentifier:",  v44,  v47,  v46);
    }
    double totalTaskCount = self->_totalTaskCount;
    double finishedTaskCount = self->_finishedTaskCount;
    self->_double finishedTaskCount = finishedTaskCount + 1.0;
    (*((void (**)(double))self->_progressHandler + 2))((finishedTaskCount + 1.0) / totalTaskCount);
    unsigned int v18 = [v47 isEqualToString:@"filePath"];
    id resultsHandler = (void (**)(id, void *, void, id))self->_resultsHandler;
    if (v18)
    {
      os_log_type_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v46));
      resultsHandler[2](resultsHandler, v20, 0LL, v45);
    }

    else
    {
      resultsHandler[2](self->_resultsHandler, v46, 0LL, v45);
    }

    int v40 = [v45 code];
  }

  else
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "vcp_results"));
    objc_super v42 = (void *)objc_claimAutoreleasedReturnValue( -[MADComputeServiceProcessingTask _prepareVideoAnalysisResults:]( self,  "_prepareVideoAnalysisResults:",  v21));

    double v23 = self->_totalTaskCount;
    double v22 = self->_finishedTaskCount;
    self->_double finishedTaskCount = v22 + 1.0;
    uint64_t v24 = (*((uint64_t (**)(double))self->_progressHandler + 2))((v22 + 1.0) / v23);
    uint64_t v26 = MediaAnalysisLogLevel(v24, v25);
    if ((int)v26 >= 6)
    {
      uint64_t v28 = VCPLogInstance(v26, v27);
      os_log_type_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      os_log_type_t v30 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v29, v30))
      {
        id v31 = [v42 count];
        *(_DWORD *)buf = 138412546;
        uint64_t v54 = v43;
        __int16 v55 = 2048;
        id v56 = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "%@ Calling result handler with %lu results", buf, 0x16u);
      }
    }

    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v32 = v42;
    id v33 = [v32 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v49;
      do
      {
        for (unint64_t i = 0LL; i != v33; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v49 != v34) {
            objc_enumerationMutation(v32);
          }
          uint64_t v36 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)i);
          unsigned int v37 = [v47 isEqualToString:@"filePath"];
          uint64_t v38 = (void (**)(id, void *, uint64_t, void))self->_resultsHandler;
          if (v37)
          {
            BOOL v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v46));
            v38[2](v38, v39, v36, 0LL);
          }

          else
          {
            v38[2](self->_resultsHandler, v46, v36, 0LL);
          }
        }

        id v33 = [v32 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }

      while (v33);
    }

    objc_storeStrong((id *)&self->_resumedAssetIdentifier, a6);
    int v40 = 0;
  }

  return v40;
}

- (id)_processVideoAsset:(id)a3 partialAnalysis:(id)a4 analysisTypes:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v98 = a4;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
  uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[ProcessVideoAsset][%@]",  v11));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 photoLibrary]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseReader databaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseReader,  "databaseForPhotoLibrary:",  v12));

  uint64_t v14 = MediaAnalysisResultsTypesForAnalysisTypes(a5);
  os_log_type_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 queryAnalysisForAsset:v16 withTypes:v15]);

  if (!v17) {
    goto LABEL_17;
  }
  signed int v18 = objc_msgSend(v17, "vcp_version");
  if (v18 < MediaAnalysisMinValidVersion)
  {

LABEL_17:
    id v29 = 0LL;
    goto LABEL_18;
  }

  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "vcp_dateModified"));
  os_log_type_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "vcp_modificationDate"));
  unsigned __int8 v21 = [v19 isEqualToDate:v20];

  if ((v21 & 1) == 0)
  {
    uint64_t v37 = MediaAnalysisLogLevel(v22, v23);
    if ((int)v37 >= 7)
    {
      uint64_t v39 = VCPLogInstance(v37, v38);
      int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      os_log_type_t v41 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v40, v41))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v99;
        _os_log_impl((void *)&_mh_execute_header, v40, v41, "%@ Existing analysis based on old modification", buf, 0xCu);
      }
    }

    goto LABEL_17;
  }

  objc_msgSend(v17, "vcp_degraded");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v10));
  id v25 = [v10 mediaType];
  uint64_t v26 = (id *)&OBJC_CLASS___VCPPhotoAnalyzer_ptr;
  if (v25 != (id)1) {
    uint64_t v26 = (id *)&OBJC_CLASS___VCPMovieAnalyzer_ptr;
  }
  unsigned int v27 = [*v26 canAnalyzeUndegraded:v10 withResources:v24];
  uint64_t v28 = MediaAnalysisStripOutdatedAnalysis(v10, v17);
  id v29 = (id)objc_claimAutoreleasedReturnValue(v28);

  id v30 = objc_msgSend(v29, "vcp_degraded");
  if ((v30 & v27) == 1)
  {
    uint64_t v32 = MediaAnalysisLogLevel(v30, v31);
    if ((int)v32 >= 7)
    {
      uint64_t v34 = VCPLogInstance(v32, v33);
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      os_log_type_t v36 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v35, v36))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v99;
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "%@ Existing analysis based on degraded asset", buf, 0xCu);
      }

- (int)_resumePausedVideoAnalysis
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADComputeServiceProcessingTask _partialAnalysisURL](self, "_partialAnalysisURL"));
  BOOL v4 = -[NSURL startAccessingSecurityScopedResource](self->_resultDirectoryURL, "startAccessingSecurityScopedResource");
  if (v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v3));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v7 removeItemAtURL:v3 error:0];

    id v8 = -[NSURL stopAccessingSecurityScopedResource](self->_resultDirectoryURL, "stopAccessingSecurityScopedResource");
    if (v6)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"analysis"]);
      if (v11)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"identifierType"]);
        double v123 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"assetIdentifier"]);
        if (([v12 isEqualToString:@"filePath"] & 1) == 0)
        {
          id v13 = [v12 isEqualToString:@"localIdentifier"];
          if ((v13 & 1) == 0)
          {
            uint64_t v77 = MediaAnalysisLogLevel(v13, v14);
            os_log_type_t v15 = @"[ResumePausedVideoAnalysis]";
            if ((int)v77 >= 3)
            {
              uint64_t v79 = VCPLogInstance(v77, v78);
              v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
              os_log_type_t v81 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v80, v81))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = @"[ResumePausedVideoAnalysis]";
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v12;
                _os_log_impl( (void *)&_mh_execute_header,  v80,  v81,  "%@ Unsupported asset identifier type %@",  buf,  0x16u);
              }
            }

            goto LABEL_67;
          }
        }

        os_log_type_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[ResumePausedVideoAnalysis][%@]",  v123));
        uint64_t v17 = MediaAnalysisLogLevel(v15, v16);
        if ((int)v17 >= 5)
        {
          uint64_t v19 = VCPLogInstance(v17, v18);
          os_log_type_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          os_log_type_t v21 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v20, v21))
          {
            requestID = self->_requestID;
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v15;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = requestID;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "%@ Loaded partial analysis for request %@ ",  buf,  0x16u);
          }
        }

        id v23 = objc_msgSend(v11, "vcp_syncPoint");
        if ((v138.flags & 1) == 0)
        {
          uint64_t v25 = MediaAnalysisLogLevel(v23, v24);
          if ((int)v25 < 4)
          {
LABEL_67:
            int v39 = -50;
LABEL_78:

LABEL_79:
            goto LABEL_80;
          }

          uint64_t v27 = VCPLogInstance(v25, v26);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          os_log_type_t v29 = VCPLogToOSLogType[4];
          if (!os_log_type_enabled((os_log_t)v28, v29))
          {
LABEL_15:

            goto LABEL_67;
          }

          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v15;
          id v30 = "%@ Invalid sync point in paused analysis";
          uint64_t v31 = (os_log_s *)v28;
          os_log_type_t v32 = v29;
          uint32_t v33 = 12;
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v31, v32, v30, buf, v33);
          goto LABEL_15;
        }

        uint64_t v48 = MediaAnalysisLogLevel(v23, v24);
        if ((int)v48 >= 6)
        {
          uint64_t v50 = VCPLogInstance(v48, v49);
          uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          os_log_type_t v52 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v51, v52))
          {
            CMTime time = v138;
            Float64 Seconds = CMTimeGetSeconds(&time);
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v15;
            *(_WORD *)&buf[12] = 2048;
            *(Float64 *)&buf[14] = Seconds;
            *(_WORD *)&buf[22] = 2048;
            CMTimeValue value = v138.value;
            LOWORD(v145) = 1024;
            *(_DWORD *)((char *)&v145 + 2) = v138.timescale;
            _os_log_impl( (void *)&_mh_execute_header,  v51,  v52,  "%@ Resume from sync point: %0.3fs (value: %lld, timescale: %d)",  buf,  0x26u);
          }
        }

        unint64_t v54 = -[MADComputeServiceProcessingTask _videoAnalysisTypes](self, "_videoAnalysisTypes");
        if ([v12 isEqualToString:@"filePath"])
        {
          context = objc_autoreleasePoolPush();
          uint64_t v56 = MediaAnalysisLogLevel(context, v55);
          if ((int)v56 >= 6)
          {
            uint64_t v58 = VCPLogInstance(v56, v57);
            os_log_type_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
            os_log_type_t v60 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v59, v60))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v15;
              _os_log_impl((void *)&_mh_execute_header, v59, v60, "%@ Resume processing with URL ...", buf, 0xCu);
            }
          }

          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          CMTimeValue value = (CMTimeValue)sub_1000891AC;
          uint64_t v145 = sub_1000891BC;
          id v146 = 0LL;
          uint64_t v131 = 0LL;
          v132 = &v131;
          uint64_t v133 = 0x3032000000LL;
          uint64_t v134 = sub_1000891AC;
          uint64_t v135 = sub_1000891BC;
          id v136 = 0LL;
          unint64_t v61 = v54;
          dispatch_semaphore_t v62 = dispatch_semaphore_create(0LL);
          v126[0] = _NSConcreteStackBlock;
          v126[1] = 3221225472LL;
          v126[2] = sub_10008A11C;
          v126[3] = &unk_1001BC280;
          id v114 = v15;
          v127 = v114;
          uint64_t v129 = &v131;
          uint64_t v130 = buf;
          dispatch_semaphore_t dsema = v62;
          dispatch_semaphore_t v128 = dsema;
          BOOL v121 = objc_retainBlock(v126);
          v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v123));
          id v142 = v119;
          uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v142,  1LL));
          uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFullAnalysisURLProcessingTask taskForURLAsset:withOptions:analysisTypes:progressHandler:completionHandler:]( &OBJC_CLASS___VCPFullAnalysisURLProcessingTask,  "taskForURLAsset:withOptions:analysisTypes:progressHandler:completionHandler:",  v63,  0LL,  v61,  0LL,  v121));

          [v64 setPartialAnalysis:v11];
          v125[0] = _NSConcreteStackBlock;
          v125[1] = 3221225472LL;
          v125[2] = sub_10008A2EC;
          v125[3] = &unk_1001B9E98;
          v125[4] = self;
          [v64 runWithCancelBlock:v125];
          dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
          if ([(id)v132[5] code] == (id)-128)
          {
            uint64_t v65 = objc_claimAutoreleasedReturnValue([v64 partialAnalysis]);
            unint64_t v66 = *(void **)(*(void *)&buf[8] + 40LL);
            *(void *)(*(void *)&buf[8] + 40LL) = v65;
          }

          uint64_t v67 = *(void *)(*(void *)&buf[8] + 40LL);
          uint64_t v68 = v132[5];
          uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v119 path]);
          LOBYTE(v67) = -[MADComputeServiceProcessingTask _processVideoAnalysis:analysisError:assetIdentifierType:assetIdentifier:]( self,  "_processVideoAnalysis:analysisError:assetIdentifierType:assetIdentifier:",  v67,  v68,  @"filePath",  v69) == 0;

          if ((v67 & 1) != 0)
          {
            int v39 = 0;
          }

          else
          {
            uint64_t v72 = MediaAnalysisLogLevel(v70, v71);
            if ((int)v72 >= 3)
            {
              uint64_t v74 = VCPLogInstance(v72, v73);
              id v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
              os_log_type_t v76 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v75, v76))
              {
                *(_DWORD *)uint64_t v140 = 138412290;
                uint64_t v141 = v114;
                _os_log_impl( (void *)&_mh_execute_header,  v75,  v76,  "%@ Failed to analyze with partial analysis",  v140,  0xCu);
              }
            }

            int v39 = -18;
          }

          _Block_object_dispose(&v131, 8);
          _Block_object_dispose(buf, 8);

          objc_autoreleasePoolPop(context);
          goto LABEL_78;
        }

        id v82 = [v12 isEqualToString:@"localIdentifier"];
        if (!(_DWORD)v82)
        {
          uint64_t v105 = MediaAnalysisLogLevel(v82, v83);
          uint64_t v107 = VCPLogInstance(v105, v106);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v107);
          os_log_type_t v108 = VCPLogToOSLogType[3];
          if (!os_log_type_enabled((os_log_t)v28, v108)) {
            goto LABEL_15;
          }
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v12;
          id v30 = "%@ Unsupported asset identifier type %@; skip resuming";
          uint64_t v31 = (os_log_s *)v28;
          os_log_type_t v32 = v108;
          uint32_t v33 = 22;
          goto LABEL_14;
        }

        contexta = objc_autoreleasePoolPush();
        uint64_t v85 = MediaAnalysisLogLevel(contexta, v84);
        if ((int)v85 >= 6)
        {
          uint64_t v87 = VCPLogInstance(v85, v86);
          uint64_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
          os_log_type_t v89 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v88, v89))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v88,  v89,  "%@ Resume processing with localIdentifier ...",  buf,  0xCu);
          }
        }

        uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
        v122 = (void *)objc_claimAutoreleasedReturnValue([v90 photoLibraryWithURL:self->_photoLibraryURL]);

        v120 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v122,  1LL));
        uint64_t v139 = v123;
        uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v139, 1LL));
        uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v91,  v120));
        dispatch_semaphore_t dsemaa = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue([v92 firstObject]);

        dispatch_semaphore_t v95 = dsemaa;
        if (dsemaa)
        {
          id v124 = 0LL;
          uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue( -[MADComputeServiceProcessingTask _processVideoAsset:partialAnalysis:analysisTypes:error:]( self,  "_processVideoAsset:partialAnalysis:analysisTypes:error:",  dsemaa,  v11,  v54,  &v124));
          uint64_t v97 = (os_log_s *)v124;
          uint64_t v98 = -[MADComputeServiceProcessingTask _processVideoAnalysis:analysisError:assetIdentifierType:assetIdentifier:]( self,  "_processVideoAnalysis:analysisError:assetIdentifierType:assetIdentifier:",  v96,  v97,  @"localIdentifier",  v123);
          if ((_DWORD)v98)
          {
            uint64_t v100 = MediaAnalysisLogLevel(v98, v99);
            if ((int)v100 >= 3)
            {
              uint64_t v102 = VCPLogInstance(v100, v101);
              uint64_t v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
              os_log_type_t v104 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v103, v104))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v15;
                _os_log_impl( (void *)&_mh_execute_header,  v103,  v104,  "%@ Failed to analyze with partial analysis",  buf,  0xCu);
              }
            }

            int v39 = -18;
          }

          else
          {
            int v39 = 0;
          }
        }

        else
        {
          uint64_t v109 = MediaAnalysisLogLevel(v93, v94);
          if ((int)v109 < 3)
          {
            int v39 = -18;
            goto LABEL_77;
          }

          uint64_t v111 = VCPLogInstance(v109, v110);
          uint64_t v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
          os_log_type_t v112 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v97, v112))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v15;
            _os_log_impl((void *)&_mh_execute_header, v97, v112, "%@ Failed to fetch asset", buf, 0xCu);
          }

          int v39 = -18;
        }

        dispatch_semaphore_t v95 = dsemaa;
LABEL_77:

        objc_autoreleasePoolPop(contexta);
        goto LABEL_78;
      }

      uint64_t v44 = MediaAnalysisLogLevel(0LL, v10);
      if ((int)v44 >= 7)
      {
        uint64_t v46 = VCPLogInstance(v44, v45);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v46);
        os_log_type_t v47 = VCPLogToOSLogType[7];
        os_log_type_t v15 = @"[ResumePausedVideoAnalysis]";
        if (os_log_type_enabled((os_log_t)v12, v47))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = @"[ResumePausedVideoAnalysis]";
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, v47, "%@ Invalid partial analysis", buf, 0xCu);
        }

        int v39 = -19;
        goto LABEL_79;
      }

      int v39 = -19;
      os_log_type_t v15 = @"[ResumePausedVideoAnalysis]";
    }

    else
    {
      uint64_t v40 = MediaAnalysisLogLevel(v8, v9);
      if ((int)v40 < 6)
      {
        int v39 = 0;
        os_log_type_t v15 = @"[ResumePausedVideoAnalysis]";
LABEL_81:

        goto LABEL_82;
      }

      uint64_t v42 = VCPLogInstance(v40, v41);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v42);
      os_log_type_t v43 = VCPLogToOSLogType[6];
      os_log_type_t v15 = @"[ResumePausedVideoAnalysis]";
      if (os_log_type_enabled((os_log_t)v11, v43))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[ResumePausedVideoAnalysis]";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, v43, "%@ No partial analysis to resume", buf, 0xCu);
      }

      int v39 = 0;
    }

- (void)_processVideoAssetURLs
{
  uint64_t v2 = MediaAnalysisLogLevel(self, a2);
  if ((int)v2 >= 7)
  {
    uint64_t v4 = VCPLogInstance(v2, v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    os_log_type_t v6 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v5, v6))
    {
      NSUInteger v7 = -[NSArray count](self->_assetURLs, "count");
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = @"[ProcessVideoAssetURL]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ Processing %lu assetURLs ... ", buf, 0x16u);
    }
  }

  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id obj = self->_assetURLs;
  id v53 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v67,  v80,  16LL);
  if (v53)
  {
    uint64_t v52 = *(void *)v68;
    os_log_type_t type = VCPLogToOSLogType[6];
    os_log_type_t v49 = VCPLogToOSLogType[3];
    *(void *)&__int128 v8 = 138412290LL;
    __int128 v48 = v8;
    do
    {
      for (unint64_t i = 0LL; i != v53; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v68 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_autoreleasePoolPush();
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
        unsigned int v13 = [v12 isEqualToString:self->_resumedAssetIdentifier];

        if (!v13)
        {
          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          uint64_t v77 = sub_1000891AC;
          uint64_t v78 = sub_1000891BC;
          id v79 = 0LL;
          uint64_t v61 = 0LL;
          dispatch_semaphore_t v62 = &v61;
          uint64_t v63 = 0x3032000000LL;
          uint64_t v64 = sub_1000891AC;
          uint64_t v65 = sub_1000891BC;
          id v66 = 0LL;
          dispatch_semaphore_t v20 = dispatch_semaphore_create(0LL);
          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472LL;
          v56[2] = sub_10008A978;
          v56[3] = &unk_1001BC280;
          uint64_t v57 = @"[ProcessVideoAssetURL]";
          os_log_type_t v59 = &v61;
          os_log_type_t v60 = buf;
          os_log_type_t v21 = v20;
          uint64_t v58 = v21;
          uint64_t v22 = objc_retainBlock(v56);
          uint64_t v24 = MediaAnalysisLogLevel(v22, v23);
          if ((int)v24 >= 6)
          {
            uint64_t v26 = VCPLogInstance(v24, v25);
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, type))
            {
              *(_DWORD *)uint64_t v72 = 138412546;
              uint64_t v73 = @"[ProcessVideoAssetURL]";
              __int16 v74 = 2112;
              id v75 = v10;
              _os_log_impl((void *)&_mh_execute_header, v27, type, "%@[%@] Start processing ...", v72, 0x16u);
            }
          }

          uint64_t v71 = v10;
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v71,  1LL,  v48));
          os_log_type_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFullAnalysisURLProcessingTask taskForURLAsset:withOptions:analysisTypes:progressHandler:completionHandler:]( &OBJC_CLASS___VCPFullAnalysisURLProcessingTask,  "taskForURLAsset:withOptions:analysisTypes:progressHandler:completionHandler:",  v28,  0LL,  -[MADComputeServiceProcessingTask _videoAnalysisTypes](self, "_videoAnalysisTypes"),  0LL,  v22));

          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472LL;
          v55[2] = sub_10008AB48;
          v55[3] = &unk_1001B9E98;
          v55[4] = self;
          id v30 = objc_retainBlock(v55);
          [v29 runWithCancelBlock:v30];
          dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
          if ([(id)v62[5] code] == (id)-128)
          {
            uint64_t v31 = objc_claimAutoreleasedReturnValue([v29 partialAnalysis]);
            os_log_type_t v32 = *(void **)(*(void *)&buf[8] + 40LL);
            *(void *)(*(void *)&buf[8] + 40LL) = v31;
          }

          uint64_t v33 = *(void *)(*(void *)&buf[8] + 40LL);
          uint64_t v34 = v62[5];
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
          LODWORD(v34) = -[MADComputeServiceProcessingTask _processVideoAnalysis:analysisError:assetIdentifierType:assetIdentifier:]( self,  "_processVideoAnalysis:analysisError:assetIdentifierType:assetIdentifier:",  v33,  v34,  @"filePath",  v35) == 0;

          if ((_DWORD)v34)
          {
            uint64_t v45 = MediaAnalysisLogLevel(v36, v37);
            if ((int)v45 >= 6)
            {
              uint64_t v47 = VCPLogInstance(v45, v46);
              uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
              if (os_log_type_enabled(v41, type))
              {
                *(_DWORD *)uint64_t v72 = 138412546;
                uint64_t v73 = @"[ProcessVideoAssetURL]";
                __int16 v74 = 2112;
                id v75 = v10;
                uint64_t v42 = v41;
                os_log_type_t v43 = type;
                uint64_t v44 = "%@[%@] Processed analysis";
LABEL_28:
                _os_log_impl((void *)&_mh_execute_header, v42, v43, v44, v72, 0x16u);
              }

- (void)_processVideoLocalIdentifiers
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 7)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    os_log_type_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v6, v7))
    {
      NSUInteger v8 = -[NSArray count](self->_localIdentifiers, "count");
      *(_DWORD *)buf = 138412546;
      uint64_t v50 = @"[ProcessVideoAsset]";
      __int16 v51 = 2048;
      NSUInteger v52 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "%@ Processing %lu localIdentifiers ... ", buf, 0x16u);
    }
  }

  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithArray:]( &OBJC_CLASS___NSMutableArray,  "arrayWithArray:",  self->_localIdentifiers));
  id v9 = [v46 containsObject:self->_resumedAssetIdentifier];
  if ((_DWORD)v9)
  {
    uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v11 >= 6)
    {
      uint64_t v13 = VCPLogInstance(v11, v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      os_log_type_t v15 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = @"[ProcessVideoAsset]";
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "%@ Resume processed; skip re-process", buf, 0xCu);
      }
    }

    [v46 removeObject:self->_resumedAssetIdentifier];
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v16 photoLibraryWithURL:self->_photoLibraryURL]);

  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v45,  1LL));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v46));
  unint64_t v18 = 0LL;
  os_log_type_t v19 = VCPLogToOSLogType[6];
  os_log_type_t type = VCPLogToOSLogType[3];
  while (v18 < (unint64_t)[v17 count])
  {
    dispatch_semaphore_t v20 = objc_autoreleasePoolPush();
    os_log_type_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:v18]);
    uint64_t v23 = MediaAnalysisLogLevel(v21, v22);
    if ((int)v23 >= 6)
    {
      uint64_t v25 = VCPLogInstance(v23, v24);
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, v19))
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v21 localIdentifier]);
        *(_DWORD *)buf = 138412546;
        uint64_t v50 = @"[ProcessVideoAsset]";
        __int16 v51 = 2112;
        NSUInteger v52 = (NSUInteger)v27;
        _os_log_impl((void *)&_mh_execute_header, v26, v19, "%@[%@] Start processing ...", buf, 0x16u);
      }
    }

    unint64_t v28 = -[MADComputeServiceProcessingTask _videoAnalysisTypes](self, "_videoAnalysisTypes");
    id v48 = 0LL;
    os_log_type_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[MADComputeServiceProcessingTask _processVideoAsset:partialAnalysis:analysisTypes:error:]( self,  "_processVideoAsset:partialAnalysis:analysisTypes:error:",  v21,  0LL,  v28,  &v48));
    id v30 = v48;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v21 localIdentifier]);
    BOOL v32 = -[MADComputeServiceProcessingTask _processVideoAnalysis:analysisError:assetIdentifierType:assetIdentifier:]( self,  "_processVideoAnalysis:analysisError:assetIdentifierType:assetIdentifier:",  v29,  v30,  @"localIdentifier",  v31) == 0;

    if (v32)
    {
      uint64_t v40 = MediaAnalysisLogLevel(v33, v34);
      uint64_t v42 = VCPLogInstance(v40, v41);
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v38, v19))
      {
        os_log_type_t v43 = (void *)objc_claimAutoreleasedReturnValue([v21 localIdentifier]);
        *(_DWORD *)buf = 138412546;
        uint64_t v50 = @"[ProcessVideoAsset]";
        __int16 v51 = 2112;
        NSUInteger v52 = (NSUInteger)v43;
        _os_log_impl((void *)&_mh_execute_header, v38, v19, "%@[%@] Processed analysis", buf, 0x16u);
      }
    }

    else
    {
      uint64_t v35 = MediaAnalysisLogLevel(v33, v34);
      uint64_t v37 = VCPLogInstance(v35, v36);
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, type))
      {
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v21 localIdentifier]);
        *(_DWORD *)buf = 138412546;
        uint64_t v50 = @"[ProcessVideoAsset]";
        __int16 v51 = 2112;
        NSUInteger v52 = (NSUInteger)v39;
        _os_log_impl((void *)&_mh_execute_header, v38, type, "%@[%@] Failed to process analysis", buf, 0x16u);
      }
    }

LABEL_25:
    objc_autoreleasePoolPop(v20);
    ++v18;
  }
}

- (void)_processVideoRequests
{
  uint64_t v3 = objc_autoreleasePoolPush();
  -[MADComputeServiceProcessingTask _resumePausedVideoAnalysis](self, "_resumePausedVideoAnalysis");
  objc_autoreleasePoolPop(v3);
  NSUInteger v4 = -[NSArray count](self->_localIdentifiers, "count");
  uint64_t v5 = objc_autoreleasePoolPush();
  if (v4) {
    -[MADComputeServiceProcessingTask _processVideoLocalIdentifiers](self, "_processVideoLocalIdentifiers");
  }
  else {
    -[MADComputeServiceProcessingTask _processVideoAssetURLs](self, "_processVideoAssetURLs");
  }
  objc_autoreleasePoolPop(v5);
  uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v8 >= 6)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Finished processing video requests", v13, 2u);
    }
  }

- (int)run
{
  uint64_t v199 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADComputeServiceProcessingTask]"));
  uint64_t v4 = MediaAnalysisLogLevel(v199, v3);
  if ((int)v4 >= 6)
  {
    uint64_t v6 = VCPLogInstance(v4, v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v216 = (uint64_t)v199;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ Consuming secure scoped resource ... ", buf, 0xCu);
    }
  }

  unint64_t v9 = 0LL;
  os_log_type_t v10 = VCPLogToOSLogType[7];
  while (v9 < -[NSArray count](self->_assetURLs, "count"))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_assetURLs, "objectAtIndexedSubscript:", v9));
    unsigned int v12 = [v11 startAccessingSecurityScopedResource];

    uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
    if ((int)v15 >= 7)
    {
      uint64_t v17 = VCPLogInstance(v15, v16);
      unint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, v10))
      {
        uint64_t v19 = objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_assetURLs, "objectAtIndexedSubscript:", v9));
        dispatch_semaphore_t v20 = (void *)v19;
        *(_DWORD *)buf = 138412802;
        os_log_type_t v21 = @"failed";
        if (v12) {
          os_log_type_t v21 = @"success";
        }
        uint64_t v216 = (uint64_t)v199;
        __int16 v217 = 2112;
        uint64_t v218 = v19;
        __int16 v219 = 2112;
        os_log_type_t v220 = v21;
        _os_log_impl((void *)&_mh_execute_header, v18, v10, "%@ Consuming secure scoped URL %@ : %@", buf, 0x20u);
      }
    }

    ++v9;
  }

  uint64_t v200 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v22 = 0LL;
  os_log_type_t v197 = VCPLogToOSLogType[6];
  os_log_type_t v196 = VCPLogToOSLogType[3];
  os_log_type_t type = VCPLogToOSLogType[5];
  while (v22 < -[NSArray count](self->_requests, "count"))
  {
    uint64_t v23 = objc_autoreleasePoolPush();
    BOOL v24 = -[MADComputeServiceProcessingTask isCancelled](self, "isCancelled");
    BOOL v26 = v24;
    if (!v24)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_requests, "objectAtIndexedSubscript:", v22));
      uint64_t v31 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADComputeServiceProcessingTask][%@]",  objc_opt_class(v30));
      BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      uint64_t v34 = MediaAnalysisLogLevel(v32, v33);
      if ((int)v34 >= 6)
      {
        uint64_t v36 = VCPLogInstance(v34, v35);
        uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, v197))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v216 = (uint64_t)v32;
          __int16 v217 = 2112;
          uint64_t v218 = (uint64_t)v30;
          _os_log_impl((void *)&_mh_execute_header, v37, v197, "%@ Adding request ... %@ ", buf, 0x16u);
        }
      }

      uint64_t v38 = objc_opt_class(&OBJC_CLASS___MADSceneClassificationVideoRequest);
      if ((objc_opt_isKindOfClass(v30, v38) & 1) != 0
        || (uint64_t v39 = objc_opt_class(&OBJC_CLASS___MADFaceDetectionVideoRequest), (objc_opt_isKindOfClass(v30, v39) & 1) != 0)
        || (uint64_t v40 = objc_opt_class(&OBJC_CLASS___MADVideoVisionRequest), (objc_opt_isKindOfClass(v30, v40) & 1) != 0)
        || (uint64_t v41 = objc_opt_class(&OBJC_CLASS___MADVideoCoreMLRequest), (objc_opt_isKindOfClass(v30, v41) & 1) != 0)
        || (uint64_t v42 = objc_opt_class(&OBJC_CLASS___MADMovieCurationRequest), (objc_opt_isKindOfClass(v30, v42) & 1) != 0)
        || (uint64_t v43 = objc_opt_class(&OBJC_CLASS___MADExposureImageRequest), (objc_opt_isKindOfClass(v30, v43) & 1) != 0)
        || (uint64_t v44 = objc_opt_class(&OBJC_CLASS___MADSharpnessImageRequest), (objc_opt_isKindOfClass(v30, v44) & 1) != 0))
      {
        -[NSMutableArray addObject:](self->_videoProcessingRequests, "addObject:", v30);
LABEL_32:

LABEL_33:
        goto LABEL_34;
      }

      uint64_t v45 = objc_opt_class(&OBJC_CLASS___MADSceneClassificationImageRequest);
      if ((objc_opt_isKindOfClass(v30, v45) & 1) != 0)
      {
        uint64_t v46 = objc_claimAutoreleasedReturnValue( -[MADComputeServiceProcessingTask _prepareSceneAssetProcessingTask]( self,  "_prepareSceneAssetProcessingTask"));
        id v195 = (id)v46;
        if (v46) {
          goto LABEL_38;
        }
        if (-[NSArray count](self->_localIdentifiers, "count"))
        {
          NSErrorUserInfoKey v213 = NSLocalizedDescriptionKey;
          v188 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to issue request",  v32));
          v214 = v188;
          os_log_type_t v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v214,  &v213,  1LL));
          v192 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v49));

          uint64_t v52 = MediaAnalysisLogLevel(v50, v51);
          if ((int)v52 >= 3)
          {
            uint64_t v54 = VCPLogInstance(v52, v53);
            uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
            if (os_log_type_enabled(v55, v196))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v216 = (uint64_t)v192;
              _os_log_impl((void *)&_mh_execute_header, v55, v196, "%@", buf, 0xCu);
            }
          }

          goto LABEL_49;
        }

- (void).cxx_destruct
{
}

@end