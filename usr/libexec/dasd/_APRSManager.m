@interface _APRSManager
+ (_APRSManager)sharedInstance;
- (BOOL)classCUnlocked;
- (NSDate)signpostReaderDate;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (OS_os_log)log;
- (_APRSBiomeAppKillEventWriter)appKillEventWriter;
- (_APRSBiomeEventAnalyzer)eventAnalyzer;
- (_APRSFreezerInterface)freezer;
- (_APRSManager)init;
- (_APRSPrewarmInterface)prewarmLauncher;
- (_APRSRecommendationEngine)engine;
- (_APRSSignpostReader)signpostReader;
- (_DASDataProtectionStateMonitor)dataProtectionStateMonitor;
- (int)debugNotifyToken;
- (int)notifyToken;
- (void)extractResumeLaunchSignposts:(id)a3;
- (void)feedNewRecommendations;
- (void)setAppKillEventWriter:(id)a3;
- (void)setClassCUnlocked:(BOOL)a3;
- (void)setDataProtectionStateMonitor:(id)a3;
- (void)setDebugNotifyToken:(int)a3;
- (void)setDefaults:(id)a3;
- (void)setEngine:(id)a3;
- (void)setEventAnalyzer:(id)a3;
- (void)setFreezer:(id)a3;
- (void)setLog:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setPrewarmLauncher:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSignpostReader:(id)a3;
- (void)setSignpostReaderDate:(id)a3;
- (void)setTimer:(id)a3;
- (void)setupTriggerWithHandler:(id)a3;
@end

@implementation _APRSManager

- (void)extractResumeLaunchSignposts:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.dasd.appResume.SignpostReader");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  signpostReaderDate = self->_signpostReaderDate;
  if (!signpostReaderDate
    || (-[NSDate timeIntervalSinceDate:](signpostReaderDate, "timeIntervalSinceDate:", v6), v8 < -86400.0))
  {
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -86400.0));
    v10 = self->_signpostReaderDate;
    self->_signpostReaderDate = v9;
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"com.apple.appResume.signpostReader";
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Started %@!", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10009FAB8;
  v23[3] = &unk_100115300;
  v23[4] = &buf;
  [v4 setExpirationHandler:v23];
  -[_APRSSignpostReader begin](self->_signpostReader, "begin");
  *(void *)&__int128 v12 = 134217984LL;
  __int128 v21 = v12;
  while (1)
  {
    -[NSDate timeIntervalSinceDate:](self->_signpostReaderDate, "timeIntervalSinceDate:", v6, v21);
    if (v13 >= -3600.0 || *(_BYTE *)(*((void *)&buf + 1) + 24LL)) {
      break;
    }
    v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      -[NSDate timeIntervalSinceDate:](self->_signpostReaderDate, "timeIntervalSinceDate:", v6);
      *(_DWORD *)v24 = v21;
      uint64_t v25 = v17;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Time interval %f", v24, 0xCu);
    }

    v15 = (NSDate *)objc_claimAutoreleasedReturnValue( -[NSDate dateByAddingTimeInterval:]( self->_signpostReaderDate,  "dateByAddingTimeInterval:",  3600.0));
    -[_APRSSignpostReader logAppResumeAndLaunchesFrom:endDate:]( self->_signpostReader,  "logAppResumeAndLaunchesFrom:endDate:",  self->_signpostReaderDate,  v15);
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v15, @"signpostReaderDate");
    v16 = self->_signpostReaderDate;
    self->_signpostReaderDate = v15;
  }

  -[_APRSSignpostReader end](self->_signpostReader, "end");
  if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
  {
    id v22 = 0LL;
    unsigned __int8 v18 = [v4 setTaskExpiredWithRetryAfter:&v22 error:0.0];
    id v19 = v22;
    if ((v18 & 1) == 0)
    {
      v20 = self->_log;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        sub_1000B8C34((uint64_t)v19, v20);
      }
      [v4 setTaskCompleted];
    }
  }

  else
  {
    [v4 setTaskCompleted];
  }

  _Block_object_dispose(&buf, 8);
}

- (_APRSManager)init
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS____APRSManager;
  v2 = -[_APRSManager init](&v28, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.aprs", "appResume.manager");
    log = v2->_log;
    v2->_log = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[_APRSRecommendationEngine sharedInstance](&OBJC_CLASS____APRSRecommendationEngine, "sharedInstance"));
    engine = v2->_engine;
    v2->_engine = (_APRSRecommendationEngine *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[_APRSPrewarmInterface sharedInstance](&OBJC_CLASS____APRSPrewarmInterface, "sharedInstance"));
    prewarmLauncher = v2->_prewarmLauncher;
    v2->_prewarmLauncher = (_APRSPrewarmInterface *)v7;

    v9 = objc_opt_new(&OBJC_CLASS____APRSSignpostReader);
    signpostReader = v2->_signpostReader;
    v2->_signpostReader = v9;

    v11 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
    defaults = v2->_defaults;
    v2->_defaults = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", @"signpostReaderDate"));
    signpostReaderDate = v2->_signpostReaderDate;
    v2->_signpostReaderDate = (NSDate *)v13;

    v2->_debugNotifyToken = -1;
    queue = (dispatch_queue_s *)v2->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10009FCC8;
    handler[3] = &unk_100115388;
    v16 = v2;
    uint64_t v27 = v16;
    notify_register_dispatch("com.apple.dasd.appResume.Signpost", &v2->_debugNotifyToken, queue, handler);
    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unsigned __int8 v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_BACKGROUND, 0);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.appresume.manager", v20);
    id v22 = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v21;

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10009FCD4;
    v24[3] = &unk_1001150D0;
    uint64_t v25 = v16;
    -[_APRSManager setupTriggerWithHandler:](v25, "setupTriggerWithHandler:", v24);
  }

  return v2;
}

