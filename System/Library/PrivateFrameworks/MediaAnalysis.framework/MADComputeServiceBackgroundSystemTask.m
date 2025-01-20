@interface MADComputeServiceBackgroundSystemTask
+ (id)identifier;
+ (id)sharedTask;
- (void)executeWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)submitTask:(id *)a3;
@end

@implementation MADComputeServiceBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100099E2C;
  block[3] = &unk_1001B9958;
  block[4] = a1;
  if (qword_1001E6548 != -1) {
    dispatch_once(&qword_1001E6548, block);
  }
  return (id)qword_1001E6540;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.macs.overnight";
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
    [v24 setRequiresExternalPower:1];
    [v24 setPriority:1];
    [v24 setScheduleAfter:0.0];
    [v24 setTrySchedulingBefore:1800.0];
    [v24 setResourceIntensive:1];
    [v24 setExpectedDuration:300.0];
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
  id v64 = a3;
  id v66 = a4;
  id v67 = a5;
  uint64_t v8 = (objc_class *)objc_opt_class(self);
  uint64_t v9 = NSStringFromClass(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [(id)objc_opt_class(self) identifier];
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@][%@]",  v10,  v12));

  uint64_t v81 = 0LL;
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"status==%lu",  0LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[MADManagedRequest fetchTaskScheduleWithPredicate:error:]( &OBJC_CLASS___MADManagedRequest,  "fetchTaskScheduleWithPredicate:error:"));
  id v57 = 0LL;
  uint64_t v16 = MediaAnalysisLogLevel(v57, v15);
  if ((int)v16 >= 6)
  {
    uint64_t v18 = VCPLogInstance(v16, v17);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    os_log_type_t v20 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v19, v20))
    {
      id v21 = [v14 count];
      *(_DWORD *)buf = 138412546;
      id v85 = v13;
      __int16 v86 = 2048;
      id v87 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "%@ Fetched %lu requests", buf, 0x16u);
    }
  }

  os_log_type_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  id obj = v14;
  id v24 = [obj countByEnumeratingWithState:&v77 objects:v83 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v78;
    do
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v78 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)i);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 requestID]);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v29]);

        if (!v30)
        {
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          v32 = (void *)objc_claimAutoreleasedReturnValue([v28 requestID]);
          [v22 setObject:v31 forKeyedSubscript:v32];

          os_log_type_t v33 = (void *)objc_claimAutoreleasedReturnValue([v28 requestID]);
          [v23 addObject:v33];
        }

        id v34 = (void *)objc_claimAutoreleasedReturnValue([v28 requestID]);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v34]);
        [v35 addObject:v28];
      }

      id v25 = [obj countByEnumeratingWithState:&v77 objects:v83 count:16];
    }

    while (v25);
  }

  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472LL;
  v74[2] = sub_10009A780;
  v74[3] = &unk_1001BC6C8;
  id v59 = v13;
  id v75 = v59;
  id v56 = v64;
  id v76 = v56;
  v65 = objc_retainBlock(v74);
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  id v62 = v23;
  id v36 = [v62 countByEnumeratingWithState:&v70 objects:v82 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v71;
    os_log_type_t v60 = VCPLogToOSLogType[4];
    os_log_type_t type = VCPLogToOSLogType[7];
    do
    {
      for (j = 0LL; j != v37; j = (char *)j + 1)
      {
        if (*(void *)v71 != v38) {
          objc_enumerationMutation(v62);
        }
        uint64_t v40 = *(void *)(*((void *)&v70 + 1) + 8LL * (void)j);
        v41 = objc_autoreleasePoolPush();
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472LL;
        v68[2] = sub_10009A924;
        v68[3] = &unk_1001BC6F0;
        id v42 = v67;
        id v69 = v42;
        v43 = objc_retainBlock(v68);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v40]);
        v45 = (void *)objc_claimAutoreleasedReturnValue( +[MADComputeServiceProcessingTask taskWithManagedRequests:cancelBlock:progressHandler:resultsHandler:completionHandler:]( &OBJC_CLASS___MADComputeServiceProcessingTask,  "taskWithManagedRequests:cancelBlock:progressHandler:resultsHandler:completionHandler:",  v44,  v65,  v66,  0LL,  v43));

        v46 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
        id v47 = [v46 addBackgroundTask:v45 withQoS:17];

        uint64_t v50 = MediaAnalysisLogLevel(v48, v49);
        if (v47)
        {
          if ((int)v50 >= 7)
          {
            uint64_t v52 = VCPLogInstance(v50, v51);
            v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v53, type))
            {
              *(_DWORD *)buf = 138412290;
              id v85 = v59;
              _os_log_impl( (void *)&_mh_execute_header,  v53,  type,  "%@ Successfully submitted background task to task scheduler.",  buf,  0xCu);
            }
          }
        }

        else
        {
          if ((int)v50 >= 4)
          {
            uint64_t v54 = VCPLogInstance(v50, v51);
            v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
            if (os_log_type_enabled(v55, v60))
            {
              *(_DWORD *)buf = 138412290;
              id v85 = v59;
              _os_log_impl( (void *)&_mh_execute_header,  v55,  v60,  "%@ Failed to submit background task to task scheduler; prepare to reschedule",
                buf,
                0xCu);
            }
          }

          (*((void (**)(id, uint64_t))v67 + 2))(v42, 4294967168LL);
        }

        objc_autoreleasePoolPop(v41);
      }

      id v37 = [v62 countByEnumeratingWithState:&v70 objects:v82 count:16];
    }

    while (v37);
  }
}

@end