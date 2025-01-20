@interface MSDS3Server
- (MSDS3Server)initWithCellularAccess:(BOOL)a3;
- (void)launchTaskWithRequest:(id)a3;
- (void)uploadMobileStoreDemoLogs:(id)a3;
@end

@implementation MSDS3Server

- (MSDS3Server)initWithCellularAccess:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSDS3Server;
  v4 = -[MSDS3Server init](&v8, "init");
  if (v4)
  {
    v5 = -[MSDSession initWithCellularAccess:](objc_alloc(&OBJC_CLASS___MSDSession), "initWithCellularAccess:", v3);
    -[MSDServer setSession:](v4, "setSession:", v5);

    v6 = v4;
  }

  return v4;
}

- (void)uploadMobileStoreDemoLogs:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "About to send request to S3 server to upload logs.",  buf,  2u);
  }

  v7 = objc_alloc_init(&OBJC_CLASS___MSDServerResponse);
  if ([v4 isValid])
  {
    -[MSDS3Server launchTaskWithRequest:](self, "launchTaskWithRequest:", v4);
    id v8 = 0LL;
  }

  else
  {
    id v9 = sub_10003A95C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000938B0(v4, v10);
    }

    id v13 = 0LL;
    sub_100087610(&v13, 3727744769LL, (uint64_t)@"Input is invalid");
    id v8 = v13;
    -[MSDServerResponse setError:](v7, "setError:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 completion]);

    if (v11)
    {
      v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 completion]);
      ((void (**)(void, MSDServerResponse *))v12)[2](v12, v7);
    }
  }
}

- (void)launchTaskWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___MSDS3SessionTaskInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 s3url]);
  -[MSDS3SessionTaskInfo setS3url:](v5, "setS3url:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 httpHeaders]);
  -[MSDS3SessionTaskInfo setHttpHeaders:](v5, "setHttpHeaders:", v7);

  -[MSDSessionTaskInfo setMaxRetry:](v5, "setMaxRetry:", [v4 retryAttempts]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 logFilePath]);
  -[MSDSessionTaskInfo setPostFile:](v5, "setPostFile:", v8);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10004AB90;
  v12[3] = &unk_1000F9450;
  id v13 = v4;
  id v9 = v4;
  v10 = objc_retainBlock(v12);
  -[MSDSessionTaskInfo setHandler:](v5, "setHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServer session](self, "session"));
  [v11 launchTaskWithInfo:v5];
}

@end