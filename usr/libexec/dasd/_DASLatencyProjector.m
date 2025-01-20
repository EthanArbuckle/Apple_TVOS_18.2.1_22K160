@interface _DASLatencyProjector
+ (id)sharedInstance;
- (BOOL)isDASTaskCheckpoint:(id)a3;
- (BOOL)isTerminalEvent:(id)a3;
- (NSDate)lastPPSFlush;
- (OS_os_log)log;
- (_DASLatencyProjector)init;
- (id)computeActivityBlockingReason:(id)a3;
- (id)computeActivityTimeline:(id)a3 installations:(id)a4;
- (id)computeBlockedDurations:(id)a3;
- (id)computeElapsedRunTimeFromPairings:(id)a3 endDate:(id)a4;
- (id)computeElapsedRunTimeTotals:(id)a3;
- (id)computeElapsedRunTimes:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)computeElapsedRunTimesFromCheckpoints:(id)a3 endDate:(id)a4;
- (id)computeEstimatedMADCompletionTime:(id)a3 checkpointTimeSeries:(id)a4 progressTimeSeries:(id)a5 blockingReasonsTimeSeries:(id)a6 activity:(id)a7 osUpgradeTimestamp:(id)a8 endDate:(id)a9;
- (id)computeEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 filepath:(id)a5;
- (id)computeEstimatedRunTime:(id)a3 checkpointTimeSeries:(id)a4 progressTimeSeries:(id)a5 activity:(id)a6 endDate:(id)a7;
- (id)computeEstimatedRunTimes:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)computeFeatureTimeline:(id)a3 installations:(id)a4;
- (id)computePlugInStatus:(id)a3;
- (id)computeProgressTimeline:(id)a3;
- (id)computeUserActivityStatus:(id)a3;
- (id)exactCheckpointState:(unint64_t)a3;
- (id)exactFeatureCode:(id)a3;
- (id)exactTaskNamePredicate:(id)a3;
- (id)findActivitiesByName:(id)a3;
- (id)findLastCheckpointEvent:(id)a3 checkpoint:(unint64_t)a4;
- (id)findLastDASTaskCheckpointEvent:(id)a3;
- (id)findLastTaskSubmissionEvent:(id)a3;
- (id)getActivityTimelines:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)getBuddyData:(id)a3 filepath:(id)a4;
- (id)getConditionsPenalties:(id)a3;
- (id)getConditionsPenalty:(id)a3;
- (id)getDeviceConditionTimelines:(id)a3 filepath:(id)a4;
- (id)getFeatureTimelines:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)getInstallTimeline:(id)a3 filepath:(id)a4;
- (id)getLastOSUpgradeTimestamp:(id)a3 endDate:(id)a4 eraseInstallOnly:(BOOL)a5;
- (id)getRecentUniqueInstallationEvents:(id)a3 timeFilter:(id)a4;
- (id)getRecentUniqueProgressEvents:(id)a3;
- (id)getTaskCheckpointPairings:(id)a3;
- (id)getTasksForFeatures:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)removeImmediatelyPrecedingSubmissions:(id)a3;
- (id)stringifyDASTaskCheckpoint:(unint64_t)a3;
- (unint64_t)computeOverallProgressPercentage:(id)a3;
- (void)flushPPSCaches;
- (void)setLastPPSFlush:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation _DASLatencyProjector

- (_DASLatencyProjector)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____DASLatencyProjector;
  v2 = -[_DASLatencyProjector init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"latencyProjector"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;
  }

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A419C;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157D50 != -1) {
    dispatch_once(&qword_100157D50, block);
  }
  return (id)qword_100157D48;
}

- (id)exactTaskNamePredicate:(id)a3
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.TaskName == %@",  a3);
}

- (id)exactFeatureCode:(id)a3
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.FeatureCode == %@",  a3);
}

- (id)exactCheckpointState:(unint64_t)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.CheckpointState == %@",  v3));

  return v4;
}

- (BOOL)isDASTaskCheckpoint:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 metricKeysAndValues]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"CheckpointState"]);
  unint64_t v5 = (unint64_t)[v4 unsignedLongValue];

  return (v5 < 0x33) & (0x4210040108400uLL >> v5);
}

- (id)stringifyDASTaskCheckpoint:(unint64_t)a3
{
  if ((uint64_t)a3 <= 29)
  {
    switch(a3)
    {
      case 0xAuLL:
        uint64_t v3 = @"Submitted";
        return v3;
      case 0xFuLL:
        uint64_t v3 = @"TimewiseEligible";
        return v3;
      case 0x14uLL:
        uint64_t v3 = @"Started";
        return v3;
    }

- (BOOL)isTerminalEvent:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 metricKeysAndValues]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"CheckpointState"]);
  unint64_t v5 = (unint64_t)[v4 unsignedLongValue];

  return (v5 < 0x33) & (0x4010040000000uLL >> v5);
}

- (id)findLastTaskSubmissionEvent:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 metricKeysAndValues]);
  uint64_t v28 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"TaskName"]);

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v29 = v3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v3 reverseObjectEnumerator]);
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    v9 = 0LL;
    id v10 = 0LL;
    uint64_t v11 = *(void *)v32;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v32 != v11) {
        objc_enumerationMutation(v6);
      }
      v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 metricKeysAndValues]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"CheckpointState"]);
      id v16 = [v15 unsignedLongValue];

      if (v16 == (id)45 && v9 != 0LL)
      {
LABEL_29:
        id v23 = v10;

        v25 = (void *)v28;
        v24 = v29;
        goto LABEL_34;
      }

      if (v9 && v10)
      {

        -[_DASLatencyProjector isDASTaskCheckpoint:](self, "isDASTaskCheckpoint:", v13);
        v9 = 0LL;
        id v10 = 0LL;
      }

      else
      {
        if (v16 == (id)40 && v10 != 0LL)
        {
          v20 = v9;
          v9 = v13;
          id v21 = v10;
LABEL_25:
          id v22 = v13;

          id v10 = v21;
          goto LABEL_26;
        }

        else {
          BOOL v19 = 1;
        }
        if (!v19) {
          goto LABEL_29;
        }
      }

      v20 = v10;
      id v21 = v13;
      if (v16 == (id)10) {
        goto LABEL_25;
      }
LABEL_26:
      if (v8 == (id)++v12)
      {
        id v8 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_31;
      }
    }
  }

  v9 = 0LL;
  id v10 = 0LL;
LABEL_31:

  log = self->_log;
  v25 = (void *)v28;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v36 = v28;
    __int16 v37 = 2112;
    id v38 = v10;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Last submission event for %@: %@", buf, 0x16u);
  }

  id v10 = v10;
  v24 = v29;
LABEL_34:

  return v10;
}

- (id)findLastCheckpointEvent:(id)a3 checkpoint:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 metricKeysAndValues]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TaskName"]);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v30 = a4;
    __int16 v31 = 2112;
    __int128 v32 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Finding the last event for checkpoint %lu of %@",  buf,  0x16u);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 reverseObjectEnumerator]);
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    id v22 = v9;
    id v23 = v6;
    uint64_t v14 = *(void *)v25;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "metricKeysAndValues", v22, v23));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"CheckpointState"]);
        id v19 = [v18 unsignedLongValue];

        if (v19 == (id)a4)
        {
          id v20 = v16;
          goto LABEL_13;
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13) {
        continue;
      }
      break;
    }

    id v20 = 0LL;
LABEL_13:
    v9 = v22;
    id v6 = v23;
  }

  else
  {
    id v20 = 0LL;
  }

  return v20;
}

- (id)findLastDASTaskCheckpointEvent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 metricKeysAndValues]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"TaskName"]);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B8F1C((uint64_t)v7, log, v9);
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reverseObjectEnumerator", 0));
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (-[_DASLatencyProjector isDASTaskCheckpoint:](self, "isDASTaskCheckpoint:", v15))
        {
          id v16 = v15;
          goto LABEL_13;
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v16 = 0LL;
LABEL_13:

  return v16;
}

