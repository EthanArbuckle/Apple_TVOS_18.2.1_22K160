@interface _NSConcreteDateInterval
- (_NSConcreteDateInterval)init;
- (_NSConcreteDateInterval)initWithStartDate:(id)a3 duration:(double)a4;
- (_NSConcreteDateInterval)initWithStartDate:(id)a3 endDate:(id)a4;
- (double)duration;
- (id)endDate;
- (id)startDate;
- (void)dealloc;
@end

@implementation _NSConcreteDateInterval

- (_NSConcreteDateInterval)init
{
  return -[_NSConcreteDateInterval initWithStartDate:duration:]( self,  "initWithStartDate:duration:",  [MEMORY[0x189603F50] date],  0.0);
}

- (_NSConcreteDateInterval)initWithStartDate:(id)a3 duration:(double)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    v8 = self;
    v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Start date is nil!",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_8;
  }

  if (a4 < 0.0)
  {
    v8 = self;
    v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Duration is less than 0!",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_8:
    v10 = v9;

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v10 userInfo:0]);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____NSConcreteDateInterval;
  v6 = -[NSDateInterval init](&v11, sel_init);
  if (v6)
  {
    v6->_startDate = (NSDate *)[a3 copy];
    v6->_duration = a4;
  }

  return v6;
}

- (_NSConcreteDateInterval)initWithStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    objc_super v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Start date is nil!",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_9:
    uint64_t v12 = v11;

    v13 = (void *)MEMORY[0x189603F70];
    v14 = (void *)MEMORY[0x189603A60];
    goto LABEL_11;
  }

  if (!a4)
  {
    objc_super v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"End date is nil!",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_9;
  }

  if ([a3 compare:a4] == 1)
  {
    uint64_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Start date cannot be later in time than end date!",  _NSMethodExceptionProem((objc_class *)self, a2));

    v13 = (void *)MEMORY[0x189603F70];
    v14 = (void *)MEMORY[0x189603A48];
LABEL_11:
    objc_exception_throw((id)[v13 exceptionWithName:*v14 reason:v12 userInfo:0]);
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____NSConcreteDateInterval;
  v8 = -[NSDateInterval init](&v15, sel_init);
  if (v8)
  {
    v8->_startDate = (NSDate *)[a3 copy];
    [a4 timeIntervalSinceDate:a3];
    v8->_duration = v9;
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSConcreteDateInterval;
  -[_NSConcreteDateInterval dealloc](&v3, sel_dealloc);
}

- (id)endDate
{
  if (self->_duration == 0.0) {
    return self->_startDate;
  }
  else {
    return (id)objc_msgSend(MEMORY[0x189603F50], "dateWithTimeInterval:sinceDate:", self->_startDate);
  }
}

- (id)startDate
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (double)duration
{
  return self->_duration;
}

@end