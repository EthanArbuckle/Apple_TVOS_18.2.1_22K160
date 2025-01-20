@interface MADPhotosProcessingBackgroundSystemTask
+ (BOOL)enabled;
+ (BOOL)enabledByDefault;
+ (BOOL)frequentProgressReporting;
+ (NSString)identifier;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
+ (void)reportProgressForTasks:(id)a3 cancelOrExtendTimeoutBlock:(id)a4;
+ (void)unimplementedExceptionForMethodName:(id)a3;
- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5;
@end

@implementation MADPhotosProcessingBackgroundSystemTask

+ (BOOL)enabled
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B5A0;
  block[3] = &unk_1001B9958;
  block[4] = a1;
  if (qword_1001E6378 != -1) {
    dispatch_once(&qword_1001E6378, block);
  }
  return byte_1001E6370;
}

+ (BOOL)frequentProgressReporting
{
  if (qword_1001E6380 != -1) {
    dispatch_once(&qword_1001E6380, &stru_1001B9CE8);
  }
  return 0;
}

+ (void)reportProgressForTasks:(id)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  id v6 = a3;
  v7 = (unsigned int (**)(void))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allPhotoLibraries]);

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v10 = v9;
  id v41 = [v10 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v41)
  {
    uint64_t v11 = *(void *)v50;
    uint64_t v40 = *(void *)v50;
    id v37 = a1;
    id v38 = v6;
    id v36 = v10;
    os_log_type_t type = VCPLogToOSLogType[5];
    do
    {
      for (i = 0LL; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(v10);
        }
        v13 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
        context = objc_autoreleasePoolPush();
        if ([v13 isSystemPhotoLibrary])
        {
          if (![a1 frequentProgressReporting])
          {
            +[MADProgressManager requestProgressUpdateForTasks:]( &OBJC_CLASS___MADProgressManager,  "requestProgressUpdateForTasks:",  v6);
            v29 = (void *)objc_claimAutoreleasedReturnValue( +[MADProgressReporterBackgroundSystemTask sharedTask]( &OBJC_CLASS___MADProgressReporterBackgroundSystemTask,  "sharedTask"));
            id v43 = 0LL;
            [v29 submitTask:&v43];
            id v22 = v43;

            if (v22)
            {
              uint64_t v32 = MediaAnalysisLogLevel(v30, v31);
              if ((int)v32 >= 5)
              {
                uint64_t v34 = VCPLogInstance(v32, v33);
                v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                if (os_log_type_enabled(v28, type)) {
                  goto LABEL_24;
                }
                goto LABEL_25;
              }
            }

- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5
{
  id v66 = a3;
  id v67 = a4;
  id v8 = a5;
  v9 = (objc_class *)objc_opt_class(self);
  id v10 = NSStringFromClass(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = [(id)objc_opt_class(self) identifier];
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@][%@]",  v11,  v13));

  id v15 = [(id)objc_opt_class(self) enabled];
  if ((v15 & 1) != 0)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    if ((VCPIsRemoteIOSTask() & 1) != 0)
    {
      v18 = 0LL;
    }

    else
    {
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472LL;
      v82[2] = sub_10000C128;
      v82[3] = &unk_1001B9D10;
      id v83 = v14;
      v84 = self;
      id v85 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[VCPTimer timerWithIntervalSeconds:isOneShot:andBlock:]( &OBJC_CLASS___VCPTimer,  "timerWithIntervalSeconds:isOneShot:andBlock:",  60LL,  0LL,  v82));
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v91 = 0x3032000000LL;
    v92 = sub_10000C208;
    v93 = sub_10000C218;
    id v24 = [(id)objc_opt_class(self) identifier];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    id v26 = VCPTransactionWithName((uint64_t)v25);
    id v94 = (id)objc_claimAutoreleasedReturnValue(v26);

    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472LL;
    v80[2] = sub_10000C220;
    v80[3] = &unk_1001B9850;
    id v27 = v14;
    id v81 = v27;
    v63 = objc_retainBlock(v80);
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472LL;
    v78[2] = sub_10000C2FC;
    v78[3] = &unk_1001B99C8;
    id v28 = v67;
    id v79 = v28;
    v65 = objc_retainBlock(v78);
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = sub_10000C308;
    v70[3] = &unk_1001B9D38;
    id v29 = v17;
    id v71 = v29;
    id v60 = v27;
    id v72 = v60;
    id v61 = v18;
    id v73 = v61;
    v74 = self;
    p___int128 buf = &buf;
    id v75 = v28;
    id v30 = v8;
    id v76 = v30;
    uint64_t v31 = objc_retainBlock(v70);
    context = objc_autoreleasePoolPush();
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
    v64 = (void *)objc_claimAutoreleasedReturnValue([v32 allPhotoLibraries]);

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary vcp_defaultPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "vcp_defaultPhotoLibrary"));
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v33));

    id v35 = [v34 hasOutstandingTransactions];
    if ((_DWORD)v35)
    {
      uint64_t v37 = VCPLogInstance(v35, v36);
      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      {
        id v58 = (id)objc_opt_class(self);
        unsigned int v59 = [(id)objc_opt_class(self) taskID];
        *(_DWORD *)v86 = 138412546;
        id v87 = v58;
        __int16 v88 = 1024;
        unsigned int v89 = v59;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_FAULT,  "[%@] Error: Outstanding MAD database transcations detected before launching the task %u!",  v86,  0x12u);
      }
    }

    if (VCPIsRemoteIOSTask())
    {
      id v39 = [(id)objc_opt_class(self) taskID];
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472LL;
      v69[2] = sub_10000C63C;
      v69[3] = &unk_1001B9800;
      uint64_t v40 = v69;
      v69[4] = v31;
      id v41 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADRemoteActivityTask taskWithActivityType:andCompletionHandler:]( &OBJC_CLASS___VCPMADRemoteActivityTask,  "taskWithActivityType:andCompletionHandler:",  v39,  v69));
      [v41 setCancelBlock:v65];
    }

    else
    {
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472LL;
      v68[2] = sub_10000C66C;
      v68[3] = &unk_1001B9D60;
      uint64_t v40 = v68;
      v68[4] = v31;
      v42 = objc_retainBlock(v68);
      id v43 = [(id)objc_opt_class(self) taskWithPhotoLibraries:v64 cancelBlock:v65 progressHandler:v63 andCompletionHandler:v42];
      id v41 = (void *)objc_claimAutoreleasedReturnValue(v43);
      objc_msgSend( v34,  "storeSchedulingHistoryForActivityID:andStartTime:",  objc_msgSend((id)objc_opt_class(self), "taskID"),  v29);
      objc_msgSend( v34,  "purgeExcessiveSchedulingRecordsForActivityID:",  objc_msgSend((id)objc_opt_class(self), "taskID"));
    }

    [v34 commit];
    id v44 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADTaskScheduler sharedInstance](&OBJC_CLASS___VCPMADTaskScheduler, "sharedInstance"));
    BOOL v45 = [v44 addBackgroundTask:v41 withQoS:17] == 0;

    if (v45)
    {
      uint64_t v53 = MediaAnalysisLogLevel(v46, v47);
      if ((int)v53 >= 4)
      {
        uint64_t v55 = VCPLogInstance(v53, v54);
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        os_log_type_t v57 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v56, v57))
        {
          *(_DWORD *)v86 = 138412290;
          id v87 = v60;
          _os_log_impl( (void *)&_mh_execute_header,  v56,  v57,  "%@ Failed to submit background task to task scheduler; prepare to reschedule",
            v86,
            0xCu);
        }
      }

      (*((void (**)(id, uint64_t))v30 + 2))(v30, 4294967168LL);
    }

    else
    {
      uint64_t v48 = MediaAnalysisLogLevel(v46, v47);
      if ((int)v48 >= 7)
      {
        uint64_t v50 = VCPLogInstance(v48, v49);
        __int128 v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        os_log_type_t v52 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v51, v52))
        {
          *(_DWORD *)v86 = 138412290;
          id v87 = v60;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  v52,  "%@ Successfully submitted background task to task scheduler.",  v86,  0xCu);
        }
      }
    }

    objc_autoreleasePoolPop(context);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    uint64_t v19 = MediaAnalysisLogLevel(v15, v16);
    if ((int)v19 >= 5)
    {
      uint64_t v21 = VCPLogInstance(v19, v20);
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      os_log_type_t v23 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v22, v23))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "%@ BackgroundSystemTask disabled; quitting background processing",
          (uint8_t *)&buf,
          0xCu);
      }
    }

    (*((void (**)(id, void))v8 + 2))(v8, 0LL);
  }
}

+ (void)unimplementedExceptionForMethodName:(id)a3
{
  v3 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NotImplementedException",  objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADPhotosProcessingBackgroundSystemTask %@] should not be called",  a3)),  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_exception_throw(v4);
  +[MADPhotosProcessingBackgroundSystemTask identifier](v5, v6);
}

+ (NSString)identifier
{
  return 0LL;
}

+ (BOOL)enabledByDefault
{
  return 0;
}

+ (unint64_t)taskID
{
  return 0LL;
}

+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  return 0LL;
}

@end