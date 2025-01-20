@interface MADPhotosSceneFastPassProcessingTask
+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (BOOL)_processWithLocalIdentifiers:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)run:(id *)a3;
- (MADPhotosSceneFastPassProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (int)_requestAssetResource:(id)a3;
@end

@implementation MADPhotosSceneFastPassProcessingTask

- (MADPhotosSceneFastPassProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  v9 = (Block_layout *)a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100126D94;
  v19[3] = &unk_1001BADE0;
  id v10 = a5;
  id v20 = v10;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MADPhotosSceneFastPassProcessingTask;
  v11 = -[MADPhotosSceneFastPassProcessingTask initWithCompletionHandler:](&v18, "initWithCompletionHandler:", v19);
  if (v11)
  {
    if (v9) {
      v12 = v9;
    }
    else {
      v12 = &stru_1001BE108;
    }
    v13 = objc_retainBlock(v12);
    id progressHandler = v11->_progressHandler;
    v11->_id progressHandler = v13;

    dispatch_group_t v15 = dispatch_group_create();
    downloadGroup = v11->_downloadGroup;
    v11->_downloadGroup = (OS_dispatch_group *)v15;

    -[MADPhotosSceneFastPassProcessingTask setCancelBlock:](v11, "setCancelBlock:", v8);
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

- (BOOL)_processWithLocalIdentifiers:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc(&OBJC_CLASS___VCPMADSceneAssetProcessingTask);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 photoLibraryURL]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100127140;
  v20[3] = &unk_1001B9E98;
  v20[4] = self;
  v12 = -[VCPMADSceneAssetProcessingTask initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:]( v10,  "initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:",  v8,  v11,  v20,  self->_progressHandler,  &stru_1001BE128);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  [v13 pet];

  if (v12)
  {
    signed int v14 = -[VCPMADSceneAssetProcessingTask run](v12, "run");
    if (!v14)
    {
      BOOL v18 = 1;
      goto LABEL_7;
    }

    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    dispatch_group_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADPhotosSceneFastPassTask] Failed to process asset batch ... "));
    v22 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v14,  v16));
  }

  else
  {
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    dispatch_group_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADPhotosSceneFastPassTask] Failed to create asset batch ... "));
    v24 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v16));
  }

  *a5 = v17;

  BOOL v18 = 0;
LABEL_7:

  return v18;
}

- (int)_requestAssetResource:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assetLocalIdentifier]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Scene-FP][Download][%@]",  v5));

  uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v9 >= 7)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v6;
      __int16 v39 = 2112;
      id v40 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ Attempt to download resource: %@", buf, 0x16u);
    }
  }

  signed int v14 = objc_alloc_init(&OBJC_CLASS___PHAssetResourceRequestOptions);
  -[PHAssetResourceRequestOptions setNetworkAccessAllowed:](v14, "setNetworkAccessAllowed:", 1LL);
  -[PHAssetResourceRequestOptions setDownloadPriority:](v14, "setDownloadPriority:", 0LL);
  -[PHAssetResourceRequestOptions setDownloadIntent:](v14, "setDownloadIntent:", 2LL);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1001274AC;
  v35[3] = &unk_1001BC570;
  id v15 = v6;
  id v36 = v15;
  -[PHAssetResourceRequestOptions setProgressHandler:](v14, "setProgressHandler:", v35);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100127588;
  v33[3] = &unk_1001BCE78;
  id v16 = v15;
  id v34 = v16;
  v17 = objc_retainBlock(v33);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100127650;
  v30[3] = &unk_1001BCEA0;
  id v18 = v16;
  id v31 = v18;
  v32 = self;
  v19 = objc_retainBlock(v30);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetResourceManager defaultManager](&OBJC_CLASS___PHAssetResourceManager, "defaultManager"));
  int v21 = [v20 requestFileURLForAssetResource:v4 options:v14 urlReceivedHandler:v17 completionHandler:v19];

  if (!v21)
  {
    uint64_t v24 = MediaAnalysisLogLevel(v22, v23);
    if ((int)v24 >= 3)
    {
      uint64_t v26 = VCPLogInstance(v24, v25);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      os_log_type_t v28 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v18;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@ Failed to issue download request", buf, 0xCu);
      }
    }
  }

  return v21;
}

