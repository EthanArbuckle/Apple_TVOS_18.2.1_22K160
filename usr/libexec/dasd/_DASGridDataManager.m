@interface _DASGridDataManager
+ (id)sharedInstance;
- (BOOL)isCarbonImpactHighForState:(id)a3;
- (BOOL)isHighCarbonImpactWindow;
- (NSDate)carbonImpactWindowEndDate;
- (NSDate)carbonImpactWindowFetchTime;
- (NSDate)carbonImpactWindowStartDate;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_CDContext)context;
- (_DASGridDataManager)init;
- (_OSChargingPredictor)pluggedInPredictor;
- (double)forecastCacheSeconds;
- (double)pluggedInPredictionInterval;
- (double)predictedPluggedInterval;
- (id)carbonImpactWindowStartForForecast:(id)a3 withStartDate:(id)a4 windowSize:(double)a5;
- (int)debugNotifyToken;
- (void)loadState;
- (void)monitorPluggedInState;
- (void)resetState;
- (void)saveCarbonImpactWindowState;
- (void)setCarbonImpactWindowEndDate:(id)a3;
- (void)setCarbonImpactWindowFetchTime:(id)a3;
- (void)setCarbonImpactWindowStartDate:(id)a3;
- (void)setContext:(id)a3;
- (void)setDebugNotifyToken:(int)a3;
- (void)setDefaults:(id)a3;
- (void)setForecastCacheSeconds:(double)a3;
- (void)setLog:(id)a3;
- (void)setPluggedInPredictionInterval:(double)a3;
- (void)setPluggedInPredictor:(id)a3;
- (void)setQueue:(id)a3;
- (void)updatePredictedInterval;
@end

@implementation _DASGridDataManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000280E8;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157628 != -1) {
    dispatch_once(&qword_100157628, block);
  }
  return (id)qword_100157630;
}

- (_DASGridDataManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS____DASGridDataManager;
  v2 = -[_DASGridDataManager init](&v22, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "GridDataManager");
    log = v2->_log;
    v2->_log = v3;

    v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
    defaults = v2->_defaults;
    v2->_defaults = v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.das.griddatamanager", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    v2->_forecastCacheSeconds = 14400.0;
    -[_DASGridDataManager loadState](v2, "loadState");
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
    context = v2->_context;
    v2->_context = (_CDContext *)v11;

    uint64_t v24 = 0LL;
    v25 = &v24;
    uint64_t v26 = 0x2050000000LL;
    v13 = (void *)qword_100157638;
    uint64_t v27 = qword_100157638;
    if (!qword_100157638)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_100029070;
      v23[3] = &unk_100115300;
      v23[4] = &v24;
      sub_100029070((uint64_t)v23);
      v13 = (void *)v25[3];
    }

    id v14 = v13;
    _Block_object_dispose(&v24, 8);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 predictor]);
    pluggedInPredictor = v2->_pluggedInPredictor;
    v2->_pluggedInPredictor = (_OSChargingPredictor *)v15;

    v2->_debugNotifyToken = -1;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100028320;
    v20[3] = &unk_100115388;
    v21 = v2;
    notify_register_dispatch("com.apple.dasd.testGridDataManager", &v2->_debugNotifyToken, v18, v20);
  }

  return v2;
}

- (void)monitorPluggedInState
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v3));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100028424;
  v6[3] = &unk_100115788;
  v6[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:]( &OBJC_CLASS____CDContextualChangeRegistration,  "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:",  @"com.apple.das.environmentpolicy.pluggedInState",  v4,  @"com.apple.dasd.contextstore-registration",  v6));

  -[_CDContext registerCallback:](self->_context, "registerCallback:", v5);
}

- (BOOL)isHighCarbonImpactWindow
{
  return -[_DASGridDataManager isCarbonImpactHighForState:](self, "isCarbonImpactHighForState:", self->_context);
}

- (BOOL)isCarbonImpactHighForState:(id)a3
{
  unsigned int v4 = +[_DASSystemContext isPluggedIn:](&OBJC_CLASS____DASSystemContext, "isPluggedIn:", a3);
  if (v4)
  {
    if (!self->_carbonImpactWindowStartDate
      || (-[NSDate timeIntervalSinceNow](self->_carbonImpactWindowFetchTime, "timeIntervalSinceNow"),
          v5 < -self->_forecastCacheSeconds))
    {
      double pluggedInPredictionInterval = self->_pluggedInPredictionInterval;
      if (pluggedInPredictionInterval == -99999.0)
      {
        -[_DASGridDataManager updatePredictedInterval](self, "updatePredictedInterval");
        double pluggedInPredictionInterval = self->_pluggedInPredictionInterval;
      }

      -[_DASGridDataManager setupHighCarbonImpactWindow:]( self,  "setupHighCarbonImpactWindow:",  pluggedInPredictionInterval);
    }

    -[NSDate timeIntervalSinceNow](self->_carbonImpactWindowStartDate, "timeIntervalSinceNow");
    LOBYTE(v4) = v7 < 0.0
              && (-[NSDate timeIntervalSinceNow](self->_carbonImpactWindowEndDate, "timeIntervalSinceNow"), v8 > 0.0);
  }

  return v4;
}

