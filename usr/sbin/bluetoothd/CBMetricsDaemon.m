@interface CBMetricsDaemon
+ (id)sharedCBMetricsDaemon;
- (CBMetricsDaemon)init;
- (id)description;
- (void)_reportAggressiveScanMetricEvents;
- (void)_reportAuthTagType:(unsigned __int8)a3 authTagStatus:(unsigned __int8)a4 integrityTagStatus:(unsigned __int8)a5 resolutionWindow:(char)a6;
- (void)_reportEvents;
- (void)_scheduleReport;
- (void)_setupAggressiveScanMetricExportTimer;
- (void)_setupMetricExportTimer;
- (void)_startIfNeeded;
- (void)_whbMetricExportTimerFired;
- (void)reportAggressiveScan:(id)a3 action:(id)a4;
- (void)reportAuthTagType:(unsigned __int8)a3 authTagStatus:(unsigned __int8)a4 integrityTagStatus:(unsigned __int8)a5 resolutionWindow:(char)a6;
- (void)reportCBDiscovery:(id)a3 daemonCnx:(id)a4 action:(id)a5;
- (void)reportRSSIMetric:(id)a3;
- (void)reportWhbMetric:(id)a3;
- (void)reportxpcCBAdvertiserUpdate:(id)a3;
@end

@implementation CBMetricsDaemon

+ (id)sharedCBMetricsDaemon
{
  if (qword_1008D9EA8 != -1) {
    dispatch_once(&qword_1008D9EA8, &stru_10087FB18);
  }
  return (id)qword_1008D9EA0;
}

- (CBMetricsDaemon)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CBMetricsDaemon;
  v2 = -[CBMetricsDaemon init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("CBMetrics", v7);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v8;

    v10 = v3;
  }

  return v3;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t discoveryEventsDroppedTotal = self->_discoveryEventsDroppedTotal;
  unint64_t discoveryEventsTotal = self->_discoveryEventsTotal;
  os_unfair_lock_unlock(p_lock);
  id v6 = [(id)objc_opt_class(self) description];
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = NSPrintF_safe("%@: Discovery total/dropped: %llu/%llu", v7, discoveryEventsTotal, discoveryEventsDroppedTotal);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (void)_reportEvents
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  self->_scheduledReport = 0;
  dispatch_queue_attr_t v4 = self->_discoveryEventsArray;
  discoveryEventsArray = self->_discoveryEventsArray;
  self->_discoveryEventsArray = 0LL;

  unint64_t discoveryEventsTotal = self->_discoveryEventsTotal;
  unint64_t discoveryEventsDroppedReported = self->_discoveryEventsDroppedReported;
  unint64_t discoveryEventsDroppedTotal = self->_discoveryEventsDroppedTotal;
  self->_unint64_t discoveryEventsDroppedReported = discoveryEventsDroppedTotal;
  os_unfair_lock_unlock(p_lock);
  v28 = v4;
  id v6 = -[NSMutableArray count](v4, "count");
  if (&_PLLogRegisteredEvent && v6)
  {
    id v24 = v6;
    v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    obj = v4;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
    if (v7)
    {
      uint64_t v30 = *(void *)v34;
      do
      {
        id v32 = v7;
        for (i = 0LL; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v34 != v30) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          v39[0] = @"actn";
          uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 action]);
          v11 = (void *)v10;
          if (v10) {
            objc_super v12 = (const __CFString *)v10;
          }
          else {
            objc_super v12 = &stru_1008A57D8;
          }
          v40[0] = v12;
          v39[1] = @"apID";
          uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 appID]);
          v14 = (void *)v13;
          if (v13) {
            v15 = (const __CFString *)v13;
          }
          else {
            v15 = &stru_1008A57D8;
          }
          v40[1] = v15;
          v39[2] = @"cid";
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 clientID]));
          v40[2] = v16;
          v39[3] = @"dsFl";
          v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v9 discoveryFlags]));
          v40[3] = v17;
          v39[4] = @"pid";
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 pid]));
          v40[4] = v18;
          v39[5] = @"scnR";
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v9 scanRate]));
          v40[5] = v19;
          v39[6] = @"timS";
          [v9 timestamp];
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          v40[6] = v20;
          v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  7LL));

          -[NSMutableArray addObject:](v31, "addObject:", v21);
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
      }

      while (v7);
    }

    v37[0] = @"dscE";
    v37[1] = @"drpE";
    v38[0] = v31;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  discoveryEventsDroppedTotal - discoveryEventsDroppedReported));
    v38[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  2LL));

    if (dword_1008D6290 <= 20
      && (dword_1008D6290 != -1 || _LogCategory_Initialize(&dword_1008D6290, 20LL)))
    {
      LogPrintF_safe( &dword_1008D6290,  "-[CBMetricsDaemon _reportEvents]",  20LL,  "PowerLog report: name %@, total %llu +%llu, dropped %llu +%llu",  @"CBDiscovery",  discoveryEventsTotal,  v24,  discoveryEventsDroppedTotal,  discoveryEventsDroppedTotal - discoveryEventsDroppedReported);
    }

    PLLogRegisteredEvent(35LL, @"CBDiscovery", v23, 0LL);
  }
}

