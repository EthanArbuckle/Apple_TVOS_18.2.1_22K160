@interface _APRSBiomeEventAnalyzer
+ (id)sharedInstance;
- (NSMutableDictionary)bookmarkDictionary;
- (OS_os_log)log;
- (_APRSBiomeEventAnalyzer)init;
- (id)allAppActivationTimeInfo;
- (id)allAppKillsInfo;
- (id)appActivationPublisherForEventsFrom:(id)a3;
- (id)appActivationTimeInfoStartingAtDate:(id)a3 withBookmarkKey:(id)a4;
- (id)appKillsInfoPublisherForEventsFrom:(id)a3;
- (id)appKillsInfoStartingAtDate:(id)a3 withBookmarkKey:(id)a4;
- (id)meanDeltaTimeBetweenColdLaunchAndResume;
- (id)meanDeltaTimeBetweenColdLaunchAndResumeStartingAtDate:(id)a3 withBookmarkKey:(id)a4;
- (void)logCompletion:(id)a3 forAnalysisName:(id)a4;
- (void)setBookmarkDictionary:(id)a3;
- (void)setLog:(id)a3;
- (void)setupDailyTask;
@end

@implementation _APRSBiomeEventAnalyzer

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003B844;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157818 != -1) {
    dispatch_once(&qword_100157818, block);
  }
  return (id)qword_100157820;
}

- (_APRSBiomeEventAnalyzer)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____APRSBiomeEventAnalyzer;
  v2 = -[_APRSBiomeEventAnalyzer init](&v8, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.aprs", "appResume.BiomeAnalyzer");
    log = v2->_log;
    v2->_log = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    bookmarkDictionary = v2->_bookmarkDictionary;
    v2->_bookmarkDictionary = v5;

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_bookmarkDictionary,  "setObject:forKeyedSubscript:",  0LL,  @"appKillBookmark");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_bookmarkDictionary,  "setObject:forKeyedSubscript:",  0LL,  @"appActivationInfoBookmark");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_bookmarkDictionary,  "setObject:forKeyedSubscript:",  0LL,  @"appActivationMeanBookmark");
    -[_APRSBiomeEventAnalyzer setupDailyTask](v2, "setupDailyTask");
  }

  return v2;
}

- (void)logCompletion:(id)a3 forAnalysisName:(id)a4
{
  id v6 = a4;
  if ([a3 state])
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000B318C();
    }
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000B312C();
  }
}

- (void)setupDailyTask
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10003BB60;
  v12[3] = &unk_100115B50;
  v12[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.appResumeDaily" usingQueue:0 launchHandler:v12];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 taskRequestForIdentifier:@"com.apple.dasd.appResumeDaily"]);

  if (!v5)
  {
    id v6 = [[BGRepeatingSystemTaskRequest alloc] initWithIdentifier:@"com.apple.dasd.appResumeDaily"];
    [v6 setPriority:1];
    [v6 setInterval:86400.0];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
    id v11 = 0LL;
    unsigned __int8 v8 = [v7 submitTaskRequest:v6 error:&v11];
    id v9 = v11;

    if ((v8 & 1) == 0)
    {
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Failed to submit task with error: %@",  buf,  0xCu);
      }
    }
  }

- (id)meanDeltaTimeBetweenColdLaunchAndResume
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -1814400.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[_APRSBiomeEventAnalyzer meanDeltaTimeBetweenColdLaunchAndResumeStartingAtDate:withBookmarkKey:]( self,  "meanDeltaTimeBetweenColdLaunchAndResumeStartingAtDate:withBookmarkKey:",  v3,  @"appActivationMeanBookmark"));

  return v4;
}