- (BOOL)run:(id *)a3
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 5)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v7))
    {
      *(_DWORD *)buf = 138412290;
      v208 = @"[Scene-FP]";
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "%@ Running MADPhotosSceneFastPassTask ... ", buf, 0xCu);
    }
  }

  uint64_t v8 = VCPSignPostLog(v3);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t spid = os_signpost_id_generate(v9);

  uint64_t v11 = VCPSignPostLog(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  os_log_type_t v13 = v12;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "MADPhotosSceneFastPassProcessingTask",  (const char *)&unk_100199097,  buf,  2u);
  }

  signed int v14 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary systemPhotoLibraryURL](&OBJC_CLASS___PHPhotoLibrary, "systemPhotoLibraryURL"));
  v197 = (void *)objc_claimAutoreleasedReturnValue([v14 photoLibraryWithURL:v15]);

  if (!v197)
  {
    NSErrorUserInfoKey v214 = NSLocalizedDescriptionKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue([0 photoLibraryURL]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to open Photo Library (%@)",  @"[Scene-FP]",  v18));
    v215 = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v215,  &v214,  1LL));
    id v198 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v20));

    uint64_t v23 = MediaAnalysisLogLevel(v21, v22);
    uint64_t v25 = a3;
    if ((int)v23 >= 3)
    {
      uint64_t v26 = VCPLogInstance(v23, v24);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      os_log_type_t v28 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue([v198 description]);
        *(_DWORD *)buf = 138412290;
        v208 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@", buf, 0xCu);
      }

      uint64_t v25 = a3;
    }

    if (!v25) {
      goto LABEL_23;
    }
LABEL_17:
    id v30 = v198;
    BOOL v31 = 0;
    id v32 = *v25;
    id v198 = v30;
    *uint64_t v25 = v30;