+ (_APRSManager)sharedInstance
{
  if (qword_100157CB0 != -1) {
    dispatch_once(&qword_100157CB0, &stru_100117340);
  }
  return (_APRSManager *)(id)qword_100157CA8;
}

- (void)setupTriggerWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  timer = self->_timer;
  self->_timer = v5;

  dispatch_set_qos_class_fallback(self->_timer, 17LL);
  uint64_t v7 = self->_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10009FFA8;
  handler[3] = &unk_100117368;
  id v8 = v4;
  id v26 = v8;
  dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
  v9 = self->_timer;
  dispatch_time_t v10 = dispatch_walltime(0LL, 10000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v9, v10, 0x1A3185C5000uLL, 0x45D964B800uLL);
  v11 = objc_alloc_init(&OBJC_CLASS____DASDataProtectionStateMonitor);
  dataProtectionStateMonitor = self->_dataProtectionStateMonitor;
  self->_dataProtectionStateMonitor = v11;

  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10009FFB4;
  v22[3] = &unk_100115008;
  objc_copyWeak(&v23, &location);
  -[_DASDataProtectionStateMonitor setChangeHandler:](self->_dataProtectionStateMonitor, "setChangeHandler:", v22);
  uint64_t v13 = self->_dataProtectionStateMonitor;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  LODWORD(v13) = -[_DASDataProtectionStateMonitor isDataAvailableFor:](v13, "isDataAvailableFor:", v14);

  if ((_DWORD)v13)
  {
    self->_classCUnlocked = 1;
    dispatch_activate((dispatch_object_t)self->_timer);
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Class C not yet available.", buf, 2u);
    }
  }

  self->_notifyToken = -1;
  p_notifyToken = &self->_notifyToken;
  dispatch_queue_attr_t v17 = *(dispatch_queue_s **)(p_notifyToken + 7);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000A010C;
  v19[3] = &unk_100117390;
  id v18 = v8;
  id v20 = v18;
  notify_register_dispatch("com.apple.aprs.triggerHandler", p_notifyToken, v17, v19);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)feedNewRecommendations
{
  id v5 = (id)os_transaction_create("com.apple.dasd.appResume.Recommendations");
  -[_APRSRecommendationEngine evaluatePrewarmRecommendations](self->_engine, "evaluatePrewarmRecommendations");
  -[_APRSRecommendationEngine updateCurrentRecommendations](self->_engine, "updateCurrentRecommendations");
  prewarmLauncher = self->_prewarmLauncher;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSRecommendationEngine prewarmRecommendations](self->_engine, "prewarmRecommendations"));
  -[_APRSPrewarmInterface prewarmRecommendations:](prewarmLauncher, "prewarmRecommendations:", v4);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (int)debugNotifyToken
{
  return self->_debugNotifyToken;
}

- (void)setDebugNotifyToken:(int)a3
{
  self->_debugNotifyToken = a3;
}

- (NSDate)signpostReaderDate
{
  return self->_signpostReaderDate;
}

- (void)setSignpostReaderDate:(id)a3
{
}

- (_APRSFreezerInterface)freezer
{
  return self->_freezer;
}

- (void)setFreezer:(id)a3
{
}

- (_APRSPrewarmInterface)prewarmLauncher
{
  return self->_prewarmLauncher;
}

- (void)setPrewarmLauncher:(id)a3
{
}

- (_APRSSignpostReader)signpostReader
{
  return self->_signpostReader;
}

- (void)setSignpostReader:(id)a3
{
}

- (BOOL)classCUnlocked
{
  return self->_classCUnlocked;
}

- (void)setClassCUnlocked:(BOOL)a3
{
  self->_classCUnlocked = a3;
}

- (_DASDataProtectionStateMonitor)dataProtectionStateMonitor
{
  return self->_dataProtectionStateMonitor;
}

- (void)setDataProtectionStateMonitor:(id)a3
{
}

- (_APRSRecommendationEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (_APRSBiomeAppKillEventWriter)appKillEventWriter
{
  return self->_appKillEventWriter;
}

- (void)setAppKillEventWriter:(id)a3
{
}

- (_APRSBiomeEventAnalyzer)eventAnalyzer
{
  return self->_eventAnalyzer;
}

- (void)setEventAnalyzer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end