@interface _DASActivityDurationTracker
+ (BOOL)shouldTrackActivity:(id)a3;
+ (id)sharedInstance;
- (BOOL)activityHadEnoughRuntime:(id)a3;
- (NSArray)dayToDurationsList;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (OS_os_log)log;
- (_DASActivityDurationTracker)init;
- (double)runtimeForActivity:(id)a3 inLastNumDays:(unint64_t)a4;
- (id)description;
- (int)notifyToken;
- (void)activityCanceled:(id)a3;
- (void)activityCompleted:(id)a3;
- (void)addTimeInterval:(double)a3 forActivity:(id)a4;
- (void)deleteOldDurations;
- (void)loadState;
- (void)saveState;
- (void)setDayToDurationsList:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setLog:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation _DASActivityDurationTracker

- (_DASActivityDurationTracker)init
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS____DASActivityDurationTracker;
  id v2 = -[_DASActivityDurationTracker init](&v28, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.dasd.activityDurationManager", v4);
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"activityDurationTracker"));
    v8 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v7;

    v9 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.dasd.activityDurationTracker");
    v10 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v9;

    dispatch_source_t v11 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)v2 + 2));
    v12 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v11;

    v13 = (dispatch_source_s *)*((void *)v2 + 3);
    dispatch_time_t v14 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 86400000000000LL);
    dispatch_source_set_timer(v13, v14, 0x4E94914F0000uLL, 0xD18C2E2800uLL);
    v15 = (dispatch_source_s *)*((void *)v2 + 3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000AF76C;
    handler[3] = &unk_1001150D0;
    v16 = (int *)v2;
    v27 = v16;
    dispatch_source_set_event_handler(v15, handler);
    dispatch_activate(*((dispatch_object_t *)v2 + 3));
    v16[2] = 0;
    v17 = v16 + 2;
    v18 = (dispatch_queue_s *)*((void *)v2 + 2);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000AF774;
    v24[3] = &unk_100115388;
    v19 = v16;
    v25 = v19;
    notify_register_dispatch("com.apple.dasd.testActivityDayDurationsDelete", v17, v18, v24);
    v20 = (dispatch_queue_s *)*((void *)v2 + 2);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000AF77C;
    v22[3] = &unk_100115388;
    v23 = v19;
    notify_register_dispatch("com.apple.dasd.testActivityDayDurationsLoad", v17, v20, v22);
  }

  return (_DASActivityDurationTracker *)v2;
}

+ (BOOL)shouldTrackActivity:(id)a3
{
  return [a3 isIntensive];
}

- (id)description
{
  return -[NSArray description](self->_dayToDurationsList, "description");
}

- (void)loadState
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:",  @"/var/mobile/Library/DuetActivityScheduler/activityDayDurations.data"));
  if (v3)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v5 = objc_opt_class(&OBJC_CLASS____DASActivityDayToDurations);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
    v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  v5,  v6,  v7,  v8,  objc_opt_class(&OBJC_CLASS___NSDate),  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v25 = 0LL;
    dispatch_source_t v11 = (NSArray *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v10,  v3,  &v25));
    id v12 = v25;
    dayToDurationsList = self->_dayToDurationsList;
    self->_dayToDurationsList = v11;

    if (v12)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        sub_1000B9604((uint64_t)v12, log, v15, v16, v17, v18, v19, v20);
      }
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v22 = self->_dayToDurationsList;
      self->_dayToDurationsList = v21;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  v23 = self->_log;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = self->_dayToDurationsList;
    *(_DWORD *)buf = 138412290;
    v27 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Loaded day to durations data %@", buf, 0xCu);
  }
}

- (void)saveState
{
  dayToDurationsList = self->_dayToDurationsList;
  id v15 = 0LL;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  dayToDurationsList,  1LL,  &v15));
  id v5 = v15;
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_1000B966C((uint64_t)v5, log, v7, v8, v9, v10, v11, v12);
    }
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    dispatch_time_t v14 = self->_dayToDurationsList;
    self->_dayToDurationsList = v13;
  }

  [v4 writeToFile:@"/var/mobile/Library/DuetActivityScheduler/activityDayDurations.data" atomically:1];
}