LABEL_122:

    goto LABEL_123;
  }

  if ([v197 isReadyForAnalysisCPLInitialDownloadCompleted])
  {
    if ([v197 isCloudPhotoLibraryEnabled])
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[VCPInternetReachability sharedInstance](&OBJC_CLASS___VCPInternetReachability, "sharedInstance"));
      unsigned int v191 = [v16 hasWifiOrEthernetConnection];
    }

    else
    {
      unsigned int v191 = 0;
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v45 pet];

    id v198 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v192 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v194 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v197,  2LL));
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"creationDate",  0LL));
    v211 = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v211, 1LL));
    [v194 setSortDescriptors:v47];

    [v194 setFetchLimit:2000];
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithOptions:](&OBJC_CLASS___PHAsset, "fetchAssetsWithOptions:", v194));
    uint64_t v50 = MediaAnalysisLogLevel(v48, v49);
    if ((int)v50 >= 6)
    {
      uint64_t v52 = VCPLogInstance(v50, v51);
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      os_log_type_t v54 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v53, v54))
      {
        id v55 = [v48 count];
        *(_DWORD *)buf = 138412546;
        v208 = @"[Scene-FP]";
        __int16 v209 = 2048;
        id v210 = v55;
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "%@ Evaluating %lu recently assets", buf, 0x16u);
      }
    }

    unint64_t v56 = 0LL;
    os_log_type_t v193 = VCPLogToOSLogType[7];
    os_log_type_t v190 = VCPLogToOSLogType[3];
    os_log_type_t type = VCPLogToOSLogType[5];
    while (v56 < (unint64_t)[v48 count])
    {
      v57 = objc_autoreleasePoolPush();
      v58 = (void *)objc_claimAutoreleasedReturnValue([v48 objectAtIndexedSubscript:v56]);
      v59 = (void *)objc_claimAutoreleasedReturnValue([v58 localIdentifier]);
      v60 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Scene-FP][Prepare][%@]",  v59));

      if (-[MADPhotosSceneFastPassProcessingTask isCanceled](self, "isCanceled"))
      {
        v61 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Processed canceled",  v60));
        uint64_t v63 = MediaAnalysisLogLevel(v61, v62);
        if ((int)v63 >= 5)
        {
          uint64_t v65 = VCPLogInstance(v63, v64);
          v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
          if (os_log_type_enabled(v66, type))
          {
            *(_DWORD *)buf = 138412290;
            v208 = v61;
            _os_log_impl((void *)&_mh_execute_header, v66, type, "%@", buf, 0xCu);
          }
        }

        if (a3)
        {
          NSErrorUserInfoKey v205 = NSLocalizedDescriptionKey;
          v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v61));
          v206 = v67;
          v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v206,  &v205,  1LL));
          v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v68));
          id v70 = *a3;
          *a3 = v69;
        }

        int v71 = 1;
      }

      else
      {
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
        [v72 pet];

        v73 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v58));
        v61 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "vcp_thumbnailResource"));

        if (v61)
        {
          id v76 = -[__CFString vcp_isLocallyAvailable](v61, "vcp_isLocallyAvailable");
          if ((_DWORD)v76)
          {
            uint64_t v78 = MediaAnalysisLogLevel(v76, v77);
            if ((int)v78 >= 7)
            {
              uint64_t v80 = VCPLogInstance(v78, v79);
              v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
              if (os_log_type_enabled(v81, v193))
              {
                *(_DWORD *)buf = 138412290;
                v208 = v60;
                _os_log_impl((void *)&_mh_execute_header, v81, v193, "%@ Thumbnail is ready for analysis", buf, 0xCu);
              }
            }

            v82 = (void *)objc_claimAutoreleasedReturnValue([v58 localIdentifier]);
            [v198 addObject:v82];
          }

          else if (v191)
          {
            v87 = (void *)objc_claimAutoreleasedReturnValue([v58 localIdentifier]);
            [v192 addObject:v87];

            uint64_t v90 = MediaAnalysisLogLevel(v88, v89);
            if ((int)v90 >= 7)
            {
              uint64_t v92 = VCPLogInstance(v90, v91);
              v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
              if (os_log_type_enabled(v93, v193))
              {
                *(_DWORD *)buf = 138412290;
                v208 = v60;
                _os_log_impl( (void *)&_mh_execute_header,  v93,  v193,  "%@ Initialting to download thumbnail ... ",  buf,  0xCu);
              }
            }

            dispatch_group_enter((dispatch_group_t)self->_downloadGroup);
            dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
            v95 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100128C60;
            block[3] = &unk_1001B9E70;
            block[4] = self;
            v61 = v61;
            v204 = v61;
            dispatch_async(v95, block);
          }

          int v71 = 0;
        }

        else
        {
          uint64_t v83 = MediaAnalysisLogLevel(v74, v75);
          if ((int)v83 >= 3)
          {
            uint64_t v85 = VCPLogInstance(v83, v84);
            v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
            if (os_log_type_enabled(v86, v190))
            {
              *(_DWORD *)buf = 138412290;
              v208 = v60;
              _os_log_impl( (void *)&_mh_execute_header,  v86,  v190,  "%@ Invalid thumbnail resource; skipping ...",
                buf,
                0xCu);
            }
          }

          int v71 = 16;
        }
      }

      objc_autoreleasePoolPop(v57);
      if ((v71 | 0x10) != 0x10) {
        goto LABEL_120;
      }
      ++v56;
    }

    if (![v198 count]) {
      goto LABEL_83;
    }
    v96 = objc_autoreleasePoolPush();
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v97 pet];

    uint64_t v100 = MediaAnalysisLogLevel(v98, v99);
    if ((int)v100 >= 6)
    {
      uint64_t v102 = VCPLogInstance(v100, v101);
      v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
      os_log_type_t v104 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v103, v104))
      {
        id v105 = [v198 count];
        *(_DWORD *)buf = 138412546;
        v208 = @"[Scene-FP]";
        __int16 v209 = 2048;
        id v210 = v105;
        _os_log_impl( (void *)&_mh_execute_header,  v103,  v104,  "%@ Processing %lu thumbnail-ready assets ... ",  buf,  0x16u);
      }
    }

    uint64_t v106 = VCPSignPostLog(v100);
    v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
    os_signpost_id_t v108 = os_signpost_id_generate(v107);

    uint64_t v110 = VCPSignPostLog(v109);
    v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
    v112 = v111;
    if (v108 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v111))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v112,  OS_SIGNPOST_INTERVAL_BEGIN,  v108,  "MADPhotosSceneFastPassProcessingTask_ProcessLocal",  (const char *)&unk_100199097,  buf,  2u);
    }

    id v202 = 0LL;
    unsigned __int8 v113 = -[MADPhotosSceneFastPassProcessingTask _processWithLocalIdentifiers:photoLibrary:error:]( self,  "_processWithLocalIdentifiers:photoLibrary:error:",  v198,  v197,  &v202);
    id v114 = v202;
    v116 = v114;
    if ((v113 & 1) != 0)
    {
      uint64_t v117 = MediaAnalysisLogLevel(v114, v115);
      if ((int)v117 >= 6)
      {
        uint64_t v119 = VCPLogInstance(v117, v118);
        v120 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
        os_log_type_t v121 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v120, v121))
        {
          *(_DWORD *)buf = 138412290;
          v208 = @"[Scene-FP]";
          _os_log_impl((void *)&_mh_execute_header, v120, v121, "%@ Processed thumbnail-ready assets", buf, 0xCu);
        }
      }

      uint64_t v122 = VCPSignPostLog(v117);
      v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v122);
      v124 = v123;
      if (v108 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v123))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v124,  OS_SIGNPOST_INTERVAL_END,  v108,  "MADPhotosSceneFastPassProcessingTask_ProcessLocal",  (const char *)&unk_100199097,  buf,  2u);
      }
    }

    else
    {
      if (a3)
      {
        id v125 = [v114 copy];
        id v126 = *a3;
        *a3 = v125;
      }

      uint64_t v127 = MediaAnalysisLogLevel(v114, v115);
      if ((int)v127 < 3)
      {
LABEL_82:

        objc_autoreleasePoolPop(v96);
        if ((v113 & 1) == 0) {
          goto LABEL_120;
        }
LABEL_83:
        id v130 = [v192 count];
        if (!v130)
        {
LABEL_116:
          uint64_t v185 = VCPSignPostLog(v130);
          v186 = (os_log_s *)objc_claimAutoreleasedReturnValue(v185);
          v187 = v186;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v186))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v187,  OS_SIGNPOST_INTERVAL_END,  spid,  "MADPhotosSceneFastPassProcessingTask",  (const char *)&unk_100199097,  buf,  2u);
          }

          v188 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[MADPhotosSceneFastPassProcessingTask completionHandler]( self,  "completionHandler"));
          v188[2](v188, 0LL, 0LL);

          BOOL v31 = 1;
