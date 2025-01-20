@interface MADSchedulerBackgroundSystemTask
+ (BOOL)photosActivitiesEnabled;
+ (id)identifier;
+ (id)sharedTask;
+ (unint64_t)taskID;
+ (void)updateTask;
- (void)executeWith:(id)a3 completionHandler:(id)a4;
- (void)submitPhotosTasks;
- (void)submitTaskWithTaskClass:(Class)a3;
@end

@implementation MADSchedulerBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A7AC;
  block[3] = &unk_1001B9958;
  block[4] = a1;
  if (qword_1001E6368 != -1) {
    dispatch_once(&qword_1001E6368, block);
  }
  return (id)qword_1001E6360;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.background.scheduler";
}

+ (unint64_t)taskID
{
  return 0LL;
}

+ (BOOL)photosActivitiesEnabled
{
  return 1;
}

+ (void)updateTask
{
  if (+[VCPDeviceInformation isHomePod](&OBJC_CLASS___VCPDeviceInformation, "isHomePod"))
  {
    id v3 = [(id)objc_opt_class(a1) identifier];
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if ((int)MediaAnalysisLogLevel(v4, v5) >= 6)
    {
      uint64_t v6 = VCPLogInstance();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      os_log_type_t v8 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%@][HomePod] Attempting updateTask", buf, 0xCu);
      }
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 taskRequestForIdentifier:v4]);

    if (v10)
    {
      id v13 = [v10 interval];
      if (v15 >= 86400.0)
      {
        if ((int)MediaAnalysisLogLevel(v13, v14) >= 6)
        {
          uint64_t v45 = VCPLogInstance();
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          os_log_type_t v46 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v25, v46))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  v46,  "[%@][HomePod] Task interval already up-to-date, skipping updateTask",  buf,  0xCu);
          }

          id v21 = 0LL;
          goto LABEL_39;
        }

        id v21 = 0LL;
      }

      else
      {
        if ((int)MediaAnalysisLogLevel(v13, v14) >= 6)
        {
          uint64_t v16 = VCPLogInstance();
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          os_log_type_t v18 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v17, v18))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[%@][HomePod] Updating interval to 24 hours",  buf,  0xCu);
          }
        }

        [v10 setInterval:86400.0];
        [v10 setMinDurationBetweenInstances:70000.0];
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
        id v52 = 0LL;
        unsigned __int8 v20 = [v19 updateTaskRequest:v10 error:&v52];
        id v21 = v52;

        if ((v20 & 1) != 0)
        {
          if ((int)MediaAnalysisLogLevel(v22, v23) >= 6)
          {
            uint64_t v24 = VCPLogInstance();
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            os_log_type_t v26 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v25, v26))
            {
              *(_DWORD *)buf = 138412290;
              v54 = v4;
              v27 = "[%@][HomePod] Successfully updated task request";
              v28 = v25;
              os_log_type_t v29 = v26;
              uint32_t v30 = 12;
LABEL_38:
              _os_log_impl((void *)&_mh_execute_header, v28, v29, v27, buf, v30);
              goto LABEL_39;
            }

            goto LABEL_39;
          }
        }

        else if ((int)MediaAnalysisLogLevel(v22, v23) >= 3)
        {
          uint64_t v49 = VCPLogInstance();
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          os_log_type_t v50 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v25, v50))
          {
            *(_DWORD *)buf = 138412546;
            v54 = v4;
            __int16 v55 = 2112;
            id v56 = v21;
            v27 = "[%@][HomePod] Failed to update task request with error: %@";
            v28 = v25;
            os_log_type_t v29 = v50;
            uint32_t v30 = 22;
            goto LABEL_38;
          }

- (void)submitTaskWithTaskClass:(Class)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class identifier](a3, "identifier"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class sharedTask](a3, "sharedTask"));
  id v18 = 0LL;
  [v5 submitTask:&v18];
  id v6 = v18;

  if (v6)
  {
    if ((int)MediaAnalysisLogLevel(v7, v8) >= 3)
    {
      uint64_t v9 = VCPLogInstance();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      os_log_type_t v11 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138412546;
        unsigned __int8 v20 = v4;
        __int16 v21 = 2112;
        id v22 = v6;
        uint64_t v12 = "[%@] Failed to submit this BGST task with error: %@";
        id v13 = v10;
        os_log_type_t v14 = v11;
        uint32_t v15 = 22;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
        goto LABEL_9;
      }

      goto LABEL_9;
    }
  }

  else if ((int)MediaAnalysisLogLevel(v7, v8) >= 5)
  {
    uint64_t v16 = VCPLogInstance();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v17 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v10, v17))
    {
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v20 = v4;
      uint64_t v12 = "[%@] Successfully submitted this BGST task.";
      id v13 = v10;
      os_log_type_t v14 = v17;
      uint32_t v15 = 12;
      goto LABEL_8;
    }

