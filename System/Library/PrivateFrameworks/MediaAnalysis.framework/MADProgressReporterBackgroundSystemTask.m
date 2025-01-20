@interface MADProgressReporterBackgroundSystemTask
+ (BOOL)externalPowerRequired;
+ (BOOL)resourceIntensive;
+ (double)expectedDuration;
+ (id)identifier;
+ (id)sharedTask;
+ (unint64_t)taskID;
- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5;
@end

@implementation MADProgressReporterBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100123288;
  block[3] = &unk_1001B9958;
  block[4] = a1;
  if (qword_1001E6718 != -1) {
    dispatch_once(&qword_1001E6718, block);
  }
  return (id)qword_1001E6710;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.progress";
}

+ (unint64_t)taskID
{
  return 256LL;
}

+ (BOOL)externalPowerRequired
{
  return 1;
}

+ (BOOL)resourceIntensive
{
  return 1;
}

+ (double)expectedDuration
{
  return 1200.0;
}

- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5
{
  id v52 = a4;
  id v51 = a5;
  id v7 = [(id)objc_opt_class(self) identifier];
  v49 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[ReportProgress][%@][ExecuteTask]",  v49));
  uint64_t v64 = 0LL;
  v65 = &v64;
  uint64_t v66 = 0x3032000000LL;
  v67 = sub_1001239F8;
  v68 = sub_100123A08;
  v69 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  [(id)v65[5] start];
  v62[0] = 0LL;
  v62[1] = v62;
  v62[2] = 0x3032000000LL;
  v62[3] = sub_1001239F8;
  v62[4] = sub_100123A08;
  id v8 = [(id)objc_opt_class(self) identifier];
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = VCPTransactionWithName((uint64_t)v9);
  id v63 = (id)objc_claimAutoreleasedReturnValue(v10);

  v61[0] = 0LL;
  v61[1] = v61;
  v61[2] = 0x2020000000LL;
  v61[3] = 0LL;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_100123A10;
  v58[3] = &unk_1001BC100;
  id v11 = v50;
  id v59 = v11;
  v60 = v61;
  v12 = objc_retainBlock(v58);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_100123AF8;
  v53[3] = &unk_1001BE030;
  v56 = &v64;
  id v13 = v11;
  id v54 = v13;
  v57 = v62;
  id v14 = v51;
  id v55 = v14;
  v15 = objc_retainBlock(v53);
  v16 = objc_autoreleasePoolPush();
  uint64_t v18 = MediaAnalysisLogLevel(v16, v17);
  if ((int)v18 >= 5)
  {
    uint64_t v20 = VCPLogInstance(v18, v19);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    os_log_type_t v22 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)buf = 138412290;
      id v75 = v13;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "%@ start processing task ...", buf, 0xCu);
    }
  }

  if (VCPIsRemoteIOSTask())
  {
    v23 = +[VCPMADRemoteActivityTask taskWithActivityType:andCompletionHandler:]( VCPMADRemoteActivityTask,  "taskWithActivityType:andCompletionHandler:",  [(id)objc_opt_class(self) taskID],  v15);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
  }

  else
  {
    uint64_t v24 = objc_claimAutoreleasedReturnValue( +[MADProgressReporterProcessingTask taskWithCancelBlock:progressHandler:completionHandler:]( &OBJC_CLASS___MADProgressReporterProcessingTask,  "taskWithCancelBlock:progressHandler:completionHandler:",  v52,  v12,  v15));
  }

  v26 = (void *)v24;
  if (v24)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
    id v28 = [v27 addBackgroundTask:v26 withQoS:9];
    if (!v28)
    {
      uint64_t v42 = MediaAnalysisLogLevel(0LL, v29);
      if ((int)v42 >= 3)
      {
        uint64_t v44 = VCPLogInstance(v42, v43);
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        os_log_type_t v46 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v45, v46))
        {
          *(_DWORD *)buf = 138412290;
          id v75 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  v46,  "%@ Failed to submit background task to task scheduler; prepare to reschedule",
            buf,
            0xCu);
        }
      }

      NSErrorUserInfoKey v72 = NSLocalizedDescriptionKey;
      v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Cancelled",  v13));
      v73 = v47;
      v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v73,  &v72,  1LL));
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v48));

      ((void (*)(void *, void, os_log_s *))v15[2])(v15, 0LL, v33);
      goto LABEL_23;
    }

    uint64_t v30 = MediaAnalysisLogLevel(v28, v29);
    if ((int)v30 >= 7)
    {
      uint64_t v32 = VCPLogInstance(v30, v31);
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      os_log_type_t v34 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v33, v34))
      {
        *(_DWORD *)buf = 138412290;
        id v75 = v13;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "%@ Submitted background task to task scheduler", buf, 0xCu);
      }

@end