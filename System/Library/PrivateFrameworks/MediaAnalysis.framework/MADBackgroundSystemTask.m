@interface MADBackgroundSystemTask
+ (BOOL)buddyCheckRequired;
+ (BOOL)externalPowerRequired;
+ (BOOL)ignoreCancellation;
+ (BOOL)inexpensiveNetworkConnectivityRequired;
+ (BOOL)networkConnectivityRequired;
+ (BOOL)resourceIntensive;
+ (BOOL)runRemote;
+ (double)expectedDuration;
+ (id)identifier;
+ (id)rateLimitConfigurationName;
+ (id)sharedTask;
+ (int64_t)activityDelayInSeconds;
+ (unint64_t)taskID;
+ (void)notImplementedException:(id)a3;
- (BOOL)oneShot;
- (void)executeWith:(id)a3 completionHandler:(id)a4;
- (void)executeWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5;
- (void)registerTask;
- (void)submitTask:(id *)a3;
@end

@implementation MADBackgroundSystemTask

+ (void)notImplementedException:(id)a3
{
  v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@ %@]",  objc_opt_class(a1),  a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NotImplementedException",  v4,  0LL));

  objc_exception_throw(v5);
  __break(1u);
}

+ (id)sharedTask
{
  return 0LL;
}

+ (id)identifier
{
  return 0LL;
}

+ (unint64_t)taskID
{
  return 0LL;
}

+ (int64_t)activityDelayInSeconds
{
  return 10LL;
}

+ (BOOL)externalPowerRequired
{
  return 1;
}

+ (BOOL)resourceIntensive
{
  return 1;
}

+ (double)expectedDuration
{
  return 3600.0;
}

+ (BOOL)inexpensiveNetworkConnectivityRequired
{
  return 0;
}

+ (BOOL)networkConnectivityRequired
{
  return [(id)objc_opt_class(a1) inexpensiveNetworkConnectivityRequired];
}

+ (id)rateLimitConfigurationName
{
  return 0LL;
}

- (void)submitTask:(id *)a3
{
  id v5 = [(id)objc_opt_class(self) activityDelayInSeconds];
  v6 = objc_autoreleasePoolPush();
  id v7 = [(id)objc_opt_class(self) identifier];
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
  if ((int)v10 >= 7)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%@] Try submit the BGST task", buf, 0xCu);
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 taskRequestForIdentifier:v8]);

  if (!v16)
  {
    id v22 = [[BGNonRepeatingSystemTaskRequest alloc] initWithIdentifier:v8];
    [v22 setGroupName:MediaAnalysisDaemonDomain];
    [v22 setGroupConcurrencyLimit:1];
    objc_msgSend(v22, "setResourceIntensive:", objc_msgSend((id)objc_opt_class(self), "resourceIntensive"));
    [v22 setRequiresUserInactivity:1];
    [v22 setPriority:1];
    [v22 setScheduleAfter:(double)(uint64_t)v5];
    [v22 setTrySchedulingBefore:(double)((uint64_t)v5 + 1800)];
    if ([v22 resourceIntensive])
    {
      [(id)objc_opt_class(self) expectedDuration];
      objc_msgSend(v22, "setExpectedDuration:");
    }

    objc_msgSend( v22,  "setRequiresInexpensiveNetworkConnectivity:",  objc_msgSend((id)objc_opt_class(self), "inexpensiveNetworkConnectivityRequired"));
    objc_msgSend( v22,  "setRequiresNetworkConnectivity:",  objc_msgSend((id)objc_opt_class(self), "networkConnectivityRequired"));
    id v25 = [(id)objc_opt_class(self) rateLimitConfigurationName];
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (v26) {
      [v22 setRateLimitConfigurationName:v26];
    }
    objc_msgSend(v22, "setRequiresExternalPower:", objc_msgSend((id)objc_opt_class(self), "externalPowerRequired"));
    [v22 setPowerNap:1];
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
    id v44 = 0LL;
    unsigned __int8 v28 = [v27 submitTaskRequest:v22 error:&v44];
    id v24 = v44;

    if ((v28 & 1) != 0)
    {
      uint64_t v31 = MediaAnalysisLogLevel(v29, v30);
      if ((int)v31 >= 7)
      {
        uint64_t v33 = VCPLogInstance(v31, v32);
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        os_log_type_t v35 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v34, v35))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v8;
          v36 = "[%@] Submitted BGST task successfully.";
          v37 = v34;
          os_log_type_t v38 = v35;
          uint32_t v39 = 12;
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v37, v38, v36, buf, v39);
          goto LABEL_23;
        }

        goto LABEL_23;
      }
    }

    else
    {
      uint64_t v40 = MediaAnalysisLogLevel(v29, v30);
      if ((int)v40 >= 3)
      {
        uint64_t v42 = VCPLogInstance(v40, v41);
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        os_log_type_t v43 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v34, v43))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v8;
          __int16 v47 = 2112;
          id v48 = v24;
          v36 = "[%@] Failed to submit the BGST task with error: %@";
          v37 = v34;
          os_log_type_t v38 = v43;
          uint32_t v39 = 22;
          goto LABEL_22;
        }

- (BOOL)oneShot
{
  return 0;
}

- (void)executeWith:(id)a3 completionHandler:(id)a4
{
}

- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5
{
}

- (void)executeWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
}

+ (BOOL)ignoreCancellation
{
  return 0;
}

+ (BOOL)buddyCheckRequired
{
  return 1;
}

+ (BOOL)runRemote
{
  return 1;
}

- (void)registerTask
{
  id v3 = [(id)objc_opt_class(self) identifier];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"[%@][%@]", v7, v4));

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100011014;
  v35[3] = &unk_1001B9EE8;
  id v9 = v8;
  id v36 = v9;
  v37 = self;
  id v10 = v4;
  id v38 = v10;
  uint64_t v11 = objc_retainBlock(v35);
  v13 = v11;
  if (v10)
  {
    os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
    unsigned int v15 = [v14 registerForTaskWithIdentifier:v10 usingQueue:0 launchHandler:v13];

    if (v15)
    {
      uint64_t v18 = MediaAnalysisLogLevel(v16, v17);
      if ((int)v18 >= 7)
      {
        uint64_t v20 = VCPLogInstance(v18, v19);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        os_log_type_t v22 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v21, v22))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v9;
          os_log_type_t v23 = "%@ Successfully registered";
LABEL_12:
          uint64_t v29 = v21;
          os_log_type_t v30 = v22;
          uint32_t v31 = 12;
          goto LABEL_13;
        }

        goto LABEL_14;
      }
    }

    else
    {
      uint64_t v32 = MediaAnalysisLogLevel(v16, v17);
      if ((int)v32 >= 4)
      {
        uint64_t v34 = VCPLogInstance(v32, v33);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        os_log_type_t v22 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v21, v22))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v9;
          os_log_type_t v23 = "%@ identifier already registerred; ignore re-registering";
          goto LABEL_12;
        }

@end