- (id)removeImmediatelyPrecedingSubmissions:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v16 = v3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 reverseObjectEnumerator]);
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 metricKeysAndValues]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"CheckpointState"]);
      id v13 = [v12 unsignedIntegerValue];

      if (v13 != (id)10) {
        break;
      }
      [v4 addObject:v10];
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v14 = [v16 mutableCopy];
  [v14 removeObjectsInArray:v4];

  return v14;
}

- (id)getTaskCheckpointPairings:(id)a3
{
  id v3 = a3;
  id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v4 = (_DASTaskCheckpointPair *)v3;
  id v5 = -[_DASTaskCheckpointPair countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (v5)
  {
    id v6 = v5;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v21;
    while (1)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metricKeysAndValues", v18));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"CheckpointState"]);
        id v13 = [v12 unsignedLongValue];

        if (v13 == (id)20)
        {
          id v14 = v10;
LABEL_11:

          id v7 = v14;
          continue;
        }

        if (v7 && -[_DASLatencyProjector isTerminalEvent:](self, "isTerminalEvent:", v10))
        {
          v15 = -[_DASTaskCheckpointPair initWithParams:terminalEvent:]( objc_alloc(&OBJC_CLASS____DASTaskCheckpointPair),  "initWithParams:terminalEvent:",  v7,  v10);
          [v18 addObject:v15];

          id v14 = 0LL;
          goto LABEL_11;
        }
      }

      id v6 = -[_DASTaskCheckpointPair countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
      if (!v6)
      {

        if (v7)
        {
          id v16 = -[_DASTaskCheckpointPair initWithParams:terminalEvent:]( objc_alloc(&OBJC_CLASS____DASTaskCheckpointPair),  "initWithParams:terminalEvent:",  v7,  v7);
          [v18 addObject:v16];
          goto LABEL_17;
        }

        goto LABEL_18;
      }
    }
  }

  id v7 = 0LL;
  id v16 = v4;
LABEL_17:

LABEL_18:
  return v18;
}

- (id)getRecentUniqueProgressEvents:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 metricKeysAndValues]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"TaskName"]);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Getting the recent unique progress events for %@",  buf,  0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", v7));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v21 = v4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 reverseObjectEnumerator]);
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 metricKeysAndValues]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"WorkloadCategory"]);

        if (([v10 containsObject:v18] & 1) == 0)
        {
          [v10 addObject:v18];
          [v9 insertObject:v16 atIndex:0];
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v13);
  }

  return v9;
}

- (unint64_t)computeOverallProgressPercentage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 metricKeysAndValues]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"TaskName"]);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v25 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Computing Overall Progress Percentage for %@",  buf,  0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getRecentUniqueProgressEvents:](self, "getRecentUniqueProgressEvents:", v4));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v10) {
    goto LABEL_12;
  }
  id v11 = v10;
  unint64_t v12 = 0LL;
  uint64_t v13 = *(void *)v20;
  do
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v20 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v19 + 1) + 8 * (void)i) metricKeysAndValues]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"CompletedPercentage"]);

      v12 += (unint64_t)[v16 unsignedIntegerValue];
    }

    id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }

  while (v11);
  if (v12) {
    unint64_t v17 = v12 / (unint64_t)[v9 count];
  }
  else {
LABEL_12:
  }
    unint64_t v17 = 0LL;

  return v17;
}

- (id)getRecentUniqueInstallationEvents:(id)a3 timeFilter:(id)a4
{
  id v6 = a3;
  id v27 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Getting the recent unique installation events",  buf,  2u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  uint64_t v28 = v6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 reverseObjectEnumerator]);
  id v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 metricKeysAndValues]);
        unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"]);

        if (v17 && ([v9 containsObject:v17] & 1) == 0)
        {
          [v9 addObject:v17];
          [v8 insertObject:v15 atIndex:0];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v12);
  }

  if (v27)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v27 startDate]);
    [v18 timeIntervalSince1970];
    uint64_t v20 = v19;
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v27 endDate]);
    [v21 timeIntervalSince1970];
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"LastUpgradeSystemTimestamp >= %lf AND LastUpgradeSystemTimestamp <= %lf",  v20,  v22));

    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v8 filteredArrayUsingPredicate:v23]);
    id v25 = [v24 mutableCopy];

    uint64_t v8 = v25;
  }

  return v8;
}

- (id)findActivitiesByName:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B8F88((uint64_t)v4, log, v6);
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allTasks]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name", (void)v20));
        unsigned int v17 = [v4 containsObject:v16];

        if (v17)
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
          [v7 setObject:v15 forKeyedSubscript:v18];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }

  return v7;
}

- (void)flushPPSCaches
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector lastPPSFlush](self, "lastPPSFlush"));
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector lastPPSFlush](self, "lastPPSFlush"));
  if (!v6 || v5 < -3.0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      sub_1000B8FF4(log);
    }
    PLQueryRegistered(1LL, @"XPCCacheFlush", 0LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[_DASLatencyProjector setLastPPSFlush:](self, "setLastPPSFlush:", v8);
  }

- (id)getTasksForFeatures:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  __int128 v30 = v8;
  __int128 v31 = v7;
  __int128 v29 = v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 loadTasksForFeatures:v7 metrics:0 timeFilter:v8 filepath:v9]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v11;
  id v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(obj);
        }
        unsigned int v17 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 metricKeysAndValues]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"FeatureCodes"]);

        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v17 metricKeysAndValues]);
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"TaskName"]);

        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v19 stringValue]);
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v22]);

        if (!v23)
        {
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v19 stringValue]);
          [v12 setObject:v24 forKeyedSubscript:v25];
        }

        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v19 stringValue]);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v26]);
      }

      id v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v14);
  }

  return v12;
}

- (id)getLastOSUpgradeTimestamp:(id)a3 endDate:(id)a4 eraseInstallOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector getRecentUniqueInstallationEvents:timeFilter:]( self,  "getRecentUniqueInstallationEvents:timeFilter:",  a3,  0LL));
  if (v8)
  {
    [v8 timeIntervalSince1970];
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"LastUpgradeSystemTimestamp <= %lf",  v10));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 filteredArrayUsingPredicate:v11]);

    id v9 = (void *)v12;
  }

  if (v5)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"InstallType = 0"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 filteredArrayUsingPredicate:v13]);

    id v9 = (void *)v14;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 reverseObjectEnumerator]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 nextObject]);

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 metricKeysAndValues]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"]);
  [v18 doubleValue];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));

  return v19;
}

