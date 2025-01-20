@interface VCPMADPhotosProcessingTask
+ (NSString)name;
+ (unint64_t)taskID;
+ (void)unimplementedExceptionForMethodName:(id)a3;
- (BOOL)_isAssetEligible:(id)a3 withAnalysisDatabase:(id)a4 previousStatus:(unint64_t *)a5 previousAttempts:(int *)a6 lastAttemptDate:(id *)a7 allowDownload:(BOOL)a8;
- (BOOL)shouldProcessAsset:(id)a3;
- (VCPMADPhotosProcessingTask)initWithCompletionHandler:(id)a3;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
- (int)_processAssetsInBatch:(id)a3;
- (int)processAssetsInFetchResult:(id)a3 withAnalysisDatabase:(id)a4 allowDownload:(BOOL)a5 progress:(id)a6;
- (int)waitForPublishing;
@end

@implementation VCPMADPhotosProcessingTask

- (VCPMADPhotosProcessingTask)initWithCompletionHandler:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VCPMADPhotosProcessingTask;
  v3 = -[VCPMADPhotosProcessingTask initWithCompletionHandler:](&v9, "initWithCompletionHandler:", a3);
  if (v3)
  {
    dispatch_group_t v4 = dispatch_group_create();
    publishGroup = v3->_publishGroup;
    v3->_publishGroup = (OS_dispatch_group *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaanalysisd.photosprocessing.publish", 0LL);
    publishQueue = v3->_publishQueue;
    v3->_publishQueue = (OS_dispatch_queue *)v6;
  }

  return v3;
}

- (BOOL)_isAssetEligible:(id)a3 withAnalysisDatabase:(id)a4 previousStatus:(unint64_t *)a5 previousAttempts:(int *)a6 lastAttemptDate:(id *)a7 allowDownload:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v47 = 0LL;
  id v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 localIdentifier]);
  unsigned int v17 = objc_msgSend( v15,  "queryProcessingStatus:attempts:lastAttemptDate:andNextAttemptDate:forLocalIdentifier:andTaskID:",  a5,  a6,  a7,  &v47,  v16,  objc_msgSend((id)objc_opt_class(self), "taskID"));

  id v18 = v47;
  if (v17)
  {
    uint64_t v21 = MediaAnalysisLogLevel(v19, v20);
    if ((int)v21 >= 3)
    {
      uint64_t v23 = VCPLogInstance(v21, v22);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      os_log_type_t v25 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v24, v25))
      {
        id v26 = [(id)objc_opt_class(self) name];
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v14 localIdentifier]);
        *(_DWORD *)buf = 138412802;
        v49 = v27;
        __int16 v50 = 2112;
        v51 = v28;
        __int16 v52 = 1024;
        LODWORD(v53) = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "[%@][%@] Failed to query processing status due to DB error %d",  buf,  0x1Cu);
      }

- (int)_processAssetsInBatch:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  objc_msgSend(v5, "addBreadcrumb:", @"Processing batch size %lu", objc_msgSend(v4, "count"));

  id v6 = [v4 prepare];
  if ((_DWORD)v6)
  {
    int v8 = (int)v6;
    uint64_t v9 = MediaAnalysisLogLevel(v6, v7);
    if ((int)v9 >= 3)
    {
      uint64_t v11 = VCPLogInstance(v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      os_log_type_t v13 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled((os_log_t)v12, v13))
      {
LABEL_13:

        goto LABEL_14;
      }

      *(_DWORD *)buf = 138412290;
      id v28 = v4;
      id v14 = "Failed to prepare batch: %@";
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, v13, v14, buf, 0xCu);
      goto LABEL_13;
    }
  }

  else
  {
    id v15 = [v4 process];
    int v8 = (int)v15;
    if ((_DWORD)v15 != -128 && (_DWORD)v15)
    {
      uint64_t v20 = MediaAnalysisLogLevel(v15, v16);
      if ((int)v20 >= 3)
      {
        uint64_t v22 = VCPLogInstance(v20, v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v22);
        os_log_type_t v13 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled((os_log_t)v12, v13)) {
          goto LABEL_13;
        }
        *(_DWORD *)buf = 138412290;
        id v28 = v4;
        id v14 = "Failed to process batch: %@";
        goto LABEL_5;
      }
    }

    else
    {
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
      objc_msgSend(v17, "addBreadcrumb:", @"Finished processing batch size %lu", objc_msgSend(v4, "count"));

      dispatch_group_wait((dispatch_group_t)self->_publishGroup, 0xFFFFFFFFFFFFFFFFLL);
      if (!self->_publishError)
      {
        publishGroup = self->_publishGroup;
        publishQueue = (dispatch_queue_s *)self->_publishQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10010374C;
        block[3] = &unk_1001B9E00;
        id v25 = v4;
        id v26 = self;
        dispatch_group_async((dispatch_group_t)publishGroup, publishQueue, block);
        v12 = v25;
        goto LABEL_13;
      }
    }
  }

