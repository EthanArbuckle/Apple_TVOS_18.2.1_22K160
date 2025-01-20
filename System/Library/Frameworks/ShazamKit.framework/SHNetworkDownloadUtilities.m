@interface SHNetworkDownloadUtilities
+ (id)cachedFileURLWithFilename:(id)a3 type:(id)a4;
+ (id)downloadDirectory;
+ (id)renameDownloadedFile:(id)a3 withFilename:(id)a4 usingType:(id)a5 error:(id *)a6;
@end

@implementation SHNetworkDownloadUtilities

+ (id)renameDownloadedFile:(id)a3 withFilename:(id)a4 usingType:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 downloadDirectory]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 URLByAppendingPathComponent:v12 conformingToType:v11]);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
  if (([v15 fileExistsAtPath:v16] & 1) == 0)
  {

    goto LABEL_9;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v18 = [v17 removeItemAtURL:v14 error:0];

  if ((v18 & 1) != 0)
  {
LABEL_9:
    v26 = v14;
    goto LABEL_10;
  }

  uint64_t v20 = sh_log_object(v19);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    id v22 = *a6;
    int v39 = 138412546;
    id v40 = v14;
    __int16 v41 = 2112;
    id v42 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Existing downloaded file at %@ could not be removed for a new download. Error: %@.",  (uint8_t *)&v39,  0x16u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 globallyUniqueString]);

  v25 = (void *)objc_claimAutoreleasedReturnValue([a1 downloadDirectory]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 URLByAppendingPathComponent:v24 conformingToType:v11]);

  uint64_t v28 = sh_log_object(v27);
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    int v39 = 138412290;
    id v40 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "Saving downloaded file to %@ instead",  (uint8_t *)&v39,  0xCu);
  }

LABEL_10:
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v31 = [v30 moveItemAtURL:v10 toURL:v26 error:a6];

  uint64_t v33 = sh_log_object(v32);
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  v35 = v34;
  if ((v31 & 1) != 0)
  {
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      int v39 = 138412290;
      id v40 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  "Downloaded archive file from server %@",  (uint8_t *)&v39,  0xCu);
    }

    id v36 = v26;
  }

  else
  {
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v37 = *a6;
      int v39 = 138412802;
      id v40 = v10;
      __int16 v41 = 2112;
      id v42 = v26;
      __int16 v43 = 2112;
      id v44 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Failed to rename item at %@ to %@ Error: %@",  (uint8_t *)&v39,  0x20u);
    }

    id v36 = 0LL;
  }

  return v36;
}

+ (id)cachedFileURLWithFilename:(id)a3 type:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 downloadDirectory]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:v7 conformingToType:v6]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
  LODWORD(v7) = [v10 fileExistsAtPath:v11];

  if ((_DWORD)v7) {
    id v12 = v9;
  }
  else {
    id v12 = 0LL;
  }

  return v12;
}

+ (id)downloadDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    id v7 = NSTemporaryDirectory();
    id v6 = (id)objc_claimAutoreleasedReturnValue(v7);
  }

  v8 = v6;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:@"com.apple.shazamd/Downloads"]);

  unsigned __int8 v24 = 0;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
  unsigned int v13 = [v11 fileExistsAtPath:v12 isDirectory:&v24];
  int v14 = v24;

  if (!v13 || !v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v23 = 0LL;
    unsigned __int8 v16 = [v15 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v23];
    id v17 = v23;

    if ((v16 & 1) == 0)
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));

      uint64_t v20 = sh_log_object(v19);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to create directory for network downloads. Error: %@",  buf,  0xCu);
      }

      id v10 = (void *)v18;
    }
  }

  return v10;
}

@end