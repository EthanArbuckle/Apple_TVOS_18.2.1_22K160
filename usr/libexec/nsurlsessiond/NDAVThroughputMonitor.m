@interface NDAVThroughputMonitor
- (NDAVThroughputMonitor)initWithWrapper:(id)a3 monitoredApplication:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 queue:(id)a7;
- (double)currentIntervalThroughputThreshold;
- (int64_t)basePriority;
- (int64_t)currentIntervalDuration;
- (void)applicationEnteredForeground:(id)a3;
- (void)applicationNoLongerInForeground:(id)a3;
- (void)calculateThroughput;
- (void)cancel;
- (void)setBasePriority:(int64_t)a3;
- (void)setThroughputTimerForCurrentInterval;
- (void)startThroughputMonitoring;
- (void)startThroughputMonitoringIfAppropriate;
- (void)stopThroughputMonitoring;
- (void)wrapperTransferredData:(unint64_t)a3;
@end

@implementation NDAVThroughputMonitor

- (NDAVThroughputMonitor)initWithWrapper:(id)a3 monitoredApplication:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 queue:(id)a7
{
  char v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NDAVThroughputMonitor;
  v16 = -[NDAVThroughputMonitor init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_wrapper, a3);
    objc_storeStrong((id *)&v17->_queue, a7);
    objc_storeStrong((id *)&v17->_monitoredApplication, a4);
    v17->_basePriority = a5;
    v17->_discretionary = v8 & 1;
    v17->_explicitlyDiscretionary = (v8 & 2) != 0;
    v17->_performsNonDiscretionaryThroughputMonitoring = (v8 & 4) != 0;
    -[NDApplication addObserver:](v17->_monitoredApplication, "addObserver:", v17);
  }

  return v17;
}

- (void)cancel
{
}

- (void)wrapperTransferredData:(unint64_t)a3
{
  if (!self->_hasTransferredData) {
    -[NDAVThroughputMonitor startThroughputMonitoringIfAppropriate](self, "startThroughputMonitoringIfAppropriate");
  }
  self->_hasTransferredData = 1;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (!-[NSMutableArray count](self->_progressTimestamps, "count")) {
    self->_throughputMonitoringStartTime = Current;
  }
  if (-[NSMutableArray count](self->_progressTimestamps, "count")
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_progressTimestamps, "lastObject")),
        [v6 doubleValue],
        CFAbsoluteTime v8 = Current - v7,
        v6,
        v8 <= 1.0))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_progressValues, "lastObject"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (char *)[v14 unsignedLongLongValue] + a3));

    -[NSMutableArray removeLastObject](self->_progressValues, "removeLastObject");
    -[NSMutableArray addObject:](self->_progressValues, "addObject:", v13);
  }

  else
  {
    if ((unint64_t)-[NSMutableArray count](self->_progressTimestamps, "count") >= 0xA)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_progressTimestamps, "removeObjectAtIndex:", 0LL);
      -[NSMutableArray removeObjectAtIndex:](self->_progressValues, "removeObjectAtIndex:", 0LL);
    }

    progressTimestamps = self->_progressTimestamps;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current));
    -[NSMutableArray addObject:](progressTimestamps, "addObject:", v10);

    progressValues = self->_progressValues;
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    -[NSMutableArray addObject:](progressValues, "addObject:", v12);
    id v13 = (void *)v12;
  }

  if ((unint64_t)-[NSMutableArray count](self->_progressTimestamps, "count") >= 0xA
    && Current - self->_throughputMonitoringStartTime >= 15.0)
  {
    -[NDAVThroughputMonitor calculateThroughput](self, "calculateThroughput");
  }

