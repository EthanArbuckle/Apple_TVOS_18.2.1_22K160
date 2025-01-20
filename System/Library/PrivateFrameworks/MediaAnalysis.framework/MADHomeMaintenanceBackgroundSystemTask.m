@interface MADHomeMaintenanceBackgroundSystemTask
+ (id)identifier;
+ (id)sharedTask;
+ (int64_t)activityDelayInSeconds;
+ (unint64_t)taskID;
- (void)executeWith:(id)a3 completionHandler:(id)a4;
@end

@implementation MADHomeMaintenanceBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004D60;
  block[3] = &unk_1001B9958;
  block[4] = a1;
  if (qword_1001E6348 != -1) {
    dispatch_once(&qword_1001E6348, block);
  }
  return (id)qword_1001E6340;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.home.maintenance";
}

+ (unint64_t)taskID
{
  return 0LL;
}

+ (int64_t)activityDelayInSeconds
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MADHomeMaintenanceBackgroundSystemTask;
  return (int64_t)objc_msgSendSuper2(&v4, "activityDelayInSeconds");
}

- (void)executeWith:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (objc_class *)objc_opt_class(self);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [(id)objc_opt_class(self) identifier];
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@][%@]",  v10,  v12));

  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x3032000000LL;
  v45 = sub_1000051D4;
  v46 = sub_1000051E4;
  v47 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  [(id)v43[5] start];
  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x3032000000LL;
  v40[3] = sub_1000051D4;
  v40[4] = sub_1000051E4;
  id v14 = [(id)objc_opt_class(self) identifier];
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = VCPTransactionWithName((uint64_t)v15);
  id v41 = (id)objc_claimAutoreleasedReturnValue(v16);

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000051EC;
  v35[3] = &unk_1001B9980;
  v38 = &v42;
  id v17 = v13;
  id v36 = v17;
  v39 = v40;
  id v18 = v7;
  id v37 = v18;
  v19 = objc_retainBlock(v35);
  v20 = objc_autoreleasePoolPush();
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[VCPHomeResidentMaintenanceTask taskWithOptions:extendTimeoutBlock:completionHandler:]( &OBJC_CLASS___VCPHomeResidentMaintenanceTask,  "taskWithOptions:extendTimeoutBlock:completionHandler:",  &__NSDictionary0__struct,  &stru_1001B99A0,  v19));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100005400;
  v33[3] = &unk_1001B99C8;
  id v22 = v6;
  id v34 = v22;
  [v21 setCancelBlock:v33];
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
  BOOL v24 = [v23 addBackgroundTask:v21 withQoS:17] == 0;

  if (v24)
  {
    if ((int)MediaAnalysisLogLevel(v25, v26) >= 4)
    {
      uint64_t v30 = VCPLogInstance();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      os_log_type_t v32 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v31, v32))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "%@ Failed to submit background task to task scheduler; prepare to reschedule",
          buf,
          0xCu);
      }
    }

    (*((void (**)(id, uint64_t))v18 + 2))(v18, 4294967168LL);
  }

  else if ((int)MediaAnalysisLogLevel(v25, v26) >= 7)
  {
    uint64_t v27 = VCPLogInstance();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    os_log_type_t v29 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v28, v29))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  v29,  "%@ Successfully submitted background task to task scheduler.",  buf,  0xCu);
    }
  }

  objc_autoreleasePoolPop(v20);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(&v42, 8);
}

@end