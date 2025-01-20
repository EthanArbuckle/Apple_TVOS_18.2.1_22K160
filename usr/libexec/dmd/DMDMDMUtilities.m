@interface DMDMDMUtilities
+ (BOOL)setSkipBackupAttribute:(BOOL)a3 toItemAtPath:(id)a4;
+ (id)iTunesAccountHashForUniqueIdentifier:(id)a3;
@end

@implementation DMDMDMUtilities

+ (id)iTunesAccountHashForUniqueIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = MCUSEnglishNumberFormatter();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringFromNumber:v3]);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dmd_sha1Hash"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 base64EncodedStringWithOptions:0]);
    }

    else
    {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

+ (BOOL)setSkipBackupAttribute:(BOOL)a3 toItemAtPath:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
        v8 = (void *)objc_claimAutoreleasedReturnValue([v6 path]),
        unsigned __int8 v9 = [v7 fileExistsAtPath:v8],
        v8,
        v7,
        (v9 & 1) != 0))
  {
    id v18 = 0LL;
    unsigned int v10 = [v6 getResourceValue:&v18 forKey:NSURLIsExcludedFromBackupKey error:0];
    id v11 = v18;
    v12 = v11;
    if (v10 && [v11 BOOLValue] == v4)
    {
      LOBYTE(v14) = 1;
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
      id v17 = 0LL;
      unsigned int v14 = [v6 setResourceValue:v13 forKey:NSURLIsExcludedFromBackupKey error:&v17];
      id v15 = v17;

      if ((!v14 || v15) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100065078(v6, (uint64_t)v15);
      }
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100064FFC((uint64_t)v5);
    }
    LOBYTE(v14) = 0;
  }

  return v14;
}

@end