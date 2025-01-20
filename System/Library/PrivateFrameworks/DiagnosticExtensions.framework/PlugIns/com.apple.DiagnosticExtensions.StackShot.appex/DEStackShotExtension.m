@interface DEStackShotExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)takeStackshot;
@end

@implementation DEStackShotExtension

- (id)attachmentList
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"stacks.*\\.(plist|log|ips).*",  1LL,  0LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[DEStackShotExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v4,  v3,  0LL));

  return v5;
}

- (id)attachmentsForParameters:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DEStackShotExtension attachmentList](self, "attachmentList"));
  id v5 = [v4 mutableCopy];
  v6 = -[NSDate initWithTimeIntervalSinceNow:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceNow:",  -1800.0);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "modificationDate", (void)v19));
        id v14 = [v13 compare:v6];

        if (v14 == (id)-1LL) {
          [v5 removeObject:v12];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v9);
  }

  if (![v5 count])
  {
    char v15 = 1;
    do
    {
      char v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DEStackShotExtension takeStackshot](self, "takeStackshot", (void)v19));
      if (v17) {
        [v5 addObject:v17];
      }

      char v15 = 0;
    }

    while ((v16 & 1) != 0);
  }

  return v5;
}

- (id)takeStackshot
{
  if (!qword_100008168)
  {
    v3 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
    qword_100008168 = (uint64_t)v3;
    if (v3)
    {
      v4 = (void (*)(const __CFString *, uint64_t))dlsym(v3, "WriteStackshotReport");
      qword_100008160 = (uint64_t)v4;
      if (v4)
      {
LABEL_11:
        v4(@"Radar Compose taking stackshot", 4276958003LL);
        +[DELogMover moveSystemLogsWithExtensions:](&OBJC_CLASS___DELogMover, "moveSystemLogsWithExtensions:", 0LL);
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DEStackShotExtension attachmentList](self, "attachmentList", 0LL));
        id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
        if (v8)
        {
          id v9 = v8;
          id v10 = 0LL;
          uint64_t v11 = *(void *)v21;
          do
          {
            for (i = 0LL; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v7);
              }
              v13 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
              if (!v10) {
                id v10 = v13;
              }
              id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 modificationDate]);
              char v15 = (void *)objc_claimAutoreleasedReturnValue([v10 modificationDate]);
              id v16 = [v14 compare:v15];

              if (v16 == (id)1)
              {
                id v17 = v13;

                id v10 = v17;
              }
            }

            id v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
          }

          while (v9);
        }

        else
        {
          id v10 = 0LL;
        }

        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DELogging fwHandle](&OBJC_CLASS___DELogging, "fwHandle"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v10;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "stackshot to return: %@", buf, 0xCu);
        }

        goto LABEL_29;
      }

      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DELogging fwHandle](&OBJC_CLASS___DELogging, "fwHandle"));
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      *(_WORD *)buf = 0;
      v6 = "CLWriteStackshotReport is NULL\n";
    }

    else
    {
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DELogging fwHandle](&OBJC_CLASS___DELogging, "fwHandle"));
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        goto LABEL_10;
      }

      *(_WORD *)buf = 0;
      v6 = "Unable to load CrashReporterSupport framework.\n";
    }

    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    goto LABEL_9;
  }

@end