- (id)computeBlockedDurations:(id)a3
{
  id v49 = a3;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[_DASRequiresPluggedInPolicy policyInstance]( &OBJC_CLASS____DASRequiresPluggedInPolicy,  "policyInstance"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 policyName]);
  unint64_t v42 = +[_DASPolicyManager bitmaskForPolicy:](&OBJC_CLASS____DASPolicyManager, "bitmaskForPolicy:", v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDeviceActivityPolicy policyInstance](&OBJC_CLASS____DASDeviceActivityPolicy, "policyInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 policyName]);
  unint64_t v41 = +[_DASPolicyManager bitmaskForPolicy:](&OBJC_CLASS____DASPolicyManager, "bitmaskForPolicy:", v6);

  unint64_t v48 = +[_DASPolicyManager bitmaskForPolicy:]( &OBJC_CLASS____DASPolicyManager,  "bitmaskForPolicy:",  @"Incompatibility");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](&OBJC_CLASS____DASPolicyManager, "allPoliciesForPlatform"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v7));

  v45 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectEnumerator]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 nextObject]);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    do
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 policyName]);
      [v10 addObject:v13];

      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 nextObject]);
      uint64_t v12 = (void *)v14;
    }

    while (v14);
  }

  v44 = v9;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[_DASRequiresPluggedInPolicy policyInstance]( &OBJC_CLASS____DASRequiresPluggedInPolicy,  "policyInstance"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 policyName]);
  v61[0] = v16;
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDeviceActivityPolicy policyInstance](&OBJC_CLASS____DASDeviceActivityPolicy, "policyInstance"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 policyName]);
  v61[1] = v18;
  v61[2] = @"Incompatibility";
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v61, 3LL));
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v19));
  [v10 minusSet:v20];

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v21 = v10;
  id v22 = [v21 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = 0LL;
    uint64_t v25 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v56 != v25) {
          objc_enumerationMutation(v21);
        }
        v24 |= +[_DASPolicyManager bitmaskForPolicy:]( &OBJC_CLASS____DASPolicyManager,  "bitmaskForPolicy:",  *(void *)(*((void *)&v55 + 1) + 8LL * (void)i));
      }

      id v23 = [v21 countByEnumeratingWithState:&v55 objects:v60 count:16];
    }

    while (v23);
  }

  else
  {
    uint64_t v24 = 0LL;
  }

  v43 = v21;

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v27 = v49;
  id v28 = [v27 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = 0LL;
    uint64_t v50 = 0LL;
    uint64_t v47 = 0LL;
    uint64_t v31 = *(void *)v52;
    do
    {
      for (j = 0LL; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v52 != v31) {
          objc_enumerationMutation(v27);
        }
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v51 + 1) + 8 * (void)j) metricKeysAndValues]);
        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"Maintenance"]);

        if (((unint64_t)[v34 unsignedLongValue] & (v41 | v42)) != 0)
        {
          ++v30;
        }

        else if (((unint64_t)[v34 unsignedLongValue] & v48) != 0)
        {
          ++v50;
        }

        else
        {
          unint64_t v35 = (unint64_t)[v34 unsignedLongValue];
          uint64_t v36 = v47;
          if ((v35 & v24) != 0) {
            uint64_t v36 = v47 + 1;
          }
          uint64_t v47 = v36;
        }
      }

      id v29 = [v27 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }

    while (v29);
  }

  else
  {
    uint64_t v30 = 0LL;
    uint64_t v50 = 0LL;
    uint64_t v47 = 0LL;
  }

  __int16 v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  900 * v30));
  [v46 setObject:v37 forKeyedSubscript:@"UnpluggedOrDeviceActive"];

  id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  900 * v50));
  [v46 setObject:v38 forKeyedSubscript:@"Incompatibility"];

  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  900 * v47));
  [v46 setObject:v39 forKeyedSubscript:@"SystemConditions"];

  return v46;
}

- (id)computeElapsedRunTimeFromPairings:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 startEvent]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 metricKeysAndValues]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"TaskName"]);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v13;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Computing Elapsed Run Time for %@", buf, 0xCu);
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v15 = v6;
  id v16 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v16)
  {
    id v17 = v16;
    __int16 v37 = v13;
    id v38 = v8;
    id v18 = 0LL;
    uint64_t v19 = *(void *)v40;
    double v20 = 0.0;
    do
    {
      id v21 = 0LL;
      id v22 = v18;
      do
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v15);
        }
        id v18 = *(id *)(*((void *)&v39 + 1) + 8LL * (void)v21);

        id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 terminalEvent]);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v18 startEvent]);

        if (v23 == v24)
        {
          if (!v7) {
            id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          }
          objc_msgSend(v7, "timeIntervalSince1970", v37, v38, (void)v39);
          double v32 = v31;
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v18 startEvent]);
          [v25 epochTimestamp];
          double v30 = v32 - v33;
        }

        else
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v18 terminalEvent]);
          [v25 epochTimestamp];
          double v27 = v26;
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v18 startEvent]);
          [v28 epochTimestamp];
          double v30 = v27 - v29;
        }

        double v20 = v20 + v30;
        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v18 dictionaryRepresentation]);
        [v9 addObject:v34];

        id v21 = (char *)v21 + 1;
        id v22 = v18;
      }

      while (v17 != v21);
      id v17 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }

    while (v17);

    id v13 = v37;
    id v8 = v38;
  }

  else
  {
    double v20 = 0.0;
  }

  unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20));
  [v8 setObject:v35 forKeyedSubscript:@"Elapsed Runtime"];

  [v8 setObject:v9 forKeyedSubscript:@"Checkpoint Pairings"];
  return v8;
}

- (id)computeElapsedRunTimesFromCheckpoints:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v9 = [v7 copy];

  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector findLastTaskSubmissionEvent:](self, "findLastTaskSubmissionEvent:", v9));
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    v60 = v8;
    do
    {
      [v11 epochTimestamp];
      v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"@epochTimestamp >= %lf",  v12));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 filteredArrayUsingPredicate:v67]);
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getTaskCheckpointPairings:](self, "getTaskCheckpointPairings:", v13));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeElapsedRunTimeFromPairings:endDate:]( self,  "computeElapsedRunTimeFromPairings:endDate:",  v68,  v6));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 dictionaryRepresentation]);
      v66 = v14;
      [v14 setObject:v15 forKeyedSubscript:@"Submission Event"];

      id v16 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector findLastDASTaskCheckpointEvent:]( self,  "findLastDASTaskCheckpointEvent:",  v9));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dictionaryRepresentation]);
      [v14 setObject:v17 forKeyedSubscript:@"Last DAS Checkpoint Event"];

      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactCheckpointState:](self, "exactCheckpointState:", 10LL));
      double v20 = (void *)objc_claimAutoreleasedReturnValue([v13 filteredArrayUsingPredicate:v19]);
      id v62 = [v20 count];

      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactCheckpointState:](self, "exactCheckpointState:", 20LL));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 filteredArrayUsingPredicate:v21]);
      id v63 = [v22 count];

      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactCheckpointState:](self, "exactCheckpointState:", 40LL));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v13 filteredArrayUsingPredicate:v23]);
      id v64 = [v24 count];

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactCheckpointState:](self, "exactCheckpointState:", 45LL));
      double v26 = (void *)objc_claimAutoreleasedReturnValue([v13 filteredArrayUsingPredicate:v25]);
      id v27 = [v26 count];

      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactCheckpointState:](self, "exactCheckpointState:", 15LL));
      double v29 = (void *)objc_claimAutoreleasedReturnValue([v13 filteredArrayUsingPredicate:v28]);
      id v65 = [v29 count];

      double v30 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactCheckpointState:](self, "exactCheckpointState:", 50LL));
      double v31 = (void *)objc_claimAutoreleasedReturnValue([v13 filteredArrayUsingPredicate:v30]);
      id v32 = [v31 count];

      double v33 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactCheckpointState:](self, "exactCheckpointState:", 30LL));
      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v13 filteredArrayUsingPredicate:v33]);
      id v61 = [v34 count];

      unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v62));
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector stringifyDASTaskCheckpoint:](self, "stringifyDASTaskCheckpoint:", 10LL));
      [v18 setObject:v35 forKeyedSubscript:v36];

      __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v63));
      id v38 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector stringifyDASTaskCheckpoint:](self, "stringifyDASTaskCheckpoint:", 20LL));
      [v18 setObject:v37 forKeyedSubscript:v38];

      __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v27));
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector stringifyDASTaskCheckpoint:](self, "stringifyDASTaskCheckpoint:", 45LL));
      [v18 setObject:v39 forKeyedSubscript:v40];

      __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v64));
      __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector stringifyDASTaskCheckpoint:](self, "stringifyDASTaskCheckpoint:", 40LL));
      [v18 setObject:v41 forKeyedSubscript:v42];

      id v43 = v32;
      id v8 = v60;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v43));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector stringifyDASTaskCheckpoint:](self, "stringifyDASTaskCheckpoint:", 50LL));
      [v18 setObject:v44 forKeyedSubscript:v45];

      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v61));
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector stringifyDASTaskCheckpoint:](self, "stringifyDASTaskCheckpoint:", 30LL));
      [v18 setObject:v46 forKeyedSubscript:v47];

      unint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v65));
      id v49 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector stringifyDASTaskCheckpoint:](self, "stringifyDASTaskCheckpoint:", 15LL));
      [v18 setObject:v48 forKeyedSubscript:v49];

      [v66 setObject:v18 forKeyedSubscript:@"Totals"];
      [v60 insertObject:v66 atIndex:0];
      [v11 epochTimestamp];
      __int128 v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"@epochTimestamp < %lf",  v50));

      __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v9 filteredArrayUsingPredicate:v51]);
      id v9 = (id)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector removeImmediatelyPrecedingSubmissions:]( self,  "removeImmediatelyPrecedingSubmissions:",  v52));

      [v11 epochTimestamp];
      __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));

      uint64_t v54 = objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector findLastTaskSubmissionEvent:](self, "findLastTaskSubmissionEvent:", v9));
      uint64_t v11 = (void *)v54;
      id v6 = v53;
    }

    while (v54);
  }

  else
  {
    __int128 v53 = v6;
  }

  if ([v9 count])
  {
    __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getTaskCheckpointPairings:](self, "getTaskCheckpointPairings:", v9));
    __int128 v56 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeElapsedRunTimeFromPairings:endDate:]( self,  "computeElapsedRunTimeFromPairings:endDate:",  v55,  v53));
    __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector findLastDASTaskCheckpointEvent:](self, "findLastDASTaskCheckpointEvent:", v9));
    __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v57 dictionaryRepresentation]);
    [v56 setObject:v58 forKeyedSubscript:@"Last DAS Checkpoint Event"];

    [v8 addObject:v56];
  }

  return v8;
}

