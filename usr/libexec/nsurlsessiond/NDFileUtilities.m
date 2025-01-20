@interface NDFileUtilities
+ (BOOL)createDataVaultDirectoryAtPath:(id)a3;
+ (BOOL)itemShouldBePurged:(id)a3;
+ (id)bundleManagerPath:(id)a3;
+ (id)defaultDownloadDirectoryContainer;
+ (id)defaultDownloadDirectoryForBundleID:(id)a3;
+ (id)fetchStreamingZipModificationDate:(id)a3;
+ (id)nsurlsessiondLaunchdPath;
+ (id)nsurlsessiondPath;
+ (id)sessionPath:(id)a3 forBundleID:(id)a4;
+ (void)createDirectoryAtPath:(id)a3;
+ (void)createDirectoryAtURL:(id)a3;
+ (void)markItemAsPurged:(id)a3;
+ (void)removeItemAtPath:(id)a3;
+ (void)removeItemAtURL:(id)a3;
+ (void)removeStreamingZipModificationDate:(id)a3;
+ (void)setDaemonWorkState:(BOOL)a3;
+ (void)updateStreamingZipModificationDate:(id)a3;
@end

@implementation NDFileUtilities

+ (id)nsurlsessiondPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"com.apple.nsurlsessiond"]);

  return v5;
}

+ (id)bundleManagerPath:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](&OBJC_CLASS___NDFileUtilities, "nsurlsessiondPath"));
  id v5 = sub_100003474(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v6]);

  return v7;
}

+ (id)sessionPath:(id)a3 forBundleID:(id)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities bundleManagerPath:](&OBJC_CLASS___NDFileUtilities, "bundleManagerPath:", a4));
  id v7 = sub_100003474(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v8]);

  return v9;
}

+ (id)nsurlsessiondLaunchdPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](&OBJC_CLASS___NDFileUtilities, "nsurlsessiondPath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingString:@"-launchd"]);

  return v3;
}

+ (void)removeItemAtPath:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = 0LL;
  unsigned __int8 v5 = [v4 removeItemAtPath:v3 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    id v7 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 code];
      *(_DWORD *)buf = 138412802;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2048;
      id v15 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Error removing item at path: %@, error: %@ [%ld]",  buf,  0x20u);
    }
  }
}

+ (void)removeItemAtURL:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = 0LL;
  unsigned __int8 v5 = [v4 removeItemAtURL:v3 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    id v7 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 code];
      *(_DWORD *)buf = 138412802;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2048;
      id v15 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Error removing item at url: %@, error: %@ [%ld]",  buf,  0x20u);
    }
  }
}

+ (BOOL)createDataVaultDirectoryAtPath:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    uint64_t v12 = qword_100083990;
    if (!os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    id v13 = "Couldn't create directory.  No path provided.";
    __int16 v14 = (os_log_s *)v12;
    uint32_t v15 = 2;
LABEL_28:
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_16;
  }

  id v5 = v3;
  id v6 = (const char *)[v5 cStringUsingEncoding:4];
  if (!v6)
  {
    uint64_t v16 = qword_100083990;
    if (!os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    v31 = (const char *)v5;
    id v13 = "Couldn't create directory.  Unable to extract C-string from path argument: %@";
    __int16 v14 = (os_log_s *)v16;
    uint32_t v15 = 12;
    goto LABEL_28;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v8 = [v7 fileExistsAtPath:v5];

  if (!v8)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByDeletingLastPathComponent]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v29 = 0LL;
    unsigned __int8 v19 = [v18 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v29];
    id v10 = v29;

    if ((v19 & 1) != 0)
    {
      if (!rootless_mkdir_datavault(v6, 448LL, "nsurlsessiond"))
      {
        BOOL v11 = 1;
        goto LABEL_23;
      }

      v20 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v31) = v21;
        v22 = "Failed to create data-vault directory.  errno=%d";
        v23 = v20;
        uint32_t v24 = 8;
LABEL_30:
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
      }
    }

    else
    {
      v20 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v27 = [v10 code];
        *(_DWORD *)buf = 138412802;
        v31 = (const char *)v5;
        __int16 v32 = 2112;
        id v33 = v10;
        __int16 v34 = 2048;
        id v35 = v27;
        v22 = "Couldn't create directory at %@, error: %@ [%ld]";
        v23 = v20;
        uint32_t v24 = 32;
        goto LABEL_30;
      }
    }

    BOOL v11 = 0;
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }

  if (chmod(v6, 0x1C0u))
  {
    id v9 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v26 = *__error();
      *(_DWORD *)buf = 136315394;
      v31 = v6;
      __int16 v32 = 1024;
      LODWORD(v33) = v26;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to set mode 700 on path %s.  errno=%d",  buf,  0x12u);
    }
  }

  if (rootless_check_datavault_flag(v6, "nsurlsessiond") == 1
    && rootless_convert_to_datavault(v6, "nsurlsessiond"))
  {
    id v10 = (id)qword_100083990;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      int v28 = *__error();
      *(_DWORD *)buf = 136315394;
      v31 = v6;
      __int16 v32 = 1024;
      LODWORD(v33) = v28;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "Failed to convert %s to a data-vault directory.  errno=%d",  buf,  0x12u);
    }

    BOOL v11 = 0;
    goto LABEL_24;
  }

