@interface _APRSMetricRecorder
+ (id)sharedInstance;
- (NSMutableDictionary)dockedApps;
- (NSMutableDictionary)frozenApps;
- (NSMutableDictionary)prewarmedApps;
- (NSString)kernelExperimentID;
- (NSString)kernelTreatmentID;
- (OS_dispatch_queue)handlerQueue;
- (_APRSMetricRecorder)init;
- (id)commonAnalytics;
- (id)log;
- (int)kernelDeploymentID;
- (void)reportActivationTimes:(id)a3;
- (void)reportEvent:(id)a3 forApp:(id)a4 forEvent:(unint64_t)a5;
- (void)sendAnalyticsLazyWithCommonFeilds:(id)a3 forEvent:(id)a4;
- (void)setDockedApps:(id)a3;
- (void)setFrozenApps:(id)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setKernelDeploymentID:(int)a3;
- (void)setKernelExperimentID:(id)a3;
- (void)setKernelTreatmentID:(id)a3;
- (void)setPrewarmedApps:(id)a3;
@end

@implementation _APRSMetricRecorder

- (_APRSMetricRecorder)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____APRSMetricRecorder;
  return -[_APRSMetricRecorder init](&v3, "init");
}

+ (id)sharedInstance
{
  if (qword_1001575C8 != -1) {
    dispatch_once(&qword_1001575C8, &stru_100115598);
  }
  return (id)qword_1001575D0;
}

- (id)log
{
  if (qword_1001575D8 != -1) {
    dispatch_once(&qword_1001575D8, &stru_1001155B8);
  }
  return (id)qword_1001575E0;
}

- (void)reportEvent:(id)a3 forApp:(id)a4 forEvent:(unint64_t)a5
{
  id v8 = a3;
  v9 = (NSMutableDictionary *)a4;
  if (a5 <= 2)
  {
    v10 = (&self->_prewarmedApps)[a5];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v9));
    if (v11)
    {
      if ([v8 isEqualToString:@"Timeout"])
      {
        uint64_t v12 = 0xFFFFFFFFLL;
      }

      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v11 startDate]);
        [v13 timeIntervalSinceDate:v14];
        uint64_t v12 = (int)(v15 / 60.0);
      }

      v29 = v11;
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[_APRSMetricRecorder log](self, "log"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v35 = v9;
        __int16 v36 = 2112;
        id v37 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Process %@ %@.", buf, 0x16u);
      }

      v32[0] = @"Type";
      v17 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157DE8 objectAtIndexedSubscript:a5]);
      v33[0] = v17;
      v33[1] = v9;
      v32[1] = @"BundleID";
      v32[2] = @"State";
      v33[2] = v8;
      v32[3] = @"Interval";
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v12));
      v33[3] = v18;
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  4LL));

      v28 = (void *)v19;
      -[_APRSMetricRecorder sendAnalyticsLazyWithCommonFeilds:forEvent:]( self,  "sendAnalyticsLazyWithCommonFeilds:forEvent:",  v19,  @"com.apple.dasd.appResumeDetail");
      -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v9);
      LODWORD(v17) = [v8 isEqualToString:@"Launched"];
      v20 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157DE8 objectAtIndexedSubscript:a5]);
      v21 = v20;
      if ((_DWORD)v17) {
        v22 = @"LaunchCount";
      }
      else {
        v22 = @"NonLaunchCount";
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByAppendingString:v22]);

      v30 = v23;
      v31 = &off_100121A98;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
      -[_APRSMetricRecorder sendAnalyticsLazyWithCommonFeilds:forEvent:]( self,  "sendAnalyticsLazyWithCommonFeilds:forEvent:",  v24,  @"com.apple.dasd.appResumeStats");

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        prewarmedApps = self->_prewarmedApps;
        *(_DWORD *)buf = 138412290;
        v35 = prewarmedApps;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Reporting to CA prewarmedApps: %@",  buf,  0xCu);
      }

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        dockedApps = self->_dockedApps;
        *(_DWORD *)buf = 138412290;
        v35 = dockedApps;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Reporting to CA dockedApps: %@", buf, 0xCu);
      }

      v11 = v29;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        frozenApps = self->_frozenApps;
        *(_DWORD *)buf = 138412290;
        v35 = frozenApps;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Reporting to CA frozenApps: %@", buf, 0xCu);
      }
    }
  }
}

