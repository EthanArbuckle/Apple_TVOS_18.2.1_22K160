@interface _DASSwapModelApplicationKills
+ (id)histogramEventStream;
- (BOOL)process:(id)a3 inSet:(id)a4;
- (NSDate)lastSnapshotTime;
- (NSDictionary)historicalKillHistogram;
- (NSMutableDictionary)todaysKillHistogram;
- (NSMutableSet)zerosSet;
- (NSUserDefaults)killDefaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASAppResumePLLogger)pLLogger;
- (_DASSwapModelApplicationKills)init;
- (double)scoreForApplication:(id)a3 atDate:(id)a4;
- (double)secondsFrom:(unint64_t)a3 until:(unint64_t)a4;
- (id)_queue_computeScores;
- (id)appsRecentlyForegrounded;
- (id)queryForHistogramWithIdentifier:(id)a3;
- (id)scoresForAllApplicationsAtDate:(id)a3;
- (void)_queue_loadHistograms;
- (void)_queue_updateHistograms;
- (void)incorporateLatestJetsamStatistics;
- (void)registerDailyModelUpdateTask;
- (void)setHistoricalKillHistogram:(id)a3;
- (void)setKillDefaults:(id)a3;
- (void)setLastSnapshotTime:(id)a3;
- (void)setLog:(id)a3;
- (void)setPLLogger:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTodaysKillHistogram:(id)a3;
- (void)setZerosSet:(id)a3;
- (void)updateModel;
- (void)updateScores;
@end

@implementation _DASSwapModelApplicationKills

- (_DASSwapModelApplicationKills)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS____DASSwapModelApplicationKills;
  v2 = -[_DASSwapModelApplicationKills init](&v20, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.dasd.swap.appKillsModel", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"swap.appKillsModel"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v9;

    v11 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.dasd.swapkills");
    killDefaults = v2->_killDefaults;
    v2->_killDefaults = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[_DASAppResumePLLogger sharedInstance](&OBJC_CLASS____DASAppResumePLLogger, "sharedInstance"));
    pLLogger = v2->_pLLogger;
    v2->_pLLogger = (_DASAppResumePLLogger *)v13;

    v15 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100072F30;
    block[3] = &unk_1001150D0;
    v16 = v2;
    v19 = v16;
    dispatch_async(v15, block);
    -[_DASSwapModelApplicationKills registerDailyModelUpdateTask](v16, "registerDailyModelUpdateTask");
  }

  return v2;
}

+ (id)histogramEventStream
{
  return +[_DKEventStream eventStreamWithName:]( &OBJC_CLASS____DKEventStream,  "eventStreamWithName:",  @"com.apple.dasd.jetsams");
}

- (id)queryForHistogramWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASSwapModelApplicationKills histogramEventStream]( &OBJC_CLASS____DASSwapModelApplicationKills,  "histogramEventStream"));
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DKHistogramQuery histogramQueryForPersistedHistogramsForStream:withCustomIdentifier:]( &OBJC_CLASS____DKHistogramQuery,  "histogramQueryForPersistedHistogramsForStream:withCustomIdentifier:",  v4,  v3));

  return v5;
}

- (void)_queue_loadHistograms
{
  context = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](self->_killDefaults, "dictionaryForKey:", @"histograms"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"current"]);
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"historical"]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"zeros"]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"snapshotTS"]);
  v8 = (void *)v7;
  if (!v4) {
    v4 = &__NSDictionary0__struct;
  }
  if (!v5) {
    dispatch_queue_attr_t v5 = &__NSDictionary0__struct;
  }
  if (!v6) {
    v6 = &__NSArray0__struct;
  }
  if (!v7) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  }
  uint64_t v9 = (NSMutableDictionary *)[v4 mutableCopy];
  todaysKillHistogram = self->_todaysKillHistogram;
  self->_todaysKillHistogram = v9;

  p_historicalKillHistogram = &self->_historicalKillHistogram;
  objc_storeStrong((id *)&self->_historicalKillHistogram, v5);
  v12 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v6));
  zerosSet = self->_zerosSet;
  self->_zerosSet = v12;

  objc_storeStrong((id *)&self->_lastSnapshotTime, v8);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    lastSnapshotTime = self->_lastSnapshotTime;
    *(_DWORD *)buf = 138412290;
    v22 = lastSnapshotTime;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Last snapshot: %@", buf, 0xCu);
  }

  v16 = self->_log;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_todaysKillHistogram;
    *(_DWORD *)buf = 138412290;
    v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Loaded current histogram: %@", buf, 0xCu);
  }

  v18 = self->_log;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *p_historicalKillHistogram;
    *(_DWORD *)buf = 138412290;
    v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Loaded historical histogram: %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_queue_updateHistograms
{
  id v3 = objc_autoreleasePoolPush();
  v8[0] = @"current";
  v8[1] = @"historical";
  historicalKillHistogram = self->_historicalKillHistogram;
  v9[0] = self->_todaysKillHistogram;
  v9[1] = historicalKillHistogram;
  v8[2] = @"zeros";
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_zerosSet, "allObjects"));
  v8[3] = @"snapshotTS";
  lastSnapshotTime = self->_lastSnapshotTime;
  v9[2] = v5;
  v9[3] = lastSnapshotTime;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  4LL));

  -[NSUserDefaults setObject:forKey:](self->_killDefaults, "setObject:forKey:", v7, @"histograms");
  objc_autoreleasePoolPop(v3);
}

