@interface SystemDiagnosticLogAgent
+ (BOOL)_runBlock:(id)a3 withTimeout:(double)a4;
+ (BOOL)_runDispatchBlock:(id)a3 withTimeout:(double)a4 onQueue:(id)a5;
+ (id)logAgentWithTaskType:(int)a3;
+ (id)stringForReqType:(int)a3;
- (BOOL)ASPMagazineTaskForDir:(id)a3 withTimeout:(double)a4;
- (BOOL)ASPToolGenericWithTimeout:(double)a3 forFile:(id)a4 andBlock:(id)a5;
- (BOOL)ASPToolSnapshotForDir:(id)a3 withTimeout:(double)a4;
- (BOOL)ASPToolTaskForDir:(id)a3 withTimeout:(double)a4;
- (BOOL)DSCSYMTaskForDir:(id)a3 withTimeout:(double)a4;
- (BOOL)FDRDiagnosticTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)_libNotifyTaskAtLocation:(id)a3 andTimeout:(double)a4;
- (BOOL)_memoryExceptionsListLogsTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)_powerTaskForDir:(id)a3 withTimeout:(double)a4;
- (BOOL)_runBlockForCurrentUser:(id)a3 withTimeout:(double)a4;
- (BOOL)batteryHealthTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)coreCaptureTaskWithDir:(id)a3 withTimeout:(double)a4 ofType:(int)a5;
- (BOOL)getCloudKitPreferences:(id)a3 withTimeout:(double)a4;
- (BOOL)getPreferences:(id)a3 withTimeout:(double)a4;
- (BOOL)getPreferencesInternal:(id)a3 withTimeout:(double)a4;
- (BOOL)osEligibilityDumpToDir:(id)a3 withTimeout:(double)a4;
- (BOOL)parseLogAgentRequest:(id)a3 outputPath:(id *)a4 timeout:(double *)a5 taskType:(int *)a6 startTimeClockNS:(int64_t *)a7;
- (BOOL)runningBoardTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)setRootMode;
- (BOOL)setUserMode;
- (BOOL)tailspinInfoTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)tailspinSaveNoSymbolicateTSTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)tailspinSaveSpiWrapperForReason:(id)a3 forPath:(id)a4 collectAriadne:(BOOL)a5 withTimeout:(double)a6;
- (BOOL)timezoneTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)trialTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)unifiedAssetTaskWithDir:(id)a3 withTimeout:(double)a4;
- (OS_dispatch_queue)serialQueue;
- (OS_os_log)logHandle;
- (id)_memoryExceptionsTaskWithTimeout:(double)a3;
- (id)coreCaptureConfigTask:(double)a3;
- (id)excResourcePathsWithTimeout:(double)a3;
- (id)getPreferencesForDomain:(id)a3 withKey:(id)a4 andNestedKeys:(id)a5 currentUser:(BOOL)a6;
- (id)getPreferencesForDomain:(id)a3 withKeys:(id)a4 currentUser:(BOOL)a5;
- (id)intelligencePlatformTaskWithTimeout:(id)a3 withTimeout:(double)a4;
- (id)tailspinAugmentSpiWrapperForPath:(id)a3 withDestName:(id)a4 collectAriadne:(BOOL)a5 withTimeout:(double)a6;
- (id)tailspinAugmentTaskWithDir:(id)a3 withTimeout:(double)a4;
- (id)tailspinKeychordTaskWithDir:(id)a3 withTimeout:(double)a4;
- (int64_t)_logItemForType:(int)a3;
- (void)processMessage:(id)a3 replyWith:(id)a4;
- (void)setLogHandle:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)writePreferenceInDomain:(id)a3 withKey:(id)a4 toDirectory:(id)a5 currentUser:(BOOL)a6;
@end

@implementation SystemDiagnosticLogAgent

+ (id)logAgentWithTaskType:(int)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___SystemDiagnosticLogAgentiOS);
  v5 = sub_10000356C(a3);
  id v6 = objc_claimAutoreleasedReturnValue(v5);
  os_log_t v7 = os_log_create("com.apple.sysdiagnose", (const char *)[v6 UTF8String]);
  -[SystemDiagnosticLogAgent setLogHandle:](v4, "setLogHandle:", v7);

  return v4;
}

- (void)processMessage:(id)a3 replyWith:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn( "-[SystemDiagnosticLogAgent processMessage:replyWith:]",  "SystemDiagnosticLogAgent.m",  162,  "0 && \"Should call this from subclass only\"");
}