- (id)computeElapsedRunTimes:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    -[_DASLatencyProjector flushPPSCaches](self, "flushPPSCaches");
  }
  id v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v11 loadTaskCheckpoints:v8 metrics:0 timeFilter:v9 filepath:v10]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 endDate]);
  uint64_t v25 = v10;
  double v26 = v9;
  if (v12) {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 endDate]);
  }
  else {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  uint64_t v14 = (void *)v13;

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v8;
  id v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
        double v20 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](self, "exactTaskNamePredicate:", v19));
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v28 array]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 filteredArrayUsingPredicate:v20]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeElapsedRunTimesFromCheckpoints:endDate:]( self,  "computeElapsedRunTimesFromCheckpoints:endDate:",  v22,  v14));

        [v29 setObject:v23 forKeyedSubscript:v19];
      }

      id v16 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v16);
  }

  return v29;
}

- (id)computeElapsedRunTimeTotals:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v3;
  id v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v33;
    double v5 = 0.0;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v6;
        id v7 = *(void **)(*((void *)&v32 + 1) + 8 * v6);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Elapsed Runtime"]);
        [v8 doubleValue];
        double v10 = v9;

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Totals"]);
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        id v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v29;
          do
          {
            for (i = 0LL; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v16]);
              id v18 = (char *)[v17 unsignedLongValue];
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v16]);
              double v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  &v18[(void)[v19 unsignedLongValue]]));
              [v4 setObject:v20 forKeyedSubscript:v16];
            }

            id v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }

          while (v13);
        }

        double v5 = v5 + v10;

        uint64_t v6 = v27 + 1;
      }

      while ((id)(v27 + 1) != v26);
      id v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }

    while (v26);
  }

  else
  {
    double v5 = 0.0;
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5));
  [v4 setObject:v21 forKeyedSubscript:@"Run Time"];

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [obj count]));
  [v4 setObject:v22 forKeyedSubscript:@"Instances"];

  return v4;
}

- (id)computeEstimatedRunTime:(id)a3 checkpointTimeSeries:(id)a4 progressTimeSeries:(id)a5 activity:(id)a6 endDate:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = a5;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v75 = v11;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 array]);
  v81 = v13;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeElapsedRunTimesFromCheckpoints:endDate:]( self,  "computeElapsedRunTimesFromCheckpoints:endDate:",  v16,  v13));

  v82 = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 lastObject]);
  v79 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"Submission Event"]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v79 objectForKeyedSubscript:@"epoch"]);
  [v19 doubleValue];
  uint64_t v21 = v20;

  v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"@epochTimestamp >= %lf",  v21));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filteredTimeSeriesUsingPredicate:"));

  v78 = v22;
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 array]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getRecentUniqueProgressEvents:](self, "getRecentUniqueProgressEvents:", v23));

  unint64_t v25 = -[_DASLatencyProjector computeOverallProgressPercentage:](self, "computeOverallProgressPercentage:", v24);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"Elapsed Runtime"]);
  [v26 doubleValue];
  double v28 = v27;

  v76 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"Last DAS Checkpoint Event"]);
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v76 objectForKeyedSubscript:@"CheckpointState"]);
  unint64_t v30 = (unint64_t)[v29 unsignedIntegerValue];

  v80 = v18;
  [v15 addEntriesFromDictionary:v18];
  id v74 = v12;
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v12 fastPass]);
  BOOL v32 = v31 != 0LL;
  v72 = v31;

  unint64_t v73 = v25;
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v25));
  [v15 setObject:v33 forKeyedSubscript:@"Overall Progress"];

  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  [v15 setObject:v34 forKeyedSubscript:@"hasFastPass"];

  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v32));
  [v15 setObject:v35 forKeyedSubscript:@"isFastPass"];

  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  id v36 = v24;
  id v37 = [v36 countByEnumeratingWithState:&v87 objects:v92 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v88;
    do
    {
      for (i = 0LL; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v88 != v39) {
          objc_enumerationMutation(v36);
        }
        __int128 v41 = *(void **)(*((void *)&v87 + 1) + 8LL * (void)i);
        __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"Recent Progress Events"]);

        if (!v42)
        {
          id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          [v15 setObject:v43 forKeyedSubscript:@"Recent Progress Events"];
        }

        v44 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"Recent Progress Events"]);
        v45 = (void *)objc_claimAutoreleasedReturnValue([v41 dictionaryRepresentation]);
        [v44 addObject:v45];
      }

      id v38 = [v36 countByEnumeratingWithState:&v87 objects:v92 count:16];
    }

    while (v38);
  }

  if (v30 > 0x32) {
    goto LABEL_14;
  }
  if (((1LL << v30) & 0x4200040000000LL) != 0)
  {
LABEL_31:
    v66 = v74;
    id v65 = v75;
    v67 = &AnalyticsSendEventLazy_ptr;
    goto LABEL_32;
  }

  if (((1LL << v30) & 0x8400) != 0)
  {
    if (v28 == 0.0)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue([v82 reverseObjectEnumerator]);
      id v47 = [v46 nextObject];
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      id v48 = v46;
      id v49 = [v48 countByEnumeratingWithState:&v83 objects:v91 count:16];
      if (v49)
      {
        id v50 = v49;
        id v51 = 0LL;
        uint64_t v52 = *(void *)v84;
LABEL_18:
        __int128 v53 = 0LL;
        uint64_t v54 = v51;
        while (1)
        {
          if (*(void *)v84 != v52) {
            objc_enumerationMutation(v48);
          }
          id v51 = *(id *)(*((void *)&v83 + 1) + 8LL * (void)v53);

          __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKeyedSubscript:@"Last DAS Checkpoint Event"]);
          __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:@"CheckpointState"]);
          id v57 = [v56 unsignedIntegerValue];

          if (v57 == (id)30) {
            break;
          }

          __int128 v53 = (char *)v53 + 1;
          uint64_t v54 = v51;
          if (v50 == v53)
          {
            id v50 = [v48 countByEnumeratingWithState:&v83 objects:v91 count:16];
            if (v50) {
              goto LABEL_18;
            }

            goto LABEL_25;
          }
        }

        __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKeyedSubscript:@"Elapsed Runtime"]);
        [v58 doubleValue];
        double v60 = v59;

        if (!v51) {
          goto LABEL_28;
        }
        id v61 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKeyedSubscript:@"Last DAS Checkpoint Event"]);
        id v62 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKeyedSubscript:@"Submission Event"]);
        id v63 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKeyedSubscript:@"epoch"]);
        [v15 setObject:v63 forKeyedSubscript:@"Previous Instance Submission Time"];

        id v64 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKeyedSubscript:@"epoch"]);
        [v15 setObject:v64 forKeyedSubscript:@"Previous Instance Completion Time"];

        double v28 = v60;
        goto LABEL_31;
      }

