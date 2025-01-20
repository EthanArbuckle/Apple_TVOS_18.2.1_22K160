@interface _DASIssueDetector
+ (id)sharedInstance;
- (BOOL)hasEnoughTotalPluggedInTimeOfDuration:(int64_t)a3 withMinimumSessionDuration:(int64_t)a4 inLastHours:(double)a5;
- (BOOL)libraryExceedsPhotoCount:(int64_t)a3;
- (BOOL)shouldGenerateSpotlightProgressTTRForDevice;
- (BOOL)shouldGenerateSpotlightProgressTTRForSamples:(unint64_t)a3 initialProcessingCount:(unint64_t)a4 finalProcessingCount:(unint64_t)a5;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASIssueDetector)init;
- (id)getSpotlightTimeSeries;
- (id)ttrURLWithTitle:(id)a3 withDescription:(id)a4 withStateDictionary:(id)a5 componentID:(unint64_t)a6 componentName:(id)a7 componentVersion:(id)a8;
- (void)checkProgressForMAD;
- (void)checkProgressForSpotlight;
- (void)computeSpotlightProgressParamsForTimeSeries:(id)a3 AndReturnNumSamples:(unint64_t *)a4 initialProcessingCount:(unint64_t *)a5 finalProcessingCount:(unint64_t *)a6;
- (void)schedule;
- (void)setDefaults:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _DASIssueDetector

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100062C60;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157B90 != -1) {
    dispatch_once(&qword_100157B90, block);
  }
  return (id)qword_100157B88;
}

- (_DASIssueDetector)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____DASIssueDetector;
  v2 = -[_DASIssueDetector init](&v14, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"issueDetector"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.dasd.issueDetector");
    defaults = v2->_defaults;
    v2->_defaults = v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.duetactivityscheduler.issueDetector", v10);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;
  }

  return v2;
}

- (void)schedule
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  [v2 registerForTaskWithIdentifier:@"com.apple.dasd.issueDetector.daily" usingQueue:0 launchHandler:&stru_100116768];
}

- (BOOL)hasEnoughTotalPluggedInTimeOfDuration:(int64_t)a3 withMinimumSessionDuration:(int64_t)a4 inLastHours:(double)a5
{
  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a5));
  dispatch_queue_t v11 = objc_alloc(&OBJC_CLASS___NSDateInterval);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v41 = (void *)v10;
  v13 = -[NSDateInterval initWithStartDate:endDate:](v11, "initWithStartDate:endDate:", v10, v12);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"IsPluggedIn"));
  v42 = v9;
  v40 = v13;
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v9,  "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:",  @"BackgroundProcessing",  @"SystemConditionsBattery",  0,  0));
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B5CA8((uint64_t)v14, log);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
  [v16 epochTimestamp];
  double v18 = v17;

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v14;
  id v19 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  int64_t v39 = a3;
  if (v19)
  {
    id v20 = v19;
    char v21 = 0;
    double v22 = (double)a3;
    uint64_t v23 = *(void *)v45;
    double v24 = 0.0;
    while (2)
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 metricKeysAndValues]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"IsPluggedIn"]);
        uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSNumber);
        char isKindOfClass = objc_opt_isKindOfClass(v28, v29);

        if ((isKindOfClass & 1) != 0)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"IsPluggedIn"]);
          unsigned int v32 = [v31 BOOLValue];

          if ((v21 & 1) != v32)
          {
            [v26 epochTimestamp];
            if ((v32 & 1) != 0)
            {
              char v21 = 1;
              double v18 = v33;
            }

            else
            {
              char v21 = 0;
              double v34 = v33 - v18;
              double v24 = v24 + v34;
            }
          }

          if (v24 > v22)
          {

            goto LABEL_21;
          }
        }
      }

      id v20 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  else
  {
    double v24 = 0.0;
  }

