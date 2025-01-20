@interface _DASCheckpointRecorder
+ (BOOL)shouldLogCheckpointForActivity:(id)a3;
+ (id)sharedInstance;
- (BOOL)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 error:(id *)a5;
- (BOOL)reportFeatureStatus:(unint64_t)a3 forFeature:(unint64_t)a4 statusChangedDate:(id)a5 error:(id *)a6;
- (BOOL)sendDataToPPS:(id)a3 subsystem:(id)a4 category:(id)a5;
- (BOOL)sendTaskCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5;
- (BOOL)validateFeatureCode:(id)a3;
- (NSMutableDictionary)availableStatus;
- (NSMutableDictionary)previewAvailableStatus;
- (NSMutableDictionary)taskToDependencies;
- (NSMutableDictionary)taskToFeatureCodes;
- (NSMutableDictionary)taskToSemanticVersion;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)featureAvailabilityQueue;
- (OS_dispatch_queue)featureCodeQueue;
- (OS_dispatch_queue)taskCheckpointQueue;
- (OS_dispatch_queue)taskDependencyQueue;
- (OS_os_log)log;
- (_DASCheckpointRecorder)init;
- (void)addDependencyInfoForTask:(id)a3 producedResultIdentifiers:(id)a4 dependencyIdentifiers:(id)a5;
- (void)addFeatureCodesForTask:(id)a3 featureCodes:(id)a4 semanticVersion:(int64_t)a5;
- (void)populateFeatureStatusFromPast;
- (void)registerFeatureStatusTask;
- (void)registerReportTaskInfoTask;
- (void)reportDependencyInfoForTasks;
- (void)reportFeatureCodesForTasks;
- (void)reportFeatureStatus;
- (void)reportTaskCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5;
- (void)setAvailableStatus:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setFeatureAvailabilityQueue:(id)a3;
- (void)setFeatureCodeQueue:(id)a3;
- (void)setLog:(id)a3;
- (void)setPreviewAvailableStatus:(id)a3;
- (void)setTaskCheckpointQueue:(id)a3;
- (void)setTaskDependencyQueue:(id)a3;
- (void)setTaskToDependencies:(id)a3;
- (void)setTaskToFeatureCodes:(id)a3;
- (void)setTaskToSemanticVersion:(id)a3;
@end

@implementation _DASCheckpointRecorder

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057280;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157B08 != -1) {
    dispatch_once(&qword_100157B08, block);
  }
  return (id)qword_100157B00;
}

- (_DASCheckpointRecorder)init
{
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS____DASCheckpointRecorder;
  v2 = -[_DASCheckpointRecorder init](&v42, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"checkpointRecorder"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
    defaults = v2->_defaults;
    v2->_defaults = v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    taskToFeatureCodes = v2->_taskToFeatureCodes;
    v2->_taskToFeatureCodes = v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    taskToSemanticVersion = v2->_taskToSemanticVersion;
    v2->_taskToSemanticVersion = v9;

    v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    taskToDependencies = v2->_taskToDependencies;
    v2->_taskToDependencies = v11;

    v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    availableStatus = v2->_availableStatus;
    v2->_availableStatus = v13;

    v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    previewAvailableStatus = v2->_previewAvailableStatus;
    v2->_previewAvailableStatus = v15;

    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_BACKGROUND, 0);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.duetactivityscheduler.taskCheckpoint", v20);
    taskCheckpointQueue = v2->_taskCheckpointQueue;
    v2->_taskCheckpointQueue = (OS_dispatch_queue *)v21;

    dispatch_queue_attr_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v23);
    dispatch_queue_attr_t v25 = dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_BACKGROUND, 0);
    v26 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v25);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.duetactivityscheduler.featureCode", v26);
    featureCodeQueue = v2->_featureCodeQueue;
    v2->_featureCodeQueue = (OS_dispatch_queue *)v27;

    dispatch_queue_attr_t v29 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v29);
    dispatch_queue_attr_t v31 = dispatch_queue_attr_make_with_qos_class(v30, QOS_CLASS_BACKGROUND, 0);
    v32 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v31);
    dispatch_queue_t v33 = dispatch_queue_create("com.apple.duetactivityscheduler.taskDependency", v32);
    taskDependencyQueue = v2->_taskDependencyQueue;
    v2->_taskDependencyQueue = (OS_dispatch_queue *)v33;

    dispatch_queue_attr_t v35 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v36 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v35);
    dispatch_queue_attr_t v37 = dispatch_queue_attr_make_with_qos_class(v36, QOS_CLASS_BACKGROUND, 0);
    v38 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v37);
    dispatch_queue_t v39 = dispatch_queue_create("com.apple.duetactivityscheduler.featureAvailability", v38);
    featureAvailabilityQueue = v2->_featureAvailabilityQueue;
    v2->_featureAvailabilityQueue = (OS_dispatch_queue *)v39;
  }

  return v2;
}