- (void)_scheduleReport
{
  if (!self->_scheduledReport)
  {
    self->_scheduledReport = 1;
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002F3D0;
    block[3] = &unk_10087EA48;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }

- (void)_startIfNeeded
{
  if (!self->_startCalled)
  {
    self->_startCalled = 1;
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002F450;
    block[3] = &unk_10087EA48;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }

- (void)reportAuthTagType:(unsigned __int8)a3 authTagStatus:(unsigned __int8)a4 integrityTagStatus:(unsigned __int8)a5 resolutionWindow:(char)a6
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002F6F4;
  v7[3] = &unk_10087EB48;
  v7[4] = self;
  unsigned __int8 v8 = a3;
  unsigned __int8 v9 = a4;
  unsigned __int8 v10 = a5;
  char v11 = a6;
  dispatch_async(dispatchQueue, v7);
}

- (void)_reportAuthTagType:(unsigned __int8)a3 authTagStatus:(unsigned __int8)a4 integrityTagStatus:(unsigned __int8)a5 resolutionWindow:(char)a6
{
  int v6 = a6;
  int v7 = a5;
  int v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  double Current = CFAbsoluteTimeGetCurrent();
  double v21 = -1.0;
  double v20 = -1.0;
  int v19 = -1;
  if (([gCBDaemonServer prefSystemReferenceTimeDisabled] & 1) == 0
    && TMGetReferenceTime(&v21, &v20, &v19)
    && v19)
  {
    double v10 = v21;
    double v11 = v21 - Current;
    if (dword_1008D6290 > 20) {
      goto LABEL_13;
    }
    if (dword_1008D6290 != -1) {
      goto LABEL_6;
    }
    if (_LogCategory_Initialize(&dword_1008D6290, 20LL))
    {
      double v10 = v21;
LABEL_6:
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v10));
      id v13 = objc_claimAutoreleasedReturnValue([v12 description]);
      v14 = (const char *)[v13 UTF8String];
      LogPrintF_safe( &dword_1008D6290,  "-[CBMetricsDaemon _reportAuthTagType:authTagStatus:integrityTagStatus:resolutionWindow:]",  20LL,  "Reference time %f, (%s). delta: %f ±%f reliability %d",  v10,  v14,  v11,  v20,  v19);
    }
  }

  else
  {
    double v11 = -1.0;
    if (dword_1008D6290 <= 20
      && (dword_1008D6290 != -1 || _LogCategory_Initialize(&dword_1008D6290, 20LL)))
    {
      LogPrintF_safe( &dword_1008D6290,  "-[CBMetricsDaemon _reportAuthTagType:authTagStatus:integrityTagStatus:resolutionWindow:]",  20LL,  "No reference time available for auth tag");
    }
  }

