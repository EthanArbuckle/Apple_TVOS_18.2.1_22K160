@interface SOSIntervalEvent
- (BOOL)checkDate;
- (NSString)dateDescription;
- (NSUserDefaults)defaults;
- (SOSIntervalEvent)initWithDefaults:(id)a3 dateDescription:(id)a4 earliest:(double)a5 latest:(double)a6;
- (double)earliestDate;
- (double)latestDate;
- (id)getDate;
- (void)followup;
- (void)schedule;
- (void)setDateDescription:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setEarliestDate:(double)a3;
- (void)setLatestDate:(double)a3;
@end

@implementation SOSIntervalEvent

- (id)getDate
{
  return -[NSUserDefaults valueForKey:](self->_defaults, "valueForKey:", self->_dateDescription);
}

- (BOOL)checkDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SOSIntervalEvent getDate](self, "getDate"));
  v3 = v2;
  BOOL v5 = 0;
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    if (v4 <= 0.0) {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (void)followup
{
  uint64_t v3 = SOSCreateRandomDateBetweenNowPlus(self->_earliestDate, self->_latestDate);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[NSUserDefaults setValue:forKey:](self->_defaults, "setValue:forKey:", v4, self->_dateDescription);
}

- (void)schedule
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSIntervalEvent getDate](self, "getDate"));
  if (!v3)
  {
    -[SOSIntervalEvent followup](self, "followup");
    uint64_t v3 = 0LL;
  }
}

- (SOSIntervalEvent)initWithDefaults:(id)a3 dateDescription:(id)a4 earliest:(double)a5 latest:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SOSIntervalEvent;
  v13 = -[SOSIntervalEvent init](&v19, "init");
  v14 = v13;
  if (v13)
  {
    p_defaults = (void **)&v13->_defaults;
    objc_storeStrong((id *)&v13->_defaults, a3);
    if (!v14->_defaults)
    {
      v16 = objc_alloc_init(&OBJC_CLASS___NSUserDefaults);
      v17 = *p_defaults;
      *p_defaults = v16;
    }

    objc_storeStrong((id *)&v14->_dateDescription, a4);
    v14->_earliestDate = a5;
    v14->_latestDate = a6;
    -[SOSIntervalEvent schedule](v14, "schedule");
  }

  return v14;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSString)dateDescription
{
  return self->_dateDescription;
}

- (void)setDateDescription:(id)a3
{
}

- (double)earliestDate
{
  return self->_earliestDate;
}

- (void)setEarliestDate:(double)a3
{
  self->_earliestDate = a3;
}

- (double)latestDate
{
  return self->_latestDate;
}

- (void)setLatestDate:(double)a3
{
  self->_latestDate = a3;
}

- (void).cxx_destruct
{
}

@end