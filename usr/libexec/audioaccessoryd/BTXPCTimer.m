@interface BTXPCTimer
- (BOOL)isActive;
- (BTXPCTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8;
- (BTXPCTimer)initWithName:(id)a3 date:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7;
- (BTXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8;
- (BTXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7;
- (NSDate)date;
- (NSString)name;
- (OS_xpc_object)activity;
- (OS_xpc_object)duetActivitySchedulerData;
- (double)gracePeriod;
- (id)activityHandler;
- (id)block;
- (id)criteria;
- (int64_t)priority;
- (unint64_t)options;
- (void)handleActivity;
- (void)invalidate;
- (void)setActivity:(id)a3;
- (void)setBlock:(id)a3;
- (void)setDate:(id)a3;
- (void)setDuetActivitySchedulerData:(id)a3;
- (void)setGracePeriod:(double)a3;
- (void)setName:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation BTXPCTimer

- (BTXPCTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___BTXPCTimer;
  v17 = -[BTXPCTimer init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    -[BTXPCTimer setName:](v17, "setName:", v14);
    -[BTXPCTimer setDate:](v18, "setDate:", v15);
    -[BTXPCTimer setGracePeriod:](v18, "setGracePeriod:", a5);
    -[BTXPCTimer setPriority:](v18, "setPriority:", a6);
    -[BTXPCTimer setOptions:](v18, "setOptions:", a7);
    -[BTXPCTimer setBlock:](v18, "setBlock:", v16);
    -[BTXPCTimer handleActivity](v18, "handleActivity");
  }

  return v18;
}

- (BTXPCTimer)initWithName:(id)a3 date:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  return -[BTXPCTimer initWithName:date:gracePeriod:priority:options:block:]( self,  "initWithName:date:gracePeriod:priority:options:block:",  a3,  a4,  a5,  a6,  a7,  0.0);
}

- (BTXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  id v14 = a8;
  id v15 = a3;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a4));
  v17 = -[BTXPCTimer initWithName:date:gracePeriod:priority:options:block:]( self,  "initWithName:date:gracePeriod:priority:options:block:",  v15,  v16,  a6,  a7,  v14,  a5);

  return v17;
}

- (BTXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a4));
  id v15 = -[BTXPCTimer initWithName:date:gracePeriod:priority:options:block:]( self,  "initWithName:date:gracePeriod:priority:options:block:",  v13,  v14,  a5,  a6,  v12,  0.0);

  return v15;
}

- (id)criteria
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer date](self, "date"));
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  double v6 = 0.0;
  if (v5 >= 0.0) {
    double v6 = v5;
  }
  int64_t v7 = (uint64_t)v6;
  -[BTXPCTimer gracePeriod](self, "gracePeriod");
  int64_t v9 = (uint64_t)v8;
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_int64(v10, XPC_ACTIVITY_DELAY, v7);
  xpc_dictionary_set_int64(v10, XPC_ACTIVITY_GRACE_PERIOD, v9);
  int64_t v11 = -[BTXPCTimer priority](self, "priority");
  id v12 = (const char **)&XPC_ACTIVITY_PRIORITY_UTILITY;
  if (v11 != 1) {
    id v12 = (const char **)&XPC_ACTIVITY_PRIORITY_MAINTENANCE;
  }
  xpc_dictionary_set_string(v10, XPC_ACTIVITY_PRIORITY, *v12);
  unsigned __int8 v13 = -[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_POWER_NAP, v13 & 1);
  unsigned __int8 v14 = -[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, (v14 & 4) != 0LL);
  unsigned __int8 v15 = -[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, (v15 & 2) != 0LL);
  unsigned __int8 v16 = -[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_USES_DUET_POWER_BUDGETING, (v16 & 8) != 0LL);
  if ((-[BTXPCTimer options](self, "options") & 0x10) != 0)
  {
    v17 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_A;
  }

  else if ((-[BTXPCTimer options](self, "options") & 0x20) != 0)
  {
    v17 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_B;
  }

  else
  {
    v17 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_C;
  }

  if (*v17) {
    xpc_dictionary_set_BOOL(v10, *v17, 1);
  }
