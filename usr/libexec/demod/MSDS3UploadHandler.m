@interface MSDS3UploadHandler
+ (id)sharedInstance;
- (BOOL)uploadInProgress;
- (MSDS3UploadHandler)init;
- (id)demoLogUploadRequest;
- (id)getDefaultLogFolderName;
- (void)clearDemoLogUploadRequest;
- (void)demoLogUploadCompleted:(id)a3;
- (void)saveDemoLogUploadRequest:(id)a3;
- (void)setUploadInProgress:(BOOL)a3;
- (void)uploadDemoLogsIfNeeded;
- (void)uploadDemoLogsTo:(id)a3 HttpHeaders:(id)a4 andMaxAttempts:(int64_t)a5;
@end

@implementation MSDS3UploadHandler

+ (id)sharedInstance
{
  if (qword_1001252E8 != -1) {
    dispatch_once(&qword_1001252E8, &stru_1000F9AA0);
  }
  return (id)qword_1001252E0;
}

- (MSDS3UploadHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDS3UploadHandler;
  v2 = -[MSDS3UploadHandler init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[MSDS3UploadHandler setUploadInProgress:](v2, "setUploadInProgress:", 0LL);
  }
  return v3;
}

- (void)uploadDemoLogsTo:(id)a3 HttpHeaders:(id)a4 andMaxAttempts:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  v46 = sub_100027EF0;
  v47 = sub_100027F00;
  id v48 = 0LL;
  if (-[MSDS3UploadHandler uploadInProgress](self, "uploadInProgress"))
  {
    id v17 = sub_10003A95C();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100094CB8(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_13;
  }

  if (!v8)
  {
    id v26 = sub_10003A95C();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100094CEC(v18, v27, v28, v29, v30, v31, v32, v33);
    }
LABEL_13:

    v34 = (id *)(v44 + 5);
    id obj = (id)v44[5];
    sub_100087610(&obj, 3727744742LL, (uint64_t)@"Failed to upload MobileStoreDemo logs to S3.");
    objc_storeStrong(v34, obj);
    -[MSDS3UploadHandler demoLogUploadCompleted:](self, "demoLogUploadCompleted:", v44[5]);
    goto LABEL_8;
  }

  -[MSDS3UploadHandler setUploadInProgress:](self, "setUploadInProgress:", 1LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3UploadHandler getDefaultLogFolderName](self, "getDefaultLogFolderName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3UploadHandler demoLogUploadRequest](self, "demoLogUploadRequest"));

  if (!v11)
  {
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v8, @"s3URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, @"maxRetry");

    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v10, @"folderName");
    if (v9) {
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v9, @"httpHeaders");
    }
    -[MSDS3UploadHandler saveDemoLogUploadRequest:](self, "saveDemoLogUploadRequest:", v12);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
  v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027F08;
  block[3] = &unk_1000F9AC8;
  id v37 = v10;
  id v38 = v8;
  int64_t v42 = a5;
  v40 = self;
  v41 = &v43;
  id v39 = v9;
  id v16 = v10;
  dispatch_async(v15, block);

LABEL_8:
  _Block_object_dispose(&v43, 8);
}

- (void)uploadDemoLogsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3UploadHandler demoLogUploadRequest](self, "demoLogUploadRequest"));
  v4 = v3;
  if (v3)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"s3URL"]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"folderName"]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"httpHeaders"]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"maxRetry"]);
    id v9 = [v8 integerValue];

    id v10 = sub_10003A95C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Demod was interrupted in between demo log upload to S3! Lets try again..",  v12,  2u);
    }

    -[MSDS3UploadHandler uploadDemoLogsTo:HttpHeaders:andMaxAttempts:]( self,  "uploadDemoLogsTo:HttpHeaders:andMaxAttempts:",  v5,  v7,  v9);
  }
}

- (BOOL)uploadInProgress
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL uploadInProgress = v2->_uploadInProgress;
  objc_sync_exit(v2);

  return uploadInProgress;
}

- (void)setUploadInProgress:(BOOL)a3
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_BOOL uploadInProgress = a3;
  objc_sync_exit(obj);
}

- (void)saveDemoLogUploadRequest:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v4 setObject:v3 forKey:@"DemoLogUploadRequest"];
}

- (void)clearDemoLogUploadRequest
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v2 removeObjectForKey:@"DemoLogUploadRequest"];
}

- (id)demoLogUploadRequest
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"DemoLogUploadRequest"]);

  return v3;
}

- (id)getDefaultLogFolderName
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"yyyyMMddhhmmss");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v3));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serialNumber]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-log-%@", v6, v4));
  return v7;
}

- (void)demoLogUploadCompleted:(id)a3
{
  id v8 = a3;
  if (!-[MSDS3UploadHandler uploadInProgress](self, "uploadInProgress")) {
    -[MSDS3UploadHandler clearDemoLogUploadRequest](self, "clearDemoLogUploadRequest");
  }
  id v4 = v8;
  if (v8)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    [v6 setS3ServerFailureReason:v5];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](&OBJC_CLASS___MSDMailProcessor, "sharedInstance"));
    [v7 reportS3ServerFailed];

    id v4 = v8;
  }
}

@end