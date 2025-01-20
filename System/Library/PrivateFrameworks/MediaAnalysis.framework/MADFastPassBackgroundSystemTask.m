@interface MADFastPassBackgroundSystemTask
+ (id)featureCodes;
+ (id)processingTaskIdentifiers;
+ (id)producedResultIdentifiers;
- (BOOL)oneShot;
- (id)processingTaskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5;
- (void)registerTask;
@end

@implementation MADFastPassBackgroundSystemTask

+ (id)processingTaskIdentifiers
{
  return 0LL;
}

+ (id)featureCodes
{
  return 0LL;
}

+ (id)producedResultIdentifiers
{
  return +[NSSet set](&OBJC_CLASS___NSSet, "set");
}

- (BOOL)oneShot
{
  return 1;
}

- (void)registerTask
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 5)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = [(id)objc_opt_class(self) identifier];
      id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
      id v10 = [(id)objc_opt_class(self) processingTaskIdentifiers];
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      v16 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "%@: Registering fast-pass background processing task for %@",  buf,  0x16u);
    }
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MADFastPassBackgroundSystemTask;
  -[MADBackgroundSystemTask registerTask](&v12, "registerTask");
}

- (id)processingTaskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  return 0LL;
}

- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5
{
  id v46 = a3;
  id v49 = a4;
  id v48 = a5;
  id v8 = [(id)objc_opt_class(self) identifier];
  v45 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[BGST-FP][%@][ExecuteTask]",  v45));
  uint64_t v64 = 0LL;
  v65 = &v64;
  uint64_t v66 = 0x3032000000LL;
  v67 = sub_10007FAC8;
  v68 = sub_10007FAD8;
  v69 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  [(id)v65[5] start];
  v62[0] = 0LL;
  v62[1] = v62;
  v62[2] = 0x3032000000LL;
  v62[3] = sub_10007FAC8;
  v62[4] = sub_10007FAD8;
  id v9 = [(id)objc_opt_class(self) identifier];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = VCPTransactionWithName((uint64_t)v10);
  id v63 = (id)objc_claimAutoreleasedReturnValue(v11);

  v61[0] = 0LL;
  v61[1] = v61;
  v61[2] = 0x2020000000LL;
  v61[3] = 0LL;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_10007FAE0;
  v58[3] = &unk_1001BC100;
  id v12 = v47;
  id v59 = v12;
  v60 = v61;
  v13 = objc_retainBlock(v58);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10007FBC8;
  v50[3] = &unk_1001BC128;
  v55 = &v64;
  id v14 = v12;
  id v51 = v14;
  id v15 = v46;
  id v52 = v15;
  v53 = self;
  v56 = v61;
  v57 = v62;
  id v16 = v48;
  id v54 = v16;
  v17 = objc_retainBlock(v50);
  v18 = objc_autoreleasePoolPush();
  uint64_t v20 = MediaAnalysisLogLevel(v18, v19);
  if ((int)v20 >= 5)
  {
    uint64_t v22 = VCPLogInstance(v20, v21);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    os_log_type_t v24 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v23, v24))
    {
      *(_DWORD *)buf = 138412290;
      id v71 = v14;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@ start processing task ...", buf, 0xCu);
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue( -[MADFastPassBackgroundSystemTask processingTaskWithCancelBlock:progressHandler:completionHandler:]( self,  "processingTaskWithCancelBlock:progressHandler:completionHandler:",  v49,  v13,  v17));
  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
    id v28 = [v27 addBackgroundTask:v26 withQoS:9];
    if (v28)
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
          id v71 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "%@ Submitted background task to task scheduler.",  buf,  0xCu);
        }
      }
    }

    else
    {
      uint64_t v40 = MediaAnalysisLogLevel(0LL, v29);
      if ((int)v40 >= 3)
      {
        uint64_t v42 = VCPLogInstance(v40, v41);
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        os_log_type_t v44 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v43, v44))
        {
          *(_DWORD *)buf = 138412290;
          id v71 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  v44,  "%@ Failed to submit background task to task scheduler; prepare to reschedule",
            buf,
            0xCu);
        }
      }

      ((void (*)(void *, uint64_t))v17[2])(v17, 4294967168LL);
    }
  }

  else
  {
    uint64_t v35 = MediaAnalysisLogLevel(0LL, v25);
    if ((int)v35 >= 3)
    {
      uint64_t v37 = VCPLogInstance(v35, v36);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      os_log_type_t v39 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v38, v39))
      {
        *(_DWORD *)buf = 138412290;
        id v71 = v14;
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "%@ Failed to create processing task.", buf, 0xCu);
      }
    }

    ((void (*)(void *, uint64_t))v17[2])(v17, 4294967278LL);
  }

  objc_autoreleasePoolPop(v18);
  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v62, 8);

  _Block_object_dispose(&v64, 8);
}

@end