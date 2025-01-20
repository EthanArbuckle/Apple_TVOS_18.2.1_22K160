@interface ESADefaultStorageProvider
+ (id)activityLogFile;
+ (id)containerBaseURL;
- (id)readStoredLog;
- (void)storeLog:(id)a3;
@end

@implementation ESADefaultStorageProvider

+ (id)containerBaseURL
{
  if (qword_100078F88 != -1) {
    dispatch_once(&qword_100078F88, &stru_100068E60);
  }
  if (qword_100078F80)
  {
    id v2 = (id)qword_100078F80;
  }

  else
  {
    v3 = NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4));
  }

  return v2;
}

+ (id)activityLogFile
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1 containerBaseURL]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"sbd-operation-log.plist"]);

  return v3;
}

- (id)readStoredLog
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ESADefaultStorageProvider activityLogFile]( &OBJC_CLASS___ESADefaultStorageProvider,  "activityLogFile"));
  uint64_t v4 = CloudServicesLog();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = objc_opt_class(self, v6);
    __int16 v27 = 2112;
    id v28 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%@: Attempting to load activity log at %@",  buf,  0x16u);
  }

  id v24 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v3,  0LL,  &v24));
  id v9 = v24;
  if (v7)
  {
    id v23 = v9;
    id v10 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___SecureBackupLog, v8),  v7,  &v23);
    id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
    id v12 = v23;

    uint64_t v13 = CloudServicesLog();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10004365C();
      }

      v16 = 0LL;
    }

    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = objc_opt_class(self, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v11 activities]);
        id v21 = [v20 count];
        *(_DWORD *)buf = 138412546;
        uint64_t v26 = v19;
        __int16 v27 = 2048;
        id v28 = v21;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@: Unarchived %lu activity logs", buf, 0x16u);
      }

      id v11 = v11;
      v16 = v11;
    }
  }

  else
  {
    uint64_t v17 = CloudServicesLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      sub_1000435F4();
    }
    v16 = 0LL;
    id v12 = v9;
  }

  return v16;
}

- (void)storeLog:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[ESADefaultStorageProvider activityLogFile]( &OBJC_CLASS___ESADefaultStorageProvider,  "activityLogFile"));
  uint64_t v6 = CloudServicesLog();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = objc_opt_class(self, v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 activities]);
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v9;
    __int16 v28 = 2048;
    id v29 = [v10 count];
    __int16 v30 = 2112;
    v31 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%@: Attempting to write %lu activity logs to %@",  buf,  0x20u);
  }

  id v25 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v25));
  id v12 = v25;
  uint64_t v13 = v12;
  if (v11)
  {
    id v24 = v12;
    unsigned __int8 v14 = [v11 writeToURL:v5 options:1 error:&v24];
    id v15 = v24;

    uint64_t v16 = CloudServicesLog();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = v17;
    if ((v14 & 1) != 0)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = objc_opt_class(self, v19);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 activities]);
        id v22 = [v21 count];
        *(_DWORD *)buf = 138412546;
        uint64_t v27 = v20;
        __int16 v28 = 2048;
        id v29 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%@: Wrote %lu activity logs to disk",  buf,  0x16u);
      }
    }

    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      sub_10004372C();
    }

    uint64_t v13 = v15;
  }

  else
  {
    uint64_t v23 = CloudServicesLog();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000436C4();
    }
  }
}

@end