- (BOOL)DSCSYMTaskForDir:(id)a3 withTimeout:(double)a4
{
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000442C;
  v11[3] = &unk_100060810;
  v13 = &v14;
  id v6 = a3;
  id v12 = v6;
  if (!+[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v11,  a4))
  {
    os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DSCSYM task timed out", v10, 2u);
    }
  }

  char v8 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)intelligencePlatformTaskWithTimeout:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  if (objc_opt_class(&OBJC_CLASS___GDXPCSysdiagnoseService, v7))
  {
    *(void *)buf = 0LL;
    v25 = buf;
    uint64_t v26 = 0x3032000000LL;
    v27 = sub_1000047D0;
    v28 = sub_1000047E0;
    id v29 = 0LL;
    uint64_t v20 = 0LL;
    v21 = &v20;
    uint64_t v22 = 0x2020000000LL;
    char v23 = 0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000047E8;
    v19[3] = &unk_100060838;
    v19[4] = self;
    v19[5] = buf;
    v19[6] = &v20;
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v19,  a4))
    {
      if (*((_BYTE *)v21 + 24))
      {
        char v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"intelligence_platform_status.json"]);
        v9 = (void *)*((void *)v25 + 5);
        id v18 = 0LL;
        unsigned __int8 v10 = [v9 writeToFile:v8 atomically:0 encoding:4 error:&v18];
        id v11 = v18;
        if ((v10 & 1) != 0)
        {
          v30 = v8;
          id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v30,  1LL));
        }

        else
        {
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
            *(_DWORD *)v31 = 138412546;
            v32 = v8;
            __int16 v33 = 2112;
            v34 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Failed to write intelligence platform data to '%@' with error: %@",  v31,  0x16u);
          }

          id v12 = &__NSArray0__struct;
        }

        goto LABEL_19;
      }

      id v11 = (id)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        uint64_t v14 = "Intelligence platform SPI did not succeed";
        goto LABEL_13;
      }
    }

    else
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        uint64_t v14 = "Intelligence platform SPI timed out";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, v14, v31, 2u);
      }
    }

    id v12 = &__NSArray0__struct;
LABEL_19:

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_20;
  }

  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "GDXPCSysdiagnoseService class not found on this platform, failing intelligencePlatformTaskWithTimeout",  buf,  2u);
  }

  id v12 = &__NSArray0__struct;
LABEL_20:

  return v12;
}

- (BOOL)batteryHealthTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (&_IOPSCopyPowerSourcesByTypePrecise)
  {
    *(void *)buf = 0LL;
    id v18 = buf;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100004B20;
    v14[3] = &unk_100060710;
    v14[4] = self;
    uint64_t v16 = buf;
    id v8 = (id)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"BatteryHealth.log"]);
    id v15 = v8;
    unsigned int v10 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v14,  a4);
    if (v10 && v18[24])
    {
      BOOL v9 = 1;
    }

    else
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = v18[24];
        *(_DWORD *)v21 = 67109376;
        unsigned int v22 = v10;
        __int16 v23 = 1024;
        int v24 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "IOKitPS SPI timed out (%d) or couldn't create the dest file (%d)",  v21,  0xEu);
      }

      BOOL v9 = 0;
    }

    _Block_object_dispose(buf, 8);
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "IOPSCopyPowerSourcesByTypePrecise SPI not found",  buf,  2u);
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)timezoneTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100004F80;
  v12[3] = &unk_100060810;
  uint64_t v14 = &v15;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"tzDataVersion.log"]);
  id v13 = v7;
  if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v12,  a4)
    && *((_BYTE *)v16 + 24))
  {
    BOOL v8 = 1;
  }

  else
  {
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "SPI timed out or couldn't create the dest file",  v11,  2u);
    }

    BOOL v8 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)runningBoardTaskWithDir:(id)a3 withTimeout:(double)a4
{
  if (&_RBSCaptureStateToFile)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000519C;
    v10[3] = &unk_100060860;
    id v5 = (id)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathComponent:@"RunningBoard_state.log"]);
    id v11 = v5;
    BOOL v6 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v10,  a4);
    if (!v6)
    {
      BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "RunningBoard SPI timed out or couldn't create the dest file",  buf,  2u);
      }
    }
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", a3, a4));
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "RunningBoard SPI not found",  buf,  2u);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)_logItemForType:(int)a3
{
  int64_t v3 = 56LL;
  if (a3) {
    int64_t v3 = 0LL;
  }
  if (a3 == 1) {
    return 79LL;
  }
  else {
    return v3;
  }
}

