@interface _AppLoggingInfo
- (NSDate)startDate;
- (_AppLoggingInfo)initWithPid:(int)a3;
- (id)description;
- (int)pid;
- (void)setPid:(int)a3;
- (void)setStartDate:(id)a3;
@end

@implementation _AppLoggingInfo

- (_AppLoggingInfo)initWithPid:(int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____AppLoggingInfo;
  v4 = -[_AppLoggingInfo init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_pid = a3;
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PID: %d, Start date: %@",  self->_pid,  self->_startDate);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setStartDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end