LABEL_121:

          id v32 = v192;
          goto LABEL_122;
        }

        v131 = objc_autoreleasePoolPush();
        v132 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
        [v132 pet];

        uint64_t v135 = MediaAnalysisLogLevel(v133, v134);
        if ((int)v135 >= 6)
        {
          uint64_t v137 = VCPLogInstance(v135, v136);
          v138 = (os_log_s *)objc_claimAutoreleasedReturnValue(v137);
          os_log_type_t v139 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v138, v139))
          {
            id v140 = [v192 count];
            *(_DWORD *)buf = 138412546;
            v208 = @"[Scene-FP]";
            __int16 v209 = 2048;
            id v210 = v140;
            _os_log_impl( (void *)&_mh_execute_header,  v138,  v139,  "%@ Waiting for %lu thumbnails to download ... ",  buf,  0x16u);
          }
        }

        uint64_t v141 = VCPSignPostLog(v135);
        v142 = (os_log_s *)objc_claimAutoreleasedReturnValue(v141);
        os_signpost_id_t v143 = os_signpost_id_generate(v142);

        uint64_t v145 = VCPSignPostLog(v144);
        v146 = (os_log_s *)objc_claimAutoreleasedReturnValue(v145);
        v147 = v146;
        if (v143 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v146))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v147,  OS_SIGNPOST_INTERVAL_BEGIN,  v143,  "MADPhotosSceneFastPassProcessingTask_DownloadWait",  (const char *)&unk_100199097,  buf,  2u);
        }

        uint64_t v148 = dispatch_group_wait((dispatch_group_t)self->_downloadGroup, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v149 = VCPSignPostLog(v148);
        v150 = (os_log_s *)objc_claimAutoreleasedReturnValue(v149);
        v151 = v150;
        if (v143 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v150))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v151,  OS_SIGNPOST_INTERVAL_END,  v143,  "MADPhotosSceneFastPassProcessingTask_DownloadWait",  (const char *)&unk_100199097,  buf,  2u);
        }

        uint64_t v154 = MediaAnalysisLogLevel(v152, v153);
        if ((int)v154 >= 6)
        {
          uint64_t v156 = VCPLogInstance(v154, v155);
          v157 = (os_log_s *)objc_claimAutoreleasedReturnValue(v156);
          os_log_type_t v158 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v157, v158))
          {
            id v159 = [v192 count];
            *(_DWORD *)buf = 138412546;
            v208 = @"[Scene-FP]";
            __int16 v209 = 2048;
            id v210 = v159;
            _os_log_impl( (void *)&_mh_execute_header,  v157,  v158,  "%@ Processing %lu thumbnail-downloaded assets ... ",  buf,  0x16u);
          }
        }

        uint64_t v160 = VCPSignPostLog(v154);
        v161 = (os_log_s *)objc_claimAutoreleasedReturnValue(v160);
        os_signpost_id_t v162 = os_signpost_id_generate(v161);

        uint64_t v164 = VCPSignPostLog(v163);
        v165 = (os_log_s *)objc_claimAutoreleasedReturnValue(v164);
        v166 = v165;
        if (v162 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v165))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v166,  OS_SIGNPOST_INTERVAL_BEGIN,  v162,  "MADPhotosSceneFastPassProcessingTask_ProcessDownloaded",  (const char *)&unk_100199097,  buf,  2u);
        }

        v167 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
        [v167 pet];

        id v201 = 0LL;
        unsigned __int8 v168 = -[MADPhotosSceneFastPassProcessingTask _processWithLocalIdentifiers:photoLibrary:error:]( self,  "_processWithLocalIdentifiers:photoLibrary:error:",  v192,  v197,  &v201);
        id v169 = v201;
        v171 = v169;
        if ((v168 & 1) != 0)
        {
          uint64_t v172 = MediaAnalysisLogLevel(v169, v170);
          if ((int)v172 >= 6)
          {
            uint64_t v174 = VCPLogInstance(v172, v173);
            v175 = (os_log_s *)objc_claimAutoreleasedReturnValue(v174);
            os_log_type_t v176 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v175, v176))
            {
              *(_DWORD *)buf = 138412290;
              v208 = @"[Scene-FP]";
              _os_log_impl( (void *)&_mh_execute_header,  v175,  v176,  "%@ Processed thumbnail-downloaded assets",  buf,  0xCu);
            }
          }

          uint64_t v177 = VCPSignPostLog(v172);
          v178 = (os_log_s *)objc_claimAutoreleasedReturnValue(v177);
          v179 = v178;
          if (v162 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v178))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v179,  OS_SIGNPOST_INTERVAL_END,  v162,  "MADPhotosSceneFastPassProcessingTask_ProcessDownloaded",  (const char *)&unk_100199097,  buf,  2u);
          }
        }

        else
        {
          if (a3)
          {
            id v180 = [v169 copy];
            id v181 = *a3;
            *a3 = v180;
          }

          uint64_t v182 = MediaAnalysisLogLevel(v169, v170);
          if ((int)v182 < 3)
          {
LABEL_115:

            objc_autoreleasePoolPop(v131);
            if ((v168 & 1) != 0) {
              goto LABEL_116;
            }
LABEL_120:
            BOOL v31 = 0;
            goto LABEL_121;
          }

          uint64_t v184 = VCPLogInstance(v182, v183);
          v179 = (os_log_s *)objc_claimAutoreleasedReturnValue(v184);
          if (os_log_type_enabled(v179, v190))
          {
            *(_DWORD *)buf = 138412546;
            v208 = @"[Scene-FP]";
            __int16 v209 = 2112;
            id v210 = v171;
            _os_log_impl( (void *)&_mh_execute_header,  v179,  v190,  "%@ Failed to process thumbnail-downloaded assets - %@ ",  buf,  0x16u);
          }
        }

        goto LABEL_115;
      }

      uint64_t v129 = VCPLogInstance(v127, v128);
      v124 = (os_log_s *)objc_claimAutoreleasedReturnValue(v129);
      if (os_log_type_enabled(v124, v190))
      {
        *(_DWORD *)buf = 138412546;
        v208 = @"[Scene-FP]";
        __int16 v209 = 2112;
        id v210 = v116;
        _os_log_impl( (void *)&_mh_execute_header,  v124,  v190,  "%@ Failed to process thumbnail-ready assets - %@ ",  buf,  0x16u);
      }
    }

    goto LABEL_82;
  }

  NSErrorUserInfoKey v212 = NSLocalizedDescriptionKey;
  v33 = (void *)objc_claimAutoreleasedReturnValue([v197 photoLibraryURL]);
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 path]);
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Photo Library not ready for analysis (%@)",  @"[Scene-FP]",  v34));
  v213 = v35;
  id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v213,  &v212,  1LL));
  id v198 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v36));

  uint64_t v39 = MediaAnalysisLogLevel(v37, v38);
  uint64_t v25 = a3;
  if ((int)v39 >= 3)
  {
    uint64_t v41 = VCPLogInstance(v39, v40);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    os_log_type_t v43 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue([v198 description]);
      *(_DWORD *)buf = 138412290;
      v208 = v44;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "%@", buf, 0xCu);
    }

    uint64_t v25 = a3;
  }

  if (v25) {
    goto LABEL_17;
  }
LABEL_23:
  BOOL v31 = 0;
LABEL_123:

  return v31;
}

- (void).cxx_destruct
{
}

@end