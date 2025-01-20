@interface NDTaskMonitor
- (NDTaskMonitor)initWithTask:(id)a3 taskInfo:(id)a4 clientBundleIdentifier:(id)a5 secondaryIdentifier:(id)a6 monitoredApplication:(id)a7 priority:(int64_t)a8 options:(unint64_t)a9 queue:(id)a10;
- (double)currentThroughputThreshold;
- (int64_t)basePriority;
- (int64_t)currentIntervalEndDelta;
- (void)applicationEndedTransitionalDiscretionaryBackgroundPeriod:(id)a3;
- (void)applicationEnteredForeground:(id)a3;
- (void)applicationNoLongerInForeground:(id)a3;
- (void)applicationWasQuitFromAppSwitcher:(id)a3;
- (void)backgroundUpdatesDisabledForApplication:(id)a3;
- (void)calculateThroughput;
- (void)cancel;
- (void)setBasePriority:(int64_t)a3;
- (void)setThroughputTimerForCurrentInterval;
- (void)startThroughputMonitoring;
- (void)startThroughputMonitoringIfAppropriate;
- (void)stopThroughputMonitoring;
- (void)taskTransferredData:(int64_t)a3 countOfBytesReceived:(int64_t)a4;
- (void)taskWillResume;
@end

@implementation NDTaskMonitor

- (NDTaskMonitor)initWithTask:(id)a3 taskInfo:(id)a4 clientBundleIdentifier:(id)a5 secondaryIdentifier:(id)a6 monitoredApplication:(id)a7 priority:(int64_t)a8 options:(unint64_t)a9 queue:(id)a10
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v16 = a7;
  id v17 = a10;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NDTaskMonitor;
  v18 = -[NDTaskMonitor init](&v26, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_task, a3);
    objc_storeStrong((id *)&v19->_taskInfo, a4);
    objc_storeStrong((id *)&v19->_queue, a10);
    objc_storeStrong((id *)&v19->_clientBundleIdentifier, a5);
    objc_storeStrong((id *)&v19->_clientSecondaryIdentifier, a6);
    objc_storeStrong((id *)&v19->_monitoredApplication, a7);
    v19->_basePriority = a8;
    v19->_discretionary = a9 & 1;
    v19->_explicitlyDiscretionary = (a9 & 2) != 0;
    v19->_performsNonDiscretionaryThrougputMonitoring = (a9 & 4) != 0;
    v19->_mayBeDemotedToDiscretionary = (a9 & 8) != 0;
    -[NDApplication addObserver:](v19->_monitoredApplication, "addObserver:", v19);
    v19->_powerMonitorToken = -1;
  }

  return v19;
}

- (double)currentThroughputThreshold
{
  return dbl_10005E178[self->_throughputInterval] * 1024.0;
}

- (int64_t)currentIntervalEndDelta
{
  unint64_t throughputInterval = self->_throughputInterval;
  if (throughputInterval) {
    return (uint64_t)((dbl_10005E130[throughputInterval] - dbl_10005E130[throughputInterval - 1]) * 60.0 * 1000000000.0);
  }
  else {
    return 60000000000LL;
  }
}

- (void)calculateThroughput
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v3 = self->_progressValues;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v23,  v37,  16LL);
  if (v4)
  {
    unint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        v5 += (unint64_t)objc_msgSend( *(id *)(*((void *)&v23 + 1) + 8 * (void)i),  "unsignedIntegerValue",  (void)v23);
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v23,  v37,  16LL);
    }

    while (v4);
    double v8 = (double)v5;
  }

  else
  {
    double v8 = 0.0;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_progressTimestamps, "firstObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_progressTimestamps, "lastObject"));
  [v10 doubleValue];
  double v12 = v11;
  [v9 doubleValue];
  double v14 = v13;
  -[NDTaskMonitor currentThroughputThreshold](self, "currentThroughputThreshold");
  double v15 = v8 / (v12 - v14);
  if (v15 < v16)
  {
    id v17 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionTask _loggableDescription](self->_task, "_loggableDescription"));
      -[NDTaskMonitor currentThroughputThreshold](self, "currentThroughputThreshold");
      progressTimestamps = self->_progressTimestamps;
      progressValues = self->_progressValues;
      *(_DWORD *)buf = 138544386;
      v28 = v19;
      __int16 v29 = 2048;
      double v30 = v15;
      __int16 v31 = 2048;
      uint64_t v32 = v22;
      __int16 v33 = 2112;
      v34 = progressValues;
      __int16 v35 = 2112;
      v36 = progressTimestamps;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}@ canceling because of low throughput monitoring! Current throughput: %f bytes/sec, current threshold: %f bytes/sec, samples %@/%@",  buf,  0x34u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionTask error:code:](self->_task, "error:code:", @"_nsurlsessiondErrorDomain", 3LL));
    -[NSURLSessionTask cancel_with_error:](self->_task, "cancel_with_error:", v18);
  }
}

