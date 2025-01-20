@interface MADPhotosDeferredBackgroundSystemTask
+ (id)identifier;
+ (id)sharedTask;
- (void)executeWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)submitTask:(id *)a3;
@end

@implementation MADPhotosDeferredBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DEC6C;
  block[3] = &unk_1001B9958;
  block[4] = a1;
  if (qword_1001E6658 != -1) {
    dispatch_once(&qword_1001E6658, block);
  }
  return (id)qword_1001E6650;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.photos.deferred";
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
      v36 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%@] Try submit the BGST task", buf, 0xCu);
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 taskRequestForIdentifier:v7]);

  if (v15)
  {
    uint64_t v18 = MediaAnalysisLogLevel(v16, v17);
    if ((int)v18 >= 4)
    {
      uint64_t v20 = VCPLogInstance(v18, v19);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      os_log_type_t v22 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v21, v22))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "[%@] the BGST task already existed, bailing out.",  buf,  0xCu);
      }
    }

    objc_autoreleasePoolPop(v5);
    id v23 = 0LL;
  }

  else
  {
    id v24 = [[BGNonRepeatingSystemTaskRequest alloc] initWithIdentifier:v7];
    [v24 setGroupName:MediaAnalysisDaemonDomain];
    [v24 setGroupConcurrencyLimit:1];
    [v24 setRequiresUserInactivity:1];
    [v24 setRequiresExternalPower:0];
    [v24 setPriority:1];
    [v24 setScheduleAfter:0.0];
    [v24 setTrySchedulingBefore:1800.0];
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
    id v34 = 0LL;
    unsigned __int8 v26 = [v25 submitTaskRequest:v24 error:&v34];
    id v23 = v34;

    if ((v26 & 1) == 0)
    {
      uint64_t v29 = MediaAnalysisLogLevel(v27, v28);
      if ((int)v29 >= 3)
      {
        uint64_t v31 = VCPLogInstance(v29, v30);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        os_log_type_t v33 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v32, v33))
        {
          *(_DWORD *)buf = 138412546;
          v36 = v7;
          __int16 v37 = 2112;
          id v38 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "[%@] Failed to submit the BGST task with error: %@",  buf,  0x16u);
        }
      }
    }

    objc_autoreleasePoolPop(v5);
    if (a3 && v23) {
      *a3 = [v23 copy];
    }
  }
}

- (void)executeWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = (void (**)(id, uint64_t))a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (objc_class *)objc_opt_class(self);
  v12 = NSStringFromClass(v11);
  os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = [(id)objc_opt_class(self) identifier];
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@][%@]",  v13,  v15));

  uint64_t v17 = -[MADPhotosDeferredProcessingTask initWithCancelBlock:progressHandler:completionHandler:]( objc_alloc(&OBJC_CLASS___MADPhotosDeferredProcessingTask),  "initWithCancelBlock:progressHandler:completionHandler:",  v10,  v9,  v8);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
  id v19 = [v18 addBackgroundTask:v17 withQoS:17];

  uint64_t v22 = MediaAnalysisLogLevel(v20, v21);
  if (v19)
  {
    if ((int)v22 >= 7)
    {
      uint64_t v24 = VCPLogInstance(v22, v23);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      os_log_type_t v26 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "%@ Successfully submitted background task to task scheduler.",  buf,  0xCu);
      }
    }
  }

  else
  {
    if ((int)v22 >= 4)
    {
      uint64_t v27 = VCPLogInstance(v22, v23);
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      os_log_type_t v29 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v28, v29))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  v29,  "%@ Failed to submit background task to task scheduler; prepare to reschedule",
          buf,
          0xCu);
      }
    }

    v8[2](v8, 4294967168LL);
  }
}

@end