- (id)computeEstimatedRunTimes:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    __int128 v33 = 0LL;
  }

  else
  {
    -[_DASLatencyProjector flushPPSCaches](self, "flushPPSCaches");
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector findActivitiesByName:](self, "findActivitiesByName:", v8));
  }

  id v34 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v11 loadTaskCheckpoints:v8 metrics:0 timeFilter:v9 filepath:v10]);
  double v27 = v11;
  double v28 = v10;
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v11 loadTaskProgress:v8 metrics:0 timeFilter:v9 filepath:v10]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 endDate]);
  __int128 v29 = v9;
  if (v12) {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 endDate]);
  }
  else {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  id v14 = (void *)v13;

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v8;
  id v15 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](self, "exactTaskNamePredicate:", v19));
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v32 filteredTimeSeriesUsingPredicate:v20]);

        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](self, "exactTaskNamePredicate:", v19));
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v31 filteredTimeSeriesUsingPredicate:v22]);

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v19]);
        unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeEstimatedRunTime:checkpointTimeSeries:progressTimeSeries:activity:endDate:]( self,  "computeEstimatedRunTime:checkpointTimeSeries:progressTimeSeries:activity:endDate:",  v19,  v21,  v23,  v24,  v14));
        [v34 setObject:v25 forKeyedSubscript:v19];
      }

      id v16 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }

    while (v16);
  }

  return v34;
}

- (id)getConditionsPenalty:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      sub_1000B9034(log, v4);
    }
    uint64_t v7 = [v4 requiresSignificantUserInactivity];
    else {
      uint64_t v8 = v7;
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 fileProtection]);

    if (v9) {
      unint64_t v10 = v8 | 8;
    }
    else {
      unint64_t v10 = v8;
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
    [v5 setObject:v11 forKeyedSubscript:@"Blocking Criteria Bitmask"];

    if (v10 > 0x1F) {
      id v12 = &off_100122098;
    }
    else {
      id v12 = (&off_100117528)[v10];
    }
    [v5 setObject:v12 forKeyedSubscript:@"Conditions Penalty"];
  }

  return v5;
}

- (id)getConditionsPenalties:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector findActivitiesByName:](self, "findActivitiesByName:", v4));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12, (void)v16));
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getConditionsPenalty:](self, "getConditionsPenalty:", v13));

        [v5 setObject:v14 forKeyedSubscript:v12];
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  return v5;
}

- (id)computeFeatureTimeline:(id)a3 installations:(id)a4
{
  id v5 = a3;
  id v28 = a4;
  id v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v5;
  id v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 metricKeysAndValues]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"FeatureState"]);
        [v8 setObject:v10 forKeyedSubscript:@"FeatureState"];

        [v7 epochTimestamp];
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v8 setObject:v11 forKeyedSubscript:@"epoch"];

        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v28 reverseObjectEnumerator]);
        id v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v30;
          while (2)
          {
            for (j = 0LL; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v30 != v15) {
                objc_enumerationMutation(v12);
              }
              __int128 v17 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)j);
              __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"]);
              [v18 doubleValue];
              double v20 = v19;

              [v7 epochTimestamp];
              if (v20 < v21)
              {
                id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v28 indexOfObject:v17]));
                [v8 setObject:v22 forKeyedSubscript:@"InstallationEventIndex"];

                goto LABEL_16;
              }
            }

            id v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

- (id)computeActivityTimeline:(id)a3 installations:(id)a4
{
  id v5 = a3;
  id v28 = a4;
  id v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v5;
  id v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 metricKeysAndValues]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CheckpointState"]);
        [v8 setObject:v10 forKeyedSubscript:@"CheckpointState"];

        [v7 epochTimestamp];
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v8 setObject:v11 forKeyedSubscript:@"epoch"];

        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v28 reverseObjectEnumerator]);
        id v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v30;
          while (2)
          {
            for (j = 0LL; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v30 != v15) {
                objc_enumerationMutation(v12);
              }
              __int128 v17 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)j);
              __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"]);
              [v18 doubleValue];
              double v20 = v19;

              [v7 epochTimestamp];
              if (v20 < v21)
              {
                id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v28 indexOfObject:v17]));
                [v8 setObject:v22 forKeyedSubscript:@"InstallationEventIndex"];

                goto LABEL_16;
              }
            }

            id v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

- (id)computePlugInStatus:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v8);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 metricKeysAndValues]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"IsPluggedIn"]);
        [v10 setObject:v12 forKeyedSubscript:@"plugInState"];

        [v9 epochTimestamp];
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v10 setObject:v13 forKeyedSubscript:@"epoch"];

        [v4 addObject:v10];
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }

  return v4;
}

- (id)computeUserActivityStatus:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v8);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 metricKeysAndValues]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"UserActivityStatus"]);
        [v10 setObject:v12 forKeyedSubscript:@"UserActivityStatus"];

        [v9 epochTimestamp];
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v10 setObject:v13 forKeyedSubscript:@"epoch"];

        [v4 addObject:v10];
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }

  return v4;
}

- (id)computeProgressTimeline:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v8);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 metricKeysAndValues]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"CompletedPercentage"]);
        [v10 setObject:v12 forKeyedSubscript:@"CompletedPercentage"];

        [v9 epochTimestamp];
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v10 setObject:v13 forKeyedSubscript:@"epoch"];

        [v4 addObject:v10];
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }

  return v4;
}

- (id)computeActivityBlockingReason:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v8);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 metricKeysAndValues]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"BlockingPolicies"]);
        [v10 setObject:v12 forKeyedSubscript:@"BlockingPolicies"];

        [v9 epochTimestamp];
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v10 setObject:v13 forKeyedSubscript:@"timestamp"];

        [v4 addObject:v10];
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }

  return v4;
}