- (double)predictedPluggedInterval
{
  pluggedInPredictor = self->_pluggedInPredictor;
  id v18 = 0LL;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( -[_OSChargingPredictor chargePredictionOutputOfScheme:withError:]( pluggedInPredictor,  "chargePredictionOutputOfScheme:withError:",  0LL,  &v18));
  id v5 = v18;
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = log;
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
      *(_DWORD *)buf = 138412290;
      double v20 = *(double *)&v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Error querying the predictor through the client %@",  buf,  0xCu);
    }
  }

  [v4 confidence];
  double v10 = v9;
  [v4 chargingDuration];
  double v12 = v11;
  v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v20 = v12;
    __int16 v21 = 2048;
    double v22 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "OSIntelligence predicts Interval:%lf, Confidence:%lf",  buf,  0x16u);
  }

  BOOL v14 = v10 < 0.75;
  double v15 = 0.0;
  if (v14) {
    double v16 = 0.0;
  }
  else {
    double v16 = v12;
  }
  if (v16 >= 7200.0)
  {
    double v15 = v16;
    if (v16 > 27000.0) {
      double v15 = 27000.0;
    }
  }

  return v15;
}

- (id)carbonImpactWindowStartForForecast:(id)a3 withStartDate:(id)a4 windowSize:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    id v10 = [v8 mutableCopy];
    [v10 sortUsingComparator:&stru_1001157A8];
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
    [v11 doubleValue];
    double v13 = v12;
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v10 lastObject]);
    [v14 doubleValue];
    double v16 = vabdd_f64(v13, v15);

    if (v16 >= 100.0)
    {
      unint64_t v25 = (unint64_t)fmax(floor(a5 / 900.0) + -1.0, 0.0);
      if ((unint64_t)[v8 count] >= v25)
      {
        id v44 = v10;
        id v45 = v9;
        v43 = self;
        uint64_t v26 = 0LL;
        if (v25)
        {
          for (uint64_t i = 0LL; i != v25; ++i)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:i]);
            uint64_t v26 = &v26[(void)[v28 unsignedIntegerValue]];
          }
        }

        if ((unint64_t)[v8 count] <= v25
          || (v29 = (char *)[v8 count], v30 = &v29[-v25], v29 == (char *)v25))
        {
          unint64_t v31 = 0LL;
        }

        else
        {
          v32 = 0LL;
          unint64_t v31 = 0LL;
          v33 = 0LL;
          do
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:&v33[v25]]);
            v35 = &v26[(void)[v34 unsignedIntegerValue]];

            if (v35 >= v32) {
              unint64_t v31 = (unint64_t)v33;
            }
            if (v35 > v32) {
              v32 = v35;
            }
            v36 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v33]);
            int64_t v37 = v26 - (_BYTE *)[v36 unsignedIntegerValue];

            v38 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:&v33[v25]]);
            uint64_t v26 = (char *)[v38 unsignedIntegerValue] + v37;

            ++v33;
          }

          while (v30 != v33);
        }

        log = v43->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          v40 = log;
          v41 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v31]);
          *(_DWORD *)buf = 134218242;
          unint64_t v47 = v31;
          __int16 v48 = 2112;
          v49 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "HighCarbonImpact startIndex %lu, startValue %@",  buf,  0x16u);
        }

        id v9 = v45;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v45,  (double)v31 * 900.0));
        id v10 = v44;
      }

      else
      {
        uint64_t v24 = 0LL;
      }
    }

    else
    {
      v17 = self->_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
        [v19 doubleValue];
        unint64_t v21 = v20;
        double v22 = (void *)objc_claimAutoreleasedReturnValue([v10 lastObject]);
        [v22 doubleValue];
        *(_DWORD *)buf = 134218240;
        unint64_t v47 = v21;
        __int16 v48 = 2048;
        v49 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Not enough variation in forecast values (%lf - %lf). Bailing",  buf,  0x16u);
      }

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    }
  }

  else
  {
    uint64_t v24 = 0LL;
  }

  return v24;
}