LABEL_13:
  unsigned __int8 v18 = -[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, (v18 & 0x80) != 0LL);
  unint64_t v19 = -[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, v19 & 0x100);
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_ALLOW_BATTERY, (-[BTXPCTimer options](self, "options") & 0x200) != 0);
  unsigned __int16 v20 = (unsigned __int16)-[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_MEMORY_INTENSIVE, (v20 & 0x400) != 0LL);
  unsigned __int16 v21 = (unsigned __int16)-[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_CPU_INTENSIVE, (v21 & 0x800) != 0LL);
  unsigned __int16 v22 = (unsigned __int16)-[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_DISK_INTENSIVE, (v22 & 0x1000) != 0LL);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer duetActivitySchedulerData](self, "duetActivitySchedulerData"));
  if (v23) {
    xpc_dictionary_set_value(v10, XPC_ACTIVITY_DUET_ACTIVITY_SCHEDULER_DATA, v23);
  }

  return v10;
}

- (void)invalidate
{
  id v3 = objc_claimAutoreleasedReturnValue(-[BTXPCTimer name](self, "name"));
  double v4 = (const char *)[v3 UTF8String];

  os_log_t v5 = sub_100060178("BTXPCTimer");
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    unsigned __int8 v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "BTXPCTimer Unregistering XPC activity %s",  (uint8_t *)&v15,  0xCu);
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[BTXPCTimer activity](self, "activity"));
  if (v7)
  {
    double v8 = (void *)v7;
    int64_t v9 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer activity](self, "activity"));
    BOOL v10 = xpc_activity_set_state(v9, 5LL);

    if (v10)
    {
      os_log_t v11 = sub_100060178("BTXPCTimer");
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        unsigned __int8 v16 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "BTXPCTimer XPC activity marked DONE for %s",  (uint8_t *)&v15,  0xCu);
      }
    }
  }

  xpc_activity_unregister(v4);
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer block](self, "block"));

  if (v13) {
    -[BTXPCTimer setBlock:](self, "setBlock:", 0LL);
  }
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer activity](self, "activity"));

  if (v14) {
    -[BTXPCTimer setActivity:](self, "setActivity:", 0LL);
  }
}

- (id)activityHandler
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer criteria](self, "criteria"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer name](self, "name"));
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer date](self, "date"));
  [v5 timeIntervalSinceNow];
  double v7 = v6;

  os_log_t v8 = sub_100060178("BTXPCTimer");
  int64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 < 0.0) {
      double v7 = 0.0;
    }
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer name](self, "name"));
    -[BTXPCTimer gracePeriod](self, "gracePeriod");
    *(_DWORD *)buf = 138412802;
    v24 = v10;
    __int16 v25 = 2048;
    uint64_t v26 = (uint64_t)v7;
    __int16 v27 = 2048;
    uint64_t v28 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "BTXPCTimer: Scheduling XPC activity (%@) in %lld ~%lf grace.",  buf,  0x20u);
  }

  objc_initWeak((id *)buf, self);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer block](self, "block"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10005F734;
  v18[3] = &unk_100208148;
  objc_copyWeak(&v22, (id *)buf);
  id v19 = v4;
  id v20 = v3;
  id v21 = v12;
  id v13 = v12;
  id v14 = v3;
  id v15 = v4;
  unsigned __int8 v16 = objc_retainBlock(v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
  return v16;
}

- (BOOL)isActive
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer activity](self, "activity"));

  if (!v3) {
    return 0;
  }
  double v4 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer activity](self, "activity"));
  xpc_activity_state_t state = xpc_activity_get_state(v4);

  os_log_t v6 = sub_100060178("BTXPCTimer");
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer name](self, "name"));
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2048;
    xpc_activity_state_t v13 = state;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "BTXPCTimer %@ current state %ld",  (uint8_t *)&v10,  0x16u);
  }

  return state != 5;
}

- (void)handleActivity
{
  id v5 = objc_claimAutoreleasedReturnValue(-[BTXPCTimer name](self, "name"));
  id v3 = (const char *)[v5 UTF8String];
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer activityHandler](self, "activityHandler"));
  xpc_activity_register(v3, XPC_ACTIVITY_CHECK_IN, v4);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (OS_xpc_object)duetActivitySchedulerData
{
  return self->_duetActivitySchedulerData;
}

- (void)setDuetActivitySchedulerData:(id)a3
{
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end