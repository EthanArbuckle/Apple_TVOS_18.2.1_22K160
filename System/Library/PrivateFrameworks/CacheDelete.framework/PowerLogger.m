@interface PowerLogger
+ (id)sharedLogger;
- (NSMutableArray)events;
- (OS_dispatch_queue)queue;
- (PowerLogger)init;
- (void)flush;
- (void)logCacheDuetEvent:(unint64_t)a3 urgencyLevel:(int)a4 serviceName:(id)a5 startFromUptime:(double)a6 duration:(double)a7;
- (void)logCacheDuetEvent:(unint64_t)a3 urgencyLevel:(int)a4 serviceName:(id)a5 startFromUptime:(double)a6 duration:(double)a7 purgedBytes:(unint64_t)a8;
- (void)logCacheDuetEvent:(unint64_t)a3 urgencyLevel:(int)a4 serviceName:(id)a5 startFromUptime:(double)a6 duration:(double)a7 requestedBytes:(unint64_t)a8 purgedBytes:(unint64_t)a9;
- (void)setEvents:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation PowerLogger

- (PowerLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PowerLogger;
  v2 = -[PowerLogger init](&v7, "init");
  if (v2 && init_fp)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[PowerLogger setEvents:](v2, "setEvents:", v3);

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.cache_delete.PowerLogger", 0LL);
    -[PowerLogger setQueue:](v2, "setQueue:", v4);

    v5 = v2;
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

+ (id)sharedLogger
{
  if (_MergedGlobals_14 != -1) {
    dispatch_once(&_MergedGlobals_14, &__block_literal_global_7);
  }
  return (id)qword_100066828;
}

void __27__PowerLogger_sharedLogger__block_invoke(id a1)
{
  v1 = objc_opt_new(&OBJC_CLASS___PowerLogger);
  v2 = (void *)qword_100066828;
  qword_100066828 = (uint64_t)v1;
}

- (void)logCacheDuetEvent:(unint64_t)a3 urgencyLevel:(int)a4 serviceName:(id)a5 startFromUptime:(double)a6 duration:(double)a7
{
}

- (void)logCacheDuetEvent:(unint64_t)a3 urgencyLevel:(int)a4 serviceName:(id)a5 startFromUptime:(double)a6 duration:(double)a7 purgedBytes:(unint64_t)a8
{
}

- (void)logCacheDuetEvent:(unint64_t)a3 urgencyLevel:(int)a4 serviceName:(id)a5 startFromUptime:(double)a6 duration:(double)a7 requestedBytes:(unint64_t)a8 purgedBytes:(unint64_t)a9
{
  id v16 = a5;
  v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PowerLogger queue](self, "queue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = __110__PowerLogger_logCacheDuetEvent_urgencyLevel_serviceName_startFromUptime_duration_requestedBytes_purgedBytes___block_invoke;
  v19[3] = &unk_100059EA0;
  v21 = self;
  unint64_t v22 = a3;
  int v27 = a4;
  double v23 = a6;
  double v24 = a7;
  unint64_t v25 = a8;
  unint64_t v26 = a9;
  id v20 = v16;
  id v18 = v16;
  dispatch_async(v17, v19);
}

void __110__PowerLogger_logCacheDuetEvent_urgencyLevel_serviceName_startFromUptime_duration_requestedBytes_purgedBytes___block_invoke( uint64_t a1)
{
  v12[0] = @"operationType";
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
  v13[0] = v2;
  v12[1] = @"urgencyLevel";
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 88)));
  dispatch_queue_t v4 = (void *)v3;
  v5 = *(const __CFString **)(a1 + 32);
  if (!v5) {
    v5 = &stru_10005BF88;
  }
  v13[1] = v3;
  v13[2] = v5;
  v12[2] = @"serviceName";
  v12[3] = @"startFromUptime";
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 56)));
  v13[3] = v6;
  v12[4] = @"duration";
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 64)));
  v13[4] = v7;
  v12[5] = @"requestedBytes";
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 72)));
  v13[5] = v8;
  v12[6] = @"purgedBytes";
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 80)));
  v13[6] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  7LL));

  v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) events]);
  [v11 addObject:v10];
}

- (void)flush
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PowerLogger queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __20__PowerLogger_flush__block_invoke;
  block[3] = &unk_100058BB0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __20__PowerLogger_flush__block_invoke(uint64_t a1)
{
  v9[0] = @"timestamp";
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v2 timeIntervalSince1970];
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1000 * (uint64_t)v3));

  v9[1] = @"events";
  v10[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) events]);
  id v6 = [v5 copy];
  v10[1] = v6;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));

  v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) events]);
  [v8 removeAllObjects];

  PLLogRegisteredEvent(76LL, @"CacheDeleteEvents", v7, 0LL);
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end