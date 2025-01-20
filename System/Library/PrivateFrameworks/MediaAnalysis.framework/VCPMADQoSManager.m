@interface VCPMADQoSManager
+ (id)sharedManager;
+ (unsigned)_currentQoSWithTaskID:(unint64_t)a3;
- (VCPMADQoSManager)init;
- (void)_reportDelayForQoS:(unsigned int)a3 withTaskID:(unint64_t)a4;
- (void)_reportQoSChange:(unsigned int)a3 withTaskID:(unint64_t)a4;
- (void)_reportStartingQoS:(unsigned int)a3 withTaskID:(unint64_t)a4;
- (void)disable;
- (void)enable;
- (void)runAsyncBlock:(id)a3 withTaskID:(unint64_t)a4;
- (void)runBlock:(id)a3 withTaskID:(unint64_t)a4;
@end

@implementation VCPMADQoSManager

- (VCPMADQoSManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VCPMADQoSManager;
  v2 = -[VCPMADQoSManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    atomic_store(0, (unsigned __int8 *)&v2->_enabled);
    v4 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
    timer = v3->_timer;
    v3->_timer = v4;

    mach_timebase_info(&v3->_timebase);
  }

  return v3;
}

+ (id)sharedManager
{
  if (qword_1001E6590 != -1) {
    dispatch_once(&qword_1001E6590, &stru_1001BC890);
  }
  return (id)qword_1001E6588;
}

- (void)_reportStartingQoS:(unsigned int)a3 withTaskID:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = -[VCPTimeMeasurement started](self->_timer, "started");
  if ((_DWORD)v7)
  {
    uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
    if ((int)v9 >= 4)
    {
      uint64_t v11 = VCPLogInstance(v9, v10);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      os_log_type_t v13 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v12, v13))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "[DAS QoS] manager timer already started; reset", buf, 2u);
      }
    }

    id v7 = -[VCPTimeMeasurement reset](self->_timer, "reset");
  }

  uint64_t v14 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v14 >= 7)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = VCPMAQoSDescription(v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138412546;
      uint64_t v31 = VCPAnalyticsEventDasDutyCycleKey;
      __int16 v32 = 2112;
      v33 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[DAS QoS] %@: Starting QoS %@", buf, 0x16u);
    }
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  uint64_t v27 = VCPAnalyticsFieldKeyRequestedQoS;
  uint64_t v22 = VCPMAQoSDescription(v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v29[0] = v23;
  uint64_t v28 = VCPAnalyticsFieldKeyTaskName;
  uint64_t v24 = VCPTaskIDDescription(a4);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v29[1] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  &v27,  2LL));
  objc_msgSend(v21, "sendEvent:withAnalytics:", VCPAnalyticsEventDasDutyCycleKey, v26, v27, v28, v29[0]);

  -[VCPTimeMeasurement start](self->_timer, "start");
}

- (void)_reportQoSChange:(unsigned int)a3 withTaskID:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = -[VCPTimeMeasurement started](self->_timer, "started");
  if ((v7 & 1) != 0)
  {
    id v9 = -[VCPTimeMeasurement stop](self->_timer, "stop");
    uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v11 >= 7)
    {
      uint64_t v13 = VCPLogInstance(v11, v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      os_log_type_t v15 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = VCPMAQoSDescription(v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        -[VCPTimeMeasurement elapsedTimeSeconds](self->_timer, "elapsedTimeSeconds");
        *(_DWORD *)buf = 138412802;
        uint64_t v34 = VCPAnalyticsEventDasDutyCycleKey;
        __int16 v35 = 2112;
        v36 = v17;
        __int16 v37 = 2048;
        uint64_t v38 = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "[DAS QoS] %@: QoS %@ changed after %f seconds", buf, 0x20u);
      }
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    v31[0] = VCPAnalyticsFieldKeyPreviousQoS;
    uint64_t v20 = VCPMAQoSDescription(v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v32[0] = v21;
    -[VCPTimeMeasurement elapsedTimeSeconds]( self->_timer,  "elapsedTimeSeconds",  v31[0],  VCPAnalyticsFieldKeyPreviousQoSDuration);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v32[1] = v22;
    v31[2] = VCPAnalyticsFieldKeyTaskName;
    uint64_t v23 = VCPTaskIDDescription(a4);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v32[2] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3LL));
    [v19 sendEvent:VCPAnalyticsEventDasDutyCycleKey withAnalytics:v25];

    -[VCPTimeMeasurement reset](self->_timer, "reset");
  }

  else
  {
    uint64_t v26 = MediaAnalysisLogLevel(v7, v8);
    if ((int)v26 >= 4)
    {
      uint64_t v28 = VCPLogInstance(v26, v27);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      os_log_type_t v30 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v29, v30))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "[DAS QoS] manager timer not started yet; start;", buf, 2u);
      }
    }
  }

  -[VCPTimeMeasurement start](self->_timer, "start");
}