- (BOOL)coreCaptureTaskWithDir:(id)a3 withTimeout:(double)a4 ofType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  if (objc_opt_class(&OBJC_CLASS___W5LogItemRequest, v9))
  {
    int64_t v10 = -[SystemDiagnosticLogAgent _logItemForType:](self, "_logItemForType:", v5);
    if (v10)
    {
      *(void *)buf = 0LL;
      __int16 v33 = buf;
      uint64_t v34 = 0x3032000000LL;
      v35 = sub_1000047D0;
      v36 = sub_1000047E0;
      id v37 = 0LL;
      uint64_t v26 = 0LL;
      v27 = &v26;
      uint64_t v28 = 0x3032000000LL;
      id v29 = sub_1000047D0;
      v30 = sub_1000047E0;
      id v31 = 0LL;
      uint64_t v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472LL;
      char v18 = sub_1000054E8;
      uint64_t v19 = &unk_100060888;
      int64_t v24 = v10;
      char v20 = self;
      double v25 = a4;
      id v21 = v8;
      unsigned int v22 = buf;
      __int16 v23 = &v26;
      if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  &v16,  a4))
      {
        if (*((void *)v33 + 5))
        {
          BOOL v11 = 1;
LABEL_17:

          _Block_object_dispose(&v26, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_18;
        }

        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", v16, v17, v18, v19, v20));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([(id)v27[5] localizedDescription]);
          *(_DWORD *)v38 = 138412290;
          v39 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "CoreCapture SPI failed due to %@",  v38,  0xCu);
        }
      }

      else
      {
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", v16, v17, v18, v19, v20));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v38 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CoreCapture task timed out", v38, 2u);
        }
      }

      BOOL v11 = 0;
      goto LABEL_17;
    }

    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Not a valid corecapture request type.",  buf,  2u);
    }
  }

  else
  {
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Wifi velocity SPI not found", buf, 2u);
    }
  }

  BOOL v11 = 0;
LABEL_18:

  return v11;
}

- (BOOL)unifiedAssetTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  if (objc_opt_class(&OBJC_CLASS___UAFAssetSetManager, v7))
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    char v18 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100005868;
    v12[3] = &unk_100060710;
    void v12[4] = self;
    uint64_t v14 = &v15;
    id v8 = (id)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"unified_asset_manager.log"]);
    id v13 = v8;
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v12,  a4)
      && *((_BYTE *)v16 + 24))
    {
      BOOL v9 = 1;
    }

    else
    {
      int64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002EB90();
      }

      BOOL v9 = 0;
    }

    _Block_object_dispose(&v15, 8);
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      sub_10002EB64();
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)trialTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  if (objc_opt_class(&OBJC_CLASS___TRIClient, v7))
  {
    int v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = sub_100005A80;
    uint64_t v15 = &unk_1000608B0;
    uint64_t v16 = (os_log_s *)v6;
    uint64_t v17 = self;
    BOOL v8 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  &v12,  a4);
    if (!v8)
    {
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", v12, v13, v14, v15));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002ED14();
      }
    }

    int64_t v10 = v16;
  }

  else
  {
    int64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002ECE8();
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_powerTaskForDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (&_PLSysdiagnoseCopyPowerlog)
  {
    *(void *)buf = 0LL;
    id v21 = buf;
    uint64_t v22 = 0x2020000000LL;
    char v23 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100005D14;
    v15[3] = &unk_1000608D8;
    double v19 = a4;
    id v16 = v6;
    uint64_t v17 = self;
    char v18 = buf;
    unsigned int v10 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v15,  a4);
    if ((v10 & 1) == 0)
    {
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Power logs timed out", v14, 2u);
      }
    }

    if (v21[24])
    {
      if (v10)
      {
LABEL_11:
        BOOL v9 = v21[24] != 0;
LABEL_16:

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }

    else
    {
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Power logs did not succeed", v14, 2u);
      }

      if (v10) {
        goto LABEL_11;
      }
    }

    BOOL v9 = 0;
    goto LABEL_16;
  }

  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PowerTask SPI not found", buf, 2u);
  }

  BOOL v9 = 0;
LABEL_17:

  return v9;
}

