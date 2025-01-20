@interface OctaneStorage
+ (id)_containerURL;
+ (id)_createDirectoryAtBaseURL:(id)a3 withPathComponent:(id)a4;
+ (id)persistedDataPath;
@end

@implementation OctaneStorage

+ (id)persistedDataPath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _containerURL]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _createDirectoryAtBaseURL:v3 withPathComponent:@"Documents/Persistence"]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  return v5;
}

+ (id)_createDirectoryAtBaseURL:(id)a3 withPathComponent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v6]);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v19 = 0LL;
    unsigned __int8 v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v19];
    id v11 = v19;

    if ((v10 & 1) == 0)
    {
      if (qword_1002BAE28 != -1) {
        dispatch_once(&qword_1002BAE28, &stru_10026F300);
      }
      if (os_log_type_enabled((os_log_t)qword_1002BAE18, OS_LOG_TYPE_ERROR)) {
        sub_1001EB8AC();
      }
      unsigned __int8 v18 = 0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      unsigned int v14 = [v12 fileExistsAtPath:v13 isDirectory:&v18];
      int v15 = v18;

      if (v14 && v15)
      {
        if (qword_1002BAE28 != -1) {
          dispatch_once(&qword_1002BAE28, &stru_10026F300);
        }
        v16 = (os_log_s *)qword_1002BAE18;
        if (os_log_type_enabled((os_log_t)qword_1002BAE18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v21 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Failed to create directory %{public}@, but directory exists.",  buf,  0xCu);
        }
      }

      else
      {
        if (qword_1002BAE28 != -1) {
          dispatch_once(&qword_1002BAE28, &stru_10026F300);
        }
        if (os_log_type_enabled((os_log_t)qword_1002BAE18, OS_LOG_TYPE_FAULT)) {
          sub_1001EB84C();
        }

        v8 = 0LL;
      }
    }
  }

  else
  {
    if (qword_1002BAE28 != -1) {
      dispatch_once(&qword_1002BAE28, &stru_10026F300);
    }
    if (os_log_type_enabled((os_log_t)qword_1002BAE18, OS_LOG_TYPE_FAULT)) {
      sub_1001EB7EC();
    }
    v8 = 0LL;
    id v11 = 0LL;
  }

  return v8;
}

+ (id)_containerURL
{
  if (qword_1002BADD8 != -1) {
    dispatch_once(&qword_1002BADD8, &stru_10026F2A0);
  }
  return (id)qword_1002BADD0;
}

@end