- (void)setThroughputTimerForCurrentInterval
{
  throughputTimer = self->_throughputTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10003533C;
  handler[3] = &unk_100079BE0;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)throughputTimer, handler);
  id v4 = self->_throughputTimer;
  dispatch_time_t v5 = dispatch_time(0LL, -[NDTaskMonitor currentIntervalEndDelta](self, "currentIntervalEndDelta"));
  dispatch_source_set_timer((dispatch_source_t)v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)taskTransferredData:(int64_t)a3 countOfBytesReceived:(int64_t)a4
{
  if (!self->_hasTransferredData) {
    -[NDTaskMonitor startThroughputMonitoringIfAppropriate](self, "startThroughputMonitoringIfAppropriate");
  }
  self->_hasTransferredData = 1;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (!-[NSMutableArray count](self->_progressTimestamps, "count")) {
    self->_throughputMonitoringStartTime = Current;
  }
  if (-[NSMutableArray count](self->_progressTimestamps, "count")
    && (double v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_progressTimestamps, "lastObject")),
        [v8 doubleValue],
        CFAbsoluteTime v10 = Current - v9,
        v8,
        v10 <= 1.0))
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_progressValues, "lastObject"));
    double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (char *)[v16 unsignedIntegerValue] + a4 + a3));

    -[NSMutableArray removeLastObject](self->_progressValues, "removeLastObject");
    -[NSMutableArray addObject:](self->_progressValues, "addObject:", v15);
  }

  else
  {
    if ((unint64_t)-[NSMutableArray count](self->_progressTimestamps, "count") >= 0xA)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_progressTimestamps, "removeObjectAtIndex:", 0LL);
      -[NSMutableArray removeObjectAtIndex:](self->_progressValues, "removeObjectAtIndex:", 0LL);
    }

    progressValues = self->_progressValues;
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4 + a3));
    -[NSMutableArray addObject:](progressValues, "addObject:", v12);

    progressTimestamps = self->_progressTimestamps;
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current));
    -[NSMutableArray addObject:](progressTimestamps, "addObject:", v14);
    double v15 = (void *)v14;
  }

  if ((unint64_t)-[NSMutableArray count](self->_progressTimestamps, "count") >= 0xA
    && Current - self->_throughputMonitoringStartTime >= 15.0)
  {
    -[NDTaskMonitor calculateThroughput](self, "calculateThroughput");
  }

- (void)startThroughputMonitoring
{
  if (!self->_throughputTimer)
  {
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    progressTimestamps = self->_progressTimestamps;
    self->_progressTimestamps = v3;

    dispatch_time_t v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    progressValues = self->_progressValues;
    self->_progressValues = v5;

    self->_unint64_t throughputInterval = 0LL;
    v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    throughputTimer = self->_throughputTimer;
    self->_throughputTimer = v7;

    -[NDTaskMonitor setThroughputTimerForCurrentInterval](self, "setThroughputTimerForCurrentInterval");
    dispatch_resume((dispatch_object_t)self->_throughputTimer);
  }

- (void)stopThroughputMonitoring
{
  throughputTimer = self->_throughputTimer;
  if (throughputTimer)
  {
    dispatch_source_cancel((dispatch_source_t)throughputTimer);
    id v4 = self->_throughputTimer;
    self->_throughputTimer = 0LL;

    progressTimestamps = self->_progressTimestamps;
    self->_progressTimestamps = 0LL;

    progressValues = self->_progressValues;
    self->_progressValues = 0LL;

    self->_unint64_t throughputInterval = 0LL;
  }

- (void)taskWillResume
{
  if (self->_discretionary && !self->_explicitlyDiscretionary)
  {
    if (-[NDApplication isForeground](self->_monitoredApplication, "isForeground"))
    {
      id v3 = (id)objc_claimAutoreleasedReturnValue(-[NSURLSessionTask error:code:](self->_task, "error:code:", @"_nsurlsessiondErrorDomain", 6LL));
      -[NSURLSessionTask cancel_with_error:](self->_task, "cancel_with_error:");
    }
  }

- (void)startThroughputMonitoringIfAppropriate
{
  if (self->_discretionary
    || self->_performsNonDiscretionaryThrougputMonitoring
    && self->_basePriority == 300
    && (monitoredApplication = self->_monitoredApplication) != 0LL
    && !-[NDApplication isForeground](monitoredApplication, "isForeground"))
  {
    -[NDTaskMonitor startThroughputMonitoring](self, "startThroughputMonitoring");
  }

- (void)cancel
{
  int powerMonitorToken = self->_powerMonitorToken;
  if (powerMonitorToken != -1) {
    notify_cancel(powerMonitorToken);
  }
}

- (void)applicationWasQuitFromAppSwitcher:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003528C;
  v7[3] = &unk_100079C30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)backgroundUpdatesDisabledForApplication:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000351D0;
  v7[3] = &unk_100079C30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)applicationEnteredForeground:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035100;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)applicationNoLongerInForeground:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000350B8;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)applicationEndedTransitionalDiscretionaryBackgroundPeriod:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035014;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (int64_t)basePriority
{
  return self->_basePriority;
}

- (void)setBasePriority:(int64_t)a3
{
  self->_basePriority = a3;
}

- (void).cxx_destruct
{
}

@end