- (BOOL)libraryExceedsPhotoCount:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"WorkloadType == %@",  &off_100121EE8));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue( [v4 getPPSTimeSeries:@"BackgroundProcessing" category:@"WorkloadInformation" valueFilter:v5 metrics:0 timeFilter:0 filepath:0 error:0]);
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    id v19 = v5;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)i) metricKeysAndValues]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Size"]);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
        char isKindOfClass = objc_opt_isKindOfClass(v12, v13);

        if ((isKindOfClass & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Size"]);
          id v16 = [v15 integerValue];

          if ((uint64_t)v16 > a3)
          {

            BOOL v17 = 1;
            goto LABEL_12;
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }

    BOOL v17 = 0;
LABEL_12:
    v5 = v19;
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)checkProgressForMAD
{
  if (!-[_DASIssueDetector libraryExceedsPhotoCount:](self, "libraryExceedsPhotoCount:", 1500LL))
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000B5DA0();
    }
    return;
  }

  if (!-[_DASIssueDetector hasEnoughTotalPluggedInTimeOfDuration:withMinimumSessionDuration:inLastHours:]( self,  "hasEnoughTotalPluggedInTimeOfDuration:withMinimumSessionDuration:inLastHours:",  43200LL,  3600LL,  -172800.0)) {
    return;
  }
  v76 = self;
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -172800.0));
  v5 = objc_alloc(&OBJC_CLASS___NSDateInterval);
  v79 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingTimeInterval:-172800.0]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v8 = -[NSDateInterval initWithStartDate:endDate:](v5, "initWithStartDate:endDate:", v6, v7);

  v74 = v8;
  v75 = v3;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( [v3 getPPSTimeSeries:@"BackgroundProcessing" category:@"TaskWorkload" valueFilter:0 metrics:0 timeFilter:v8 filepath:0 error:0]);
  id v9 = [obj countByEnumeratingWithState:&v98 objects:v109 count:16];
  if (!v9) {
    goto LABEL_24;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v99;
  do
  {
    v12 = 0LL;
    do
    {
      if (*(void *)v99 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v98 + 1) + 8LL * (void)v12);
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 metricKeysAndValues]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"TaskName"]);
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
      char isKindOfClass = objc_opt_isKindOfClass(v15, v16);

      if ((isKindOfClass & 1) != 0)
      {
        double v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"TaskName"]);
        if ([v18 containsString:@"mediaanalysis"])
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"SubCategory"]);
          uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
          char v21 = objc_opt_isKindOfClass(v19, v20);

          if ((v21 & 1) != 0)
          {
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"SubCategory"]);
            if ([v22 containsString:@"failed"])
            {
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"CompletedPercentage"]);
              [v84 setObject:v23 forKeyedSubscript:v18];
              goto LABEL_13;
            }

            if (!v22)
            {
              [v13 epochTimestamp];
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:"));
              double v24 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"CompletedPercentage"]);
              uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSNumber);
              char v82 = objc_opt_isKindOfClass(v24, v25);

              if ((v82 & 1) != 0)
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"CompletedPercentage"]);
                [v23 timeIntervalSinceDate:v79];
                v27 = v80;
                if (v28 >= 0.0)
                {
                  v78 = (void *)objc_claimAutoreleasedReturnValue([v81 objectForKeyedSubscript:v18]);
                  v83 = v26;
                  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)[v78 integerValue] + 1));
                  [v81 setObject:v29 forKeyedSubscript:v18];

                  v26 = v83;
                  v27 = v77;
                }

                [v27 setObject:v26 forKeyedSubscript:v18];
              }

- (id)getSpotlightTimeSeries
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -216000.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v5 = -[NSDateInterval initWithStartDate:endDate:]( objc_alloc(&OBJC_CLASS___NSDateInterval),  "initWithStartDate:endDate:",  v3,  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v2 getPPSTimeSeries:@"BackgroundProcessing" category:@"TaskWorkload" valueFilter:0 metrics:0 timeFilter:v5 filepath:0 error:0]);

  return v6;
}