- (id)_queue_computeScores
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  historicalKillHistogram = self->_historicalKillHistogram;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10007344C;
  v17[3] = &unk_100116660;
  v17[4] = self;
  id v5 = v3;
  id v18 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](historicalKillHistogram, "enumerateKeysAndObjectsUsingBlock:", v17);
  todaysKillHistogram = self->_todaysKillHistogram;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100073514;
  v15[3] = &unk_100115070;
  id v7 = v5;
  id v16 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( todaysKillHistogram,  "enumerateKeysAndObjectsUsingBlock:",  v15);
  zerosSet = self->_zerosSet;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100073588;
  v13[3] = &unk_100116B78;
  id v9 = v7;
  id v14 = v9;
  -[NSMutableSet enumerateObjectsUsingBlock:](zerosSet, "enumerateObjectsUsingBlock:", v13);
  v10 = v14;
  id v11 = v9;

  return v11;
}

- (void)updateModel
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100073640;
  block[3] = &unk_1001150D0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)registerDailyModelUpdateTask
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000738D8;
  v12[3] = &unk_100115B50;
  v12[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.swapModelUpdate" usingQueue:0 launchHandler:v12];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 taskRequestForIdentifier:@"com.apple.dasd.swapModelUpdate"]);

  if (!v5)
  {
    id v6 = [[BGRepeatingSystemTaskRequest alloc] initWithIdentifier:@"com.apple.dasd.swapModelUpdate"];
    [v6 setPriority:1];
    [v6 setRequiresExternalPower:0];
    [v6 setInterval:86400.0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
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

- (double)secondsFrom:(unint64_t)a3 until:(unint64_t)a4
{
  if (qword_100157C18 != -1) {
    dispatch_once(&qword_100157C18, &stru_100116B98);
  }
  return (double)((uint64_t)((a3 - a4) * dword_100157C10) / *(unsigned int *)algn_100157C14) / 1000000000.0;
}

- (id)appsRecentlyForegrounded
{
  return +[NSSet set](&OBJC_CLASS___NSSet, "set");
}

- (BOOL)process:(id)a3 inSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 length] > 0x1F)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)i),  "hasPrefix:",  v5,  (void)v14))
          {

            unsigned __int8 v7 = 1;
            goto LABEL_13;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    unsigned __int8 v7 = 0;
  }

  else
  {
    unsigned __int8 v7 = [v6 containsObject:v5];
  }

- (void)incorporateLatestJetsamStatistics
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelApplicationKills appsRecentlyForegrounded](self, "appsRecentlyForegrounded"));
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100073B68;
  block[3] = &unk_100115148;
  void block[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(queue, block);
}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[_DASSwapModelApplicationKills scoresForAllApplicationsAtDate:]( self,  "scoresForAllApplicationsAtDate:",  a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

  [v8 doubleValue];
  double v10 = v9;

  return v10;
}

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary", a3));
  queue = (dispatch_queue_s *)self->_queue;
  double v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_100074254;
  uint64_t v13 = &unk_100115148;
  __int128 v14 = self;
  id v6 = v4;
  id v15 = v6;
  dispatch_sync(queue, &v10);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Updating Kill Count: %@", buf, 0xCu);
  }

  id v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13, v14);

  return v8;
}

- (void)updateScores
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)todaysKillHistogram
{
  return self->_todaysKillHistogram;
}

- (void)setTodaysKillHistogram:(id)a3
{
}

- (NSDictionary)historicalKillHistogram
{
  return self->_historicalKillHistogram;
}

- (void)setHistoricalKillHistogram:(id)a3
{
}

- (NSMutableSet)zerosSet
{
  return self->_zerosSet;
}

- (void)setZerosSet:(id)a3
{
}

- (_DASAppResumePLLogger)pLLogger
{
  return self->_pLLogger;
}

- (void)setPLLogger:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSDate)lastSnapshotTime
{
  return self->_lastSnapshotTime;
}

- (void)setLastSnapshotTime:(id)a3
{
}

- (NSUserDefaults)killDefaults
{
  return self->_killDefaults;
}

- (void)setKillDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end