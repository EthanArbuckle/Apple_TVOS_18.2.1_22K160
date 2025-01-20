@interface _DASBacklightStateMonitor
+ (id)sharedInstance;
- (OS_dispatch_queue)queue;
- (_DASBacklightStateMonitor)init;
- (void)setQueue:(id)a3;
@end

@implementation _DASBacklightStateMonitor

- (_DASBacklightStateMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASBacklightStateMonitor;
  v2 = -[_DASBacklightStateMonitor init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.duetactivityscheduler.backlightstatemonitor", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A3B1C;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157D38 != -1) {
    dispatch_once(&qword_100157D38, block);
  }
  return (id)qword_100157D40;
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