- (void)deleteOldDurations
{
  dispatch_queue_attr_t v3 = (NSArray *)-[NSArray mutableCopy](self->_dayToDurationsList, "mutableCopy");
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
  if (-[NSArray count](v3, "count"))
  {
    unint64_t v4 = 0LL;
    do
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", v4));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 date]);
      [v6 timeIntervalSinceNow];
      unint64_t v8 = (uint64_t)v7;

      if (v8 <= 0xFFFFFFFFFFF573FFLL) {
        [v10 addIndex:v4];
      }
      ++v4;
    }

    while (v4 < -[NSArray count](v3, "count"));
  }

  -[NSArray removeObjectsAtIndexes:](v3, "removeObjectsAtIndexes:", v10);
  dayToDurationsList = self->_dayToDurationsList;
  self->_dayToDurationsList = v3;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AFB98;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157DC8 != -1) {
    dispatch_once(&qword_100157DC8, block);
  }
  return (id)qword_100157DD0;
}

- (void)addTimeInterval:(double)a3 forActivity:(id)a4
{
  id v25 = (id)objc_claimAutoreleasedReturnValue([a4 name]);
  dayToDurationsList = self->_dayToDurationsList;
  if (!dayToDurationsList)
  {
    -[_DASActivityDurationTracker loadState](self, "loadState");
    dayToDurationsList = self->_dayToDurationsList;
  }

  id v7 = -[NSArray mutableCopy](dayToDurationsList, "mutableCopy");
  if (!v7) {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  }
  unint64_t v8 = (_DASActivityDayToDurations *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
  if (!v8) {
    goto LABEL_8;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityDayToDurations date](v8, "date"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unsigned __int8 v12 = [v9 isDate:v10 inSameDayAsDate:v11];

  if ((v12 & 1) == 0)
  {
    -[_DASActivityDurationTracker deleteOldDurations](self, "deleteOldDurations");
    id v13 = -[NSArray mutableCopy](self->_dayToDurationsList, "mutableCopy");

    id v7 = v13;
LABEL_8:
    dispatch_time_t v14 = objc_alloc(&OBJC_CLASS____DASActivityDayToDurations);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v17 = -[_DASActivityDayToDurations initWithDate:activityDurations:]( v14,  "initWithDate:activityDurations:",  v15,  v16);

    [v7 addObject:v17];
    unint64_t v8 = v17;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityDayToDurations activityDurations](v8, "activityDurations"));
  id v19 = [v18 mutableCopy];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v25]);
  [v20 doubleValue];
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", (uint64_t)(v21 + a3)));
  [v19 setObject:v22 forKeyedSubscript:v25];

  -[_DASActivityDayToDurations setActivityDurations:](v8, "setActivityDurations:", v19);
  v23 = (NSArray *)[v7 copy];
  v24 = self->_dayToDurationsList;
  self->_dayToDurationsList = v23;

  -[_DASActivityDurationTracker saveState](self, "saveState");
}

- (void)activityCanceled:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AFE58;
  block[3] = &unk_100115148;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)activityCompleted:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AFF44;
  block[3] = &unk_100115148;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (double)runtimeForActivity:(id)a3 inLastNumDays:(unint64_t)a4
{
  id v5 = a3;
  dayToDurationsList = self->_dayToDurationsList;
  double v7 = 0.0;
  if (dayToDurationsList)
  {
    if (-[NSArray count](dayToDurationsList, "count"))
    {
      -[NSArray count](self->_dayToDurationsList, "count");
      if (-[NSArray count](self->_dayToDurationsList, "count"))
      {
        unint64_t v8 = 0LL;
        do
        {
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_dayToDurationsList,  "objectAtIndexedSubscript:",  v8));
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activityDurations]);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
          unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);

          if (v12)
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 activityDurations]);
            dispatch_time_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);
            [v15 doubleValue];
            double v17 = v16;

            double v7 = v7 + v17;
          }

          ++v8;
        }

        while (v8 < -[NSArray count](self->_dayToDurationsList, "count"));
      }
    }
  }

  return v7;
}

- (BOOL)activityHadEnoughRuntime:(id)a3
{
  return v3 >= 18000.0;
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

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
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

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSArray)dayToDurationsList
{
  return self->_dayToDurationsList;
}

- (void)setDayToDurationsList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end