- (id)excResourcePathsWithTimeout:(double)a3
{
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = sub_1000047D0;
  uint64_t v15 = sub_1000047E0;
  id v16 = 0LL;
  if (!&_ExcResourceReportPaths)
  {
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", a3));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v5 = "CoreDiagnostics SPI not available.";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
      goto LABEL_9;
    }

    goto LABEL_9;
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000601C;
  v9[3] = &unk_100060900;
  v9[4] = &v11;
  if (!+[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v9,  a3)
    || (id v6 = (void *)v12[5]) == 0LL)
  {
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v5 = "Failed to get paths for ExcResource logs.";
      goto LABEL_8;
    }

- (id)_memoryExceptionsTaskWithTimeout:(double)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = sub_1000047D0;
  uint64_t v14 = sub_1000047E0;
  id v15 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000617C;
  v9[3] = &unk_100060900;
  v9[4] = &v10;
  if (!+[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v9,  a3)
    || (v4 = (void *)v11[5]) == 0LL)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Failed to get ReportMemoryException logs.",  v8,  2u);
    }

    v4 = (void *)v11[5];
  }

  id v6 = v4;
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (BOOL)_memoryExceptionsListLogsTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100006370;
  v13[3] = &unk_100060710;
  v13[4] = self;
  id v15 = &v16;
  id v7 = (id)objc_claimAutoreleasedReturnValue( [v6 stringByAppendingPathComponent:@"ReportMemoryExceptionTool_listLogs.txt"]);
  id v14 = v7;
  unsigned int v8 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v13,  a4);
  if (v8 && *((_BYTE *)v17 + 24))
  {
    BOOL v9 = 1;
  }

  else
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *((unsigned __int8 *)v17 + 24);
      *(_DWORD *)buf = 67109376;
      unsigned int v21 = v8;
      __int16 v22 = 1024;
      int v23 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "RMECacheEnumerator getLogPathsSortedByTime timed out !(%d) or failed to create dest file !(%d)",  buf,  0xEu);
    }

    BOOL v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)coreCaptureConfigTask:(double)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (objc_opt_class(&OBJC_CLASS___W5Client, v6))
  {
    *(void *)buf = 0LL;
    uint64_t v26 = buf;
    uint64_t v27 = 0x3032000000LL;
    uint64_t v28 = sub_1000047D0;
    id v29 = sub_1000047E0;
    id v30 = 0LL;
    uint64_t v19 = 0LL;
    char v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    __int16 v22 = sub_1000047D0;
    int v23 = sub_1000047E0;
    id v24 = 0LL;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000068D8;
    v18[3] = &unk_100060928;
    v18[4] = self;
    v18[5] = buf;
    v18[6] = &v19;
    if (!+[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v18,  a3))
    {
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CoreCaptureConfig task timed out", v31, 2u);
      }

      id v12 = 0LL;
      goto LABEL_24;
    }

    if (!*((void *)v26 + 5))
    {
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([(id)v20[5] localizedDescription]);
        *(_DWORD *)id v31 = 138412290;
        v32 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Error querying Wifi Velocity configuration for peer due to %@. Assuming WiFiVelocity MegaProfile is not enabled",  v31,  0xCu);
      }

      xpc_dictionary_set_BOOL(v5, "wiFiVelocityMegaProfile", 0);
      goto LABEL_23;
    }

    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002EDBC(v31, (uint64_t)[*((id *)v26 + 5) megaWiFiProfile], v7);
    }

    unsigned int v8 = (void *)*((void *)v26 + 5);
    if (v8 && [v8 megaWiFiProfile] == (id)1)
    {
      xpc_dictionary_set_BOOL(v5, "wiFiVelocityMegaProfile", 1);
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        uint64_t v10 = "WiFiVelocity MegaProfile is enabled";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v17, 2u);
      }
    }

    else
    {
      xpc_dictionary_set_BOOL(v5, "wiFiVelocityMegaProfile", 0);
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        uint64_t v10 = "WiFiVelocity MegaProfile is not enabled";
        goto LABEL_18;
      }
    }

LABEL_23:
    id v12 = v5;
LABEL_24:
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_25;
  }

  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "WiFi Velocity SPI not found", buf, 2u);
  }

  id v12 = 0LL;
LABEL_25:

  return v12;
}

- (BOOL)ASPToolGenericWithTimeout:(double)a3 forFile:(id)a4 andBlock:(id)a5
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100006AC0;
  v14[3] = &unk_100060950;
  id v15 = a4;
  uint64_t v16 = self;
  id v17 = a5;
  id v8 = v17;
  id v9 = v15;
  BOOL v10 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v14,  a3);
  if (!v10)
  {
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ASPTool task timed out", v13, 2u);
    }
  }

  return v10;
}

- (BOOL)ASPToolSnapshotForDir:(id)a3 withTimeout:(double)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathComponent:@"asptool_snapshot_timesensitive.log"]);
  LOBYTE(self) = -[SystemDiagnosticLogAgent ASPToolGenericWithTimeout:forFile:andBlock:]( self,  "ASPToolGenericWithTimeout:forFile:andBlock:",  v6,  &stru_100060970,  a4);

  return (char)self;
}