- (id)meanDeltaTimeBetweenColdLaunchAndResumeStartingAtDate:(id)a3 withBookmarkKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)os_transaction_create("com.apple.dasd.appResumeMeanActivationTimeCalculations");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"App Activation Metrics - Mean calculation - start date: %@",  v6));
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_10003C180;
  v28 = sub_10003C190;
  v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bookmarkDictionary,  "objectForKeyedSubscript:",  v7));
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[_APRSBiomeBase sharedEventQueue](&OBJC_CLASS____APRSBiomeBase, "sharedEventQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C198;
  block[3] = &unk_100115BF0;
  block[4] = self;
  id v19 = v6;
  id v20 = v10;
  id v21 = v7;
  id v22 = v9;
  v23 = &v24;
  id v12 = v9;
  id v13 = v7;
  id v14 = v10;
  id v15 = v6;
  dispatch_sync(v11, block);
  id v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (id)allAppActivationTimeInfo
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -1814400.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[_APRSBiomeEventAnalyzer appActivationTimeInfoStartingAtDate:withBookmarkKey:]( self,  "appActivationTimeInfoStartingAtDate:withBookmarkKey:",  v3,  @"appActivationInfoBookmark"));

  return v4;
}

- (id)appActivationTimeInfoStartingAtDate:(id)a3 withBookmarkKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)os_transaction_create("com.apple.dasd.appResumeAllActivationTimeCalculations");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"App Activation Metrics - Info calculation - start date: %@",  v6));
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_10003C180;
  v28 = sub_10003C190;
  id v29 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bookmarkDictionary,  "objectForKeyedSubscript:",  v7));
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[_APRSBiomeBase sharedEventQueue](&OBJC_CLASS____APRSBiomeBase, "sharedEventQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C618;
  block[3] = &unk_100115BF0;
  block[4] = self;
  id v19 = v6;
  id v20 = v10;
  id v21 = v7;
  id v22 = v9;
  v23 = &v24;
  id v12 = v9;
  id v13 = v7;
  id v14 = v10;
  id v15 = v6;
  dispatch_sync(v11, block);
  id v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (id)appActivationPublisherForEventsFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[_APRSBiomeBase publisherForEventsStartingFromDate:]( &OBJC_CLASS____APRSBiomeAppLaunchTimeEvent,  "publisherForEventsStartingFromDate:",  v3));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 filterWithIsIncluded:&stru_100115C30]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 reduceWithInitial:v4 nextPartialResult:&stru_100115C70]);

  return v7;
}

- (id)allAppKillsInfo
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -1814400.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[_APRSBiomeEventAnalyzer appKillsInfoStartingAtDate:withBookmarkKey:]( self,  "appKillsInfoStartingAtDate:withBookmarkKey:",  v3,  @"appKillBookmark"));

  return v4;
}

- (id)appKillsInfoStartingAtDate:(id)a3 withBookmarkKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)os_transaction_create("com.apple.dasd.appResumeAllAppKillInfoCalculations");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"App Kill Metrics - Info calculation - start date: %@",  v6));
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_10003C180;
  v28 = sub_10003C190;
  id v29 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bookmarkDictionary,  "objectForKeyedSubscript:",  v7));
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[_APRSBiomeBase sharedEventQueue](&OBJC_CLASS____APRSBiomeBase, "sharedEventQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003CBD0;
  block[3] = &unk_100115BF0;
  block[4] = self;
  id v19 = v6;
  id v20 = v10;
  id v21 = v7;
  id v22 = v9;
  v23 = &v24;
  id v12 = v9;
  id v13 = v7;
  id v14 = v10;
  id v15 = v6;
  dispatch_sync(v11, block);
  id v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (id)appKillsInfoPublisherForEventsFrom:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[_APRSBiomeBase publisherForEventsStartingFromDate:]( &OBJC_CLASS____APRSBiomeAppKillEvent,  "publisherForEventsStartingFromDate:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 filterWithIsIncluded:&stru_100115CD0]);
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 reduceWithInitial:v5 nextPartialResult:&stru_100115CF0]);

  return v6;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableDictionary)bookmarkDictionary
{
  return self->_bookmarkDictionary;
}

- (void)setBookmarkDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end