- (void)submitPhotosTasks
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allPhotoLibraries]);
  id v5 = [v4 count];

  if (v5)
  {
    -[MADSchedulerBackgroundSystemTask submitTaskWithTaskClass:]( self,  "submitTaskWithTaskClass:",  objc_opt_class(&OBJC_CLASS___MADPhotosSceneBackgroundSystemTask));
    -[MADSchedulerBackgroundSystemTask submitTaskWithTaskClass:]( self,  "submitTaskWithTaskClass:",  objc_opt_class(&OBJC_CLASS___MADPhotosFullBackgroundSystemTask));
    -[MADSchedulerBackgroundSystemTask submitTaskWithTaskClass:]( self,  "submitTaskWithTaskClass:",  objc_opt_class(&OBJC_CLASS___MADPhotosFaceBackgroundSystemTask));
    -[MADSchedulerBackgroundSystemTask submitTaskWithTaskClass:]( self,  "submitTaskWithTaskClass:",  objc_opt_class(&OBJC_CLASS___MADPhotosMaintenanceBackgroundSystemTask));
  }

  else if ((int)MediaAnalysisLogLevel(v6, v7) >= 5)
  {
    uint64_t v8 = VCPLogInstance();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_log_type_t v10 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v9, v10))
    {
      int v12 = 138412290;
      id v13 = (id)objc_opt_class(self);
      id v11 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "[%@] No Photo Libraries present; bypassing submission of Photos activities",
        (uint8_t *)&v12,
        0xCu);
    }
  }

- (void)executeWith:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = (uint64_t (**)(void))a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  if ((int)MediaAnalysisLogLevel(v7, v8) >= 5)
  {
    uint64_t v9 = ((uint64_t (*)(void))VCPLogInstance)();
    os_log_type_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    os_log_type_t v11 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)unsigned __int8 v36 = 138412290;
      *(void *)&v36[4] = objc_opt_class(self);
      id v12 = *(id *)&v36[4];
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%@] begin executing task.", v36, 0xCu);
    }
  }

  if (v6 && (uint64_t v13 = v6[2](v6), (_DWORD)v13))
  {
    uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
    if ((int)v15 >= 5)
    {
      uint64_t v17 = VCPLogInstance(v15, v16);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      os_log_type_t v19 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v18, v19))
      {
        unsigned __int8 v20 = (void *)objc_opt_class(self);
        *(_DWORD *)unsigned __int8 v36 = 138412290;
        *(void *)&v36[4] = v20;
        id v21 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%@] suspending the current task execution.", v36, 0xCu);
      }
    }

    v7[2](v7, 4294967168LL);
  }

  else
  {
    id v22 = +[VCPDeviceInformation isHomePod](&OBJC_CLASS___VCPDeviceInformation, "isHomePod", *(_OWORD *)v36);
    if ((v22 & 1) != 0)
    {
      if ((int)MediaAnalysisLogLevel(v22, v23) >= 5)
      {
        uint64_t v24 = ((uint64_t (*)(void))VCPLogInstance)();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        os_log_type_t v26 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v25, v26))
        {
          v27 = (void *)objc_opt_class(self);
          *(_DWORD *)unsigned __int8 v36 = 138412290;
          *(void *)&v36[4] = v27;
          id v28 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "[%@] HomePod system; bypassing submission of core activities",
            v36,
            0xCu);
        }
      }
    }

    else if ([(id)objc_opt_class(self) photosActivitiesEnabled])
    {
      -[MADSchedulerBackgroundSystemTask submitPhotosTasks](self, "submitPhotosTasks");
    }

    -[MADSchedulerBackgroundSystemTask submitTaskWithTaskClass:]( self,  "submitTaskWithTaskClass:",  objc_opt_class(&OBJC_CLASS___MADHomeMaintenanceBackgroundSystemTask));
    uint64_t v29 = ((uint64_t (*)(id, void))v7[2])(v7, 0LL);
    if ((int)MediaAnalysisLogLevel(v29, v30) >= 5)
    {
      uint64_t v31 = ((uint64_t (*)(void))VCPLogInstance)();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      os_log_type_t v33 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v32, v33))
      {
        id v34 = (void *)objc_opt_class(self);
        *(_DWORD *)unsigned __int8 v36 = 138412290;
        *(void *)&v36[4] = v34;
        id v35 = v34;
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "[%@] finish executing task.", v36, 0xCu);
      }
    }
  }
}

@end