- (BOOL)ASPToolTaskForDir:(id)a3 withTimeout:(double)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathComponent:@"asptool_snapshot.log"]);
  LOBYTE(self) = -[SystemDiagnosticLogAgent ASPToolGenericWithTimeout:forFile:andBlock:]( self,  "ASPToolGenericWithTimeout:forFile:andBlock:",  v6,  &stru_100060990,  a4);

  return (char)self;
}

- (BOOL)FDRDiagnosticTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  id v7 = v6;
  if (&_ZhuGeCopyValue)
  {
    v26[0] = v6;
    v26[1] = @"FDRDiagnosticReport.plist";
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v10));

    *(void *)buf = 0LL;
    uint64_t v19 = buf;
    uint64_t v20 = 0x3032000000LL;
    uint64_t v21 = sub_1000047D0;
    __int16 v22 = sub_1000047E0;
    id v23 = 0LL;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100006F70;
    v17[3] = &unk_100060810;
    v17[4] = self;
    v17[5] = buf;
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v17,  a4))
    {
      int v11 = (void *)*((void *)v19 + 5);
      if (v11)
      {
        id v16 = 0LL;
        unsigned __int8 v12 = [v11 writeToURL:v8 error:&v16];
        uint64_t v13 = (os_log_s *)v16;
        if ((v12 & 1) != 0)
        {
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v24 = 138412290;
            double v25 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "FDRDiagnostic report generated successfully at %@",  v24,  0xCu);
          }

          BOOL v9 = 1;
          goto LABEL_18;
        }
      }

      else
      {
        uint64_t v13 = 0LL;
      }

      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v24 = 138412290;
        double v25 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Could not write FDRDiagnostic report: %@",  v24,  0xCu);
      }
    }

    else
    {
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ZhuGe SPI timed out", v24, 2u);
      }

      uint64_t v13 = 0LL;
    }

    BOOL v9 = 0;
LABEL_18:

    _Block_object_dispose(buf, 8);
    goto LABEL_19;
  }

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ZhuGe SPI not found", buf, 2u);
  }

  BOOL v9 = 0;
LABEL_19:

  return v9;
}

- (BOOL)tailspinInfoTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (&_tailspin_config_copy_description) {
    BOOL v9 = &_tailspin_config_create_with_current_state == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tailspin SPI not found", buf, 2u);
    }

    BOOL v10 = 0;
  }

  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tailspin info task starting", buf, 2u);
    }

    v27[0] = v6;
    v27[1] = @"tailspin-info.txt";
    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v11));

    *(void *)buf = 0LL;
    id v24 = buf;
    uint64_t v25 = 0x2020000000LL;
    char v26 = 0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100007380;
    v19[3] = &unk_100060710;
    id v7 = v12;
    uint64_t v21 = self;
    __int16 v22 = buf;
    uint64_t v20 = v7;
    unsigned int v13 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v19,  a4);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Tailspin info task ending", v18, 2u);
    }

    if ((v13 & 1) == 0)
    {
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Tailspin Info SPI timed out", v18, 2u);
      }
    }

    if (!v24[24])
    {
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Tailspin Info SPI failed to create dest file",  v18,  2u);
      }
    }

    if (v13) {
      BOOL v10 = v24[24] != 0;
    }
    else {
      BOOL v10 = 0;
    }

    _Block_object_dispose(buf, 8);
  }

  return v10;
}

- (BOOL)tailspinSaveSpiWrapperForReason:(id)a3 forPath:(id)a4 collectAriadne:(BOOL)a5 withTimeout:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!&_tailspin_dump_output_with_options_sync)
  {
    if (v13)
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Tailspin SPI not found", (uint8_t *)&buf, 2u);
    }