- (id)getFeatureTimelines:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v93 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9) {
    -[_DASLatencyProjector flushPPSCaches](self, "flushPPSCaches");
  }
  __int128 v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v86 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  __int128 v84 = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v86 loadConfig:0 timeFilter:v8 filepath:v9]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 array]);

  v96 = self;
  v81 = (void *)v11;
  __int128 v85 = v8;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector getRecentUniqueInstallationEvents:timeFilter:]( self,  "getRecentUniqueInstallationEvents:timeFilter:",  v11,  v8));
  v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v119 = 0u;
  __int128 v120 = 0u;
  __int128 v121 = 0u;
  __int128 v122 = 0u;
  id obj = v12;
  id v13 = [obj countByEnumeratingWithState:&v119 objects:v128 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v120;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v120 != v15) {
          objc_enumerationMutation(obj);
        }
        __int128 v17 = *(void **)(*((void *)&v119 + 1) + 8LL * (void)i);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 metricKeysAndValues]);
        double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"]);
        [v18 setObject:v20 forKeyedSubscript:@"LastUpgradeSystemTimestamp"];

        double v21 = (void *)objc_claimAutoreleasedReturnValue([v17 metricKeysAndValues]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"Build"]);
        [v18 setObject:v22 forKeyedSubscript:@"Build"];

        id v23 = (void *)objc_claimAutoreleasedReturnValue([v17 metricKeysAndValues]);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"InstallType"]);
        [v18 setObject:v24 forKeyedSubscript:@"InstallType"];

        [v98 addObject:v18];
      }

      id v14 = [obj countByEnumeratingWithState:&v119 objects:v128 count:16];
    }

    while (v14);
  }

  [v83 setObject:v98 forKeyedSubscript:@"Installation Events"];
  uint64_t v25 = v96;
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getBuddyData:filepath:](v96, "getBuddyData:filepath:", v85, v84));
  [v83 setObject:v26 forKeyedSubscript:@"Buddy Setup Events"];

  v92 = (void *)objc_claimAutoreleasedReturnValue([v86 loadFeatureCheckpoints:v93 metrics:0 timeFilter:v85 filepath:v84]);
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  id v27 = v93;
  id v28 = [v27 countByEnumeratingWithState:&v115 objects:v127 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v116;
    do
    {
      for (j = 0LL; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v116 != v30) {
          objc_enumerationMutation(v27);
        }
        __int128 v32 = *(void **)(*((void *)&v115 + 1) + 8LL * (void)j);
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactFeatureCode:](v25, "exactFeatureCode:", v32));
        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v92 filteredTimeSeriesUsingPredicate:v33]);

        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 array]);
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeFeatureTimeline:installations:]( v25,  "computeFeatureTimeline:installations:",  v35,  v98));
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v32 stringValue]);
        [v91 setObject:v36 forKeyedSubscript:v37];

        uint64_t v25 = v96;
      }

      id v29 = [v27 countByEnumeratingWithState:&v115 objects:v127 count:16];
    }

    while (v29);
  }

  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector getTasksForFeatures:timeFilter:filepath:]( v25,  "getTasksForFeatures:timeFilter:filepath:",  v27,  0LL,  v84));
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  id v97 = v38;
  id v40 = [v97 countByEnumeratingWithState:&v111 objects:v126 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v112;
    do
    {
      for (k = 0LL; k != v41; k = (char *)k + 1)
      {
        if (*(void *)v112 != v42) {
          objc_enumerationMutation(v97);
        }
        v44 = (void *)objc_claimAutoreleasedReturnValue( [v97 objectForKeyedSubscript:*(void *)(*((void *)&v111 + 1) + 8 * (void)k)]);
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v44));
        [v39 unionSet:v45];
      }

      id v41 = [v97 countByEnumeratingWithState:&v111 objects:v126 count:16];
    }

    while (v41);
  }

  v80 = v27;

  v82 = v39;
  v46 = (void *)objc_claimAutoreleasedReturnValue([v86 loadTaskCheckpoints:v39 metrics:0 timeFilter:v85 filepath:v84]);
  __int128 v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  id v87 = v46;
  id v94 = [v87 countByEnumeratingWithState:&v107 objects:v125 count:16];
  if (v94)
  {
    uint64_t v89 = *(void *)v108;
    do
    {
      for (m = 0LL; m != v94; m = (char *)m + 1)
      {
        if (*(void *)v108 != v89) {
          objc_enumerationMutation(v87);
        }
        id v48 = *(void **)(*((void *)&v107 + 1) + 8LL * (void)m);
        id v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary", v80));
        id v50 = (void *)objc_claimAutoreleasedReturnValue([v48 metricKeysAndValues]);
        id v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:@"CheckpointState"]);
        [v49 setObject:v51 forKeyedSubscript:@"CheckpointState"];

        [v48 epochTimestamp];
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v49 setObject:v52 forKeyedSubscript:@"epoch"];

        __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v48 metricKeysAndValues]);
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKeyedSubscript:@"TaskName"]);
        [v49 setObject:v54 forKeyedSubscript:@"TaskName"];

        __int128 v105 = 0u;
        __int128 v106 = 0u;
        __int128 v103 = 0u;
        __int128 v104 = 0u;
        __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v98 reverseObjectEnumerator]);
        id v56 = [v55 countByEnumeratingWithState:&v103 objects:v124 count:16];
        if (v56)
        {
          id v57 = v56;
          uint64_t v58 = *(void *)v104;
          while (2)
          {
            for (n = 0LL; n != v57; n = (char *)n + 1)
            {
              if (*(void *)v104 != v58) {
                objc_enumerationMutation(v55);
              }
              double v60 = *(void **)(*((void *)&v103 + 1) + 8LL * (void)n);
              id v61 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"]);
              [v61 doubleValue];
              double v63 = v62;

              [v48 epochTimestamp];
              if (v63 < v64)
              {
                id v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v98 indexOfObject:v60]));
                [v49 setObject:v65 forKeyedSubscript:@"InstallationEventIndex"];

                goto LABEL_39;
              }
            }

            id v57 = [v55 countByEnumeratingWithState:&v103 objects:v124 count:16];
            if (v57) {
              continue;
            }
            break;
          }
        }

- (id)getDeviceConditionTimelines:(id)a3 filepath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    -[_DASLatencyProjector flushPPSCaches](self, "flushPPSCaches");
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"IsPluggedIn"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 getPPSTimeSeries:@"BackgroundProcessing" category:@"SystemConditionsBattery" valueFilter:0 metrics:v18 timeFilter:v6 filepath:v7 error:0]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 array]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computePlugInStatus:](self, "computePlugInStatus:", v11));

  [v8 setObject:v12 forKeyedSubscript:@"Device PlugIn Status"];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"UserActivityStatus"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( [v9 getPPSTimeSeries:@"BackgroundProcessing" category:@"SystemConditionsPowerManagement" valueFilter:0 metrics:v13 timeFilter:v6 filepath:v7 error:0]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 array]);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeUserActivityStatus:](self, "computeUserActivityStatus:", v15));

  [v8 setObject:v16 forKeyedSubscript:@"Device User Activity Status"];
  return v8;
}

- (id)getInstallTimeline:(id)a3 filepath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    -[_DASLatencyProjector flushPPSCaches](self, "flushPPSCaches");
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  id v26 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 loadConfig:0 timeFilter:v6 filepath:v7]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 array]);

  uint64_t v25 = (void *)v10;
  id v27 = v6;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector getRecentUniqueInstallationEvents:timeFilter:]( self,  "getRecentUniqueInstallationEvents:timeFilter:",  v10,  v6));
  id v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(obj);
        }
        __int128 v16 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 metricKeysAndValues]);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"]);
        [v17 setObject:v19 forKeyedSubscript:@"LastUpgradeSystemTimestamp"];

        double v20 = (void *)objc_claimAutoreleasedReturnValue([v16 metricKeysAndValues]);
        double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"Build"]);
        [v17 setObject:v21 forKeyedSubscript:@"Build"];

        id v22 = (void *)objc_claimAutoreleasedReturnValue([v16 metricKeysAndValues]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"InstallType"]);
        [v17 setObject:v23 forKeyedSubscript:@"InstallType"];

        [v29 addObject:v17];
      }

      id v13 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v13);
  }

  return v29;
}

- (id)getBuddyData:(id)a3 filepath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    -[_DASLatencyProjector flushPPSCaches](self, "flushPPSCaches");
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  id v23 = v7;
  uint64_t v24 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 loadBuddyData:0 timeFilter:v6 filepath:v7]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 array]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = v10;
  id v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(obj);
        }
        __int128 v16 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 metricKeysAndValues]);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"SetupDate"]);
        [v17 setObject:v19 forKeyedSubscript:@"SetupDate"];

        double v20 = (void *)objc_claimAutoreleasedReturnValue([v16 metricKeysAndValues]);
        double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"TransferMethod"]);
        [v17 setObject:v21 forKeyedSubscript:@"TransferMethod"];

        [v11 addObject:v17];
      }

      id v13 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v13);
  }

  return v11;
}

