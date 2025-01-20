@interface MADPhotosMaintenanceBackgroundSystemTask
+ (BOOL)enabledByDefault;
+ (id)identifier;
+ (id)sharedTask;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5;
- (void)submitTask:(id *)a3;
@end

@implementation MADPhotosMaintenanceBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000968A0;
  block[3] = &unk_1001B9958;
  block[4] = a1;
  if (qword_1001E6538 != -1) {
    dispatch_once(&qword_1001E6538, block);
  }
  return (id)qword_1001E6530;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.photos.maintenance";
}

+ (BOOL)enabledByDefault
{
  return 1;
}

+ (unint64_t)taskID
{
  return 0LL;
}

+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  return (id)objc_claimAutoreleasedReturnValue( +[VCPPhotosMaintenanceProcessingTask taskWithPhotoLibraries:andProgressHandler:andCompletionHandler:andCancelBlock:]( &OBJC_CLASS___VCPPhotosMaintenanceProcessingTask,  "taskWithPhotoLibraries:andProgressHandler:andCompletionHandler:andCancelBlock:",  a3,  a5,  a6,  a4));
}

- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5
{
  id v45 = a4;
  id v47 = a5;
  v7 = (objc_class *)objc_opt_class(self);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [(id)objc_opt_class(self) identifier];
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"[%@][%@]", v9, v11));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allPhotoLibraries]);

  if ([v13 count])
  {
    *(void *)&__int128 v61 = 0LL;
    *((void *)&v61 + 1) = &v61;
    uint64_t v62 = 0x3032000000LL;
    v63 = sub_100096EB8;
    v64 = sub_100096EC8;
    v65 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
    [*(id *)(*((void *)&v61 + 1) + 40) start];
    v57[0] = 0LL;
    v57[1] = v57;
    v57[2] = 0x3032000000LL;
    v57[3] = sub_100096EB8;
    v57[4] = sub_100096EC8;
    id v15 = [(id)objc_opt_class(self) identifier];
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = VCPTransactionWithName((uint64_t)v16);
    id v58 = (id)objc_claimAutoreleasedReturnValue(v17);

    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_100096ED0;
    v55[3] = &unk_1001BC570;
    id v18 = v46;
    id v56 = v18;
    v19 = objc_retainBlock(v55);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_100096FAC;
    v50[3] = &unk_1001BC598;
    v53 = &v61;
    id v20 = v18;
    id v51 = v20;
    v54 = v57;
    id v21 = v47;
    id v52 = v21;
    v22 = objc_retainBlock(v50);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_100097150;
    v48[3] = &unk_1001BBED8;
    id v49 = v45;
    v23 = objc_retainBlock(v48);
    v24 = objc_autoreleasePoolPush();
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosMaintenanceProcessingTask taskWithPhotoLibraries:andProgressHandler:andCompletionHandler:andCancelBlock:]( &OBJC_CLASS___VCPPhotosMaintenanceProcessingTask,  "taskWithPhotoLibraries:andProgressHandler:andCompletionHandler:andCancelBlock:",  v13,  v19,  v22,  v23));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
    BOOL v27 = [v26 addBackgroundTask:v25 withQoS:17] == 0;

    if (v27)
    {
      uint64_t v40 = MediaAnalysisLogLevel(v28, v29);
      if ((int)v40 >= 4)
      {
        uint64_t v42 = VCPLogInstance(v40, v41);
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        os_log_type_t v44 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v43, v44))
        {
          *(_DWORD *)buf = 138412290;
          id v60 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  v44,  "%@ Failed to submit background task to task scheduler; prepare to reschedule",
            buf,
            0xCu);
        }
      }

      (*((void (**)(id, uint64_t))v21 + 2))(v21, 4294967168LL);
    }

    else
    {
      uint64_t v30 = MediaAnalysisLogLevel(v28, v29);
      if ((int)v30 >= 7)
      {
        uint64_t v32 = VCPLogInstance(v30, v31);
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        os_log_type_t v34 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v33, v34))
        {
          *(_DWORD *)buf = 138412290;
          id v60 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "%@ Successfully submitted background task to task scheduler.",  buf,  0xCu);
        }
      }
    }

    objc_autoreleasePoolPop(v24);
    _Block_object_dispose(v57, 8);

    _Block_object_dispose(&v61, 8);
  }

  else
  {
    uint64_t v35 = MediaAnalysisLogLevel(0LL, v14);
    if ((int)v35 >= 5)
    {
      uint64_t v37 = VCPLogInstance(v35, v36);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      os_log_type_t v39 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v38, v39))
      {
        LODWORD(v61) = 138412290;
        *(void *)((char *)&v61 + 4) = v46;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  v39,  "%@ No PhotoLibrary present; quitting background processing",
          (uint8_t *)&v61,
          0xCu);
      }
    }

    (*((void (**)(id, void))v47 + 2))(v47, 0LL);
  }
}

