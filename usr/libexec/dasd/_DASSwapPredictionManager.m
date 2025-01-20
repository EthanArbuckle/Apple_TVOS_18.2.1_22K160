@interface _DASSwapPredictionManager
+ (id)sharedInstance;
- (NSDictionary)currentPredictions;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (_DASAppResumePLLogger)pLLogger;
- (_DASSwapModelAggregating)aggregator;
- (_DASSwapPredictionManager)initWithAlgorithms:(id)a3;
- (int)notifyToken;
- (void)setAggregator:(id)a3;
- (void)setCurrentPredictions:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setPLLogger:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)start;
- (void)stop;
- (void)updateScores;
- (void)updateSwapScoresWithDictionary:(id)a3;
@end

@implementation _DASSwapPredictionManager

- (_DASSwapPredictionManager)initWithAlgorithms:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS____DASSwapPredictionManager;
  id v5 = -[_DASSwapPredictionManager init](&v24, "init");
  if (v5)
  {
    v6 = -[_DASSwapModelCustomAggregator initWithAlgorithms:]( objc_alloc(&OBJC_CLASS____DASSwapModelCustomAggregator),  "initWithAlgorithms:",  v4);
    v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[_DASAppResumePLLogger sharedInstance](&OBJC_CLASS____DASAppResumePLLogger, "sharedInstance"));
    v9 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v8;

    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.dasd.smartswapqueue", v11);
    v13 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v12;

    dispatch_source_t v14 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)v5 + 4));
    v15 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v14;

    dispatch_set_qos_class_fallback(*((void *)v5 + 5), 17LL);
    v16 = (dispatch_source_s *)*((void *)v5 + 5);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10006DD60;
    handler[3] = &unk_1001150D0;
    v17 = (int *)v5;
    v23 = v17;
    dispatch_source_set_event_handler(v16, handler);
    v17[2] = -1;
    v18 = (dispatch_queue_s *)*((void *)v5 + 4);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10006DD94;
    v20[3] = &unk_100115388;
    v21 = v17;
    notify_register_dispatch("com.apple.dasd.updateswapscores", v17 + 2, v18, v20);
  }

  return (_DASSwapPredictionManager *)v5;
}

- (void)updateScores
{
  id v6 = (id)os_transaction_create("com.apple.dasd.smartswap.scoresUpdateTxn");
  -[_DASSwapModelAggregating updateScores](self->_aggregator, "updateScores");
  aggregator = self->_aggregator;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[_DASSwapModelAggregating scoresForAllApplicationsAtDate:]( aggregator,  "scoresForAllApplicationsAtDate:",  v4));
  -[_DASSwapPredictionManager updateSwapScoresWithDictionary:](self, "updateSwapScoresWithDictionary:", v5);
}

- (void)updateSwapScoresWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"swap"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating scores to %@", buf, 0xCu);
  }

  if ([v4 count])
  {
    v28 = self;
    id v6 = [v4 mutableCopy];
    [v6 setObject:&off_100121F78 forKeyedSubscript:@"MobileSafari"];
    id v27 = v6;
    id v7 = [v6 copy];

    v26[1] = v26;
    v26[0] = [v7 count];
    v29 = (char *)v26 - ((56LL * v26[0] + 15) & 0xFFFFFFFFFFFFFFF0LL);
    __int128 v36 = 0u;
    __int128 v35 = 0u;
    __int128 v34 = 0u;
    __int128 v33 = 0u;
    id v4 = v7;
    id v8 = [v4 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v8)
    {
      id v10 = v8;
      int v11 = 0;
      uint64_t v12 = *(void *)v34;
      v30 = v29 + 32;
      *(void *)&__int128 v9 = 138412546LL;
      __int128 v31 = v9;
      do
      {
        v13 = 0LL;
        uint64_t v32 = v11;
        dispatch_source_t v14 = &v30[56 * v11];
        do
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v4);
          }
          v15 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v13);
          *((_DWORD *)v14 - 8) = 1;
          id v16 = v15;
          snprintf(v14, 0x11uLL, "%s", (const char *)[v16 UTF8String]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v16]);
          [v17 doubleValue];
          BOOL v19 = v18 > 0.0;

          *((_DWORD *)v14 - 5) = v19;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v31;
            id v38 = v16;
            __int16 v39 = 1024;
            BOOL v40 = v19;
            _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ => %d", buf, 0x12u);
          }

          v13 = (char *)v13 + 1;
          v14 += 56;
        }

        while (v10 != v13);
        id v10 = [v4 countByEnumeratingWithState:&v33 objects:v41 count:16];
        int v11 = v32 + (_DWORD)v13;
      }

      while (v10);
    }

    int v20 = memorystatus_control(100LL, 0LL, 16LL, v29, 56LL * v26[0]);
    v21 = v28;
    if (v20)
    {
      int v22 = v20;
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"swap"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000B6CBC(v22, v23);
      }
    }

    uint64_t v24 = objc_claimAutoreleasedReturnValue( +[_DASAppResumePLLogger topPredictionsFromScores:]( &OBJC_CLASS____DASAppResumePLLogger,  "topPredictionsFromScores:",  v4));
    currentPredictions = v21->_currentPredictions;
    v21->_currentPredictions = (NSDictionary *)v24;
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No scores to update!", buf, 2u);
  }
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E2C4;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157BF8 != -1) {
    dispatch_once(&qword_100157BF8, block);
  }
  return (id)qword_100157BF0;
}

- (void)start
{
  timer = self->_timer;
  dispatch_time_t v4 = dispatch_walltime(0LL, 10000000000LL);
  dispatch_source_set_timer((dispatch_source_t)timer, v4, 0x1A3185C5000uLL, 0x45D964B800uLL);
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (void)stop
{
}

- (_DASSwapModelAggregating)aggregator
{
  return self->_aggregator;
}

- (void)setAggregator:(id)a3
{
}

- (_DASAppResumePLLogger)pLLogger
{
  return self->_pLLogger;
}

- (void)setPLLogger:(id)a3
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

- (NSDictionary)currentPredictions
{
  return self->_currentPredictions;
}

- (void)setCurrentPredictions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end