+ (void)createDirectoryAtPath:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = 0LL;
  unsigned __int8 v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    id v7 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 code];
      *(_DWORD *)buf = 138412802;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2048;
      id v15 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Couldn't create directory at %@, error: %@ [%ld]",  buf,  0x20u);
    }
  }
}

+ (void)createDirectoryAtURL:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = 0LL;
  unsigned __int8 v5 = [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    id v7 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 code];
      *(_DWORD *)buf = 138412802;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2048;
      id v15 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Couldn't create directory at %@, error: %@ [%ld]",  buf,  0x20u);
    }
  }
}

+ (id)defaultDownloadDirectoryContainer
{
  v2 = NSTemporaryDirectory();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
  unsigned int v6 = [v5 isPrivileged];

  if (v6)
  {
    id v7 = v4;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v14 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v14]);
    id v10 = v14;

    if (v9)
    {
      id v11 = (os_log_s *)v4;
      v4 = (void *)objc_claimAutoreleasedReturnValue( [v9 URLByAppendingPathComponent:@"com.apple.nsurlsessiond/Downloads" isDirectory:1]);
    }

    else
    {
      id v11 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v13 = [v10 code];
        *(_DWORD *)buf = 138412546;
        id v16 = v10;
        __int16 v17 = 2048;
        id v18 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Error getting caches directory: %@ [%ld]",  buf,  0x16u);
      }
    }

    id v7 = v4;
  }

  return v7;
}

+ (id)defaultDownloadDirectoryForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NDFileUtilities defaultDownloadDirectoryContainer]( &OBJC_CLASS___NDFileUtilities,  "defaultDownloadDirectoryContainer"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:v3 isDirectory:1]);

  return v5;
}

+ (void)setDaemonWorkState:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondLaunchdPath](&OBJC_CLASS___NDFileUtilities, "nsurlsessiondLaunchdPath"));
  unsigned __int8 v5 = v4;
  if (!v4)
  {
    id v7 = 0LL;
    goto LABEL_7;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:@"/nsurlsessiond.launch"]);
  id v7 = (void *)v6;
  if (v3 && v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v8 createFileAtPath:v7 contents:0 attributes:0];
LABEL_5:

    goto LABEL_7;
  }

  if (!v3)
  {
    if (v6)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned int v10 = [v9 fileExistsAtPath:v7];

      if (v10)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        uint64_t v11 = 0LL;
        [v8 removeItemAtPath:v7 error:&v11];
        goto LABEL_5;
      }
    }
  }

+ (void)updateStreamingZipModificationDate:(id)a3
{
  id v3 = a3;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  uint64_t value = v4;
  id v5 = v3;
  uint64_t v6 = (const char *)[v5 fileSystemRepresentation];
  if (v6) {
    setxattr(v6, "com.apple.nsurlsessiond.szmodtime", &value, 8uLL, 0, 0);
  }
}

+ (void)removeStreamingZipModificationDate:(id)a3
{
  id v4 = a3;
  id v3 = (const char *)[v4 fileSystemRepresentation];
  if (v3) {
    removexattr(v3, "com.apple.nsurlsessiond.szmodtime", 0);
  }
}

+ (id)fetchStreamingZipModificationDate:(id)a3
{
  id v3 = (char *)[a3 fileSystemRepresentation];
  if (v3)
  {
    double value = 0.0;
    ssize_t v4 = getxattr(v3, "com.apple.nsurlsessiond.szmodtime", &value, 8uLL, 0, 0);
    id v3 = 0LL;
    if (v4 == 8) {
      id v3 = (char *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  value));
    }
  }

  return v3;
}

+ (void)markItemAsPurged:(id)a3
{
  id v3 = (const char *)[a3 fileSystemRepresentation];
  if (v3)
  {
    char value = 1;
    setxattr(v3, "com.apple.nsurlsessiond.purged", &value, 1uLL, 0, 0);
  }

+ (BOOL)itemShouldBePurged:(id)a3
{
  id v3 = (const char *)[a3 fileSystemRepresentation];
  if (v3) {
    LOBYTE(v3) = getxattr(v3, "com.apple.nsurlsessiond.purged", 0LL, 0LL, 0, 0) == 1;
  }
  return (char)v3;
}

@end