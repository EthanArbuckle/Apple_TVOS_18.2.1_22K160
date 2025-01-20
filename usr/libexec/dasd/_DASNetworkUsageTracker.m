@interface _DASNetworkUsageTracker
+ (id)sharedInstance;
- (NSMutableSet)startedActivites;
- (OS_os_log)log;
- (_DASBudgetModulator)modulator;
- (_DASNetworkUsageTracker)init;
- (void)setLog:(id)a3;
- (void)setModulator:(id)a3;
- (void)setStartedActivites:(id)a3;
@end

@implementation _DASNetworkUsageTracker

- (_DASNetworkUsageTracker)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASNetworkUsageTracker;
  v2 = -[_DASNetworkUsageTracker init](&v8, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "networkbudgeting");
    log = v2->_log;
    v2->_log = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    startedActivites = v2->_startedActivites;
    v2->_startedActivites = (NSMutableSet *)v5;
  }

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014A20;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157528 != -1) {
    dispatch_once(&qword_100157528, block);
  }
  return (id)qword_100157530;
}

- (_DASBudgetModulator)modulator
{
  return (_DASBudgetModulator *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setModulator:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableSet)startedActivites
{
  return self->_startedActivites;
}

- (void)setStartedActivites:(id)a3
{
}

- (void).cxx_destruct
{
}

@end