@interface RTXPCTimerAlarm
- (BOOL)_isEndDateValid:(id)a3;
- (BOOL)fireWithDate:(id)a3 error:(id *)a4;
- (BOOL)invalidate;
- (NSDate)endDate;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (RTXPCTimerAlarm)initWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5;
- (id)handler;
- (unint64_t)state;
- (void)_deregisterAlarm;
- (void)_fireWithDate:(id)a3;
- (void)_handleDurationExpiry;
- (void)_invalidate;
- (void)_resetState;
- (void)_setAlarmWithEndDate:(id)a3 userVisible:(BOOL)a4;
- (void)_setup;
- (void)onNotification:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setQueue:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setup;
@end

@implementation RTXPCTimerAlarm

- (RTXPCTimerAlarm)initWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v11 = sub_10000B294(&qword_10002D0A0);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[RTXPCTimerAlarm initWithIdentifier:queue:handler:]";
      __int16 v23 = 1024;
      int v24 = 26;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: queue (in %s:%d)",  buf,  0x12u);
    }
  }

  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___RTXPCTimerAlarm;
  v13 = -[RTXPCTimerAlarm init](&v20, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a4);
    v14->_state = 0LL;
    v15 = (NSString *)[v8 copy];
    identifier = v14->_identifier;
    v14->_identifier = v15;

    id v17 = [v10 copy];
    id handler = v14->_handler;
    v14->_id handler = v17;

    -[RTXPCTimerAlarm setup](v14, "setup");
  }

  return v14;
}

- (void)setup
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RTXPCTimerAlarm queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004BB8;
  block[3] = &unk_1000245A8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_setup
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RTXPCTimerAlarm identifier](self, "identifier"));
  [v4 addObserver:self selector:"onNotification:" name:v3 object:0];
}

- (void)onNotification:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RTXPCTimerAlarm queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004CD0;
  v7[3] = &unk_1000245D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)fireWithDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RTXPCTimerAlarm queue](self, "queue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100004DFC;
    v12[3] = &unk_1000245D0;
    v12[4] = self;
    id v13 = v6;
    dispatch_async(v7, v12);
  }

  else
  {
    id v8 = sub_10000B294(&qword_10002D0A0);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: endDate",  buf,  2u);
    }

    if (a4)
    {
      id v10 = sub_10000A324((uint64_t)@"endDate");
      *a4 = (id)objc_claimAutoreleasedReturnValue(v10);
    }
  }

  return v6 != 0LL;
}

- (BOOL)invalidate
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RTXPCTimerAlarm queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004E78;
  block[3] = &unk_1000245A8;
  block[4] = self;
  dispatch_async(v3, block);

  return 1;
}

- (void)_fireWithDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[RTXPCTimerAlarm _deregisterAlarm](self, "_deregisterAlarm");
    -[RTXPCTimerAlarm _resetState](self, "_resetState");
    if (-[RTXPCTimerAlarm _isEndDateValid:](self, "_isEndDateValid:", v4))
    {
      -[RTXPCTimerAlarm setState:](self, "setState:", 2LL);
      -[RTXPCTimerAlarm _setAlarmWithEndDate:userVisible:](self, "_setAlarmWithEndDate:userVisible:", v4, 1LL);
    }
  }

  else
  {
    id v5 = sub_10000B294(&qword_10002D0A0);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: endDate",  v7,  2u);
    }
  }
}

- (void)_handleDurationExpiry
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[RTXPCTimerAlarm setEndDate:](self, "setEndDate:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RTXPCTimerAlarm handler](self, "handler"));
  if (v4)
  {
    id v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RTXPCTimerAlarm handler](self, "handler"));
    v5[2]();
  }

- (void)_invalidate
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RTXPCTimerAlarm identifier](self, "identifier"));
  [v4 removeObserver:self name:v3 object:0];
}

- (void)_setAlarmWithEndDate:(id)a3 userVisible:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_claimAutoreleasedReturnValue(-[RTXPCTimerAlarm identifier](self, "identifier"));
  id v8 = [v7 cStringUsingEncoding:4];

  [v6 timeIntervalSince1970];
  double v10 = v9;

  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_date(xdict, "Date", 1000000000 * (uint64_t)v10);
  xpc_dictionary_set_BOOL(xdict, "UserVisible", a4);
  xpc_set_event("com.apple.alarm", v8, xdict);
}

- (void)_deregisterAlarm
{
  id v2 = objc_claimAutoreleasedReturnValue(-[RTXPCTimerAlarm identifier](self, "identifier"));
  id v3 = [v2 cStringUsingEncoding:4];

  xpc_set_event("com.apple.alarm", v3, 0LL);
}

- (BOOL)_isEndDateValid:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v6 = [v5 compare:v4];

  if (v6 == (id)1) {
    -[RTXPCTimerAlarm _handleDurationExpiry](self, "_handleDurationExpiry");
  }

  return v6 != (id)1;
}

- (void)_resetState
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end