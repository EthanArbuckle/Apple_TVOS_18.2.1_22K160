@interface NSFileManager
- (id)tvcd_cacheDirectoryURLForApplication:(id)a3;
- (id)tvcd_cachesDirectoryURL;
- (id)tvcd_documentDirectoryURL;
- (int64_t)tvcd_sizeOfFileAtURL:(id)a3;
@end

@implementation NSFileManager

- (id)tvcd_documentDirectoryURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLsForDirectory:9 inDomains:1]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v4;
}

- (id)tvcd_cachesDirectoryURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLsForDirectory:13 inDomains:1]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v4;
}

- (id)tvcd_cacheDirectoryURLForApplication:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager tvcd_cachesDirectoryURL](self, "tvcd_cachesDirectoryURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v4 isDirectory:1]);

  return v6;
}

- (int64_t)tvcd_sizeOfFileAtURL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = objc_claimAutoreleasedReturnValue([v3 path]);
    v6 = (const char *)[v5 UTF8String];
    objc_sync_enter(@"Size of File Synchronization String");
    qword_100013500 = 0LL;
    if (nftw(v6, (int (__cdecl *)(const char *, const stat *, int, FTW *))sub_100007600, 1, 3) == -1)
    {
      id v8 = sub_100007290();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100007A70((uint64_t)v4, v9);
      }

      int64_t v7 = 0LL;
    }

    else
    {
      int64_t v7 = qword_100013500;
    }

    objc_sync_exit(@"Size of File Synchronization String");
  }

  else
  {
    int64_t v7 = 0LL;
  }

  return v7;
}

@end