- (BOOL)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 error:(id *)a5
{
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  unsigned __int8 v10 = -[_DASCheckpointRecorder validateFeatureCode:](self, "validateFeatureCode:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"FeatureCode == %@",  v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
    id v32 = 0LL;
    v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 getPPSTimeSeries:@"BackgroundProcessing" category:@"FeatureCheckpoint" valueFilter:v12 metrics:0 timeFilter:0 limitCount:1 offsetCount:0 readDirection:1 filepath:0 error:&v32]);
    id v15 = v32;

    if (!v15 && v14)
    {
      dispatch_queue_attr_t v29 = v14;
      v30 = v12;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
      dispatch_queue_attr_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 metricKeysAndValues]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"FeatureState"]);
      id v19 = [v18 unsignedIntegerValue];

      if (v19 == (id)a3 && (a3 == 50 || a3 == 30))
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          dispatch_queue_t v21 = log;
          v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a3));
          dispatch_queue_attr_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a4));
          *(_DWORD *)buf = 138412546;
          v34 = v22;
          __int16 v35 = 2112;
          v36 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Duplicate feature state: %@ for feature code: %@",  buf,  0x16u);
        }

        BOOL v24 = 1;
        v14 = v29;
        v12 = v30;
LABEL_20:

        goto LABEL_23;
      }

      v14 = v29;
      v12 = v30;
    }

    if (a3 == 50 || a3 == 30)
    {
      featureAvailabilityQueue = (dispatch_queue_s *)self->_featureAvailabilityQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000578B4;
      block[3] = &unk_1001163B8;
      block[4] = self;
      void block[5] = a3;
      block[6] = a4;
      dispatch_sync(featureAvailabilityQueue, block);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    [v16 setObject:v26 forKeyedSubscript:@"FeatureCode"];

    dispatch_queue_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    [v16 setObject:v27 forKeyedSubscript:@"FeatureState"];

    if (a5) {
      *a5 = v15;
    }
    BOOL v24 = -[_DASCheckpointRecorder sendDataToPPS:subsystem:category:]( self,  "sendDataToPPS:subsystem:category:",  v16,  @"BackgroundProcessing",  @"FeatureCheckpoint");
    goto LABEL_20;
  }

  id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  BGSystemTaskSchedulerErrorDomain,  110LL,  0LL));
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000B4DD4();
    if (a5) {
      goto LABEL_12;
    }
LABEL_22:
    BOOL v24 = 0;
    goto LABEL_23;
  }

  if (!a5) {
    goto LABEL_22;
  }
LABEL_12:
  id v15 = v15;
  BOOL v24 = 0;
  *a5 = v15;
LABEL_23:

  return v24;
}

- (BOOL)validateFeatureCode:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](&OBJC_CLASS____DASPlistParser, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryForPlist:2]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 stringValue]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);
  LOBYTE(v3) = v7 != 0LL;

  return (char)v3;
}

+ (BOOL)shouldLogCheckpointForActivity:(id)a3
{
  id v3 = a3;
  if ([v3 isIntensive])
  {
    BOOL v4 = 1;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 fastPass]);
    if (v5) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = +[_DASPhotosPolicy isPhotosSyncActivity:](&OBJC_CLASS____DASPhotosPolicy, "isPhotosSyncActivity:", v3);
    }
  }

  return v4;
}

- (BOOL)sendTaskCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)reportTaskCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5
{
  id v8 = a4;
  taskCheckpointQueue = (dispatch_queue_s *)self->_taskCheckpointQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100057A64;
  v11[3] = &unk_1001163E0;
  id v12 = v8;
  v13 = self;
  unint64_t v14 = a3;
  id v15 = a5;
  id v10 = v8;
  dispatch_async(taskCheckpointQueue, v11);
}

- (void)addFeatureCodesForTask:(id)a3 featureCodes:(id)a4 semanticVersion:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  featureCodeQueue = (dispatch_queue_s *)self->_featureCodeQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100057B90;
  v13[3] = &unk_100116408;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(featureCodeQueue, v13);
}

- (BOOL)reportFeatureStatus:(unint64_t)a3 forFeature:(unint64_t)a4 statusChangedDate:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  [v10 setObject:v11 forKeyedSubscript:@"FeatureCode"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  [v10 setObject:v12 forKeyedSubscript:@"FeatureState"];

  [v10 setObject:v9 forKeyedSubscript:@"StateChangedDate"];
  LOBYTE(self) = -[_DASCheckpointRecorder sendDataToPPS:subsystem:category:]( self,  "sendDataToPPS:subsystem:category:",  v10,  @"BackgroundProcessing",  @"FeatureStatus");

  return (char)self;
}