- (void)reportCBDiscovery:(id)a3 daemonCnx:(id)a4 action:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = objc_alloc_init(&OBJC_CLASS___CBMetricsDiscoveryEvent);
  -[CBMetricsDiscoveryEvent setAction:](v11, "setAction:", v10);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v9 appID]);
  -[CBMetricsDiscoveryEvent setAppID:](v11, "setAppID:", v12);

  -[CBMetricsDiscoveryEvent setClientID:](v11, "setClientID:", [v8 clientID]);
  -[CBMetricsDiscoveryEvent setDiscoveryFlags:](v11, "setDiscoveryFlags:", [v8 discoveryFlags]);
  -[CBMetricsDiscoveryEvent setPid:](v11, "setPid:", [v9 pid]);
  -[CBMetricsDiscoveryEvent setScanRate:](v11, "setScanRate:", [v8 bleScanRate]);
  -[CBMetricsDiscoveryEvent setTimestamp:](v11, "setTimestamp:", CFAbsoluteTimeGetCurrent());
  os_unfair_lock_lock(&self->_lock);
  ++self->_discoveryEventsTotal;
  id v13 = -[NSMutableArray count](self->_discoveryEventsArray, "count");
  unint64_t discoveryEventsDroppedTotal = self->_discoveryEventsDroppedTotal;
  if ((unint64_t)v13 < 0x96)
  {
    discoveryEventsArray = self->_discoveryEventsArray;
    if (!discoveryEventsArray)
    {
      uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      uint64_t v18 = self->_discoveryEventsArray;
      self->_discoveryEventsArray = v17;

      discoveryEventsArray = self->_discoveryEventsArray;
    }

    -[NSMutableArray addObject:](discoveryEventsArray, "addObject:", v11);
    else {
      -[CBMetricsDaemon _scheduleReport](self, "_scheduleReport");
    }
    os_unfair_lock_unlock(&self->_lock);
    if (dword_1008D6290 <= 20
      && (dword_1008D6290 != -1 || _LogCategory_Initialize(&dword_1008D6290, 20LL)))
    {
      int v19 = (void *)objc_claimAutoreleasedReturnValue([v9 appID]);
      LogPrintF_safe( &dword_1008D6290,  "-[CBMetricsDaemon reportCBDiscovery:daemonCnx:action:]",  20,  "Metrics event report: CBDiscovery, appID %@, action %@, PID %d, CID 0x%X. count %llu, dropped %llu",  v19,  v10,  [v9 pid],  objc_msgSend(v8, "clientID"),  v13,  discoveryEventsDroppedTotal);
    }

    if ([v10 isEqual:@"strt"])
    {
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10002FCD0;
      block[3] = &unk_10087EA48;
      block[4] = v11;
      dispatch_async(dispatchQueue, block);
    }
  }

  else
  {
    self->_unint64_t discoveryEventsDroppedTotal = discoveryEventsDroppedTotal + 1;
    os_unfair_lock_unlock(&self->_lock);
    if (__ROR8__(0x8F5C28F5C28F5C29LL * discoveryEventsDroppedTotal, 1) <= 0x51EB851EB851EB8uLL
      && dword_1008D6290 <= 30
      && (dword_1008D6290 != -1 || _LogCategory_Initialize(&dword_1008D6290, 30LL)))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBMetricsDiscoveryEvent appID](v11, "appID"));
      LogPrintF_safe( &dword_1008D6290,  "-[CBMetricsDaemon reportCBDiscovery:daemonCnx:action:]",  30LL,  "Metrics event dropped: CBDiscovery, appID %@, action %@, PID %d, CID 0x%X. count %llu, dropped %llu",  v15,  v10,  -[CBMetricsDiscoveryEvent pid](v11, "pid"),  -[CBMetricsDiscoveryEvent clientID](v11, "clientID"),  v13,  discoveryEventsDroppedTotal + 1);
    }
  }
}

- (void)reportAggressiveScan:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 appID]);
  if (v8) {
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 appID]);
  }
  else {
    id v9 = @"unknown";
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_10003012C;
  v28 = sub_10003013C;
  v29 = 0LL;
  v29 = objc_alloc_init(&OBJC_CLASS___CBMetricsAggressiveScanEvent);
  unsigned int v11 = [v7 isEqual:@"agsN"];
  [(id)v25[5] setScanScreenOnCount:v11];
  unsigned int v12 = [v7 isEqual:@"agsF"];
  [(id)v25[5] setScanScreenOffCount:v12];
  id v13 = [v6 bleScanRate];
  [(id)v25[5] setScanRateScreenOn:v13];
  id v14 = [v6 bleScanRateScreenOff];
  [(id)v25[5] setScanRateScreenOff:v14];
  id v15 = [v6 discoveryFlags];
  [(id)v25[5] setDiscoveryFlags:v15];
  [(id)v25[5] setDiscoveryTypes:0];
  id v16 = [(id)v25[5] discoveryTypesPtr];
  id v17 = v6;
  CBDiscoveryTypesAddTypes(v16, [v17 discoveryTypesInternalPtr]);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030144;
  block[3] = &unk_10087FB68;
  block[4] = self;
  void block[5] = v9;
  v22 = v10;
  v23 = &v24;
  id v21 = v7;
  id v19 = v7;
  dispatch_async(dispatchQueue, block);

  _Block_object_dispose(&v24, 8);
}

- (void)_setupAggressiveScanMetricExportTimer
{
  p_aggrScanMetricExportTimer = &self->_aggrScanMetricExportTimer;
  dispatch_queue_attr_t v4 = self->_aggrScanMetricExportTimer;
  if (!v4)
  {
    dispatch_source_t v5 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)p_aggrScanMetricExportTimer, v5);
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472LL;
    id v8 = sub_100030638;
    id v9 = &unk_10087FB90;
    dispatch_queue_attr_t v4 = v5;
    id v10 = v4;
    unsigned int v11 = self;
    dispatch_source_set_event_handler((dispatch_source_t)v4, &v6);
    CUDispatchTimerSet(v4, 1200.0, -1.0, 10.0);
    dispatch_activate((dispatch_object_t)v4);
    if (dword_1008D6290 <= 20
      && (dword_1008D6290 != -1 || _LogCategory_Initialize(&dword_1008D6290, 20LL)))
    {
      LogPrintF_safe( &dword_1008D6290,  "-[CBMetricsDaemon _setupAggressiveScanMetricExportTimer]",  20LL,  "Aggressive Scan Metrics timer successfully setup",  v6,  v7,  v8,  v9);
    }
  }
}