- (void)submitTask:(id *)a3
{
  v5 = objc_autoreleasePoolPush();
  id v6 = [(id)objc_opt_class(self) identifier];
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v9 >= 7)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%@] Try submit the repeating BGST task", buf, 0xCu);
    }
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 taskRequestForIdentifier:v7]);

  if (!v15)
  {
    id v21 = [[BGRepeatingSystemTaskRequest alloc] initWithIdentifier:v7];
    [v21 setGroupName:MediaAnalysisDaemonDomain];
    [v21 setGroupConcurrencyLimit:1];
    objc_msgSend(v21, "setResourceIntensive:", objc_msgSend((id)objc_opt_class(self), "resourceIntensive"));
    [v21 setRequiresUserInactivity:1];
    [v21 setPriority:1];
    [v21 setInterval:86400.0];
    if ([v21 resourceIntensive])
    {
      [(id)objc_opt_class(self) expectedDuration];
      objc_msgSend(v21, "setExpectedDuration:");
    }

    objc_msgSend( v21,  "setRequiresInexpensiveNetworkConnectivity:",  objc_msgSend((id)objc_opt_class(self), "inexpensiveNetworkConnectivityRequired"));
    objc_msgSend( v21,  "setRequiresNetworkConnectivity:",  objc_msgSend((id)objc_opt_class(self), "networkConnectivityRequired"));
    id v24 = [(id)objc_opt_class(self) rateLimitConfigurationName];
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if (v25) {
      [v21 setRateLimitConfigurationName:v25];
    }
    objc_msgSend(v21, "setRequiresExternalPower:", objc_msgSend((id)objc_opt_class(self), "externalPowerRequired"));
    [v21 setPowerNap:1];
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
    id v43 = 0LL;
    unsigned __int8 v27 = [v26 submitTaskRequest:v21 error:&v43];
    id v23 = v43;

    if ((v27 & 1) != 0)
    {
      uint64_t v30 = MediaAnalysisLogLevel(v28, v29);
      if ((int)v30 >= 7)
      {
        uint64_t v32 = VCPLogInstance(v30, v31);
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        os_log_type_t v34 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v33, v34))
        {
          *(_DWORD *)buf = 138412290;
          id v45 = v7;
          uint64_t v35 = "[%@] Submitted repeating BGST task successfully.";
          uint64_t v36 = v33;
          os_log_type_t v37 = v34;
          uint32_t v38 = 12;
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v36, v37, v35, buf, v38);
          goto LABEL_23;
        }

        goto LABEL_23;
      }
    }

    else
    {
      uint64_t v39 = MediaAnalysisLogLevel(v28, v29);
      if ((int)v39 >= 3)
      {
        uint64_t v41 = VCPLogInstance(v39, v40);
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        os_log_type_t v42 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v33, v42))
        {
          *(_DWORD *)buf = 138412546;
          id v45 = v7;
          __int16 v46 = 2112;
          id v47 = v23;
          uint64_t v35 = "[%@] Failed to submit the repeating BGST task with error: %@";
          uint64_t v36 = v33;
          os_log_type_t v37 = v42;
          uint32_t v38 = 22;
          goto LABEL_22;
        }

@end