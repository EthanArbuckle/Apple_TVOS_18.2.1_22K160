@interface SAUtilities
+ (id)breakCommaSeparatedStringToComponents:(id)a3;
+ (id)createCommaSeparatedString:(id)a3;
+ (id)splitArray:(id)a3 into:(int)a4;
+ (int)killSADaemon;
+ (int)loadSADaemon;
+ (void)getFileSize:(id)a3 reply:(id)a4;
@end

@implementation SAUtilities

+ (id)splitArray:(id)a3 into:(int)a4
{
  id v5 = a3;
  id v6 = [v5 count];
  if ((unint64_t)v6 < a4)
  {
    uint64_t v7 = SALog(v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002E700(v5, a4, v8);
    }
LABEL_15:

    v9 = 0LL;
    goto LABEL_16;
  }

  if (a4 <= 0)
  {
    uint64_t v16 = SALog(v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002E7A8(a4, v8);
    }
    goto LABEL_15;
  }

  v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  int v10 = [v5 count];
  uint64_t v11 = 0LL;
  int v12 = 0;
  uint64_t v13 = v10 / a4;
  do
  {
    else {
      int v14 = v13;
    }
    if (v12 >= a4 - 1) {
      int v14 = v10;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subarrayWithRange:", v11, v14));
    -[NSMutableArray addObject:](v9, "addObject:", v15);

    v11 += v13;
    ++v12;
    v10 -= v13;
  }

  while (a4 != v12);
LABEL_16:

  return v9;
}

+ (void)getFileSize:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id, void *))a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
  id v17 = 0LL;
  id v16 = 0LL;
  [v7 getResourceValue:&v17 forKey:NSURLFileAllocatedSizeKey error:&v16];
  id v8 = v17;
  id v9 = v16;
  int v10 = v9;
  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v8 == 0LL;
  }
  if (v11)
  {
    uint64_t v12 = SALog(v9);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if (v10) {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" with error %@",  v10));
      }
      else {
        v15 = &stru_10004D588;
      }
      *(_DWORD *)buf = 138412546;
      id v19 = v5;
      __int16 v20 = 2112;
      v21 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to get physical size for file (%@)%@",  buf,  0x16u);
      if (v10) {
    }
      }

    id v14 = 0LL;
  }

  else
  {
    id v14 = [v8 unsignedLongValue];
  }

  v6[2](v6, v14, v10);
}

+ (id)createCommaSeparatedString:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 allObjects]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsJoinedByString:@","]);
  return v5;
}

+ (id)breakCommaSeparatedStringToComponents:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@","]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  return v4;
}

+ (int)killSADaemon
{
  v2 = objc_opt_new(&OBJC_CLASS___NSTask);
  -[NSTask setLaunchPath:](v2, "setLaunchPath:", @"/usr/bin/pkill");
  -[NSTask setArguments:](v2, "setArguments:", &off_10004FB58);
  -[NSTask launchAndReturnError:](v2, "launchAndReturnError:", 0LL);
  -[NSTask waitUntilExit](v2, "waitUntilExit");
  int v3 = -[NSTask terminationStatus](v2, "terminationStatus");

  return v3;
}

+ (int)loadSADaemon
{
  v2 = objc_opt_new(&OBJC_CLASS___NSTask);
  -[NSTask setLaunchPath:](v2, "setLaunchPath:", @"/bin/launchctl");
  -[NSTask setArguments:](v2, "setArguments:", &off_10004FB70);
  -[NSTask launchAndReturnError:](v2, "launchAndReturnError:", 0LL);
  -[NSTask waitUntilExit](v2, "waitUntilExit");
  int v3 = -[NSTask terminationStatus](v2, "terminationStatus");

  return v3;
}

@end