LABEL_16:
    BOOL v20 = 0;
    goto LABEL_27;
  }

  if (v13)
  {
    LOWORD(buf.st_dev) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Tailspin save task starting",  (uint8_t *)&buf,  2u);
  }

  id v14 = v11;
  int v15 = open((const char *)[v14 fileSystemRepresentation], 2562, 420);
  if (v15 == -1)
  {
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10002EE00();
    }

    goto LABEL_16;
  }

  int v16 = v15;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10000785C;
  v29[3] = &unk_1000609B8;
  id v17 = v10;
  BOOL v33 = a5;
  id v30 = v17;
  id v31 = &v34;
  int v32 = v16;
  unsigned int v18 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v29,  a6);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.st_dev) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Tailspin save task ending",  (uint8_t *)&buf,  2u);
  }

  fsync(v16);
  if (v18)
  {
    if (*((_BYTE *)v35 + 24))
    {
      BOOL v20 = 1;
    }

    else
    {
      memset(&buf, 0, sizeof(buf));
      if (fstat(v16, &buf)) {
        BOOL v25 = 0;
      }
      else {
        BOOL v25 = buf.st_size == 0;
      }
      BOOL v20 = !v25;
      if (v25)
      {
        char v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v27 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Removing empty tailspin-trace file",  v27,  2u);
        }

        unlink((const char *)[v14 fileSystemRepresentation]);
      }
    }
  }

  else
  {
    BOOL v20 = 0;
  }

  close(v16);
  if ((v18 & 1) == 0)
  {
    __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Tailspin Save No Symbolicate SPI timed out",  (uint8_t *)&buf,  2u);
    }
  }

  if (!*((_BYTE *)v35 + 24))
  {
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Tailspin Save No Symbolicate SPI failed to create dest file",  (uint8_t *)&buf,  2u);
    }
  }

  _Block_object_dispose(&v34, 8);
LABEL_27:

  return v20;
}

- (id)tailspinAugmentSpiWrapperForPath:(id)a3 withDestName:(id)a4 collectAriadne:(BOOL)a5 withTimeout:(double)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (!&_tailspin_augment_output)
  {
    unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Tailspin augment SPI not found", buf, 2u);
    }

- (BOOL)tailspinSaveNoSymbolicateTSTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathComponent:@"tailspin-trace.tailspin"]);
  LOBYTE(self) = -[SystemDiagnosticLogAgent tailspinSaveSpiWrapperForReason:forPath:collectAriadne:withTimeout:]( self,  "tailspinSaveSpiWrapperForReason:forPath:collectAriadne:withTimeout:",  @"sysdiagnose",  v6,  1LL,  a4);

  return (char)self;
}

- (id)tailspinAugmentTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"tailspin-trace-unsymbolicated.tailspin"]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"tailspin-trace.tailspin"]);

  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Tailspin augment task starting", buf, 2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SystemDiagnosticLogAgent tailspinAugmentSpiWrapperForPath:withDestName:collectAriadne:withTimeout:]( self,  "tailspinAugmentSpiWrapperForPath:withDestName:collectAriadne:withTimeout:",  v7,  v8,  1LL,  a4));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Tailspin save task ending", v13, 2u);
  }

  return v10;
}

- (id)tailspinKeychordTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  sub_100003C64(v12, 0x400uLL, "tailspin", "no-symbols", "tailspin");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v7]);

  if (!v8)
  {
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002EE7C();
    }
    BOOL v8 = 0LL;
    goto LABEL_7;
  }

  if (-[SystemDiagnosticLogAgent tailspinSaveSpiWrapperForReason:forPath:collectAriadne:withTimeout:]( self,  "tailspinSaveSpiWrapperForReason:forPath:collectAriadne:withTimeout:",  @"tailspin keychord",  v8,  0LL,  a4))
  {
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v8 stringByReplacingOccurrencesOfString:@"-no-symbols" withString:&stru_1000619F0]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue( -[SystemDiagnosticLogAgent tailspinAugmentSpiWrapperForPath:withDestName:collectAriadne:withTimeout:]( self,  "tailspinAugmentSpiWrapperForPath:withDestName:collectAriadne:withTimeout:",  v8,  v9,  0LL,  a4));

    BOOL v8 = (void *)v10;
LABEL_7:
  }

  return v8;
}

- (BOOL)ASPMagazineTaskForDir:(id)a3 withTimeout:(double)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathComponent:@"asptool_magazine_stats.log"]);
  LOBYTE(self) = -[SystemDiagnosticLogAgent ASPToolGenericWithTimeout:forFile:andBlock:]( self,  "ASPToolGenericWithTimeout:forFile:andBlock:",  v6,  &stru_100060A00,  a4);

  return (char)self;
}

- (BOOL)_libNotifyTaskAtLocation:(id)a3 andTimeout:(double)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000082EC;
  v8[3] = &unk_100060860;
  id v9 = a3;
  id v5 = v9;
  BOOL v6 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v8,  a4);

  return v6;
}

- (BOOL)setUserMode
{
  int64_t v3 = getpwnam((const char *)[@"mobile" UTF8String]);
  if (v3)
  {
    v4 = v3;
    uid_t pw_uid = v3->pw_uid;
    if (!pw_uid)
    {
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002EF6C();
      }
      goto LABEL_11;
    }

    gid_t pw_gid = v4->pw_gid;
  }

  else
  {
    uid_t pw_uid = 501;
    gid_t pw_gid = 501;
  }

  if (pthread_setugid_np(pw_uid, pw_gid) != -1) {
    return 1;
  }
  int v8 = *__error();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10002EEFC(v8);
  }