- (id)getActivityTimelines:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v91 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9) {
    -[_DASLatencyProjector flushPPSCaches](self, "flushPPSCaches");
  }
  uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  id v90 = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v92 loadConfig:0 timeFilter:v8 filepath:v9]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 array]);

  __int128 v101 = self;
  __int128 v102 = v8;
  __int128 v88 = (void *)v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector getRecentUniqueInstallationEvents:timeFilter:]( self,  "getRecentUniqueInstallationEvents:timeFilter:",  v11,  v8));
  __int128 v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v123 = 0u;
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v126 = 0u;
  id obj = v12;
  id v13 = [obj countByEnumeratingWithState:&v123 objects:v131 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v124;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v124 != v15) {
          objc_enumerationMutation(obj);
        }
        __int128 v17 = *(void **)(*((void *)&v123 + 1) + 8LL * (void)i);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 metricKeysAndValues]);
        double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"LastUpgradeSystemTimestamp"]);
        [v18 setObject:v20 forKeyedSubscript:@"LastUpgradeSystemTimestamp"];

        double v21 = (void *)objc_claimAutoreleasedReturnValue([v17 metricKeysAndValues]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"Build"]);
        [v18 setObject:v22 forKeyedSubscript:@"Build"];

        id v23 = (void *)objc_claimAutoreleasedReturnValue([v17 metricKeysAndValues]);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"InstallType"]);
        [v18 setObject:v24 forKeyedSubscript:@"InstallType"];

        [v106 addObject:v18];
      }

      id v14 = [obj countByEnumeratingWithState:&v123 objects:v131 count:16];
    }

    while (v14);
  }

  uint64_t v25 = v89;
  [v89 setObject:v106 forKeyedSubscript:@"Installation Events"];
  __int128 v26 = v90;
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getBuddyData:filepath:](v101, "getBuddyData:filepath:", v8, v90));
  [v89 setObject:v27 forKeyedSubscript:@"Buddy Setup Events"];

  __int128 v28 = v91;
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v92 loadTaskCheckpoints:v91 metrics:0 timeFilter:v8 filepath:v90]);
  __int128 v100 = (void *)objc_claimAutoreleasedReturnValue([v92 loadTaskBlockingReasons:v91 metrics:0 timeFilter:v8 filepath:v90]);
  __int128 v99 = (void *)objc_claimAutoreleasedReturnValue([v92 loadTaskProgress:v91 metrics:0 timeFilter:v8 filepath:v90]);
  __int128 v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ([v91 count])
  {
    __int128 v121 = 0uLL;
    __int128 v122 = 0uLL;
    __int128 v119 = 0uLL;
    __int128 v120 = 0uLL;
    id v93 = v91;
    id v96 = [v93 countByEnumeratingWithState:&v119 objects:v130 count:16];
    if (v96)
    {
      uint64_t v95 = *(void *)v120;
      do
      {
        for (j = 0LL; j != v96; j = (char *)j + 1)
        {
          if (*(void *)v120 != v95) {
            objc_enumerationMutation(v93);
          }
          uint64_t v31 = *(void *)(*((void *)&v119 + 1) + 8LL * (void)j);
          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](v101, "exactTaskNamePredicate:", v31));
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v29 filteredTimeSeriesUsingPredicate:v32]);

          __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](v101, "exactTaskNamePredicate:", v31));
          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v100 filteredTimeSeriesUsingPredicate:v34]);

          __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](v101, "exactTaskNamePredicate:", v31));
          __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v99 filteredTimeSeriesUsingPredicate:v36]);

          __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v33 array]);
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeActivityTimeline:installations:]( v101,  "computeActivityTimeline:installations:",  v38,  v106));
          [v105 setObject:v39 forKeyedSubscript:v31];

          id v40 = (void *)objc_claimAutoreleasedReturnValue([v35 array]);
          id v41 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeActivityBlockingReason:]( v101,  "computeActivityBlockingReason:",  v40));
          [v104 setObject:v41 forKeyedSubscript:v31];

          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v37 array]);
          id v43 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeProgressTimeline:](v101, "computeProgressTimeline:", v42));
          [v103 setObject:v43 forKeyedSubscript:v31];

          v44 = (void *)objc_claimAutoreleasedReturnValue([v33 array]);
          v45 = (void *)objc_claimAutoreleasedReturnValue([v102 endDate]);
          v46 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeElapsedRunTimesFromCheckpoints:endDate:]( v101,  "computeElapsedRunTimesFromCheckpoints:endDate:",  v44,  v45));

          id v47 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeElapsedRunTimeTotals:]( v101,  "computeElapsedRunTimeTotals:",  v46));
          [v98 setObject:v47 forKeyedSubscript:v31];
        }

        id v96 = [v93 countByEnumeratingWithState:&v119 objects:v130 count:16];
      }

      while (v96);
      uint64_t v25 = v89;
      __int128 v26 = v90;
      __int128 v28 = v91;
    }
  }

  else
  {
    __int128 v117 = 0uLL;
    __int128 v118 = 0uLL;
    __int128 v115 = 0uLL;
    __int128 v116 = 0uLL;
    id v97 = v29;
    id v48 = (void *)objc_claimAutoreleasedReturnValue([v29 array]);
    id v49 = [v48 countByEnumeratingWithState:&v115 objects:v129 count:16];
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v116;
      do
      {
        for (k = 0LL; k != v50; k = (char *)k + 1)
        {
          if (*(void *)v116 != v51) {
            objc_enumerationMutation(v48);
          }
          __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v115 + 1) + 8 * (void)k) metricKeysAndValues]);
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKeyedSubscript:@"TaskName"]);

          if (v54)
          {
            __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:v54]);

            if (!v55)
            {
              id v56 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](v101, "exactTaskNamePredicate:", v54));
              id v57 = (void *)objc_claimAutoreleasedReturnValue([v97 filteredTimeSeriesUsingPredicate:v56]);

              uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v57 array]);
              double v59 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeActivityTimeline:installations:]( v101,  "computeActivityTimeline:installations:",  v58,  v106));
              [v105 setObject:v59 forKeyedSubscript:v54];

              double v60 = (void *)objc_claimAutoreleasedReturnValue([v57 array]);
              id v61 = (void *)objc_claimAutoreleasedReturnValue([v102 endDate]);
              double v62 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeElapsedRunTimesFromCheckpoints:endDate:]( v101,  "computeElapsedRunTimesFromCheckpoints:endDate:",  v60,  v61));

              double v63 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeElapsedRunTimeTotals:]( v101,  "computeElapsedRunTimeTotals:",  v62));
              [v98 setObject:v63 forKeyedSubscript:v54];
            }
          }
        }

        id v50 = [v48 countByEnumeratingWithState:&v115 objects:v129 count:16];
      }

      while (v50);
    }

    __int128 v113 = 0u;
    __int128 v114 = 0u;
    __int128 v111 = 0u;
    __int128 v112 = 0u;
    double v64 = (void *)objc_claimAutoreleasedReturnValue([v100 array]);
    id v65 = [v64 countByEnumeratingWithState:&v111 objects:v128 count:16];
    if (v65)
    {
      id v66 = v65;
      uint64_t v67 = *(void *)v112;
      do
      {
        for (m = 0LL; m != v66; m = (char *)m + 1)
        {
          if (*(void *)v112 != v67) {
            objc_enumerationMutation(v64);
          }
          id v69 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v111 + 1) + 8 * (void)m) metricKeysAndValues]);
          uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKeyedSubscript:@"TaskName"]);

          if (v70)
          {
            double v71 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:v70]);

            if (!v71)
            {
              v72 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](v101, "exactTaskNamePredicate:", v70));
              unint64_t v73 = (void *)objc_claimAutoreleasedReturnValue([v100 filteredTimeSeriesUsingPredicate:v72]);

              id v74 = (void *)objc_claimAutoreleasedReturnValue([v73 array]);
              id v75 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeActivityBlockingReason:]( v101,  "computeActivityBlockingReason:",  v74));
              [v104 setObject:v75 forKeyedSubscript:v70];
            }
          }
        }

        id v66 = [v64 countByEnumeratingWithState:&v111 objects:v128 count:16];
      }

      while (v66);
    }

    __int128 v109 = 0u;
    __int128 v110 = 0u;
    __int128 v107 = 0u;
    __int128 v108 = 0u;
    id v93 = (id)objc_claimAutoreleasedReturnValue([v99 array]);
    id v76 = [v93 countByEnumeratingWithState:&v107 objects:v127 count:16];
    if (v76)
    {
      id v77 = v76;
      uint64_t v78 = *(void *)v108;
      do
      {
        for (n = 0LL; n != v77; n = (char *)n + 1)
        {
          if (*(void *)v108 != v78) {
            objc_enumerationMutation(v93);
          }
          v80 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v107 + 1) + 8 * (void)n) metricKeysAndValues]);
          v81 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKeyedSubscript:@"TaskName"]);

          if (v81)
          {
            v82 = (void *)objc_claimAutoreleasedReturnValue([v103 objectForKeyedSubscript:v81]);

            if (!v82)
            {
              __int128 v83 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](v101, "exactTaskNamePredicate:", v81));
              __int128 v84 = (void *)objc_claimAutoreleasedReturnValue([v99 filteredTimeSeriesUsingPredicate:v83]);

              __int128 v85 = (void *)objc_claimAutoreleasedReturnValue([v84 array]);
              __int128 v86 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeProgressTimeline:](v101, "computeProgressTimeline:", v85));
              [v103 setObject:v86 forKeyedSubscript:v81];
            }
          }
        }

        id v77 = [v93 countByEnumeratingWithState:&v107 objects:v127 count:16];
      }

      while (v77);
    }

    __int128 v26 = v90;
    __int128 v28 = v91;
    uint64_t v25 = v89;
    __int128 v29 = v97;
  }

  [v25 setObject:v105 forKeyedSubscript:@"Activity Checkpoints"];
  [v25 setObject:v104 forKeyedSubscript:@"Activity Blocking Reasons"];
  [v25 setObject:v103 forKeyedSubscript:@"Progress Checkpoints"];
  [v25 setObject:v98 forKeyedSubscript:@"Totals"];

  return v25;
}

