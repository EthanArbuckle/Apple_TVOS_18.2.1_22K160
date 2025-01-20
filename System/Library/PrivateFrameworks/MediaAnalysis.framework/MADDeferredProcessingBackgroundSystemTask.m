@interface MADDeferredProcessingBackgroundSystemTask
+ (unint64_t)taskID;
- (void)executeWith:(id)a3 completionHandler:(id)a4;
- (void)registerTask;
@end

@implementation MADDeferredProcessingBackgroundSystemTask

+ (unint64_t)taskID
{
  uint64_t v3 = MediaAnalysisLogLevel(a1, a2);
  if ((int)v3 >= 4)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = [(id)objc_opt_class(a1) identifier];
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      int v11 = 138412290;
      v12 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "[%@] taskID is not implemented in subclass. Scheduling history will not be recorded",  (uint8_t *)&v11,  0xCu);
    }
  }

  return 0LL;
}

- (void)executeWith:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class(self) identifier];
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = sub_1000DF65C;
  v45 = sub_1000DF66C;
  id v46 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", v9, v7, v6));
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = sub_1000DF65C;
  v39 = sub_1000DF66C;
  v40 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  [(id)v36[5] start];
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x3032000000LL;
  v33[3] = sub_1000DF65C;
  v33[4] = sub_1000DF66C;
  id v10 = VCPTransactionWithName((uint64_t)v9);
  id v34 = (id)objc_claimAutoreleasedReturnValue(v10);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000DF674;
  v31[3] = &unk_1001BC570;
  id v11 = v9;
  id v32 = v11;
  v12 = objc_retainBlock(v31);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000DF750;
  v24[3] = &unk_1001BD4F8;
  v28 = &v35;
  id v13 = v11;
  id v25 = v13;
  v26 = self;
  v29 = &v41;
  v30 = v33;
  id v14 = v7;
  id v27 = v14;
  v15 = objc_retainBlock(v24);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000DFA30;
  v22[3] = &unk_1001BBED8;
  id v16 = v6;
  id v23 = v16;
  v17 = objc_retainBlock(v22);
  v18 = objc_autoreleasePoolPush();
  if ([(id)objc_opt_class(self) taskID])
  {
    +[PHPhotoLibrary enableMultiLibraryMode](&OBJC_CLASS___PHPhotoLibrary, "enableMultiLibraryMode");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary vcp_defaultPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "vcp_defaultPhotoLibrary"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v19));

    if (v20)
    {
      id v21 = [(id)objc_opt_class(self) taskID];
      [v20 storeSchedulingHistoryForActivityID:v21 andStartTime:v42[5]];
      objc_msgSend( v20,  "purgeExcessiveSchedulingRecordsForActivityID:",  objc_msgSend((id)objc_opt_class(self), "taskID"));
      [v20 commit];
    }
  }

  -[MADBackgroundSystemTask executeWithCancelBlock:progressHandler:completionHandler:]( self,  "executeWithCancelBlock:progressHandler:completionHandler:",  v17,  v12,  v15);
  objc_autoreleasePoolPop(v18);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
}

- (void)registerTask
{
  id v3 = [(id)objc_opt_class(self) identifier];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@][%@][Deferred]",  objc_opt_class(self),  v4);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000DFCBC;
  v26[3] = &unk_1001BD548;
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  id v27 = v6;
  v28 = self;
  id v7 = objc_retainBlock(v26);
  v9 = v7;
  if (v4)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
    unsigned int v11 = [v10 registerForTaskWithIdentifier:v4 usingQueue:0 launchHandler:v9];

    if (v11)
    {
      uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
      if ((int)v14 >= 7)
      {
        uint64_t v16 = VCPLogInstance(v14, v15);
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        os_log_type_t v18 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v17, v18))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v6;
          v19 = "%@ Successfully registered";
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v17, v18, v19, buf, 0xCu);
          goto LABEL_13;
        }

        goto LABEL_13;
      }
    }

    else
    {
      uint64_t v23 = MediaAnalysisLogLevel(v12, v13);
      if ((int)v23 >= 4)
      {
        uint64_t v25 = VCPLogInstance(v23, v24);
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        os_log_type_t v18 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v17, v18))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v6;
          v19 = "%@ Attempt re-registering";
          goto LABEL_12;
        }

        goto LABEL_13;
      }
    }
  }

  else
  {
    uint64_t v20 = MediaAnalysisLogLevel(v7, v8);
    if ((int)v20 >= 3)
    {
      uint64_t v22 = VCPLogInstance(v20, v21);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      os_log_type_t v18 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v6;
        v19 = "%@ Invalid identifier";
        goto LABEL_12;
      }

@end