- (void)resetState
{
  self->_double pluggedInPredictionInterval = -99999.0;
  carbonImpactWindowStartDate = self->_carbonImpactWindowStartDate;
  self->_carbonImpactWindowStartDate = 0LL;

  carbonImpactWindowEndDate = self->_carbonImpactWindowEndDate;
  self->_carbonImpactWindowEndDate = 0LL;

  carbonImpactWindowFetchTime = self->_carbonImpactWindowFetchTime;
  self->_carbonImpactWindowFetchTime = 0LL;

  self->_forecastCacheSeconds = 14400.0;
}

- (void)loadState
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", @"pluggedInPredictionInterval"));
  unsigned int v4 = v3;
  if (v3) {
    [v3 doubleValue];
  }
  else {
    double v5 = -99999.0;
  }
  self->_double pluggedInPredictionInterval = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self->_defaults,  "objectForKey:",  @"carbonImpactStartDateInterval"));

  if (v6)
  {
    [v6 doubleValue];
    double v7 = (NSDate *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    carbonImpactWindowStartDate = self->_carbonImpactWindowStartDate;
    self->_carbonImpactWindowStartDate = v7;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", @"carbonImpactEndDateInterval"));

  if (v9)
  {
    [v9 doubleValue];
    id v10 = (NSDate *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    carbonImpactWindowEndDate = self->_carbonImpactWindowEndDate;
    self->_carbonImpactWindowEndDate = v10;
  }

  double v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self->_defaults,  "objectForKey:",  @"carbonImpactFetchDateInterval"));

  if (v12)
  {
    [v12 doubleValue];
    double v13 = (NSDate *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    carbonImpactWindowFetchTime = self->_carbonImpactWindowFetchTime;
    self->_carbonImpactWindowFetchTime = v13;
  }

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", @"forecastCacheInterval"));

  if (v15)
  {
    [v15 doubleValue];
    self->_double forecastCacheSeconds = fmax(v16, 14400.0);
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v19 = self->_carbonImpactWindowEndDate;
    double pluggedInPredictionInterval = self->_pluggedInPredictionInterval;
    unint64_t v20 = self->_carbonImpactWindowFetchTime;
    double forecastCacheSeconds = self->_forecastCacheSeconds;
    unint64_t v21 = self->_carbonImpactWindowStartDate;
    int v23 = 134219010;
    double v24 = pluggedInPredictionInterval;
    __int16 v25 = 2112;
    uint64_t v26 = v21;
    __int16 v27 = 2112;
    v28 = v19;
    __int16 v29 = 2112;
    v30 = v20;
    __int16 v31 = 2048;
    double v32 = forecastCacheSeconds;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Loaded state: PluggedIn interval %lf, carbonImpactStart %@, carbonImpactEnd %@, FetchDate %@, Forecast Cache internal %f",  (uint8_t *)&v23,  0x34u);
  }
}

- (void)updatePredictedInterval
{
  self->_double pluggedInPredictionInterval = v3;
  -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", @"pluggedInPredictionInterval");
}

- (void)saveCarbonImpactWindowState
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int)debugNotifyToken
{
  return self->_debugNotifyToken;
}

- (void)setDebugNotifyToken:(int)a3
{
  self->_debugNotifyToken = a3;
}

- (NSDate)carbonImpactWindowFetchTime
{
  return self->_carbonImpactWindowFetchTime;
}

- (void)setCarbonImpactWindowFetchTime:(id)a3
{
}

- (_OSChargingPredictor)pluggedInPredictor
{
  return self->_pluggedInPredictor;
}

- (void)setPluggedInPredictor:(id)a3
{
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

- (double)forecastCacheSeconds
{
  return self->_forecastCacheSeconds;
}

- (void)setForecastCacheSeconds:(double)a3
{
  self->_double forecastCacheSeconds = a3;
}

- (NSDate)carbonImpactWindowStartDate
{
  return self->_carbonImpactWindowStartDate;
}

- (void)setCarbonImpactWindowStartDate:(id)a3
{
}

- (NSDate)carbonImpactWindowEndDate
{
  return self->_carbonImpactWindowEndDate;
}

- (void)setCarbonImpactWindowEndDate:(id)a3
{
}

- (double)pluggedInPredictionInterval
{
  return self->_pluggedInPredictionInterval;
}

- (void)setPluggedInPredictionInterval:(double)a3
{
  self->_double pluggedInPredictionInterval = a3;
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end