- (id)computeEstimatedMADCompletionTime:(id)a3 checkpointTimeSeries:(id)a4 progressTimeSeries:(id)a5 blockingReasonsTimeSeries:(id)a6 activity:(id)a7 osUpgradeTimestamp:(id)a8 endDate:(id)a9
{
  id v58 = a6;
  id v15 = a8;
  id v16 = a9;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  double v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeEstimatedRunTime:checkpointTimeSeries:progressTimeSeries:activity:endDate:]( self,  "computeEstimatedRunTime:checkpointTimeSeries:progressTimeSeries:activity:endDate:",  v20,  v19,  v18,  v17,  v16));

  if (v22
    && (id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"Estimated Runtime"]),
        [v23 doubleValue],
        double v25 = v24,
        v23,
        double v26 = -1.0,
        v25 != -1.0))
  {
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"Overall Progress"]);
    unsigned int v56 = [v28 unsignedIntValue];

    [v16 timeIntervalSinceDate:v15];
    unint64_t v30 = (unint64_t)v29;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"Estimated Runtime"]);
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"Elapsed Runtime"]);
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v58 array]);
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeBlockedDurations:](self, "computeBlockedDurations:", v33));

    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"UnpluggedOrDeviceActive"]);
    id v55 = [v35 unsignedLongValue];

    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"Incompatibility"]);
    id v54 = [v36 unsignedLongValue];

    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"SystemConditions"]);
    id v53 = [v37 unsignedLongValue];

    id v57 = v31;
    [v31 doubleValue];
    double v39 = v38;
    [v32 doubleValue];
    id v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v39 - v40));
    [v21 setObject:v41 forKeyedSubscript:@"Estimated Runtime Remaining"];

    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v30));
    [v21 setObject:v42 forKeyedSubscript:@"Time Since Upgrade"];

    id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v56));
    [v21 setObject:v43 forKeyedSubscript:@"Overall Progress"];

    double v44 = -1.0;
    double v45 = -1.0;
    double v46 = -1.0;
    if (v56)
    {
      float v47 = (float)v56 / (float)(100 - (unint64_t)v56);
      double v26 = (float)((float)v30 / v47);
      double v44 = (float)((float)(v30 - (unint64_t)v55) / v47);
      double v45 = (float)((float)(v30 - (unint64_t)v54) / v47);
      double v46 = (float)((float)(v30 - (unint64_t)v53) / v47);
    }

    id v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v26, v53));
    [v21 setObject:v48 forKeyedSubscript:@"Remaining Estimated Completion Time"];

    id v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v44));
    [v21 setObject:v49 forKeyedSubscript:@"TimePluggedInOrDeviceInactive"];

    id v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v45));
    [v21 setObject:v50 forKeyedSubscript:@"TimeCompatible"];

    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v46));
    [v21 setObject:v51 forKeyedSubscript:@"TimeSystemConditionsFavorable"];

    id v27 = v21;
  }

  else
  {
    id v27 = 0LL;
  }

  return v27;
}

- (id)computeEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 filepath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v41 = 0LL;
  }

  else
  {
    -[_DASLatencyProjector flushPPSCaches](self, "flushPPSCaches");
    id v41 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector findActivitiesByName:](self, "findActivitiesByName:", v8));
  }

  id v42 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  if (!v9) {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  id v12 = objc_alloc(&OBJC_CLASS___NSDateInterval);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:", 0.0));
  id v14 = -[NSDateInterval initWithStartDate:endDate:](v12, "initWithStartDate:endDate:", v13, v9);

  __int128 v33 = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 loadConfig:0 timeFilter:v14 filepath:v10]);
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 array]);

  __int128 v32 = (void *)v16;
  double v40 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector getLastOSUpgradeTimestamp:endDate:eraseInstallOnly:]( self,  "getLastOSUpgradeTimestamp:endDate:eraseInstallOnly:",  v16,  v9,  0LL));
  id v17 = -[NSDateInterval initWithStartDate:endDate:]( objc_alloc(&OBJC_CLASS___NSDateInterval),  "initWithStartDate:endDate:",  v40,  v9);
  double v39 = (void *)objc_claimAutoreleasedReturnValue([v11 loadTaskCheckpoints:v8 metrics:0 timeFilter:v17 filepath:v10]);
  double v38 = (void *)objc_claimAutoreleasedReturnValue([v11 loadTaskProgress:v8 metrics:0 timeFilter:v17 filepath:v10]);
  __int128 v34 = v11;
  __int128 v35 = v10;
  uint64_t v31 = v17;
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v11 loadIntensiveTaskBlockingReasons:v17 metrics:0 filepath:v10]);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id obj = v8;
  id v18 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v44 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)i);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](self, "exactTaskNamePredicate:", v22));
        double v24 = (void *)objc_claimAutoreleasedReturnValue([v39 filteredTimeSeriesUsingPredicate:v23]);

        double v25 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](self, "exactTaskNamePredicate:", v22));
        double v26 = (void *)objc_claimAutoreleasedReturnValue([v38 filteredTimeSeriesUsingPredicate:v25]);

        id v27 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:v22]);
        id v28 = v9;
        double v29 = (void *)objc_claimAutoreleasedReturnValue( -[_DASLatencyProjector computeEstimatedMADCompletionTime:checkpointTimeSeries:progressTimeSeries:blockingReasonsTimeSeries:activity:osUpgradeTimestamp:endDate:]( self,  "computeEstimatedMADCompletionTime:checkpointTimeSeries:progressTimeSeries:blockingReasonsTimeS eries:activity:osUpgradeTimestamp:endDate:",  v22,  v24,  v26,  v37,  v27,  v40,  v9));
        [v42 setObject:v29 forKeyedSubscript:v22];

        id v9 = v28;
      }

      id v19 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }

    while (v19);
  }

  return v42;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSDate)lastPPSFlush
{
  return self->_lastPPSFlush;
}

- (void)setLastPPSFlush:(id)a3
{
}

- (void).cxx_destruct
{
}

@end