- (void)reportFeatureCodesForTasks
{
  featureCodeQueue = (dispatch_queue_s *)self->_featureCodeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057D3C;
  block[3] = &unk_1001150D0;
  block[4] = self;
  dispatch_sync(featureCodeQueue, block);
}

- (void)populateFeatureStatusFromPast
{
  dispatch_queue_attr_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  dispatch_queue_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"FeatureState == %@ OR FeatureState == %@",  &off_100121E88,  &off_100121EA0));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v29,  "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:",  @"BackgroundProcessing",  @"FeatureCheckpoint",  0));
  v28 = self;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B4F44();
  }
  id v32 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v30 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 metricKeysAndValues]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"FeatureCode"]);
        id v11 = [v10 integerValue];

        id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"FeatureState"]);
        if ([v12 unsignedIntegerValue] == (id)50)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", v14));

          if (v15) {
            goto LABEL_15;
          }
          [v8 epochTimestamp];
          int64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:"));
          dispatch_queue_attr_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringValue]);
          id v19 = v32;
          goto LABEL_14;
        }

        if ([v12 unsignedIntegerValue] == (id)30)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
          dispatch_queue_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stringValue]);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v21));

          if (!v22)
          {
            [v8 epochTimestamp];
            int64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:"));
            dispatch_queue_attr_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
            v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringValue]);
            id v19 = v30;
LABEL_14:
            -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v16, v18);
          }
        }

- (void)reportFeatureStatus
{
  featureAvailabilityQueue = (dispatch_queue_s *)self->_featureAvailabilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058428;
  block[3] = &unk_1001150D0;
  block[4] = self;
  dispatch_sync(featureAvailabilityQueue, block);
}

- (void)addDependencyInfoForTask:(id)a3 producedResultIdentifiers:(id)a4 dependencyIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  taskDependencyQueue = (dispatch_queue_s *)self->_taskDependencyQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100058778;
  v15[3] = &unk_100115630;
  id v16 = v9;
  id v17 = v10;
  v18 = self;
  id v19 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(taskDependencyQueue, v15);
}

- (void)registerFeatureStatusTask
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  [v2 registerForTaskWithIdentifier:@"com.apple.dasd.reportfeatureStatus" usingQueue:0 launchHandler:&stru_100116448];

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  [v3 deregisterTaskWithIdentifier:@"com.apple.dasd.reportfeatureStatus"];
}

- (void)registerReportTaskInfoTask
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100058954;
  v4[3] = &unk_100115B50;
  v4[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.reportTaskInfo" usingQueue:0 launchHandler:v4];
}

- (void)reportDependencyInfoForTasks
{
  taskDependencyQueue = (dispatch_queue_s *)self->_taskDependencyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000589F8;
  block[3] = &unk_1001150D0;
  block[4] = self;
  dispatch_sync(taskDependencyQueue, block);
}

- (BOOL)sendDataToPPS:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  unsigned __int8 v11 = [v10 sendDataToPPS:v9 subsystem:v8 category:v7];

  return v11;
}

- (OS_dispatch_queue)featureCodeQueue
{
  return self->_featureCodeQueue;
}

- (void)setFeatureCodeQueue:(id)a3
{
}

- (OS_dispatch_queue)taskCheckpointQueue
{
  return self->_taskCheckpointQueue;
}

- (void)setTaskCheckpointQueue:(id)a3
{
}

- (OS_dispatch_queue)taskDependencyQueue
{
  return self->_taskDependencyQueue;
}

- (void)setTaskDependencyQueue:(id)a3
{
}

- (OS_dispatch_queue)featureAvailabilityQueue
{
  return self->_featureAvailabilityQueue;
}

- (void)setFeatureAvailabilityQueue:(id)a3
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

- (NSMutableDictionary)taskToFeatureCodes
{
  return self->_taskToFeatureCodes;
}

- (void)setTaskToFeatureCodes:(id)a3
{
}

- (NSMutableDictionary)taskToSemanticVersion
{
  return self->_taskToSemanticVersion;
}

- (void)setTaskToSemanticVersion:(id)a3
{
}

- (NSMutableDictionary)availableStatus
{
  return self->_availableStatus;
}

- (void)setAvailableStatus:(id)a3
{
}

- (NSMutableDictionary)previewAvailableStatus
{
  return self->_previewAvailableStatus;
}

- (void)setPreviewAvailableStatus:(id)a3
{
}

- (NSMutableDictionary)taskToDependencies
{
  return self->_taskToDependencies;
}

- (void)setTaskToDependencies:(id)a3
{
}

- (void).cxx_destruct
{
}

@end