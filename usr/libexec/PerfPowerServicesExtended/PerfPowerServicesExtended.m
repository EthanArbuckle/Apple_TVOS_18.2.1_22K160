id sub_100003098()
{
  void *v0;
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[PowerlogCore sharedCore](&OBJC_CLASS___PowerlogCore, "sharedCore"));
  [v0 stopCore];

  return +[PLUtilities exitWithReason:](&OBJC_CLASS___PLUtilities, "exitWithReason:", 2LL);
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  if (+[PowerlogCore allowRun](&OBJC_CLASS___PowerlogCore, "allowRun"))
  {
    if (+[PLDefaults debugEnabled](&OBJC_CLASS___PLDefaults, "debugEnabled"))
    {
      v1 = (void *)objc_claimAutoreleasedReturnValue(+[PLUtilities fullModeDaemonName](&OBJC_CLASS___PLUtilities, "fullModeDaemonName"));
      v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** start %@ ***",  v1));

      v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Executables/PerfPowerServicesExtended/Per fPowerServicesExtended.m"));
      v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "main"));
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:]( &OBJC_CLASS___PLCoreStorage,  "logMessage:fromFile:fromFunction:fromLineNumber:",  v2,  v4,  v5,  59LL);

      uint64_t v6 = PLLogCommon();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_100003784();
      }
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_1000036A4,  @"com.apple.powerlog.state_changed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PowerlogCore sharedCore](&OBJC_CLASS___PowerlogCore, "sharedCore"));
    [v9 startCore];

    objc_autoreleasePoolPop(v0);
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
      unsigned __int8 v12 = [v10 runMode:NSDefaultRunLoopMode beforeDate:v11];
    }

    while ((v12 & 1) != 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PowerlogCore sharedCore](&OBJC_CLASS___PowerlogCore, "sharedCore"));
    [v13 stopCore];
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Library/Caches" stringByAppendingString:@"/powerlogd.launchd"]);
    unsigned int v16 = [v14 fileExistsAtPath:v15];

    unsigned int v17 = +[PLDefaults debugEnabled](&OBJC_CLASS___PLDefaults, "debugEnabled");
    if (v16)
    {
      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[PLUtilities fullModeDaemonName](&OBJC_CLASS___PLUtilities, "fullModeDaemonName"));
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** kill %@ ***",  v18));

        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Executables/PerfPowerServicesExtended/ PerfPowerServicesExtended.m"));
        v21 = (void *)objc_claimAutoreleasedReturnValue([v20 lastPathComponent]);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "main"));
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:]( &OBJC_CLASS___PLCoreStorage,  "logMessage:fromFile:fromFunction:fromLineNumber:",  v19,  v21,  v22,  64LL);

        uint64_t v23 = PLLogCommon();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          sub_100003784();
        }
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v26 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Library/Caches" stringByAppendingString:@"/powerlogd.launchd"]);
      id v45 = 0LL;
      unsigned __int8 v27 = [v25 removeItemAtPath:v26 error:&v45];
      id v28 = v45;

      if ((v27 & 1) != 0)
      {
        if (+[PLDefaults debugEnabled](&OBJC_CLASS___PLDefaults, "debugEnabled"))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Library/Caches" stringByAppendingString:@"/powerlogd.launchd"]);
          NSLog(@"%@ removed ", v29);
        }
      }

      else
      {
        NSLog(@"*** ERROR *** unable to remove launchd flag: %@", v28);
      }

      v37 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v37, @"com.apple.powerlog.state_changed", 0LL, 0LL, 0);
      if (+[PLDefaults debugEnabled](&OBJC_CLASS___PLDefaults, "debugEnabled"))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"sleep to avoid bounce"));
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Executables/PerfPowerServicesExtended/ PerfPowerServicesExtended.m"));
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 lastPathComponent]);
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "main"));
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:]( &OBJC_CLASS___PLCoreStorage,  "logMessage:fromFile:fromFunction:fromLineNumber:",  v38,  v40,  v41,  73LL);

        uint64_t v42 = PLLogCommon();
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
          sub_100003784();
        }
      }

      sleep(0xAu);
    }

    else
    {
      if (v17)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[PLUtilities fullModeDaemonName](&OBJC_CLASS___PLUtilities, "fullModeDaemonName"));
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** stop %@ *** sleep to avoid bounce",  v30));

        v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Executables/PerfPowerServicesExtended/ PerfPowerServicesExtended.m"));
        v33 = (void *)objc_claimAutoreleasedReturnValue([v32 lastPathComponent]);
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "main"));
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:]( &OBJC_CLASS___PLCoreStorage,  "logMessage:fromFile:fromFunction:fromLineNumber:",  v31,  v33,  v34,  77LL);

        uint64_t v35 = PLLogCommon();
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          sub_100003784();
        }
      }

      sleep(0xAu);
    }

    objc_autoreleasePoolPop(v0);
  }

  return 0LL;
}

void sub_1000036A4()
{
  unsigned int v0 = +[PLDefaults taskMode](&OBJC_CLASS___PLDefaults, "taskMode");
  unsigned __int8 v1 = +[PowerlogCore allowRun](&OBJC_CLASS___PowerlogCore, "allowRun");
  unsigned int v2 = +[PLDefaults liveModeQuery](&OBJC_CLASS___PLDefaults, "liveModeQuery");
  if ((v1 & 1) == 0)
  {
    if (!v0)
    {
LABEL_13:
      sub_100003098();
      return;
    }

LABEL_12:
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PLSubmissions sharedInstance](&OBJC_CLASS___PLSubmissions, "sharedInstance"));
    [v4 taskingCleanup];

    goto LABEL_13;
  }

  if (v2 == 1) {
    unsigned int v3 = v0;
  }
  else {
    unsigned int v3 = 0;
  }
  if (v3 == 1) {
    goto LABEL_12;
  }
}

void sub_100003760( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100003784()
{
}

id objc_msgSend_taskingCleanup(void *a1, const char *a2, ...)
{
  return [a1 taskingCleanup];
}