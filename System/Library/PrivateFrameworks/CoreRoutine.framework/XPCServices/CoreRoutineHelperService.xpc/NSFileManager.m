@interface NSFileManager
+ (id)crashReporterPath;
+ (id)defaultsDomain;
+ (id)frameworkBundle;
+ (id)frameworkDirectoryPath;
+ (id)pathInCacheDirectory:(id)a3;
+ (id)routineCacheDirectoryPath;
+ (id)routinePreferencesPath;
+ (id)sortFilesByName:(id)a3;
+ (id)sortedContentsOfDirectoryAtURL:(id)a3 withExtension:(id)a4;
+ (id)userCacheDirectoryPath;
+ (id)userLibraryPath;
+ (id)userPreferencesPath;
@end

@implementation NSFileManager

+ (id)frameworkBundle
{
  return +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.CoreRoutine");
}

+ (id)frameworkDirectoryPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager frameworkBundle](&OBJC_CLASS___NSFileManager, "frameworkBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleURL]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 absoluteString]);

  return v4;
}

+ (id)defaultsDomain
{
  return @"com.apple.routined";
}

+ (id)userCacheDirectoryPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if ([v3 count]) {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

+ (id)routineCacheDirectoryPath
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([a1 userCacheDirectoryPath]);
  if (!v2) {
    return 0LL;
  }
  v3 = (void *)v2;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultsDomain](&OBJC_CLASS___NSFileManager, "defaultsDomain"));
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v4]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LOBYTE(v4) = [v6 fileExistsAtPath:v5];

  if ((v4 & 1) != 0
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
        id v15 = 0LL,
        unsigned int v8 = [v7 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v15],  v9 = v15,  v7,  v8)
    && !v9)
  {
    id v10 = sub_10000B294(&qword_10002D0A0);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "routine cache directory path, %@",  buf,  0xCu);
    }
  }

  else
  {
    id v13 = sub_10000B294(&qword_10002D0A0);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v5;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "failed to create %@, error, %@",  buf,  0x16u);
    }

    v11 = v5;
    v5 = 0LL;
  }

  return v5;
}

+ (id)pathInCacheDirectory:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v4 = sub_10000B294(&qword_10002D0A0);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136315394;
      v28 = "+[NSFileManager(RTExtensions) pathInCacheDirectory:]";
      __int16 v29 = 1024;
      int v30 = 160;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: path (in %s:%d)",  (uint8_t *)&v27,  0x12u);
    }
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager routineCacheDirectoryPath](&OBJC_CLASS___NSFileManager, "routineCacheDirectoryPath"));
  v7 = v6;
  if (v3)
  {
    if (v6)
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v3]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));

      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 standardizedURL]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v9 absoluteString]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v10 absoluteString]);
      unsigned int v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        id v14 = sub_10000B294(&qword_10002D0A0);
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v26 = (char *)objc_claimAutoreleasedReturnValue([v10 path]);
          int v27 = 138412290;
          v28 = v26;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "path in cache directory, %@",  (uint8_t *)&v27,  0xCu);
        }

        id v16 = (id)objc_claimAutoreleasedReturnValue([v10 path]);
      }

      else
      {
        id v16 = 0LL;
      }
    }

    else
    {
      id v21 = sub_10000B294(&qword_10002D0A0);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v27 = 136315394;
        v28 = "+[NSFileManager(RTExtensions) pathInCacheDirectory:]";
        __int16 v29 = 1024;
        int v30 = 172;
        _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Cache path was nil (in %s:%d)",  (uint8_t *)&v27,  0x12u);
      }

      id v23 = sub_10000B294(&qword_10002D0A0);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Cache path was nil",  (uint8_t *)&v27,  2u);
      }

      id v16 = 0LL;
    }
  }

  else
  {
    if (!v6)
    {
      id v17 = sub_10000B294(&qword_10002D0A0);
      __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v27 = 136315394;
        v28 = "+[NSFileManager(RTExtensions) pathInCacheDirectory:]";
        __int16 v29 = 1024;
        int v30 = 164;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Cache path was nil (in %s:%d)",  (uint8_t *)&v27,  0x12u);
      }

      id v19 = sub_10000B294(&qword_10002D0A0);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Cache path was nil",  (uint8_t *)&v27,  2u);
      }
    }

    id v16 = v7;
  }

  return v16;
}

+ (id)userLibraryPath
{
  uint64_t v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if ([v3 count]) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)userPreferencesPath
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 userLibraryPath]);
  id v3 = v2;
  if (v2) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"Preferences"]);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)routinePreferencesPath
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 userPreferencesPath]);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 defaultsDomain]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathExtension:@"plist"]);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

+ (id)crashReporterPath
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 userLibraryPath]);
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([&off_100025920 componentsJoinedByString:@"/"]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:v3]);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)sortedContentsOfDirectoryAtURL:(id)a3 withExtension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v16 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:0 options:3 error:&v16]);
  id v10 = v16;

  if (v10)
  {
    id v11 = sub_10000B294(&qword_10002D0A0);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "encountered error getting contents of directory, %@, error, %@",  buf,  0x16u);
    }

    unsigned int v13 = 0LL;
  }

  else
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"pathExtension",  v7));
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 filteredArrayUsingPredicate:v12]);

    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([a1 sortFilesByName:v14]);
    id v9 = (void *)v14;
  }

  return v13;
}

+ (id)sortFilesByName:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_100024690];
}

@end