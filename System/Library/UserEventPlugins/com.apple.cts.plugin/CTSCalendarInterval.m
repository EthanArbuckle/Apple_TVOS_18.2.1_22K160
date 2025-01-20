@interface CTSCalendarInterval
- (CTSCalendarInterval)initWithToken:(unint64_t)a3 andEvent:(id)a4;
- (NSDate)fireDate;
- (NSDateComponents)components;
- (NSString)identifier;
- (unint64_t)token;
- (void)parseComponent:(unint64_t)a3 inEvent:(id)a4;
- (void)resetFireDate;
- (void)setEveryMinuteIfNothingElseSet;
- (void)setToken:(unint64_t)a3;
@end

@implementation CTSCalendarInterval

- (void)parseComponent:(unint64_t)a3 inEvent:(id)a4
{
  v6 = (const char *)qword_10948[3 * a3];
  xpc_object_t value = xpc_dictionary_get_value(a4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(value);
  v9 = v8;
  if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_int64)
  {
    int64_t v10 = xpc_int64_get_value(v9);
    int64_t v11 = qword_10948[3 * a3 + 1];
    if (v10 >= v11 && (uint64_t v12 = v10, v10 <= qword_10948[3 * a3 + 2]))
    {
      if (a3 == 512)
      {
        uint64_t v12 = v10 % 7 + 1;
        -[NSDateComponents setDay:](self->_components, "setDay:", 0x7FFFFFFFFFFFFFFFLL);
        -[NSDateComponents setMonth:](self->_components, "setMonth:", 0x7FFFFFFFFFFFFFFFLL);
      }

      -[NSDateComponents setValue:forComponent:](self->_components, "setValue:forComponent:", v12, a3);
      if (!-[NSDateComponents isValidDate](self->_components, "isValidDate"))
      {
        NSInteger v15 = -[NSDateComponents month](self->_components, "month");
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v16 = (v15 + 1) % 12 + 1;
          -[NSDateComponents setDay:](self->_components, "setDay:", 1LL);
          -[NSDateComponents setMonth:](self->_components, "setMonth:", v16);
        }
      }
    }

    else
    {
      v13 = (os_log_s *)qword_15398;
      if (os_log_type_enabled((os_log_t)qword_15398, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = qword_10948[3 * a3 + 2];
        int v17 = 136315650;
        v18 = v6;
        __int16 v19 = 1024;
        int v20 = v11;
        __int16 v21 = 1024;
        int v22 = v14;
        _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "The interval for key %s is not between %d and %d (inclusive).",  (uint8_t *)&v17,  0x18u);
      }
    }
  }
}

- (void)setEveryMinuteIfNothingElseSet
{
  if (-[NSDateComponents minute](self->_components, "minute") == 0x7FFFFFFFFFFFFFFFLL
    && -[NSDateComponents hour](self->_components, "hour") == 0x7FFFFFFFFFFFFFFFLL
    && -[NSDateComponents day](self->_components, "day") == 0x7FFFFFFFFFFFFFFFLL
    && -[NSDateComponents month](self->_components, "month") == 0x7FFFFFFFFFFFFFFFLL
    && -[NSDateComponents weekday](self->_components, "weekday") == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSDateComponents setSecond:](self->_components, "setSecond:", 0LL);
  }

- (void)resetFireDate
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[NSDateComponents calendar](self->_components, "calendar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue([v6 nextDateAfterDate:v3 matchingComponents:self->_components options:1024]);
  fireDate = self->_fireDate;
  self->_fireDate = v4;
}

- (CTSCalendarInterval)initWithToken:(unint64_t)a3 andEvent:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CTSCalendarInterval;
  v7 = -[CTSCalendarInterval init](&v14, "init");
  if (v7)
  {
    memset(v15, 0, sizeof(v15));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v7->_token = a3;
    int64_t v10 = objc_opt_new(&OBJC_CLASS___NSDateComponents);
    components = v7->_components;
    v7->_components = v10;

    uint64_t v12 = v7->_components;
    if (qword_15388 != -1) {
      dispatch_once(&qword_15388, &stru_13960);
    }
    -[NSDateComponents setCalendar:](v12, "setCalendar:", qword_15380);
    -[CTSCalendarInterval parseComponent:inEvent:](v7, "parseComponent:inEvent:", 64LL, v6);
    -[CTSCalendarInterval parseComponent:inEvent:](v7, "parseComponent:inEvent:", 32LL, v6);
    -[CTSCalendarInterval parseComponent:inEvent:](v7, "parseComponent:inEvent:", 16LL, v6);
    -[CTSCalendarInterval parseComponent:inEvent:](v7, "parseComponent:inEvent:", 8LL, v6);
    -[CTSCalendarInterval parseComponent:inEvent:](v7, "parseComponent:inEvent:", 512LL, v6);
    -[CTSCalendarInterval setEveryMinuteIfNothingElseSet](v7, "setEveryMinuteIfNothingElseSet");
    -[CTSCalendarInterval resetFireDate](v7, "resetFireDate");
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (NSDateComponents)components
{
  return self->_components;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void).cxx_destruct
{
}

@end