- (id)commonAnalytics
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](&OBJC_CLASS____DASTrialManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 experimentID]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 experimentID]);
    [v3 setObject:v6 forKeyedSubscript:@"CommonExperimentID"];

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 treatmentID]);
    [v3 setObject:v7 forKeyedSubscript:@"CommonTreatmentID"];

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v4 deploymentID]));
    [v3 setObject:v8 forKeyedSubscript:@"CommonDeploymentID"];
  }

  kernelExperimentID = self->_kernelExperimentID;
  if (kernelExperimentID)
  {
    [v3 setObject:kernelExperimentID forKeyedSubscript:@"CommonKernelExperimentID"];
    [v3 setObject:self->_kernelTreatmentID forKeyedSubscript:@"CommonKernelTreatmentID"];
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_kernelDeploymentID));
    [v3 setObject:v10 forKeyedSubscript:@"CommonKernelDeploymentID"];
  }

  return v3;
}

- (void)sendAnalyticsLazyWithCommonFeilds:(id)a3 forEvent:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100023030;
  v7[3] = &unk_1001155E0;
  v7[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  AnalyticsSendEventLazy(v5, v7);
}

- (void)reportActivationTimes:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingSelector:"compare:"]);
  id v7 = [v6 mutableCopy];

  id v8 = [v7 count];
  if (v8)
  {
    v22 = self;
    double v9 = (double)(unint64_t)v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:(int)((double)(unint64_t)v8 * 0.25)]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:");
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:(int)(v9 * 0.5)]);
    [v5 setObject:v10 forKeyedSubscript:@"activationTime50"];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:(int)(v9 * 0.75)]);
    [v5 setObject:v11 forKeyedSubscript:@"activationTime75"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:(int)(v9 * 0.9)]);
    [v5 setObject:v12 forKeyedSubscript:@"activationTime90"];
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v13 = v4;
    id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
      double v17 = 0.0;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * (void)i) doubleValue];
          double v17 = v17 + v19;
        }

        id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v15);
    }

    else
    {
      double v17 = 0.0;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17 / v9));
    [v5 setObject:v20 forKeyedSubscript:@"activationTimeMean"];

    -[_APRSMetricRecorder sendAnalyticsLazyWithCommonFeilds:forEvent:]( v22,  "sendAnalyticsLazyWithCommonFeilds:forEvent:",  v5,  @"com.apple.dasd.appResumeHalfDayEvent");
  }
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
}

- (NSMutableDictionary)prewarmedApps
{
  return self->_prewarmedApps;
}

- (void)setPrewarmedApps:(id)a3
{
}

- (NSMutableDictionary)dockedApps
{
  return self->_dockedApps;
}

- (void)setDockedApps:(id)a3
{
}

- (NSMutableDictionary)frozenApps
{
  return self->_frozenApps;
}

- (void)setFrozenApps:(id)a3
{
}

- (NSString)kernelTreatmentID
{
  return self->_kernelTreatmentID;
}

- (void)setKernelTreatmentID:(id)a3
{
}

- (NSString)kernelExperimentID
{
  return self->_kernelExperimentID;
}

- (void)setKernelExperimentID:(id)a3
{
}

- (int)kernelDeploymentID
{
  return self->_kernelDeploymentID;
}

- (void)setKernelDeploymentID:(int)a3
{
  self->_kernelDeploymentID = a3;
}

- (void).cxx_destruct
{
}

@end