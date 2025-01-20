@interface MADProgressReporterProcessingTask
+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (BOOL)run:(id *)a3;
- (MADProgressReporterProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation MADProgressReporterProcessingTask

- (MADProgressReporterProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v9 = (Block_layout *)a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MADProgressReporterProcessingTask;
  v11 = -[MADProgressReporterProcessingTask initWithCompletionHandler:](&v18, "initWithCompletionHandler:", v10);
  v12 = v11;
  if (v11)
  {
    reportingTaskIDs = v11->_reportingTaskIDs;
    v11->_reportingTaskIDs = (NSArray *)&off_1001C9090;

    if (v9) {
      v14 = v9;
    }
    else {
      v14 = &stru_1001BC800;
    }
    v15 = objc_retainBlock(v14);
    id progressHandler = v12->_progressHandler;
    v12->_id progressHandler = v15;

    -[MADProgressReporterProcessingTask setCancelBlock:](v12, "setCancelBlock:", v8);
  }

  return v12;
}

+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)a1) initWithCancelBlock:v8 progressHandler:v9 completionHandler:v10];

  return v11;
}

- (BOOL)run:(id *)a3
{
  uint64_t v4 = MediaAnalysisLogLevel(self, a2);
  if ((int)v4 >= 5)
  {
    uint64_t v6 = VCPLogInstance(v4, v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_log_type_t v8 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412290;
      v42 = @"[ProgressReport]";
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ Running MADProgressReporterProcessingTask ... ", buf, 0xCu);
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allPhotoLibraries]);

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v35;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        if ([v14 isSystemPhotoLibrary])
        {
          if (-[MADProgressReporterProcessingTask isCanceled](self, "isCanceled"))
          {
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Processed canceled",  @"[ProgressReport]"));
            uint64_t v21 = MediaAnalysisLogLevel(v19, v20);
            if ((int)v21 >= 5)
            {
              uint64_t v23 = VCPLogInstance(v21, v22);
              v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
              os_log_type_t v25 = VCPLogToOSLogType[5];
              if (os_log_type_enabled(v24, v25))
              {
                *(_DWORD *)buf = 138412290;
                v42 = v19;
                _os_log_impl((void *)&_mh_execute_header, v24, v25, "%@", buf, 0xCu);
              }
            }

            if (a3)
            {
              NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
              v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v19));
              v39 = v26;
              v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
              v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v27));
              id v29 = *a3;
              *a3 = v28;
            }

            BOOL v18 = 0;
            v17 = (void (**)(void, void, void))obj;
            goto LABEL_23;
          }

          v15 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
          [v15 pet];

          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472LL;
          v33[2] = sub_10009DEA4;
          v33[3] = &unk_1001B9E98;
          v33[4] = self;
          v16 = objc_retainBlock(v33);
          +[MADProgressManager updateProgressIfRequestedForTasks:photoLibrary:reuseCachedValue:cancelOrExtendTimeoutBlock:]( &OBJC_CLASS___MADProgressManager,  "updateProgressIfRequestedForTasks:photoLibrary:reuseCachedValue:cancelOrExtendTimeoutBlock:",  self->_reportingTaskIDs,  v14,  0LL,  v16);
          MediaAnalysisDaemonReleaseSharedDataStores(v14);
        }
      }

      id v11 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v17 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[MADProgressReporterProcessingTask completionHandler]( self,  "completionHandler"));
  v17[2](v17, 0LL, 0LL);
  BOOL v18 = 1;
LABEL_23:

  return v18;
}

- (void).cxx_destruct
{
}

@end