- (int)processAssetsInFetchResult:(id)a3 withAnalysisDatabase:(id)a4 allowDownload:(BOOL)a5 progress:(id)a6
{
  BOOL v8 = a5;
  id v11 = a3;
  id v12 = a4;
  id v77 = a6;
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472LL;
  v99[2] = sub_1001042BC;
  v99[3] = &unk_1001BCA48;
  v99[4] = self;
  v79 = v12;
  BOOL v73 = v8;
  id v75 = (id)objc_claimAutoreleasedReturnValue( -[VCPMADPhotosProcessingTask batchWithAnalysisDatabase:allowDownload:cancelBlock:]( self,  "batchWithAnalysisDatabase:allowDownload:cancelBlock:",  v12,  v8,  v99));
  objc_msgSend(v77, "setTotalUnitCount:", objc_msgSend(v11, "count"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v13 = 0LL;
  id v14 = 0LL;
  uint64_t v95 = 0LL;
  v96 = &v95;
  uint64_t v97 = 0x2020000000LL;
  int v98 = 0;
  os_log_type_t type = VCPLogToOSLogType[7];
  os_log_type_t v74 = VCPLogToOSLogType[5];
  *(void *)&__int128 v15 = 138412802LL;
  __int128 v72 = v15;
  while (v13 < (unint64_t)objc_msgSend(v11, "count", v72))
  {
    uint64_t v16 = objc_autoreleasePoolPush();
    if ((-[VCPMADPhotosProcessingTask isCanceled](self, "isCanceled") & 1) != 0)
    {
      uint64_t v6 = 4294967168LL;
      int v17 = 1;
      goto LABEL_56;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v18 pet];

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:v13]);
    uint64_t v21 = MediaAnalysisLogLevel(v19, v20);
    if ((int)v21 >= 7)
    {
      uint64_t v23 = VCPLogInstance(v21, v22);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, type))
      {
        id v25 = [(id)objc_opt_class(self) name];
        id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
        *(_DWORD *)buf = 138412546;
        id v101 = v26;
        __int16 v102 = 2112;
        v103 = v27;
        _os_log_impl((void *)&_mh_execute_header, v24, type, "[%@][%@] Evaluating asset...", buf, 0x16u);
      }
    }

    if (!v14) {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v19 photoLibrary]);
    }
    id v28 = +[PHPhotoLibrary mad_isProcessingNeededOnAsset:forTaskID:]( PHPhotoLibrary,  "mad_isProcessingNeededOnAsset:forTaskID:",  v19,  [(id)objc_opt_class(self) taskID]);
    if ((v28 & 1) == 0)
    {
      uint64_t v39 = MediaAnalysisLogLevel(v28, v29);
      if ((int)v39 >= 5)
      {
        uint64_t v41 = VCPLogInstance(v39, v40);
        uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, v74))
        {
          id v43 = (id)objc_opt_class(self);
          int v44 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
          unsigned int v45 = [(id)objc_opt_class(self) taskID];
          *(_DWORD *)buf = v72;
          id v101 = v43;
          __int16 v102 = 2112;
          v103 = v44;
          __int16 v104 = 1024;
          unsigned int v105 = v45;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  v74,  "[%@][%@] Asset does not need processing in task %u, ignoring... ",  buf,  0x1Cu);
        }
      }

      [v80 addObject:v19];
      v46 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
      objc_msgSend( v79,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  v46,  objc_msgSend((id)objc_opt_class(self), "taskID"));

      [v79 commit];
      id v47 = [v80 count];
      if (v47 >= +[PHPhotoLibrary mad_maxIgnoredAssetsToMarkAsProcessed]( &OBJC_CLASS___PHPhotoLibrary,  "mad_maxIgnoredAssetsToMarkAsProcessed"))
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
        [v48 pet];

        objc_msgSend(v14, "mad_markAsProcessedByTask:forAssets:", objc_msgSend((id)objc_opt_class(self), "taskID"), v80);
        [v80 removeAllObjects];
      }

      int v17 = 4;
      goto LABEL_55;
    }

    BOOL v30 = -[VCPMADPhotosProcessingTask shouldProcessAsset:](self, "shouldProcessAsset:", v19);
    if (!v30)
    {
      uint64_t v49 = MediaAnalysisLogLevel(v30, v31);
      if ((int)v49 >= 7)
      {
        uint64_t v51 = VCPLogInstance(v49, v50);
        __int16 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, type))
        {
          id v53 = [(id)objc_opt_class(self) name];
          __int16 v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
          int v55 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
          *(_DWORD *)buf = 138412546;
          id v101 = v54;
          __int16 v102 = 2112;
          v103 = v55;
          _os_log_impl((void *)&_mh_execute_header, v52, type, "[%@][%@] Asset up-to-date; skipping", buf, 0x16u);
        }
      }

      __int16 v56 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
      id v57 = objc_msgSend( v79,  "removeProcessingStatusForLocalIdentifier:andTaskID:",  v56,  objc_msgSend((id)objc_opt_class(self), "taskID"));

      if ((_DWORD)v57 == -108 || (_DWORD)v57 == -36)
      {
        uint64_t v58 = (uint64_t)v57;
      }

      else
      {
        uint64_t v58 = (uint64_t)v57;
        if ((_DWORD)v57 != -23) {
          uint64_t v58 = v6;
        }
      }

      int v17 = 1;
      if ((_DWORD)v57 != -108 && (_DWORD)v57 != -36 && (_DWORD)v57 != -23)
      {
        [v79 commit];
        objc_msgSend(v77, "setCompletedUnitCount:", (char *)objc_msgSend(v77, "completedUnitCount") + 1);
        int v17 = 4;
      }

      uint64_t v6 = v58;
      goto LABEL_55;
    }

    id v92 = 0LL;
    unsigned __int8 v32 = -[VCPMADPhotosProcessingTask _isAssetEligible:withAnalysisDatabase:previousStatus:previousAttempts:lastAttemptDate:allowDownload:]( self,  "_isAssetEligible:withAnalysisDatabase:previousStatus:previousAttempts:lastAttemptDate:allowDownload:",  v19,  v79,  &v94,  &v93,  &v92,  v73);
    id v33 = v92;
    v76 = v33;
    if ((v32 & 1) == 0)
    {
      uint64_t v59 = MediaAnalysisLogLevel(v33, v34);
      if ((int)v59 >= 7)
      {
        uint64_t v61 = VCPLogInstance(v59, v60);
        v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, type))
        {
          id v63 = [(id)objc_opt_class(self) name];
          v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
          v65 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
          *(_DWORD *)buf = 138412546;
          id v101 = v64;
          __int16 v102 = 2112;
          v103 = v65;
          _os_log_impl( (void *)&_mh_execute_header,  v62,  type,  "[%@][%@] Asset not eligible for processing; skipping",
            buf,
            0x16u);
        }
      }

      objc_msgSend(v77, "setCompletedUnitCount:", (char *)objc_msgSend(v77, "completedUnitCount") + 1);
      int v17 = 4;
      goto LABEL_54;
    }

    if (v94 == 4)
    {
      v91[0] = _NSConcreteStackBlock;
      v91[1] = 3221225472LL;
      v91[2] = sub_1001042C4;
      v91[3] = &unk_1001BCA48;
      v91[4] = self;
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( -[VCPMADPhotosProcessingTask batchWithAnalysisDatabase:allowDownload:cancelBlock:]( self,  "batchWithAnalysisDatabase:allowDownload:cancelBlock:",  v79,  v73,  v91));
      [v35 addPhotosAsset:v19 withPreviousStatus:v94 attempts:v93 andAttemptDate:v76];
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADQoSManager sharedManager](&OBJC_CLASS___VCPMADQoSManager, "sharedManager"));
      v88[0] = _NSConcreteStackBlock;
      v88[1] = 3221225472LL;
      v88[2] = sub_1001042CC;
      v88[3] = &unk_1001B9DD8;
      v90 = &v95;
      v88[4] = self;
      id v37 = v35;
      id v89 = v37;
      objc_msgSend(v36, "runBlock:withTaskID:", v88, objc_msgSend((id)objc_opt_class(self), "taskID"));

      objc_msgSend(v77, "setCompletedUnitCount:", (char *)objc_msgSend(v77, "completedUnitCount") + 1);
      unsigned int v38 = *((_DWORD *)v96 + 6);
      if (v38) {
        int v17 = 1;
      }
      else {
        int v17 = 4;
      }
      if (v38) {
        uint64_t v6 = v38;
      }
      else {
        uint64_t v6 = v6;
      }

      goto LABEL_53;
    }

    [v75 addPhotosAsset:v19 withPreviousStatus:v94 attempts:v93 andAttemptDate:v33];
    if ((unint64_t)[v75 count] >= 0x64)
    {
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADQoSManager sharedManager](&OBJC_CLASS___VCPMADQoSManager, "sharedManager"));
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472LL;
      v85[2] = sub_100104300;
      v85[3] = &unk_1001B9DD8;
      v87 = &v95;
      v85[4] = self;
      id v75 = v75;
      id v86 = v75;
      objc_msgSend(v66, "runBlock:withTaskID:", v85, objc_msgSend((id)objc_opt_class(self), "taskID"));

      objc_msgSend( v77,  "setCompletedUnitCount:",  (char *)objc_msgSend(v75, "count") + (void)objc_msgSend(v77, "completedUnitCount"));
      if (*((_DWORD *)v96 + 6))
      {
        int v17 = 1;
        id v37 = v86;
        uint64_t v6 = *((unsigned int *)v96 + 6);
      }

      else
      {
        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472LL;
        v84[2] = sub_100104334;
        v84[3] = &unk_1001BCA48;
        v84[4] = self;
        uint64_t v67 = objc_claimAutoreleasedReturnValue( -[VCPMADPhotosProcessingTask batchWithAnalysisDatabase:allowDownload:cancelBlock:]( self,  "batchWithAnalysisDatabase:allowDownload:cancelBlock:",  v79,  v73,  v84));

        int v17 = 0;
        id v37 = v86;
        id v75 = (id)v67;
      }

- (int)waitForPublishing
{
  return self->_publishError;
}

- (void).cxx_destruct
{
}

+ (void)unimplementedExceptionForMethodName:(id)a3
{
  v3 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NotImplementedException",  objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[VCPMADPhotosProcessingTask %@] should not be called",  a3)),  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_exception_throw(v4);
  +[VCPMADPhotosProcessingTask name](v5, v6);
}

+ (NSString)name
{
  return 0LL;
}

+ (unint64_t)taskID
{
  return 0LL;
}

- (BOOL)shouldProcessAsset:(id)a3
{
  return 0;
}

- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  return 0LL;
}

@end