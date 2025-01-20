@interface _DASAutoBugCaptureHelper
+ (BOOL)isActivitySignificantlyOverdue:(id)a3 now:(id)a4;
+ (void)checkAllTasksForBGSystemTask:(id)a3;
+ (void)schedule;
+ (void)triggerABCCaseForActivities:(id)a3;
@end

@implementation _DASAutoBugCaptureHelper

+ (BOOL)isActivitySignificantlyOverdue:(id)a3 now:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"abcHelper"));
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1000B504C();
    }
    goto LABEL_14;
  }

  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1000B5078();
    }
    goto LABEL_14;
  }

  if (![v5 significantlyOverdueAtDate:v6])
  {
LABEL_14:
    BOOL v17 = 0;
    goto LABEL_15;
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 submitDate]);
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 submitDate]);
    [v6 timeIntervalSinceDate:v11];
    double v13 = v12;

    if (v13 > 2073600.0)
    {
      v14 = v8;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v5 submitDate]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v5 startBefore]);
        int v19 = 138413058;
        id v20 = v5;
        __int16 v21 = 2112;
        v22 = v15;
        __int16 v23 = 2112;
        v24 = v16;
        __int16 v25 = 2112;
        id v26 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Activity %@ significantly overdue, submit: %@, startBefore: %@, now: %@",  (uint8_t *)&v19,  0x2Au);
      }
    }
  }

  BOOL v17 = 1;
LABEL_15:

  return v17;
}

+ (void)triggerABCCaseForActivities:(id)a3
{
  id v3 = a3;
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"abcHelper"));
  id v5 = v4;
  if (v3)
  {
    __int16 v23 = v4;
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v27 objects:v40 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v27 + 1) + 8 * (void)v11) name]);
          -[NSMutableArray addObject:](v6, "addObject:", v12);

          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v27 objects:v40 count:16];
      }

      while (v9);
    }

    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v6, "componentsJoinedByString:", @","));
    id v14 = objc_alloc_init(&OBJC_CLASS___SDRDiagnosticReporter);
    v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 signatureWithDomain:@"Duet" type:@"Activities Significantly Overdue" subType:@"Multiple Activities" subtypeContext:0 detectedProcess:@"dasd" triggerThresholdValues:0]);
    uint64_t v38 = kSymptomDiagnosticKeyPayloadDEParameters;
    v35 = v13;
    v36 = @"com.apple.das.DASDaemon.DuetDiagnosticExtension";
    v34 = @"kDASActivityNames";
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
    v37 = v16;
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    v39 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));

    v31 = @"kDASActivityNames";
    v32 = v13;
    int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    v33 = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10005A97C;
    v24[3] = &unk_1001164B8;
    id v5 = v23;
    __int16 v21 = v23;
    __int16 v25 = v21;
    id v26 = v13;
    id v22 = v13;
    if (([v14 snapshotWithSignature:v15 duration:v20 events:v18 payload:0 actions:v24 reply:0.0] & 1) == 0 && os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      sub_1000B50D0();
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    sub_1000B50A4();
  }
}

+ (void)checkAllTasksForBGSystemTask:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"abcHelper"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Checking activities for significantly overdue tasks",  buf,  2u);
  }

  if (v4)
  {
    *(void *)buf = 0LL;
    v31 = buf;
    uint64_t v32 = 0x2020000000LL;
    char v33 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10005AE90;
    v27[3] = &unk_100115170;
    __int128 v29 = buf;
    id v6 = v5;
    __int128 v28 = v6;
    [v4 setExpirationHandler:v27];
    id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allPendingTasks]);

    v18 = v5;
    int v19 = v4;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v9);
          }
          double v13 = *(NSMutableArray **)(*((void *)&v23 + 1) + 8LL * (void)i);
          if ((-[NSMutableArray userRequestedBackupTask](v13, "userRequestedBackupTask", v18) & 1) != 0
            || -[NSMutableArray beforeDaysFirstActivity](v13, "beforeDaysFirstActivity"))
          {
            if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v34 = 138412290;
              v35 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Ignoring activity that is allowed to be overdue: %@",  v34,  0xCu);
            }
          }

          else
          {
            if (v31[24]) {
              goto LABEL_18;
            }
          }
        }

        id v10 = [v9 countByEnumeratingWithState:&v23 objects:v36 count:16];
      }

      while (v10);
    }

+ (void)schedule
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"abcHelper"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000B52A0();
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005AFD0;
  v6[3] = &unk_1001164E0;
  id v7 = v3;
  id v8 = a1;
  id v5 = v3;
  [v4 registerForTaskWithIdentifier:@"com.apple.dasd.overdueCheck" usingQueue:0 launchHandler:v6];
}

@end