- (void)computeSpotlightProgressParamsForTimeSeries:(id)a3 AndReturnNumSamples:(unint64_t *)a4 initialProcessingCount:(unint64_t *)a5 finalProcessingCount:(unint64_t *)a6
{
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v7)
  {
    id v8 = v7;
    unint64_t v40 = 0LL;
    unint64_t v42 = 0LL;
    unint64_t v43 = 0LL;
    id v45 = v6;
    uint64_t v46 = *(void *)v48;
    id v9 = @"TaskName";
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v48 != v46) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v47 + 1) + 8 * (void)i) metricKeysAndValues]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"WorkloadCategory"]);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
        char isKindOfClass = objc_opt_isKindOfClass(v12, v13);

        if ((isKindOfClass & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"WorkloadCategory"]);
          if ([v15 unsignedIntValue] == 40)
          {
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9]);
            uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
            double v18 = v9;
            char v19 = objc_opt_isKindOfClass(v16, v17);

            if ((v19 & 1) != 0)
            {
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v18]);
              if ([v20 containsString:@"spotlightknowledged.task"])
              {
                char v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"SubCategory"]);
                uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString);
                char v23 = objc_opt_isKindOfClass(v21, v22);

                if ((v23 & 1) != 0)
                {
                  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"SubCategory"]);
                  if ([v44 containsString:@"Total"]
                    && (double v24 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Target"]),
                        uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSNumber),
                        char v26 = objc_opt_isKindOfClass(v24, v25),
                        v24,
                        (v26 & 1) != 0))
                  {
                    v27 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Target"]);
                    if ((unint64_t)[v27 unsignedLongValue] >> 5 < 0x465)
                    {

                      id v6 = v45;
                      goto LABEL_32;
                    }

                    double v28 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"CompletedPercentage"]);
                    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSNumber);
                    char v30 = objc_opt_isKindOfClass(v28, v29);

                    if ((v30 & 1) != 0)
                    {
                      v41 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"CompletedPercentage"]);
                      v31 = v27;
                      double v32 = (double)(unint64_t)[v27 unsignedLongValue];
                      [v41 doubleValue];
                      double v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v33 * v32 / 100.0));
                      id v35 = [v34 unsignedLongValue];

                      unint64_t v36 = v43;
                      unint64_t v40 = (unint64_t)v35;
                      if (!v42) {
                        unint64_t v36 = (unint64_t)v35;
                      }
                      ++v42;
                      unint64_t v43 = v36;

                      id v9 = @"TaskName";
                    }

                    else
                    {
                      id v9 = @"TaskName";
                      v31 = v27;
                    }

                    id v6 = v45;
                  }

                  else
                  {
                    id v6 = v45;
                    id v9 = @"TaskName";
                  }
                }

                else
                {
                  id v6 = v45;
                  id v9 = @"TaskName";
                }
              }

              else
              {
                id v9 = v18;
              }
            }

            else
            {
              id v9 = v18;
            }
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  else
  {
    unint64_t v40 = 0LL;
    unint64_t v42 = 0LL;
    unint64_t v43 = 0LL;
  }

  *a4 = v42;
  *a5 = v43;
  *a6 = v40;
LABEL_32:
}

- (BOOL)shouldGenerateSpotlightProgressTTRForDevice
{
  if (-[_DASIssueDetector hasEnoughTotalPluggedInTimeOfDuration:withMinimumSessionDuration:inLastHours:]( self,  "hasEnoughTotalPluggedInTimeOfDuration:withMinimumSessionDuration:inLastHours:",  21600LL,  3600LL,  -216000.0))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults valueForKey:]( self->_defaults,  "valueForKey:",  @"lastDateForSpotlightProgressTTR"));
    v4 = v3;
    if (v3 && ([v3 timeIntervalSinceNow], v5 > -259200.0))
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
        sub_1000B5DCC();
      }
      BOOL v6 = 0;
    }

    else
    {
      BOOL v6 = 1;
    }
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000B5DF8();
    }
    return 0;
  }

  return v6;
}

