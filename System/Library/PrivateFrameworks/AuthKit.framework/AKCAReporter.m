@interface AKCAReporter
- (AKCAReporter)initWithEvent:(id)a3;
- (double)machAbsoluteTimeToTimeInterval:(unint64_t)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)sendReport;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation AKCAReporter

- (AKCAReporter)initWithEvent:(id)a3
{
  id v5 = a3;
  if (getenv("__OSINSTALL_ENVIRONMENT") || getenv("__AKSYNCBUBBLE"))
  {
    v6 = 0LL;
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___AKCAReporter;
    v8 = -[AKCAReporter init](&v12, "init");
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_eventName, a3);
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      reportData = v9->_reportData;
      v9->_reportData = (NSMutableDictionary *)v10;

      mach_timebase_info(&v9->_clock_timebase);
      v9->_initTime = mach_absolute_time();
    }

    self = v9;
    v6 = self;
  }

  return v6;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_reportData, "objectForKeyedSubscript:", a3);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

- (void)sendReport
{
  if (self->_initTime)
  {
    -[AKCAReporter machAbsoluteTimeToTimeInterval:]( self,  "machAbsoluteTimeToTimeInterval:",  mach_absolute_time() - self->_initTime);
    double v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_reportData,  "setObject:forKeyedSubscript:",  v5,  @"duration");

    self->_initTime = 0LL;
    uint64_t v7 = _AKLogSystem(v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10013046C((uint64_t)self, v8, v4);
    }

    if (&_AnalyticsSendEvent) {
      AnalyticsSendEvent(self->_eventName, self->_reportData);
    }
  }

  else
  {
    uint64_t v9 = _AKLogSystem(self);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1001303F4((uint64_t)self, v10);
    }
  }

- (double)machAbsoluteTimeToTimeInterval:(unint64_t)a3
{
  return (double)(self->_clock_timebase.numer * a3 / self->_clock_timebase.denom) / 1000000000.0;
}

- (void).cxx_destruct
{
}

@end