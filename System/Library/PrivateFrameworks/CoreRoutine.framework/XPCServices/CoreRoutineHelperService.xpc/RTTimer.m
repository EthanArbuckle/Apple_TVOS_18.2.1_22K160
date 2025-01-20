@interface RTTimer
- (NSString)identifier;
- (RTTimer)init;
- (RTTimer)initWithIdentifier:(id)a3 dispatchSource:(id)a4;
- (RTTimer)initWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)fireAfterDelay:(double)a3;
- (void)fireAfterDelay:(double)a3 interval:(double)a4;
- (void)fireAfterDelay:(double)a3 interval:(double)a4 leeway:(double)a5;
- (void)fireWithInterval:(double)a3;
- (void)fireWithInterval:(double)a3 leeway:(double)a4;
- (void)invalidate;
- (void)resume;
- (void)suspend;
@end

@implementation RTTimer

- (RTTimer)init
{
  uint64_t v3 = objc_opt_class(self);
  sub_10000A2A8(v3, "initWithIdentifier:queue:handler:");

  return 0LL;
}

- (RTTimer)initWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  v9 = (dispatch_queue_s *)a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }

  else
  {
    id v13 = sub_10000B294(&qword_10002D0A0);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      v20 = "-[RTTimer initWithIdentifier:queue:handler:]";
      __int16 v21 = 1024;
      int v22 = 30;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: identifier (in %s:%d)",  (uint8_t *)&v19,  0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v10) {
        goto LABEL_4;
      }
LABEL_13:
      id v17 = sub_10000B294(&qword_10002D0A0);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136315394;
        v20 = "-[RTTimer initWithIdentifier:queue:handler:]";
        __int16 v21 = 1024;
        int v22 = 32;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: handler (in %s:%d)",  (uint8_t *)&v19,  0x12u);
      }

      v11 = 0LL;
      goto LABEL_16;
    }
  }

  id v15 = sub_10000B294(&qword_10002D0A0);
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v19 = 136315394;
    v20 = "-[RTTimer initWithIdentifier:queue:handler:]";
    __int16 v21 = 1024;
    int v22 = 31;
    _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: queue (in %s:%d)",  (uint8_t *)&v19,  0x12u);
  }

  if (!v10) {
    goto LABEL_13;
  }
LABEL_4:
  v11 = 0LL;
  if (v8 && v9)
  {
    v12 = (os_log_s *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v9);
    dispatch_source_set_event_handler((dispatch_source_t)v12, v10);
    self = -[RTTimer initWithIdentifier:dispatchSource:](self, "initWithIdentifier:dispatchSource:", v8, v12);
    v11 = self;
LABEL_16:
  }

  return v11;
}

- (RTTimer)initWithIdentifier:(id)a3 dispatchSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v13 = sub_10000B294(&qword_10002D0A0);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTTimer initWithIdentifier:dispatchSource:]";
      __int16 v21 = 1024;
      int v22 = 53;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: identifier (in %s:%d)",  buf,  0x12u);
    }

    if (v8) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }

  if (!v7)
  {
LABEL_9:
    id v15 = sub_10000B294(&qword_10002D0A0);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTTimer initWithIdentifier:dispatchSource:]";
      __int16 v21 = 1024;
      int v22 = 54;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: source (in %s:%d)",  buf,  0x12u);
    }

LABEL_12:
    v12 = 0LL;
    goto LABEL_13;
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___RTTimer;
  v9 = -[RTTimer init](&v18, "init");
  if (v9)
  {
    id v10 = (NSString *)[v6 copy];
    identifier = v9->_identifier;
    v9->_identifier = v10;

    objc_storeStrong((id *)&v9->_timer, a4);
  }

  self = v9;
  v12 = self;
LABEL_13:

  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RTTimer;
  -[RTTimer dealloc](&v3, "dealloc");
}

- (void)fireWithInterval:(double)a3
{
}

- (void)fireWithInterval:(double)a3 leeway:(double)a4
{
}

- (void)fireAfterDelay:(double)a3
{
}

- (void)fireAfterDelay:(double)a3 interval:(double)a4
{
}

- (void)fireAfterDelay:(double)a3 interval:(double)a4 leeway:(double)a5
{
  if (a3 <= 0.0)
  {
    id v9 = sub_10000B294(&qword_10002D0A0);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136315394;
      v26 = "-[RTTimer fireAfterDelay:interval:leeway:]";
      __int16 v27 = 1024;
      int v28 = 108;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: delay > 0 (in %s:%d)",  (uint8_t *)&v25,  0x12u);
    }
  }

  if (a4 <= 0.0)
  {
    id v11 = sub_10000B294(&qword_10002D0A0);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136315394;
      v26 = "-[RTTimer fireAfterDelay:interval:leeway:]";
      __int16 v27 = 1024;
      int v28 = 109;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: interval > 0 (in %s:%d)",  (uint8_t *)&v25,  0x12u);
    }
  }

  if (a5 <= 0.0)
  {
    id v13 = sub_10000B294(&qword_10002D0A0);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136315394;
      v26 = "-[RTTimer fireAfterDelay:interval:leeway:]";
      __int16 v27 = 1024;
      int v28 = 110;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: leeway > 0 (in %s:%d)",  (uint8_t *)&v25,  0x12u);
    }
  }

  timer = self->_timer;
  double v16 = fabs(a3);
  if (v16 == INFINITY) {
    uint64_t v17 = -1LL;
  }
  else {
    uint64_t v17 = 0LL;
  }
  dispatch_time_t v18 = v17;
  if (a3 > 0.0 && v16 != INFINITY) {
    dispatch_time_t v18 = dispatch_walltime(0LL, (uint64_t)(a3 * 1000000000.0));
  }
  if ((*(uint64_t *)&a4 <= -1 || ((*(void *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000LL) >> 53 >= 0x3FF)
    && (unint64_t)(*(void *)&a4 - 1LL) >= 0xFFFFFFFFFFFFFLL)
  {
    uint64_t v21 = -1LL;
  }

  else
  {
    uint64_t v21 = (unint64_t)(a4 * 1000000000.0);
  }

  if ((*(uint64_t *)&a5 <= -1 || ((*(void *)&a5 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000LL) >> 53 >= 0x3FF)
    && (unint64_t)(*(void *)&a5 - 1LL) >= 0xFFFFFFFFFFFFFLL)
  {
    uint64_t v24 = -1LL;
  }

  else
  {
    uint64_t v24 = (unint64_t)(a5 * 1000000000.0);
  }

  dispatch_source_set_timer((dispatch_source_t)timer, v18, v21, v24);
}

- (void)cancel
{
}

- (void)suspend
{
}

- (void)resume
{
}

- (void)invalidate
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end