- (BOOL)shouldGenerateSpotlightProgressTTRForSamples:(unint64_t)a3 initialProcessingCount:(unint64_t)a4 finalProcessingCount:(unint64_t)a5
{
  if (a3 > 1)
  {
    if (((a5 - a4) / (a3 - 1)) >> 5 < 0x465)
    {
      LOBYTE(v5) = 1;
      return v5;
    }

    BOOL v5 = os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      sub_1000B5E50();
      goto LABEL_7;
    }
  }

  else
  {
    BOOL v5 = os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      sub_1000B5E24();
LABEL_7:
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (void)checkProgressForSpotlight
{
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v12 = 0LL;
  if (-[_DASIssueDetector shouldGenerateSpotlightProgressTTRForDevice]( self,  "shouldGenerateSpotlightProgressTTRForDevice"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASIssueDetector getSpotlightTimeSeries](self, "getSpotlightTimeSeries"));
    -[_DASIssueDetector computeSpotlightProgressParamsForTimeSeries:AndReturnNumSamples:initialProcessingCount:finalProcessingCount:]( self,  "computeSpotlightProgressParamsForTimeSeries:AndReturnNumSamples:initialProcessingCount:finalProcessingCount:",  v3,  &v12,  &v14,  &v13);
    if (-[_DASIssueDetector shouldGenerateSpotlightProgressTTRForSamples:initialProcessingCount:finalProcessingCount:]( self,  "shouldGenerateSpotlightProgressTTRForSamples:initialProcessingCount:finalProcessingCount:",  v12,  v14,  v13))
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
        sub_1000B5D48();
      }
      v15[0] = @"days";
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12));
      v16[0] = v4;
      v15[1] = @"assets processed per day";
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (v13 - v14) / (unint64_t)(v12 - 1)));
      v15[2] = @"trigger";
      v16[1] = v5;
      v16[2] = @"Not enough progress for com.apple.spotlightknowledged.task";
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));

      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[_DASIssueDetector ttrURLWithTitle:withDescription:withStateDictionary:componentID:componentName:componentVersion:]( self,  "ttrURLWithTitle:withDescription:withStateDictionary:componentID:componentName:componentVersion:",  @"Tap to file Radar. Slow progress detected for spotlightknowledged text embedding generation",  @"PLEASE ANSWER THESE QUESTIONS TO AID DEBUGGING:\n\n Is this your regular carry device?\n\n",  v6,  185285LL,  @"Spotlight",  @"Backend"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNotificationManager sharedManager](&OBJC_CLASS____DASNotificationManager, "sharedManager"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  14400.0));
      [v8 postNotificationAtDate:0 withTitle:@"[Internal] Slow Text Embedding Generation Progress" withTextContent:@"Tap to file Radar. Slow progress detected for spotlightknowledged text embedding generation" icon:@"TTR" url:v7 expirationDate:v9];

      defaults = self->_defaults;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[NSUserDefaults setValue:forKey:](defaults, "setValue:forKey:", v11, @"lastDateForSpotlightProgressTTR");
    }
  }

- (id)ttrURLWithTitle:(id)a3 withDescription:(id)a4 withStateDictionary:(id)a5 componentID:(unint64_t)a6 componentName:(id)a7 componentVersion:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Debug Info:\n %@",  a4,  a5));
  double v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"tap-to-radar://new?Title=%@&Classification=Serious Bug&ComponentID=%lu&ComponentName=%@&ComponentVersion=%@&Reproducible=Sometimes&Description=%@",  v16,  a6,  v15,  v14,  v17));

  char v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAddingPercentEncodingWithAllowedCharacters:v19]);

  char v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v20));
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v21;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "TTR URL is %@", buf, 0xCu);
  }

  return v21;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end