- (void)_reportAggressiveScanMetricEvents
{
  if (&_PLLogRegisteredEvent && self->_aggrScanMetricDict)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    aggrScanMetricDict = self->_aggrScanMetricDict;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100030838;
    v7[3] = &unk_10087FBB8;
    v7[4] = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( aggrScanMetricDict,  "enumerateKeysAndObjectsUsingBlock:",  v7);
    id v8 = @"agsE";
    id v9 = v3;
    dispatch_source_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    if (dword_1008D6290 <= 20
      && (dword_1008D6290 != -1 || _LogCategory_Initialize(&dword_1008D6290, 20LL)))
    {
      LogPrintF_safe( &dword_1008D6290,  "-[CBMetricsDaemon _reportAggressiveScanMetricEvents]",  20LL,  "PowerLog report: name %@ with %lu events",  @"AggressiveScan",  -[NSMutableArray count](v3, "count"));
    }

    PLLogRegisteredEvent(35LL, @"AggressiveScan", v5, 0LL);
  }

  id v6 = self->_aggrScanMetricDict;
  self->_aggrScanMetricDict = 0LL;
}

- (void)reportxpcCBAdvertiserUpdate:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030C2C;
  block[3] = &unk_10087EA48;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, block);
}

- (void)reportRSSIMetric:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100030CFC;
  v7[3] = &unk_10087FB90;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_setupMetricExportTimer
{
  p_whbMetricExportTimer = &self->_whbMetricExportTimer;
  id v4 = self->_whbMetricExportTimer;
  if (!v4)
  {
    dispatch_source_t v5 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)p_whbMetricExportTimer, v5);
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472LL;
    id v8 = sub_100030E88;
    id v9 = &unk_10087FB90;
    id v4 = v5;
    id v10 = v4;
    unsigned int v11 = self;
    dispatch_source_set_event_handler((dispatch_source_t)v4, &v6);
    CUDispatchTimerSet(self->_whbMetricExportTimer, 43200.0, -1.0, 10.0);
    dispatch_activate((dispatch_object_t)*p_whbMetricExportTimer);
    if (dword_1008D6290 <= 30
      && (dword_1008D6290 != -1 || _LogCategory_Initialize(&dword_1008D6290, 30LL)))
    {
      LogPrintF_safe( &dword_1008D6290,  "-[CBMetricsDaemon _setupMetricExportTimer]",  30LL,  "WHB metric timer successfully setup",  v6,  v7,  v8,  v9);
    }
  }
}

- (void)_whbMetricExportTimerFired
{
  if (dword_1008D6290 <= 20 && (dword_1008D6290 != -1 || _LogCategory_Initialize(&dword_1008D6290, 20LL))) {
    LogPrintF_safe( &dword_1008D6290,  "-[CBMetricsDaemon _whbMetricExportTimerFired]",  20LL,  "WHB metric export timer fired");
  }
  unint64_t numRssiBucketChanges = self->_numRssiBucketChanges;
  unint64_t v5 = self->_numRssiNoBucketChanges + numRssiBucketChanges;
  if (v5) {
    *(float *)&double v2 = (float)((float)numRssiBucketChanges / (float)v5) * 100.0;
  }
  else {
    LODWORD(v2) = 0;
  }
  v12[0] = @"CBWHBMetricsKeyEventType";
  v12[1] = @"CBWHBMetricsKeyRSSIChangePercent";
  v13[0] = @"RSSILevelEvent";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v2));
  v13[1] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](&OBJC_CLASS___CBMetricsDaemon, "sharedCBMetricsDaemon"));
  [v8 reportWhbMetric:v7];

  self->_numRssiNoBucketChanges = 0LL;
  self->_unint64_t numRssiBucketChanges = 0LL;
  whbMetricExportTimer = self->_whbMetricExportTimer;
  if (whbMetricExportTimer)
  {
    id v10 = whbMetricExportTimer;
    dispatch_source_cancel(v10);
    unsigned int v11 = self->_whbMetricExportTimer;
    self->_whbMetricExportTimer = 0LL;
  }
}

- (void)reportWhbMetric:(id)a3
{
  id v4 = a3;
  if (dword_1008D6290 <= 20 && (dword_1008D6290 != -1 || _LogCategory_Initialize(&dword_1008D6290, 20LL)))
  {
    uint64_t v5 = CUPrintNSObjectOneLine(v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    LogPrintF_safe(&dword_1008D6290, "-[CBMetricsDaemon reportWhbMetric:]", 20LL, "WHB Metrics report: %@", v6);
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100031160;
  block[3] = &unk_10087EA48;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
}

@end