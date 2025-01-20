@interface NSURL
+ (id)ams_cachesDirectory;
@end

@implementation NSURL

+ (id)ams_cachesDirectory
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 URLByAppendingPathComponent:@"com.apple.AppleMediaServices" isDirectory:1]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
  id v15 = 0LL;
  unsigned __int8 v8 = [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v15];
  id v9 = v15;

  if ((v8 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    if (!v10) {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class(a1, v12);
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      id v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to create caches directory. %{public}@",  buf,  0x16u);
    }
  }

  return v5;
}

@end