LABEL_11:

  return 0;
}

- (BOOL)setRootMode
{
  uid_t v3 = getuid();
  gid_t v4 = v3 | getgid();
  BOOL v5 = v4 != 0;
  if (v4)
  {
    if (pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B) == -1) {
      sub_10002EF98(&v8, v9);
    }
  }

  else
  {
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10002F058();
    }
  }

  return v5;
}

- (id)getPreferencesForDomain:(id)a3 withKeys:(id)a4 currentUser:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = (__CFString *)a3;
  id v9 = (const __CFArray *)a4;
  if (v5)
  {
    uint64_t v10 = @"mobile";
    getpwnam((const char *)[@"mobile" UTF8String]);
  }

  else
  {
    uint64_t v10 = (id)kCFPreferencesCurrentUser;
  }

  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = kCFPreferencesAnyApplication;
  }
  CFDictionaryRef v12 = CFPreferencesCopyMultiple(v9, v11, v10, kCFPreferencesAnyHost);
  CFTypeID v13 = CFGetTypeID(v12);
  if (v13 == CFDictionaryGetTypeID())
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v12));
  }

  else
  {
    dispatch_semaphore_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      dispatch_queue_t v18 = v8;
      __int16 v19 = 2112;
      dispatch_time_t v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Unable to get preferences: Domain: %@, keys: %@.",  (uint8_t *)&v17,  0x16u);
    }

    uint64_t v14 = &__NSDictionary0__struct;
  }

  CFRelease(v12);

  return v14;
}

- (id)getPreferencesForDomain:(id)a3 withKey:(id)a4 andNestedKeys:(id)a5 currentUser:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v27 = a4;
  id v11 = a4;
  id v12 = a3;
  CFTypeID v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[SystemDiagnosticLogAgent getPreferencesForDomain:withKeys:currentUser:]( self,  "getPreferencesForDomain:withKeys:currentUser:",  v12,  v13,  v6));

  dispatch_semaphore_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v11]);
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  id v23 = sub_1000087A8;
  id v24 = &unk_100060A28;
  id v25 = v10;
  id v26 = v15;
  id v17 = v15;
  id v18 = v10;
  [v16 enumerateKeysAndObjectsUsingBlock:&v21];

  id v19 = objc_msgSend(v17, "copy", v21, v22, v23, v24);
  return v19;
}

- (void)writePreferenceInDomain:(id)a3 withKey:(id)a4 toDirectory:(id)a5 currentUser:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    id v22 = v11;
    CFTypeID v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    uint64_t v14 = v11;
  }

  else
  {
    CFTypeID v13 = 0LL;
    uint64_t v14 = v10;
  }

  dispatch_semaphore_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[SystemDiagnosticLogAgent getPreferencesForDomain:withKeys:currentUser:]( self,  "getPreferencesForDomain:withKeys:currentUser:",  v10,  v13,  v6));
  if (v6) {
    int v16 = @"_CurrentUser.txt";
  }
  else {
    int v16 = @"_Global.txt";
  }
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingString:v16]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
  unsigned __int8 v19 = sub_100003F0C(v12, (uint64_t)v17, v18);

  if ((v19 & 1) == 0)
  {
    dispatch_time_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Unable to create file to write preferences",  v21,  2u);
    }
  }
}

- (BOOL)getPreferences:(id)a3 withTimeout:(double)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100008A8C;
  v11[3] = &unk_1000608B0;
  void v11[4] = self;
  id v12 = a3;
  id v6 = v12;
  BOOL v7 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v11,  a4);
  if (!v7)
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preferences did not return in time.", v10, 2u);
    }
  }

  return v7;
}

- (BOOL)osEligibilityDumpToDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (&_os_eligibility_dump_sysdiagnose_data_to_dir)
  {
    *(void *)stat buf = 0LL;
    id v18 = buf;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100008D64;
    v13[3] = &unk_100060A50;
    id v14 = v6;
    dispatch_semaphore_t v15 = self;
    int v16 = buf;
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v13,  a4))
    {
      BOOL v9 = v18[24] != 0;
    }

    else
    {
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "os eligibility task timed out", v12, 2u);
      }

      BOOL v9 = 0;
    }

    _Block_object_dispose(buf, 8);
  }

  else
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "os eligibility SPI not found", buf, 2u);
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)getPreferencesInternal:(id)a3 withTimeout:(double)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100008EC8;
  v11[3] = &unk_1000608B0;
  void v11[4] = self;
  id v12 = a3;
  id v6 = v12;
  BOOL v7 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v11,  a4);
  if (!v7)
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preferences did not return in time.", v10, 2u);
    }
  }

  return v7;
}