- (void)startThroughputMonitoringIfAppropriate
{
  if (self->_discretionary
    || self->_performsNonDiscretionaryThroughputMonitoring
    && self->_basePriority == 300
    && (monitoredApplication = self->_monitoredApplication) != 0LL
    && !-[NDApplication isForeground](monitoredApplication, "isForeground"))
  {
    -[NDAVThroughputMonitor startThroughputMonitoring](self, "startThroughputMonitoring");
  }

- (void)startThroughputMonitoring
{
  if (!self->_throughputTimer)
  {
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    progressTimestamps = self->_progressTimestamps;
    self->_progressTimestamps = v3;

    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    progressValues = self->_progressValues;
    self->_progressValues = v5;

    self->_throughputInterval = 0LL;
    double v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    throughputTimer = self->_throughputTimer;
    self->_throughputTimer = v7;

    -[NDAVThroughputMonitor setThroughputTimerForCurrentInterval](self, "setThroughputTimerForCurrentInterval");
    dispatch_resume((dispatch_object_t)self->_throughputTimer);
  }

- (void)stopThroughputMonitoring
{
  throughputTimer = self->_throughputTimer;
  if (throughputTimer)
  {
    dispatch_source_cancel((dispatch_source_t)throughputTimer);
    v4 = self->_throughputTimer;
    self->_throughputTimer = 0LL;

    progressTimestamps = self->_progressTimestamps;
    self->_progressTimestamps = 0LL;

    progressValues = self->_progressValues;
    self->_progressValues = 0LL;

    self->_throughputInterval = 0LL;
  }

- (void)calculateThroughput
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v3 = self->_progressValues;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v23,  v35,  16LL);
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
        v5 += (unint64_t)objc_msgSend( *(id *)(*((void *)&v23 + 1) + 8 * (void)i),  "unsignedLongLongValue",  (void)v23);
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v23,  v35,  16LL);
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
  -[NDAVThroughputMonitor currentIntervalThroughputThreshold](self, "currentIntervalThroughputThreshold");
  double v15 = v8 / (v12 - v14);
  if (v15 < v16)
  {
    v17 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[NDAVThroughputMonitor currentIntervalThroughputThreshold](self, "currentIntervalThroughputThreshold");
      progressTimestamps = self->_progressTimestamps;
      progressValues = self->_progressValues;
      *(_DWORD *)buf = 134218754;
      double v28 = v15;
      __int16 v29 = 2048;
      uint64_t v30 = v22;
      __int16 v31 = 2112;
      v32 = progressValues;
      __int16 v33 = 2112;
      v34 = progressTimestamps;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Canceling AVAssetTask because of low throughput monitoring! Current throughput: %f bytes/sec, current threshold: %f bytes/sec, samples %@/%@",  buf,  0x2Au);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NDAVAssetDownloadSessionWrapper URL](self->_wrapper, "URL"));
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError _web_errorWithDomain:code:URL:]( &OBJC_CLASS___NSURLError,  "_web_errorWithDomain:code:URL:",  @"_nsurlsessiondErrorDomain",  3LL,  v18));

    -[NDAVAssetDownloadSessionWrapper cancelAndDeliverError:](self->_wrapper, "cancelAndDeliverError:", v19);
  }
}

- (int64_t)currentIntervalDuration
{
  unint64_t throughputInterval = self->_throughputInterval;
  if (throughputInterval) {
    return (uint64_t)((dbl_10005E130[throughputInterval] - dbl_10005E130[throughputInterval - 1]) * 60.0 * 1000000000.0);
  }
  else {
    return 60000000000LL;
  }
}

- (double)currentIntervalThroughputThreshold
{
  return dbl_10005E178[self->_throughputInterval] * 1024.0;
}

- (void)setThroughputTimerForCurrentInterval
{
  throughputTimer = self->_throughputTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10003C724;
  handler[3] = &unk_100079BE0;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)throughputTimer, handler);
  id v4 = self->_throughputTimer;
  dispatch_time_t v5 = dispatch_time(0LL, -[NDAVThroughputMonitor currentIntervalDuration](self, "currentIntervalDuration"));
  dispatch_source_set_timer((dispatch_source_t)v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)applicationEnteredForeground:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C6BC;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)applicationNoLongerInForeground:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C6A0;
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