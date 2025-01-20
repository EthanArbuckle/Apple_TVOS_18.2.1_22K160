@interface _DASTimer
+ (_DASTimer)timerWithCallback:(id)a3;
- (NSDictionary)previousWakeRequestDictionary;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (_DASTimer)initWithCallback:(id)a3;
- (id)callback;
- (void)cancelPreviousWakeRequest;
- (void)requestSystemWakeOBehalfOf:(id)a3 at:(id)a4 withLeeway:(double)a5;
- (void)requestSystemWakeOnBehalfOf:(id)a3 at:(id)a4 withLeeway:(double)a5 cancelPrevious:(BOOL)a6;
- (void)scheduleOnBehalfOf:(id)a3 between:(double)a4 and:(double)a5 waking:(BOOL)a6;
- (void)setCallback:(id)a3;
- (void)setPreviousWakeRequestDictionary:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation _DASTimer

- (_DASTimer)initWithCallback:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____DASTimer;
  id v5 = -[_DASTimer init](&v19, "init");
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.das.dastimerqueue", v9);
    v11 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v10;

    dispatch_source_t v12 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)v5 + 2));
    v13 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v12;

    dispatch_set_qos_class_fallback(*((void *)v5 + 3), 17LL);
    dispatch_source_set_timer( *((dispatch_source_t *)v5 + 3),  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL);
    objc_initWeak(&location, v5);
    v14 = (dispatch_source_s *)*((void *)v5 + 3);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001E400;
    v16[3] = &unk_100114FB8;
    objc_copyWeak(&v17, &location);
    dispatch_source_set_event_handler(v14, v16);
    dispatch_resume(*((dispatch_object_t *)v5 + 3));
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return (_DASTimer *)v5;
}

+ (_DASTimer)timerWithCallback:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithCallback:v4];

  return (_DASTimer *)v5;
}

- (void)cancelPreviousWakeRequest
{
  time_to_wake = (const __CFDate *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_previousWakeRequestDictionary,  "objectForKeyedSubscript:",  @"time"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_previousWakeRequestDictionary,  "objectForKeyedSubscript:",  @"scheduledby"));
  if (time_to_wake) {
    BOOL v4 = v3 == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    IOPMCancelScheduledPowerEvent(time_to_wake, v3, @"wake");
  }
}

- (void)requestSystemWakeOBehalfOf:(id)a3 at:(id)a4 withLeeway:(double)a5
{
}

- (void)requestSystemWakeOnBehalfOf:(id)a3 at:(id)a4 withLeeway:(double)a5 cancelPrevious:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  dispatch_source_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v12 setObject:v11 forKeyedSubscript:@"time"];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", (uint64_t)a5));
  [v12 setObject:v13 forKeyedSubscript:@"leeway"];

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  _DASDaemonServiceName,  v10));
  [v12 setObject:v14 forKeyedSubscript:@"scheduledby"];

  if (v6)
  {
    -[_DASTimer cancelPreviousWakeRequest](self, "cancelPreviousWakeRequest");
    v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v12));
    previousWakeRequestDictionary = self->_previousWakeRequestDictionary;
    self->_previousWakeRequestDictionary = v15;
  }

  if (IOPMRequestSysWake(v12))
  {
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to request system wake for %@",  buf,  0xCu);
    }
  }
}

- (void)scheduleOnBehalfOf:(id)a3 between:(double)a4 and:(double)a5 waking:(BOOL)a6
{
  BOOL v6 = a6;
  id v15 = a3;
  dispatch_suspend((dispatch_object_t)self->_timer);
  double v10 = a5 - a4;
  if (v6)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  a4 + 10.0));
    -[_DASTimer requestSystemWakeOnBehalfOf:at:withLeeway:cancelPrevious:]( self,  "requestSystemWakeOnBehalfOf:at:withLeeway:cancelPrevious:",  v15,  v11,  1LL,  v10 + -10.0);

    unint64_t v12 = 10LL;
  }

  else
  {
    unint64_t v12 = (unint64_t)fmax(v10, 1.0);
  }

  timer = self->_timer;
  dispatch_time_t v14 = dispatch_walltime(0LL, (uint64_t)(a4 * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)timer, v14, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * v12);
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
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

- (NSDictionary)previousWakeRequestDictionary
{
  return self->_previousWakeRequestDictionary;
}

- (void)setPreviousWakeRequestDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end