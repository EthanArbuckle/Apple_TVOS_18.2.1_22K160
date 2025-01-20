@interface ADSessionAssertion
- (ADSessionAssertion)initWithTimestamp:(unint64_t)a3 reason:(id)a4;
- (NSString)description;
- (NSString)reason;
- (unint64_t)timestamp;
@end

@implementation ADSessionAssertion

- (ADSessionAssertion)initWithTimestamp:(unint64_t)a3 reason:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADSessionAssertion;
  v7 = -[ADSessionAssertion init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_timestamp = a3;
    v9 = (NSString *)[v6 copy];
    reason = v8->_reason;
    v8->_reason = v9;
  }

  return v8;
}

- (NSString)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADSessionAssertion;
  v4 = -[ADSessionAssertion description](&v11, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unint64_t timestamp = self->_timestamp;
  reason = self->_reason;
  uint64_t v8 = mach_absolute_time();
  v9 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ {unint64_t timestamp = %llu, reason = %@, duration = %f seconds}",  v5,  timestamp,  reason,  AFMachAbsoluteTimeGetTimeInterval(v8 - self->_timestamp));

  return v9;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
}

@end