- (BOOL)getCloudKitPreferences:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  uint64_t v28 = 0LL;
  int v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_1000047D0;
  id v32 = sub_1000047E0;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_1000047D0;
  id v26 = sub_1000047E0;
  id v27 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100009138;
  v16[3] = &unk_100060A78;
  v16[4] = self;
  id v17 = @"com.apple.CloudKit";
  id v18 = @"BehaviorOptions";
  uint64_t v19 = &off_100062278;
  char v20 = &v28;
  uint64_t v21 = &v22;
  if (!+[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v16,  a4))
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_semaphore_t v15 = 0;
      CFTypeID v13 = "Couldn't retrieve the preferences within the required time";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v15, 2u);
    }

+ (BOOL)_runDispatchBlock:(id)a3 withTimeout:(double)a4 onQueue:(id)a5
{
  id v7 = a3;
  dispatch_async((dispatch_queue_t)a5, v7);
  if (a4 == -1.0)
  {
    dispatch_time_t v8 = -1LL;
LABEL_5:
    BOOL v9 = dispatch_block_wait(v7, v8) == 0;
    goto LABEL_6;
  }

  if (a4 > 0.0)
  {
    dispatch_time_t v8 = dispatch_time(0LL, (uint64_t)(a4 * 1000000000.0));
    goto LABEL_5;
  }

  BOOL v9 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unknown value for timeout specified. Returning",  v11,  2u);
    BOOL v9 = 0;
  }

+ (BOOL)_runBlock:(id)a3 withTimeout:(double)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000934C;
  block[3] = &unk_100060AA0;
  id v12 = a3;
  id v6 = v12;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  LOBYTE(a1) = [a1 _runDispatchBlock:v7 withTimeout:v9 onQueue:a4];

  return (char)a1;
}

- (BOOL)_runBlockForCurrentUser:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.sysdiagnose_helper.userModeQueue", 0LL);
  CFTypeID v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  dispatch_semaphore_t v15 = sub_100009428;
  int v16 = &unk_100060AC8;
  id v17 = self;
  id v18 = v6;
  id v8 = v6;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &v13);
  BOOL v11 = (void *)objc_opt_class(self, v10);
  LOBYTE(self) = objc_msgSend( v11,  "_runDispatchBlock:withTimeout:onQueue:",  v9,  v7,  a4,  v13,  v14,  v15,  v16,  v17);

  return (char)self;
}

+ (id)stringForReqType:(int)a3
{
  uid_t v3 = sub_10000356C(a3);
  gid_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = v4;
  if (v4) {
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 stringByReplacingOccurrencesOfString:@"_" withString:@" "]);
  }
  else {
    id v6 = @"<UNKNOWN>";
  }

  return v6;
}

- (BOOL)parseLogAgentRequest:(id)a3 outputPath:(id *)a4 timeout:(double *)a5 taskType:(int *)a6 startTimeClockNS:(int64_t *)a7
{
  id v12 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v12, "taskType");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SystemDiagnosticLogAgent stringForReqType:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "stringForReqType:",  int64));
  double v15 = xpc_dictionary_get_double(v12, "taskTimeout");
  string = (char *)xpc_dictionary_get_string(v12, "taskOutputDir");
  if (string || xpc_dictionary_get_BOOL(v12, "taskNoOutputDir"))
  {
    int64_t v17 = xpc_dictionary_get_int64(v12, "startTimeClockNS");
    if (!v17)
    {
      id v23 = v14;
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose_agent: No sysdiagnoseStartTimeClockNS provided)",  buf,  2u);
      }

      uint64_t v14 = v23;
    }

    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138412290;
      id v25 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose_agent: Received message with task type: %@",  buf,  0xCu);
    }

    if (string) {
      string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    }
    if (a4) {
      *a4 = string;
    }
    if (a5) {
      *a5 = v15;
    }
    if (a6) {
      *a6 = int64;
    }
    if (a7) {
      *a7 = v17;
    }
    BOOL v20 = 1;
  }

  else
  {
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138412546;
      id v25 = v14;
      __int16 v26 = 2080;
      id v27 = "taskNoOutputDir";
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose_agent: No output dir for task type %@, without %s being set",  buf,  0x16u);
    }

    BOOL v20 = 0;
    string = 0LL;
  }

  return v20;
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end