- (void)_reportDelayForQoS:(unsigned int)a3 withTaskID:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if (-[VCPTimeMeasurement started](self->_timer, "started"))
  {
    -[VCPTimeMeasurement stop](self->_timer, "stop");
    -[VCPTimeMeasurement elapsedTimeSeconds](self->_timer, "elapsedTimeSeconds");
    double v8 = v7;
    id v9 = -[VCPTimeMeasurement start](self->_timer, "start");
    uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v11 >= 7)
    {
      uint64_t v13 = VCPLogInstance(v11, v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      os_log_type_t v15 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = VCPTaskIDDescription(a4);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        uint64_t v18 = VCPMAQoSDescription(v5);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        *(_DWORD *)buf = 138413058;
        uint64_t v28 = VCPAnalyticsEventDasDutyCycleTaskKey;
        __int16 v29 = 2112;
        os_log_type_t v30 = v17;
        __int16 v31 = 2112;
        __int16 v32 = v19;
        __int16 v33 = 2048;
        double v34 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[DAS QoS] %@: %@ (%@) QoS change delay %f seconds",  buf,  0x2Au);
      }
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    uint64_t v25 = VCPAnalyticsFieldKeyTaskName;
    uint64_t v21 = VCPTaskIDDescription(a4);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v8,  v25,  VCPAnalyticsFieldKeyQoSDelay,  v22));
    v26[1] = v23;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  &v25,  2LL));
    [v20 sendEvent:VCPAnalyticsEventDasDutyCycleTaskKey withAnalytics:v24];
  }

+ (unsigned)_currentQoSWithTaskID:(unint64_t)a3
{
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  uint64_t v12 = sub_1000A7C28;
  uint64_t v13 = &unk_1001BA7D8;
  id v14 = a1;
  unint64_t v15 = a3;
  if (qword_1001E65A0 != -1) {
    dispatch_once(&qword_1001E65A0, &v10);
  }
  uint64_t v5 = atomic_load(&dword_1001E6598);
  unsigned __int8 v6 = atomic_load(byte_1001E65A8);
  if ((v6 & 1) != 0)
  {
    double v7 = (void *)objc_opt_class(a1);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sharedManager", v10, v11, v12, v13, v14, v15));
    [v8 _reportDelayForQoS:v5 withTaskID:a3];

    atomic_store(0, byte_1001E65A8);
  }

  return v5;
}

- (void)enable
{
}

- (void)disable
{
}

- (void)runBlock:(id)a3 withTaskID:(unint64_t)a4
{
}

- (void)runAsyncBlock:(id)a3 withTaskID:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = qos_class_self();
  uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v9 >= 7)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = VCPMAQoSDescription(v7);
      id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
      uint64_t v16 = qos_class_self();
      uint64_t v17 = VCPMAQoSDescription(v16);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138412546;
      id v37 = v15;
      __int16 v38 = 2112;
      v39 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[DAS QoS] Target QoS: %@ Current QoS: %@", buf, 0x16u);
    }
  }

  uint64_t v19 = mach_absolute_time();
  uint64_t v21 = MediaAnalysisLogLevel(v19, v20);
  if ((int)v21 >= 7)
  {
    uint64_t v23 = VCPLogInstance(v21, v22);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    os_log_type_t v25 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = VCPMAQoSDescription(v7);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      *(_DWORD *)buf = 138412290;
      id v37 = v27;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "[DAS QoS] Dispatching to target QoS: %@", buf, 0xCu);
    }
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v7, 0LL);
  __int16 v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A8388;
  block[3] = &unk_1001BC8D8;
  block[4] = self;
  id v32 = v6;
  uint64_t v33 = v19;
  unint64_t v34 = a4;
  int v35 = v7;
  id v30 = v6;
  dispatch_async(v29, block);
}

- (void).cxx_destruct
{
}

@end